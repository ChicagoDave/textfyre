using System;
using System.Collections.Generic;
using System.Net.Mail;
using System.Xml;
using System.Linq;
using System.IO;
using System.Threading.Tasks;
using System.Text;
using System.Text.RegularExpressions;
using System.Xml.Serialization;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters;
using System.Runtime.Serialization.Formatters.Binary;
using System.Web;

using Zifmia.FyreVM.Service;
using Zifmia.Service.Database;
using Zifmia.Model;

namespace Zifmia.Service.Controller
{
    public class ZifmiaController
    {
        private ZifmiaDatabase _database;
        private bool _unitTesting;

        public ZifmiaController()
        {
            _database = new ZifmiaDatabase();
            _unitTesting = ZifmiaDatabase.UnitTesting;
        }

        #region Registration and Login

        public virtual ZifmiaRegistrationViewModel Register(string username, string password, string nickName, string emailAddress)
        {
            ZifmiaRegistrationViewModel viewModel = new ZifmiaRegistrationViewModel();
            viewModel.Message = "Registration has failed. An administrator has been notified of the problem. Please try again later.";
            viewModel.Status = ZifmiaStatus.Failure;

            ZifmiaPlayer newPlayer = new ZifmiaPlayer(username, password, nickName, emailAddress);

            if (username == "regression")
            {
                // we also need to validate the regression test user, since we can't wait for an e-mail validation

                newPlayer.IsValidated = true;
            }

            using (ZifmiaDatabase database = new ZifmiaDatabase())
            {
                ZifmiaRegistrationStatus status = database.CheckPlayerIsUnqiue(newPlayer);

                if (status != ZifmiaRegistrationStatus.Succeeded)
                {
                    viewModel.RegistrationStatus = status;
                    switch (status)
                    {
                        case ZifmiaRegistrationStatus.UsernameExists:
                            viewModel.Message = "The username '" + username + "' is unavailable.";
                            break;
                        case ZifmiaRegistrationStatus.NickNameExists:
                            viewModel.Message = "The nick name '" + nickName + "' is unavailable.";
                            break;
                        case ZifmiaRegistrationStatus.EmailAddressExists:
                            viewModel.Message = "The email address '" + emailAddress + "' is unavailable.";
                            break;
                    }
                }
                else
                {
                    database.Save(newPlayer);

                    viewModel.Status = ZifmiaStatus.Success;
                    viewModel.Message = "Registration has been completed. Please check your e-mail for further instructions.";

                    // We can't send e-mails, but we still want to return normally.
                    // Also skip sending an email for regression test user
                    if (ZifmiaDatabase.IsNetworkAvailable && username != "regression")
                    {
                        string host = HttpContext.Current.Request.ServerVariables["HTTP_HOST"];
                        string protocol = HttpContext.Current.Request.ServerVariables["SERVER_PROTOCOL"];
                        if (protocol.StartsWith("HTTP/"))
                            protocol = "http://";
                        else
                            protocol = "https://";

                        host = protocol + host;

                        MailMessage message = new MailMessage();
                        message.From = new MailAddress("zifmia-noreply@textfyre.com", "Textfyre Games Validation - NO REPLY");
                        message.ReplyToList.Add(new MailAddress("zifmia-noreply@textfyre.com", "Textfyre Games Validation - NO REPLY"));
                        message.To.Add(new MailAddress(emailAddress, nickName));
                        message.Body = String.Format(@"Dear New Textfyre Player,<br/><br/>Please click the following link to validate your new registration:<br/><br/>" + host + "/Validation/{0}<br/><br/>Sincerely,<br/><br/>The Textfyre Team", newPlayer.ValidationId);
                        message.IsBodyHtml = true;
                        SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;

                        // Since this is open source, we can't just hard code the SMTP account password, can we?
                        // Sorry spammer dudes, no open relay for you...
                        XmlDocument doc = new XmlDocument();
                        doc.Load(@"D:\Zifmia\Zifmia.config");
                        string emailPassword = doc.SelectSingleNode("/ZifmiaConfiguration/EmailPassword").InnerText;

                        smtp.Credentials = new System.Net.NetworkCredential("no-reply@textfyre.com", emailPassword);
                        smtp.EnableSsl = true;
                        smtp.Send(message);
                    }
                }
            }

            return viewModel;
        }

