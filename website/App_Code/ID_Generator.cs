using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace Amity.ERP_Utilities
{


    /// <summary>
    /// Class for universal ID genr
    /// </summary>
    public class ID_Generator
    {
        public ID_Generator()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public string GetFinYear(string sdate)
        {
            string finyear = "";
            DateTime s = Convert.ToDateTime(sdate);

            int m = s.Month;
            int y = int.Parse(string.Format("{0:yyyy}", s));
            if (m > 3)
            {
                finyear = y.ToString() + "-" + Convert.ToString((y + 1));
            }
            else
            {
                finyear = Convert.ToString((y - 1)) + "-" + y.ToString();
            }
            return finyear;

        }

        /// <summary>
        /// Generates New ID Input String must be in Format "XXXXXX-0000000/10-11"
        /// </summary>
        public string GenerateNewID(string MaxLastID, string IDFormat)
        {
            string complaintNum = "";

            string MaxID = MaxLastID;
            string ComNo;
            if (MaxID == "" || MaxID == string.Empty)
            {
                ComNo = IDFormat;
            }
            else
            {
                ComNo = MaxID;
            }
            if (ComNo.Contains("-"))
            {
                string[] arr = ComNo.Split('-');
                //string str = arr[1];
                //string[] arr1 = str.Split('/');

                int num = Convert.ToInt32(arr[1]) + 1;
                //string temp = num.ToString();
                //int len = 7 - temp.Length;
                //while (len >= 1)
                //{
                //    temp = "0" + temp;
                //    len--;
                //}
                complaintNum = arr[0] + "-" + num;
                return complaintNum;
            }

            else
            {
                string newno = ComNo;
                return newno;
            }
        }
        public string GenerateNewID1(string MaxLastID, string IDFormat)
        {
            string complaintNum = "";

            string MaxID = MaxLastID;
            string ComNo;
            if (MaxID == "" || MaxID == string.Empty)
            {
                ComNo = IDFormat;
            }
            else
            {
                ComNo = MaxID;
            }
            if (ComNo.Contains("/"))
            {
                string[] arr = ComNo.Split('-');
                string str = arr[1];
                string[] arr1 = str.Split('/');

                int num = Convert.ToInt32(arr1[0]) + 1;
                string temp = num.ToString();
                int len = 4 - temp.Length;
                while (len >= 1)
                {
                    temp = "0" + temp;
                    len--;
                }
                complaintNum = arr[0] + "-" + temp + "/" + GetFinYear(System.DateTime.Now.Date.ToString());
                return complaintNum;
            }

            else
            {
                string newno = ComNo + "/" + GetFinYear(System.DateTime.Now.Date.ToString());
                return newno;
            }
        }
        public string GenrateEmpID(string MaxLastID, string IDFormat)
        {
            string complaintNum = "";
            string MaxID = MaxLastID;
            string ComNo;
            if (MaxID == "" || MaxID == string.Empty)
            {
                ComNo = IDFormat;
            }
            else
            {
                ComNo = MaxID;
            }
            if (ComNo.Contains("-"))
            {
                string[] arr = ComNo.Split('-');
                string str = arr[1];
                int num = int.Parse(str) + 1;
                string temp = num.ToString();
                int len = 4 - temp.Length;
                while (len >= 1)
                {
                    temp = "0" + temp;
                    len--;
                }
                complaintNum = arr[0] + "-" + temp ;
                return complaintNum;
            }

            else
            {

                return IDFormat;
            }
        }
        public string GenrateCustomerID(string MaxLastID, string IDFormat)
        {
            string complaintNum = "";
            string MaxID = MaxLastID;
            string ComNo;
            if (MaxID == "" || MaxID == string.Empty)
            {
                ComNo = IDFormat;
            }
            else
            {
                ComNo = MaxID;
            }
            if (ComNo.Contains("-"))
            {
                string[] arr = ComNo.Split('-');
                string str = arr[1];
                int num = int.Parse(str) + 1;
                string temp = num.ToString();
                int len = 7 - temp.Length;
                while (len >= 1)
                {
                    temp = "0" + temp;
                    len--;
                }
                complaintNum = arr[0] + "-" + temp;
                return complaintNum;
            }

            else
            {

                return IDFormat;
            }
        }

        public string GenrateProductID( string ShortCode,string MaxLastID, string IDFormat)
        {
            string complaintNum = "";
            string MaxID = MaxLastID;
            string ComNo;
            if (MaxID == "" || MaxID == string.Empty)
            {
                ComNo = IDFormat;
            }
            else
            {
                ComNo = MaxID;
            }
            if (ComNo.Contains("-"))
            {
                string[] arr = ComNo.Split('-');
                string str = arr[1];
                int num = int.Parse(str) + 1;
                string temp = num.ToString();
                int len = 5 - temp.Length;
                while (len >= 1)
                {
                    temp = "0" + temp;
                    len--;
                }
                complaintNum =ShortCode + "-" + temp;
                return complaintNum;
            }

            else
            {

                return IDFormat;
            }
        }
        public string GenrateProductID(string MaxLastID, string IDFormat)
        {
            string complaintNum = "";
            string MaxID = MaxLastID;
            string ComNo;
            if (MaxID == "" || MaxID == string.Empty)
            {
                ComNo = IDFormat;
            }
            else
            {
                ComNo = MaxID;
            }
            if (ComNo.Contains("-"))
            {
                string[] arr = ComNo.Split('-');
                string str = arr[1];
                int num = int.Parse(str) + 1;
                string temp = num.ToString();
                int len = 4 - temp.Length;
                while (len >= 1)
                {
                    temp = "0" + temp;
                    len--;
                }
                complaintNum = arr[0] + "-" + temp;
                return complaintNum;
            }

            else
            {

                return IDFormat;
            }
        }


        public string CreateRandomPassword(int PasswordLength)
        {

            string alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            string small_alphabets = "abcdefghijklmnopqrstuvwxyz";
            string numbers = "1234567890";

            string characters = numbers;

            characters += alphabets + small_alphabets + numbers;

            int length = PasswordLength;
            string otp = string.Empty;
            for (int i = 0; i < length; i++)
            {
                string character = string.Empty;
                do
                {
                    int index = new Random().Next(0, characters.Length);
                    character = characters.ToCharArray()[index].ToString();
                } while (otp.IndexOf(character) != -1);
                otp += character;
            }

            return otp;
        }



        public string RandomAlphaNumeric(int length)
        {
            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            var random = new Random();
            var result = new string(
                Enumerable.Repeat(chars, length)
                          .Select(s => s[random.Next(s.Length)])
                          .ToArray());
            return result.ToString();


        }
        //public string RandomSentCode(int size)
        //{
        //    StringBuilder builder = new StringBuilder();
        //    Random random = new Random();
        //    char ch;
        //    for (int i = 0; i < size; i++)
        //    {
        //        ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
        //        builder.Append(ch.ToString());

        //    }

        //    return builder.ToString();
        //}
    }
}