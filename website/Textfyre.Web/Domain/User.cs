using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using Textfyre.Web.Extensions;

namespace Textfyre.Web.Domain {
    public class User {

        private string _firstName;
        private string _lastName;
        private string _city;
        private string _state;
        private string _school;
        private bool _isCustomer;
        private bool _ownsSecretLetter;
        private bool _ownsShadow;
        private bool _ownsEmpathy;

        public User(Guid userId, string email) {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TFWebLocalDB"].ConnectionString)) {
                    SqlCommand command = new SqlCommand("select FirstName, LastName, City, State, School, IsCustomer, OwnsSecretLetter, OwnsShadow, OwnsEmpathy from aspnet_TFProfile where userid = @userid", conn);
                    command.Parameters.Add(new SqlParameter("@userid",userId));
                    try {
                        conn.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.Read()) {
                            _firstName = reader["FirstName"].ToSafeString();
                            _lastName = reader["LastName"].ToSafeString();
                            _city = reader["City"].ToSafeString();
                            _state = reader["State"].ToSafeString();
                            _school = reader["School"].ToSafeString();
                            _isCustomer = reader["IsCustomer"].ToSafeBoolean();
                            _ownsSecretLetter = reader["OwnsSecretLetter"].ToSafeBoolean();
                            _ownsShadow = reader["OwnsShadow"].ToSafeBoolean();
                            _ownsEmpathy = reader["OwnsEmpathy"].ToSafeBoolean();
                        }

                        reader.Close();

                    } catch (Exception se) {
                        System.Diagnostics.EventLog log = new System.Diagnostics.EventLog();
                        log.Source = "Textfyre.Com";
                        log.WriteEntry(string.Format("Error with user profile '{0}' - {1}", email, se.Message));
                        log.Close();
                        log.Dispose();
                        return;
                    }

                    conn.Close();
                }
        }

        public User(string firstName, string lastName, string city, string state, string school, bool isCustomer, bool ownsSecretLetter, bool ownsShadow, bool ownsEmpathy) {
            _firstName = firstName;
            _lastName = lastName;
            _city = city;
            _state = state;
            _school = school;
            _isCustomer = isCustomer;
            _ownsSecretLetter = ownsSecretLetter;
            _ownsShadow = ownsShadow;
            _ownsEmpathy = ownsEmpathy;
        }

        public string FirstName { get { return _firstName; } set { _firstName = value; } }
        public string LastName { get { return _lastName; } set { _lastName = value; } }
        public string City { get { return _city; } set { _city = value; } }
        public string State { get { return _state; } set { _state = value; } }
        public string School { get { return _school; } set { _school = value; } }
        public bool IsCustomer { get { return _isCustomer; } set { _isCustomer = value; } }
        public bool OwnsSecretLetter { get { return _ownsSecretLetter; } set { _ownsSecretLetter = value; } }
        public bool OwnsShadow { get { return _ownsShadow; } set { _ownsShadow = value; } }
        public bool OwnsEmpathy { get { return _ownsEmpathy; } set { _ownsEmpathy = value; } }

    }
}