        public ZifmiaStatus ValidatePlayer(string validationId)
        {
            ZifmiaStatus returnStatus = ZifmiaStatus.Failure;

            using (ZifmiaDatabase database = new ZifmiaDatabase())
            {
                ZifmiaPlayer player = database.GetPlayerByValidationId(validationId);

                if (player != null)
                {
                    player.Validate(validationId);

                    database.Save(player);

                    returnStatus = ZifmiaStatus.Success;
                }
            }

            return returnStatus;
        }

        public virtual ZifmiaLoginViewModel Login(string username, string password) {

            ZifmiaLoginViewModel viewModel = new ZifmiaLoginViewModel();

            using (ZifmiaDatabase database = new ZifmiaDatabase())
            {
                //
                // Get the playerKey for the current user so we can authorize them.
                //
                ZifmiaPlayer player = database.GetPlayerByUsernamePassword(username, password);


                CheckPlayer(player, viewModel);
                if (viewModel.Status == ZifmiaStatus.DoesNotExist || viewModel.Status == ZifmiaStatus.Invalid)
                {
                    return viewModel;
                }

                string authKey = ZifmiaAuthorizationId.GetNextKey(database);

                player.Authorize(authKey);

                database.Save(player);

                viewModel.AuthKey = authKey;
                viewModel.FirstName = player.FirstName;
                viewModel.LastName = player.LastName;
                viewModel.FullName = player.FullName;
                viewModel.Nickname = player.NickName;
                viewModel.EmailAddress = player.EmailAddress;
                viewModel.Status = ZifmiaStatus.Success;
                viewModel.Message = "Player is logged in.";
            }

            return viewModel;
        }

        public virtual ZifmiaLoginViewModel IsAuthorized(string authKey)
        {
            ZifmiaPlayer player = null;
            using (ZifmiaDatabase database = new ZifmiaDatabase())
            {
                //
                // Get the player by the auth key
                //
                player = database.GetPlayerByAuthKey(authKey);
            }

            ZifmiaLoginViewModel viewModel = new ZifmiaLoginViewModel();

            CheckPlayer(player, viewModel);
            if (viewModel.Status == ZifmiaStatus.DoesNotExist || viewModel.Status == ZifmiaStatus.Invalid)
            {
                return viewModel;
            }

            viewModel.AuthKey = authKey;
            viewModel.Nickname = player.FullName;
            viewModel.Status = ZifmiaStatus.Success;
            viewModel.Message = "Player is logged in.";

            return viewModel;
        }

        public virtual ZifmiaStatus DeletePlayer(string username)
        {
            ZifmiaStatus returnStatus = ZifmiaStatus.DoesNotExist;

            using (ZifmiaDatabase database = new ZifmiaDatabase())
            {
                returnStatus = database.DeletePlayer(username);
            }

            return returnStatus;
        }
        #endregion

        #region Games

        public virtual ZifmiaGamesViewModel GetInstalledGames()
        {
            ZifmiaGamesViewModel viewModel = new ZifmiaGamesViewModel();
            List<ZifmiaGame> games = _database.GetInstalledGames();

            // copy list of games to view model, leaving out engine data
            foreach (ZifmiaGame game in games)
            {
                ZifmiaGameViewModel newGame = new ZifmiaGameViewModel();
                newGame.Key = game.Key;
                newGame.Installed = game.Installed;
                newGame.Title = game.Title;
                viewModel.Games.Add(newGame);
            }

            if (viewModel.Games.Count > 0)
            {
                viewModel.Message = String.Format("Found {0} games installed.", viewModel.Games.Count);
                viewModel.Status = ZifmiaStatus.Success;
            }
            else
            {
                viewModel.Message = "There are currently no games available.";
                viewModel.Status = ZifmiaStatus.Failure;
            }

            return viewModel;
        }
        
