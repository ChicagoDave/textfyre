using System.Runtime.Serialization;

namespace Zifmia.Model
{
    public class ZifmiaLoginViewModel : IZifmiaViewModel
    {
        public bool IsLoggedIn { get; set; }
        public string AuthKey { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName { get; set; }
        public string EmailAddress { get; set; }
        public string Nickname { get; set; }
        public ZifmiaStatus Status { get; set; }
        public string Message { get; set; }

        public ZifmiaLoginViewModel() { }

        public ZifmiaLoginViewModel(bool loggedIn)
        {
            this.IsLoggedIn = loggedIn;
        }
    }
}
