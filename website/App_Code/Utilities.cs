using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Security.Cryptography;
using System.IO;

/// <summary>
/// Summary description for Utilities
/// </summary>
public static class Utilities
{
	
    public static void CleartextBoxes(Control parent)
    {

        foreach (Control c in parent.Controls)
        {
            if ((c.GetType() == typeof(TextBox)))
            {

                ((TextBox)(c)).Text = "";
            }
            //if ((c.GetType() == typeof(DropDownList)))
            //{

            //    ((DropDownList)(c)).ClearSelection();
            //}
            //if ((c.GetType() == typeof(Label)))
            //{

            //    ((Label)(c)).Text = "-1";
            //}

            if (c.HasControls())
            {
                CleartextBoxes(c);
            }
        }
    }
    /// <summary>
    /// Safe converting to any type
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <param name="value">Value to convert</param>
    /// <param name="defaultValue">Default value, sets type of return value</param>
    /// <returns>Converted value or defaul when error</returns>
    public static T safeConvert<T>(object value, T defaultValue)
    {
        try
        {
            return value == null ? default(T) :
                (T)Convert.ChangeType(value, Nullable.GetUnderlyingType(typeof(T)) ?? typeof(T));
        }
        catch
        {
            return defaultValue;
        }
    }

    public static String NumWords(double n) //converts double to words
    {
        string[] numbersArr = new string[] { "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen" };
        string[] tensArr = new string[] { "Twenty", "Thirty", "Fourty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninty" };
        string[] suffixesArr = new string[] { "Thousand", "Million", "Billion", "Trillion", "Quadrillion", "Quintillion", "Sextillion", "Septillion", "Octillion", "Nonillion", "Decillion", "Undecillion", "Duodecillion", "Tredecillion", "Quattuordecillion", "Quindecillion", "Sexdecillion", "Septdecillion", "Octodecillion", "Novemdecillion", "Vigintillion" };
        string words = "";

        bool tens = false;

        if (n < 0)
        {
            words += "Negative ";
            n *= -1;
        }

        int power = (suffixesArr.Length + 1) * 3;

        while (power > 3)
        {
            double pow = Math.Pow(10, power);
            if (n >= pow)
            {
                if (n % pow > 0)
                {
                    words += NumWords(Math.Floor(n / pow)) + " " + suffixesArr[(power / 3) - 1] + ", ";
                }
                else if (n % pow == 0)
                {
                    words += NumWords(Math.Floor(n / pow)) + " " + suffixesArr[(power / 3) - 1];
                }
                n %= pow;
            }
            power -= 3;
        }
        if (n >= 1000)
        {
            if (n % 1000 > 0) words += NumWords(Math.Floor(n / 1000)) + " Thousand, ";
            else words += NumWords(Math.Floor(n / 1000)) + " Thousand";
            n %= 1000;
        }
        if (0 <= n && n <= 999)
        {
            if ((int)n / 100 > 0)
            {
                words += NumWords(Math.Floor(n / 100)) + " Hundred";
                n %= 100;
            }
            if ((int)n / 10 > 1)
            {
                if (words != "")
                    words += " ";
                words += tensArr[(int)n / 10 - 2];
                tens = true;
                n %= 10;
            }

            if (n < 20 && n > 0)
            {
                if (words != "" && tens == false)
                    words += " ";
                words += (tens ? "-" + numbersArr[(int)n - 1] : numbersArr[(int)n - 1]);
                n -= Math.Floor(n);
            }
        }

        return words;

    }
    //public static string FriendlyInteger(int n, string leftDigits, int thousands)
    //{
    //     string[] ones = new string[] { "", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine" };
    // string[] teens = new string[] { "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen" };
    // string[] tens = new string[] { "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety" };
    // string[] thousandsGroups = { "", " Thousand", " Million", " Billion" };

    //    if (n == 0)
    //        return leftDigits;

    //    string friendlyInt = leftDigits;
    //    if (friendlyInt.Length > 0)
    //        friendlyInt += " ";