        #endregion

        #region Sessions

        public virtual ZifmiaViewModel GetSession(string authKey, string sessionKey)
        {
            ZifmiaPlayer player = _database.GetPlayerByAuthKey(authKey);
            ZifmiaViewModel viewModel = new ZifmiaViewModel();

            CheckPlayer(player, viewModel);

            if (viewModel.Status == ZifmiaStatus.Success)
            {
                ZifmiaSession session = _database.GetSessionByKey(sessionKey);

                if (session != null)
                {
                    viewModel = new ZifmiaViewModel(session);

                    viewModel.Status = ZifmiaStatus.Success;
                    viewModel.Message = "Session retrieved usccessfully.";
                }
                else
                {
                    viewModel.Status = ZifmiaStatus.Failure;
                    viewModel.Message = "Could not locate session.";
                }
            }

            return viewModel;
        }

        public virtual ZifmiaViewModel GetSession(string authKey, string sessionKey, int branchId, int turn)
        {
            ZifmiaPlayer player = _database.GetPlayerByAuthKey(authKey);
            ZifmiaViewModel viewModel = new ZifmiaViewModel();

            CheckPlayer(player, viewModel);

            if (viewModel.Status == ZifmiaStatus.Success)
            {
                ZifmiaSession session = _database.GetSessionByKey(sessionKey);

                if (session != null)
                {
                    viewModel = new ZifmiaViewModel(session);

                    viewModel.Status = ZifmiaStatus.Success;
                    viewModel.Message = "Session retrieved usccessfully.";
                }
                else
                {
                    viewModel.Status = ZifmiaStatus.Failure;
                    viewModel.Message = "Could not locate session.";
                }
            }

            return viewModel;
        }

        public virtual ZifmiaSessionsViewModel GetSessionsByPlayer(string authKey)
        {
            ZifmiaPlayer player = _database.GetPlayerByAuthKey(authKey);
            ZifmiaSessionsViewModel viewModel = new ZifmiaSessionsViewModel();

            CheckPlayer(player, viewModel);

            if (viewModel.Status == ZifmiaStatus.Success)
            {
                ZifmiaSessions sessions = _database.GetSessionsByPlayer(player.Key);

                viewModel = new ZifmiaSessionsViewModel(sessions);

                viewModel.Status = ZifmiaStatus.Success;
                if (viewModel.Sessions.Count > 0)
                {
                    viewModel.Message = String.Format("Found {0} sessions for {1}.", viewModel.Sessions.Count, player.FullName);
                }
                else
                {
                    viewModel.Message = String.Format("No sessions found for {0}.", player.FullName);
                }
            }

            return viewModel;
        }

