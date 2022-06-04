using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Text;

/// <summary>
/// Summary description for DB_Configuration
/// </summary>
public static class DB_Configuration
{
    // Caches the connection string
    private static string dbConnectionString;
	static DB_Configuration()
	{
        dbConnectionString = ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString;
        
	}
    /// <summary>
    /// Returns the connection string for the Amity Starter Kit database
    /// </summary>
    public static string DbConnectionString
    {
        get
        {
            return dbConnectionString;
        }
    }
    public static string Encryptdata(string password)
    {
        string strmsg = string.Empty;
        byte[] encode = new byte[password.Length];
        encode = Encoding.UTF8.GetBytes(password);
        strmsg = Convert.ToBase64String(encode);
        return strmsg;
    }
    /// <summary>
    /// Function is used to Decrypt the password
    /// </summary>
    /// <param name="password"></param>
    /// <returns></returns>
    public static string Decryptdata(string encryptpwd)
    {
        string decryptpwd = string.Empty;
        UTF8Encoding encodepwd = new UTF8Encoding();
        Decoder Decode = encodepwd.GetDecoder();
        byte[] todecode_byte = Convert.FromBase64String(encryptpwd);
        int charCount = Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
        char[] decoded_char = new char[charCount];
        Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
        decryptpwd = new String(decoded_char);
        return decryptpwd;
    }
}