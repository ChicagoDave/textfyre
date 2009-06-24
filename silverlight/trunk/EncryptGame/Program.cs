using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Security.Cryptography;

namespace EncryptGame
{
    class Program
    {
        static int Main(string[] args)
        {
            // these must match UlxImage.cs
            const string keykey = "Please don't share the game file";   // 32 chars
            const string ivString = "Hi from Textfyre";                 // 16 chars
            const int KEY_BYTES = 32;

            if (args.Length != 1 || !File.Exists(args[0]))
                return Usage();

            // generate key and initialization vector
            RandomNumberGenerator rng = new RNGCryptoServiceProvider();
            byte[] key = new byte[KEY_BYTES];
            rng.GetBytes(key);

            byte[] iv = new byte[16];
            for (int i = 0; i < 16; i++)
                iv[i] = (byte)ivString[i];

            Aes aes = new AesManaged();
            aes.KeySize = KEY_BYTES * 8;
            aes.Key = key;
            aes.IV = iv;

            using (Stream inputStream = new FileStream(args[0], FileMode.Open, FileAccess.Read),
                          outputStream = new FileStream(
                              args[0] + ".enc", FileMode.Create, FileAccess.Write))
            {
                // write magic number and munged key
                outputStream.WriteByte((byte)'J');
                outputStream.WriteByte((byte)'A');
                outputStream.WriteByte((byte)'C');
                outputStream.WriteByte((byte)'K');

                for (int i = 0; i < KEY_BYTES; i++)
                    outputStream.WriteByte((byte)(key[i] ^ keykey[i]));

                // write encrypted game file
                using (Stream cryptoStream = new CryptoStream(
                    outputStream, aes.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    const int BUFSIZE = 1024;
                    byte[] buffer = new byte[BUFSIZE];
                    int count;
                    while ((count = inputStream.Read(buffer, 0, BUFSIZE)) > 0)
                        cryptoStream.Write(buffer, 0, count);
                }
            }

            Console.Write("Done. AES key = ");
            for (int i = 0; i < KEY_BYTES; i++)
                Console.Write(key[i].ToString("x2"));
            Console.WriteLine();

            return 0;
        }

        private static int Usage()
        {
            Console.WriteLine("Usage: EncryptGame <file.ulx>");
            Console.WriteLine("Writes output to file.ulx.enc");
            return 1;
        }
    }
}