        #region Start Session
        // - Verify player is validated
        // - Verify player is authorization (logged in)
        // - Create session
        // - Populate and return view model
        public ZifmiaViewModel StartSession(string authKey, string gameKey)
        {
            DateTime startSession = DateTime.Now;

            ZifmiaViewModel viewModel = new ZifmiaViewModel();

            ZifmiaPlayer player = _database.GetPlayerByAuthKey(authKey);
            ZifmiaDatabase.WriteTrace("Player retrieved.");

            CheckPlayer(player, viewModel);
            if (viewModel.Status != ZifmiaStatus.Success)
            {
                return viewModel;
            }

            viewModel.Player = player;

            ZifmiaDatabase.WriteTrace("Player Key: " + player.Key);
            ZifmiaDatabase.WriteTrace("Player successfully authorized.");

            Int64 diskUsage = _database.GetDiskUsageByPlayer(player.Key);
            ZifmiaDatabase.WriteTrace("DiskUsage: " + diskUsage.ToString());

            Int64 maxDiskUsage = ZifmiaDatabase.GetMaxDiskUsage;

            if (diskUsage >= maxDiskUsage)
            {
                ZifmiaDatabase.WriteTrace("Disk Usage Limit Reached.");
                viewModel.Status = ZifmiaStatus.Failure;
                viewModel.Message = String.Format("You are out of disk space. The maximum disk space of ({0}) has been reached. Delete a branch or session to continue playing.", maxDiskUsage);
                return viewModel;
            }

            //
            // TO DO - Add game access logic here for commercial games.
            //
            ZifmiaGame game = _database.GetGame(gameKey);
            viewModel.Game = game;
            ZifmiaDatabase.WriteTrace("Game retrieved.");

            ZifmiaSession session = new ZifmiaSession(game, player);
            ZifmiaDatabase.WriteTrace("Session created.");

            viewModel = new ZifmiaViewModel(session);
            viewModel.Status = ZifmiaStatus.Success;
            viewModel.Message = "Session started successfully.";
            ZifmiaDatabase.WriteTrace("ViewModel loaded.");

            if (!_unitTesting)
            {
                // Save the new session on another thread...
                var task = Task.Factory.StartNew(() => SaveNewSessionThread(session, _database));
            }
            else
            {
                SaveNewSessionThread(session, _database);
            }
            ZifmiaDatabase.WriteTrace("Session stored in database.");

            return viewModel;
        }

        private void SaveNewSessionThread(ZifmiaSession session, ZifmiaDatabase database)
        {
            database.Save(session);
        }

        #endregion

        #region Continue Game
        // - Verify authorization
        // - Verify session
        // - If session.CurrentBranchId == branchId && session.LastTurn == turn Then
        // -    ExecuteStandardTurn
        // - Else
        // -    ExecuteBranchedTurn
        public ZifmiaViewModel SendCommand(string authKey, string sessionKey, Int64 branchId, int turn, string command)
        {
            ZifmiaViewModel viewModel = new ZifmiaViewModel();

            ZifmiaPlayer player = _database.GetPlayerByAuthKey(authKey);
            ZifmiaDatabase.WriteTrace("Player retrieved.");

            CheckPlayer(player, viewModel);
            if (viewModel.Status == ZifmiaStatus.Failure)
            {
                return viewModel;
            }
            ZifmiaDatabase.WriteTrace("Player authorized.");
            viewModel.Player = player;

            //
            // Read the session
            //
            ZifmiaSession session = _database.GetSessionByKey(sessionKey);
            ZifmiaDatabase.WriteTrace("Session retrieved.");
            viewModel.Game = session.Game;

            //
            // Reset the state of the session to reflect the selected branch and turn
            //
            ZifmiaBranch selectedBranch = (from ZifmiaBranch b in session.Branches where b.Id == branchId select b).FirstOrDefault<ZifmiaBranch>();
            ZifmiaDatabase.WriteTrace("Branch retrieved.");

            if (selectedBranch == null)
            {
                viewModel.Message = "Command was received for an invalid branch.";
                viewModel.Status = ZifmiaStatus.Failure;
                return viewModel;
            }
            ZifmiaNode selectedNode = (from ZifmiaNode n in session.CurrentBranch.Nodes where n.Turn == turn select n).FirstOrDefault<ZifmiaNode>();
            ZifmiaDatabase.WriteTrace("Node retrieved.");

            if (selectedNode == null)
            {
                viewModel.Message = "Command was received for an invalid turn.";
                viewModel.Status = ZifmiaStatus.Failure;
                return viewModel;
            }


            if (session.CurrentBranch.Id == branchId && session.CurrentBranch.CurrentNode.Turn == turn)
            {
                return ExecuteStandardTurn(session, branchId, turn, command);
            }

            //
            // Check if we've already entered this command at this point, and if so,
            // return that node.
            //
            ZifmiaSession newSession = FindExistingNode(session, branchId, turn, command);
            if (newSession != null)
            {
                return new ZifmiaViewModel(newSession);
            }

            //
            // Now we know this is new territory...we're creating a new branch.
            //
            return ExecuteBranchedTurn(session, branchId, turn, command);
        }
        
