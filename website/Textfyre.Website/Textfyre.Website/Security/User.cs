using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace Textfyre.Website.Security
{
    public class User
    {
        public long Id { get; set; }
        public string Username { get; set; }
        public string EncryptedPassword { get; set; }
        public string DisplayName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailAddress { get; set; }
        public List<ResetQuestion> ResetQuestions { get; set; }
        public List<string> PurchasedGames { get; set; }

        public User()
        {
        }

        public void Save()
        {
        }

        public void ResetPassword(string oldPassword, string newPassword)
        {
        }

        public void SendPasswordResetEmail()
        {
        }

        public void PurchaseGame(string game)
        {
        }

        public static void Add(User user)
        {
        }
    }
}