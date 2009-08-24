using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;

namespace Textfyre.Common.Utilities
{
    public class General
    {
		public const string PASSWORD="pl,okm";
		
        public static T iif<T>(bool expression, T trueReturn, T falseReturn)
        {
            if (expression) return trueReturn; else return falseReturn;
        }

        public static bool IsNull(object value) {
            return (value is DBNull);
        }

        public static string TrimEnd(string text, int characters)
        {
            return text.Remove(text.Length - characters, characters);
        }
		/// <summary>
		///This method is responsible for generating password
		/// </summary>
		/// <param name="stringToEncrypt"></param>
		/// <returns></returns>
		public static string EnCrypt(string stringToEncrypt){
			return EnCrypt (stringToEncrypt,PASSWORD);
		}
        #region Legacy AC Encrypt/Decrpt Algorithms
        /// <summary>
        /// Encrypts a string.
        /// </summary>
        /// <param name="stringToEncrypt">The string to encrypt</param>
        /// <param name="password">The password</param>
        /// <returns></returns>
        public static string EnCrypt(string stringToEncrypt, string password) {            
            int a = 0;
            int b = 0;
            int i = 0;

            StringBuilder buffer = new StringBuilder();
            StringBuilder hexBuffer = new StringBuilder();

            //Iterate through the string to encrypt
            for (i = 0; i < stringToEncrypt.Length; i++) {

                //Grab a single character from the password string
                b = password[a];

                //XOR the character from the string to encrypt with the character from the
                //password string
                buffer.Append((char)(stringToEncrypt[i] ^ b));

                //Increment a
                a++;

                //If a becomes greater than the length of the password, then go back to
                //the first character in password
                if (a == password.Length)
                    a = 0;
            }

            //Convert each character in the buffer to its hex representation
            //Make sure the resulting string is 2 characters
            for (i = 0; i < buffer.Length; i++) {
                hexBuffer.Append(((int)buffer[i]).ToString("X2"));
            }

            //Prepend the length of the hex buffer to the actual string            
            return hexBuffer.Length.ToString("00") + hexBuffer.ToString();
        }

        /// <summary>
        /// Decrypts a string.
        /// </summary>
        /// <param name="stringToDecrypt">The string to decrypt</param>
        /// <param name="password">The password</param>
        /// <returns></returns>
        public static string DeCrypt(string stringToDecrypt, string password) {
            int a = 0;
            int b = 0;
            int i = 0;

            StringBuilder retVal = new StringBuilder();
            StringBuilder buffer = new StringBuilder();
            string hexBuffer = stringToDecrypt.Substring(2, int.Parse(stringToDecrypt.Substring(0, 2)));

            //Iterate through the string to decrypt.  Every 2 characters represent a hex value.  Convert each
            //hex value back into a single character.  Append the converted character to the buffer.
            for (i = 0; i < hexBuffer.Length; i += 2) {
                buffer.Append((char)Convert.ToInt32(hexBuffer.Substring(i, 2), 16));
            }

            //Iterate through the buffer and convert each character back to the original character it was prior to
            //encryption.
            for (i = 0; i < buffer.Length; i++) {

                //Grab a single character from the password string
                b = password[a];

                //Append the converted character to the retVal buffer
                retVal.Append((char)(buffer[i] ^ b));

                //Increment a
                a++;

                //If a becomes greater than the length of the password, then go back to
                //the first character in password
                if (a == password.Length)
                    a = 0;
            }

            return retVal.ToString();
        }
        #endregion

        #region Time zone conversions

        public static DateTime ConvertCentralTimeToUserTime(DateTime centralTimeToConvert, TimeZoneInfo userTimeZoneInfo) {
            if(userTimeZoneInfo == null) {
                throw new ArgumentException("The user's time zone info can not be null.", "userTimeZoneInfo");
            }

            TimeZoneInfo centralTimeZoneInfo = TimeZoneInfo.Local; //Central time
            if(userTimeZoneInfo.BaseUtcOffset == centralTimeZoneInfo.BaseUtcOffset) //Are the time zones the same
                return centralTimeToConvert;

            return TimeZoneInfo.ConvertTime(centralTimeToConvert, centralTimeZoneInfo, userTimeZoneInfo);
        }

        public static DateTime ConvertUserTimeToCentralTime(DateTime userTimeToConvert, TimeZoneInfo userTimeZoneInfo) {
            if(userTimeZoneInfo == null) {
                throw new ArgumentException("The user's time zone info can not be null.", "userTimeZoneInfo");
            }

            TimeZoneInfo centralTimeZoneInfo = TimeZoneInfo.Local; //Central time
            if(userTimeZoneInfo.BaseUtcOffset == centralTimeZoneInfo.BaseUtcOffset) //Are the time zones the same
                return userTimeToConvert;

            return TimeZoneInfo.ConvertTime(userTimeToConvert, userTimeZoneInfo, centralTimeZoneInfo);
        }
        #endregion
    }
}