        private ZifmiaViewModel ExecuteStandardTurn(ZifmiaSession session, Int64 branchId, int turn, string command) {
            ZifmiaDatabase.WriteTrace("Starting Standard Command.");
            BinaryFormatter serializer = new BinaryFormatter();
            MemoryStream toStream = new MemoryStream(session.CurrentBranch.CurrentNode.GetEngine());
            EngineWrapper engine = (EngineWrapper)serializer.Deserialize(toStream);
            ZifmiaDatabase.WriteTrace("Engine deserialized.");

            engine.SendCommand(command);
            ZifmiaDatabase.WriteTrace("Command executed.");

            ZifmiaNode node = new ZifmiaNode();
            node.Branch = session.CurrentBranch;
            node.Command = command;
            node.Created = DateTime.Now;
            node.Player = session.Owner;
            ZifmiaDatabase.WriteTrace("Node and Engine updated.");

            List<ZifmiaChannel> channels = new List<ZifmiaChannel>();
            foreach (string key in engine.FromHash().Keys)
            {
                channels.Add(new ZifmiaChannel(key, (string)engine.FromHash()[key]));
            }

            node.Channels = channels;
            session.CurrentBranch.Nodes.Add(node);
            session.CurrentBranch.CurrentNode = node;

            ZifmiaViewModel viewModel = new ZifmiaViewModel(session);

            ZifmiaDatabase.WriteTrace("Start save Action.");
            if (!_unitTesting)
            {
                var task = Task.Factory.StartNew(() => SaveTurnThread(session, node, engine, _database));
            }
            else
            {
                SaveTurnThread(session, node, engine, _database);
            }
            ZifmiaDatabase.WriteTrace("Action started.");

            viewModel.Message = "Command succeeded. Session updated.";
            viewModel.Status = ZifmiaStatus.Success;

            ZifmiaDatabase.WriteTrace("Returning data.");
            return viewModel;
        }

