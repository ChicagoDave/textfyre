using System;
using System.Linq;
using System.Collections.Generic;

using Eloquera.Client;

namespace Zifmia.Model
{
    public class ZifmiaPlayer
    {
        public ZifmiaPlayer() { }

        public ZifmiaPlayer(string username, string password, string nickName, string emailAddress)
        {
            this.Username = username;
            this.Password = password;
            this.NickName = nickName;
            this.FirstName = "";
            this.LastName = "";
            this.EmailAddress = emailAddress;
            this.ValidationId = System.Guid.NewGuid().ToString();
            this.IsValidated = false;
        }

        [ID]
        internal long UID;
        public virtual string Key
        {
            get
            {
                return this.UID.ToString("X");
            }
        }
        public string Message { get; set; }
        public ZifmiaStatus Status { get; set; }
        public string NickName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName
        {
            get
            {
                if (this.FirstName != "")
                {
                    if (this.LastName != "")
                    {
                        return string.Concat(this.FirstName, " ", this.LastName, " (", this.NickName, ")");
                    }
                    else
                    {
                        return string.Concat(this.FirstName, " (", this.NickName, ")");
                    }
                }
                else
                {
                    if (this.LastName != "")
                    {
                        return string.Concat(this.LastName, " (", this.NickName, ")");
                    }
                    else
                    {
                        return string.Concat("(", this.NickName, ")");
                    }
                }
            }
        }

        public string EmailAddress { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string FacebookAccount { get; set; }
        public string TwitterAccount { get; set; }
        public string ValidationId { get; set; }
        public bool IsValidated { get; set; }
        public string AuthKey { get; set; }
        public DateTime AuthorizedUntil { get; set; }

        public bool IsAuthorized
        {
            get
            {
                if (AuthKey == "") return false;

                bool isAuthorized = (this.AuthorizedUntil >= DateTime.Now);
                if (isAuthorized)
                {
                    UpdateAuthorization();
                }
                return isAuthorized;
            }
        }

        public void Authorize(string authKey)
        {
            this.AuthKey = authKey;
            UpdateAuthorization();
        }

        private void UpdateAuthorization()
        {
            this.AuthorizedUntil = DateTime.Now.AddHours(1);
        }

        public ZifmiaStatus Validate(string validationId)
        {
            ZifmiaStatus status = ZifmiaStatus.Success;

            if (validationId == this.ValidationId)
            {
                this.IsValidated = true;
            }
            else
            {
                status = ZifmiaStatus.Failure;
            }

            return status;
        }

    }
}