    //    if (n < 10)
    //        friendlyInt += ones[n];
    //    else if (n < 20)
    //        friendlyInt += teens[n - 10];
    //    else if (n < 100)
    //        friendlyInt += FriendlyInteger(n % 10, tens[n / 10 - 2], 0);
    //    else if (n < 1000)
    //        friendlyInt += FriendlyInteger(n % 100, (ones[n / 100] + " Hundred"), 0);
    //    else
    //        friendlyInt += FriendlyInteger(n % 1000, FriendlyInteger(n / 1000, "", thousands + 1), 0);

    //    return friendlyInt + thousandsGroups[thousands];
    //}
    public static string DateToWord(DateTime Date)
    {
        string Day = NumWords(Date.Day);
        int MnthVal = Date.Month;

        string Month = string.Empty;


        if (MnthVal == 1 || MnthVal == 01)
        {
            Month = "January";
        }
        else if (MnthVal == 2 || MnthVal == 02)
        {
            Month = "February";
        }
        else if (MnthVal == 3 || MnthVal == 03)
        {
            Month = "March";
        }
        else if (MnthVal == 4 || MnthVal == 04)
        {
            Month = "April";
        }
        else if (MnthVal == 5 || MnthVal == 05)
        {
            Month = "May";
        }
        else if (MnthVal == 6 || MnthVal == 06)
        {
            Month = "June";
        }
        else if (MnthVal == 7 || MnthVal == 07)
        {
            Month = "July";
        }
        else if (MnthVal == 8 || MnthVal == 08)
        {
            Month = "August";
        }
        else if (MnthVal == 9 || MnthVal == 09)
        {
            Month = "September";
        }
        else if (MnthVal == 10)
        {
            Month = "October";
        }
        else if (MnthVal == 11)
        {
            Month = "November";
        }
        else if (MnthVal == 12)
        {
            Month = "December";
        }
        string Year = NumWords(Date.Year);
        if (Year.Contains(','))
        {
            Year = Year.Replace(",", "");
        }
        string Wrd = Day + " " + Month + " " + Year;
        return Wrd;
    }
    public static string GetDate(string GetDate)
    {
        string res = GetDate.Substring(6, 4);
        int yy = Convert.ToInt32(GetDate.Substring(6));
        int Mm = Convert.ToInt32(GetDate.Substring(3, 2));
        int Dd = Convert.ToInt32(GetDate.Substring(0, 2));
        string D1 = new DateTime(yy, Mm, Dd).ToString("yyyy/MM/dd");
        return D1;
    }

    public static string Encrypt(string inputText)
    {
        string encryptionkey = "SAUW193BX628TD57";
        byte[] keybytes = Encoding.ASCII.GetBytes(encryptionkey.Length.ToString());
        RijndaelManaged rijndaelCipher = new RijndaelManaged();
        byte[] plainText = Encoding.Unicode.GetBytes(inputText);
        PasswordDeriveBytes pwdbytes = new PasswordDeriveBytes(encryptionkey, keybytes);
        using (ICryptoTransform encryptrans = rijndaelCipher.CreateEncryptor(pwdbytes.GetBytes(32), pwdbytes.GetBytes(16)))
        {
            using (MemoryStream mstrm = new MemoryStream())
            {
                using (CryptoStream cryptstm = new CryptoStream(mstrm, encryptrans, CryptoStreamMode.Write))
                {
                    cryptstm.Write(plainText, 0, plainText.Length);
                    cryptstm.Close();
                    return Convert.ToBase64String(mstrm.ToArray());
                }
            }
        }
    }

    public static string GetUserIdBySession()
    {
        string UserId = string.Empty;
        if (HttpContext.Current.Session["UID"] != null)
        {
            UserId = HttpContext.Current.Session["UID"].ToString();
        }
        return UserId;
    }
    public static string Decrypt(string cipherText)
    {
        string EncryptionKey = "MAKV2SPBNI99212";
        byte[] cipherBytes = Convert.FromBase64String(cipherText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(cipherBytes, 0, cipherBytes.Length);
                    cs.Close();
                }
                cipherText = Encoding.Unicode.GetString(ms.ToArray());
            }
        }
        return cipherText;
    }
    public static DateTime ToDateFormat(this string date)
    {
        System.Globalization.DateTimeFormatInfo dateInfo = new System.Globalization.DateTimeFormatInfo();
        dateInfo.ShortDatePattern = "dd-MM-yyyy";
        DateTime objDate = Convert.ToDateTime(date, dateInfo);

        return objDate;
    }

}