        private void SaveTurnThread(ZifmiaSession session, ZifmiaNode node, EngineWrapper engine, ZifmiaDatabase database)
        {
            ZifmiaDatabase.WriteTrace("Begin Action.");
            Int64 engineId = 0;
            int engineLength = 0;
            ZifmiaNode.SetEngine(engine, ref engineId, ref engineLength);
            node.EngineId = engineId;
            node.EngineLength = engineLength;
            _database.Save(session);
            ZifmiaDatabase.WriteTrace("End Action.");
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="session"></param>
        /// <returns></returns>
        private ZifmiaSession FindExistingNode(ZifmiaSession session, Int64 branchId, int turn, string command)
        {
            List<ZifmiaBranch> branches = (from ZifmiaBranch b in session.Branches where b.Id != branchId && b.Nodes[0].Turn == turn select b).ToList<ZifmiaBranch>();

            if (session.CurrentBranch.Nodes[0].Turn < turn)
            {
                branches.Add(session.CurrentBranch);
            }

            if (session.CurrentBranch.ParentBranch != null)
            {
                // We already have it in the list, but there's no harm
                // in checking it twice.
                branches.Add(session.CurrentBranch.ParentBranch);
            }

            ZifmiaBranch selectedBranch = null;
            ZifmiaNode selectedNode = null;
            foreach (ZifmiaBranch branch in branches)
            {
                ZifmiaNode node = (from ZifmiaNode n in branch.Nodes where n.Turn == (turn+1) && n.Command == command select n).FirstOrDefault<ZifmiaNode>();

                if (node != null)
                {
                    selectedBranch = branch;
                    selectedNode = node;
                    break;
                }
            }

            ZifmiaSession returnSession = null;
            if (selectedBranch != null)
            {
                returnSession = session;
                returnSession.CurrentBranch = selectedBranch;
                returnSession.CurrentBranch.CurrentNode = selectedNode;
            }

            return returnSession;
        }

        /// <summary>
        /// User has sent in a command at an historical node, so we have to figure out what
        /// to do from here.
        /// 
        /// First, is there an existing branch at this point with a next turn with the same
        /// command? If so, we can just return that node.
        /// </summary>
        /// <param name="session"></param>
        /// <param name="branchId"></param>
        /// <param name="turn"></param>
        /// <param name="command"></param>
        /// <returns></returns>
        private ZifmiaViewModel ExecuteBranchedTurn(ZifmiaSession session, Int64 branchId, int turn, string command)
        {
            BinaryFormatter serializer = new BinaryFormatter();
            MemoryStream toStream = new MemoryStream(session.CurrentBranch.CurrentNode.GetEngine());
            EngineWrapper engine = (EngineWrapper)serializer.Deserialize(toStream);

            engine.SendCommand(command);

            List<ZifmiaChannel> channels = new List<ZifmiaChannel>();
            foreach (string key in engine.FromHash().Keys)
            {
                channels.Add(new ZifmiaChannel(key, (string)engine.FromHash()[key]));
            }

            ZifmiaBranch oldBranch = session.CurrentBranch;

            session.CurrentBranch = new ZifmiaBranch(session, String.Concat(session.CurrentBranch.BranchName, "->", command), oldBranch);
            session.Branches.Add(session.CurrentBranch);
            
            ZifmiaNode node = new ZifmiaNode();
            node.Channels = channels;
            node.Branch = session.CurrentBranch;
            node.Command = command;
            node.Created = DateTime.Now;
            node.Player = session.Owner;
            session.CurrentBranch.Nodes.Add(node);
            session.CurrentBranch.CurrentNode = node;

            if (!_unitTesting)
            {
                var task = Task.Factory.StartNew(() => SaveTurnThread(session, node, engine, _database));
            }
            else
            {
                SaveTurnThread(session, node, engine, _database);
            }

            ZifmiaViewModel viewModel = new ZifmiaViewModel(session);

            viewModel.Message = "Command succeeded. Session updated.";
            viewModel.Status = ZifmiaStatus.Success;

            return viewModel;
        }

        #endregion

        #endregion

        #region Private Methods

        private void CheckPlayer(ZifmiaPlayer player, IZifmiaViewModel viewModel)
        {
            if (player == null)
            {
                viewModel.Status = ZifmiaStatus.DoesNotExist;
                viewModel.Message = "You are not authorized. Please log in again.";
                return;
            }
            else if (!player.IsValidated)
            {
                viewModel.Status = ZifmiaStatus.Invalid;
                viewModel.Message = "Account is not validated. Check your e-mail for further instructions.";
                return;
            }
            else if (!player.IsAuthorized)
            {
                viewModel.Status = ZifmiaStatus.Unauthorized;
                viewModel.Message = "You are not authorized. Please log in again.";
                return;
            }

            viewModel.Status = ZifmiaStatus.Success;
        }

        private static string RemoveUIElements(string text)
        {
            string rText = text;
            // change newlines to html br tags
            rText = rText.Replace(Environment.NewLine, "</br>");
            // remove ui link prefix
            rText = Regex.Replace(rText, @"\[ui\]{", "");
            // remove ui link suffix
            rText = Regex.Replace(rText, @"}.*\[/ui\]", "");
            // remove ui link prefix
            rText = Regex.Replace(rText, @"\[dir\]{", "");
            // remove ui link suffix
            rText = Regex.Replace(rText, @"}.*\[/dir\]", "");

            return rText;
        }

        private static string GetContents(List<ZifmiaChannel> channels, string channelName)
        {
            if (channels.Where<ZifmiaChannel>(item => item.Name == channelName).Count<ZifmiaChannel>() > 0)
                return channels.Where<ZifmiaChannel>(item => item.Name == channelName).First<ZifmiaChannel>().Content;
            else
                return "";
        }

        #endregion
    }
}
