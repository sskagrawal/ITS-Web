using System;
using System.Text;
using System.Web.UI.WebControls;
using System.Data;
using System.Web;
using System.Globalization;
using System.Net;


public static class utility
{
   
    public static void bindCompany(DropDownList ddlCompany)
    {
        DbConnection db = new DbConnection();
        DataTable dt = db.ExecuteDataTable("SelectCompany");
        ddlCompany.DataSource = dt;
        ddlCompany.DataTextField = "CompanyName";
        ddlCompany.DataValueField = "CompanyId";
        ddlCompany.DataBind();
        ddlCompany.Items.Insert(0, "-----Select Company----");
        ddlCompany.Items[0].Value = "0";

    }
    public static String NumWords(double n) //converts double to words
    {
        string[] numbersArr = new string[] { "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen" };
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

      public static void BindColor(DropDownList ddlColor)
    {
        DbConnection db = new DbConnection();
        DataTable dt = db.ExecuteDataTable("SelectColor");
        ddlColor.DataSource = dt;
        ddlColor.DataTextField = "ColorName";
        ddlColor.DataValueField = "ColorId";
        ddlColor.DataBind();
        ddlColor.Items.Insert(0, "-----Select Color----");
        ddlColor.Items[0].Value = "0";

    }
  public static void BindAllSize(CheckBoxList chklstSize)
    {
        DbConnection db = new DbConnection();
        DataTable dt = db.ExecuteDataTable("SelectAllSize");
        chklstSize.DataSource = dt;
        chklstSize.DataTextField = "Size";
        chklstSize.DataValueField = "SizeId";
        chklstSize.DataBind();
    }
    public static void bindMonth(DropDownList ddlMonth)
    {
        DbConnection db = new DbConnection();
        DataTable dt = db.ExecuteDataTable("SelectAllMonth");
        ddlMonth.DataSource = dt;
        ddlMonth.DataTextField = "AlternateText";
        ddlMonth.DataValueField = "MonthId";
        ddlMonth.DataBind();
        ddlMonth.Items.Insert(0, "-----Select Month----");
        ddlMonth.Items[0].Value = "0";

    }
    public static void bindAgency(DropDownList ddlAgency)
    {
        DbConnection db = new DbConnection();
        DataTable dt = db.ExecuteDataTable("BindAgency");
        ddlAgency.DataSource = dt;
        ddlAgency.DataTextField = "AgencyName";
        ddlAgency.DataValueField = "AgencyId";
        ddlAgency.DataBind();
        ddlAgency.Items.Insert(0, "-----Select Agency----");
        ddlAgency.Items[0].Value = "0";

    }

    public static void bindSalesMan(DropDownList ddlSalesMan)
    {
        DbConnection db = new DbConnection();
        DataTable dt = db.ExecuteDataTable("BindUsers");
        ddlSalesMan.DataSource = dt;
        ddlSalesMan.DataTextField = "SalesName";
        ddlSalesMan.DataValueField = "UserId";
        ddlSalesMan.DataBind();
        ddlSalesMan.Items.Insert(0, "-----Select User----");
        ddlSalesMan.Items[0].Value = "0";

    }

    public static void bindCountry(DropDownList ddlCountry)
    {
        DbConnection db = new DbConnection();
        DataTable dt = db.ExecuteDataTable("BindCountry");
        ddlCountry.DataSource = dt;
        ddlCountry.DataTextField = "CountryName";
        ddlCountry.DataValueField = "CountryId";
        ddlCountry.DataBind();
        ddlCountry.Items.Insert(0, "-----Select Country----");
        ddlCountry.Items[0].Value = "0";

    }

    public static void bindState(DropDownList ddlState,int CountryId)
    {
        DbConnection db = new DbConnection();
        db.AddParameter("@CountryId", CountryId);
        DataTable dt = db.ExecuteDataTable("BindState");
        ddlState.DataSource = dt;
        ddlState.DataTextField = "StateName";
        ddlState.DataValueField = "StateId";
        ddlState.DataBind();
        ddlState.Items.Insert(0, "-----Select State----");
        ddlState.Items[0].Value = "0";

    }

    public static void bindCity(DropDownList ddlCity, int CountryId,int StateId)
    {
        DbConnection db = new DbConnection();
        db.AddParameter("@CountryId", CountryId);
        db.AddParameter("@StateId", StateId);
        DataTable dt = db.ExecuteDataTable("BindCity");
        ddlCity.DataSource = dt;
        ddlCity.DataTextField = "CityName";
        ddlCity.DataValueField = "CityId";
        ddlCity.DataBind();
        ddlCity.Items.Insert(0, "-----Select City----");
        ddlCity.Items[0].Value = "0";

    }

    public static void bindCategory(DropDownList ddlCategory)
    {
        DbConnection db = new DbConnection();
        DataTable dt = db.ExecuteDataTable("BindCategory");
        ddlCategory.DataSource = dt;
        ddlCategory.DataTextField = "CategoryName";
        ddlCategory.DataValueField = "CategoeyId";
        ddlCategory.DataBind();
        ddlCategory.Items.Insert(0, "-----Select Category----");
        ddlCategory.Items[0].Value = "0";

    }
    public static void bindSalesSubCategory(DropDownList ddlSalesSubCategory, int SalesCategoryId)
    {
        DbConnection db = new DbConnection();
        db.AddParameter("@SalesCategoeyId", SalesCategoryId);
        DataTable dt = db.ExecuteDataTable("SelectSalesSubCategory");
        ddlSalesSubCategory.DataSource = dt;
        ddlSalesSubCategory.DataTextField = "SalesSubCategoryName";
        ddlSalesSubCategory.DataValueField = "SalesSubCategoryId";
        ddlSalesSubCategory.DataBind();
        ddlSalesSubCategory.Items.Insert(0, "-----Select Sub Category----");
        ddlSalesSubCategory.Items[0].Value = "0";

    }

    public static void bindSalesChildCategory(DropDownList ddlSalesChildCategory, int SalesCategoryId,int SalesSubCategoryId)
    {
        DbConnection db = new DbConnection();
        db.AddParameter("@SalesCategoeyId", SalesCategoryId);
        db.AddParameter("@SalesSubCategoryId", SalesSubCategoryId);
        DataTable dt = db.ExecuteDataTable("SelectSalesChildCategory");
        ddlSalesChildCategory.DataSource = dt;
        ddlSalesChildCategory.DataTextField = "SalesChildCategoryName";
        ddlSalesChildCategory.DataValueField = "SalesChildCategoryId";
        ddlSalesChildCategory.DataBind();
        ddlSalesChildCategory.Items.Insert(0, "-----Select Child Category----");
        ddlSalesChildCategory.Items[0].Value = "0";

    }
    public static void GetBuyerName(int BuyerId,Label lblBuyerName)
    {
        DbConnection db = new DbConnection();
        string search = " AND BR.BuyerId=" + BuyerId;
        db.AddParameter("@Search",search);
        DataTable dtBuyer = db.ExecuteDataTable("SelectMerchant");
        if (dtBuyer != null && dtBuyer.Rows.Count > 0)
        {
            lblBuyerName.Text = Convert.ToString(dtBuyer.Rows[0]["EmailId"]);
        }
    }
    public static void bindState(DropDownList ddlState)
    {
         DbConnection db = new DbConnection();
        DataTable dt = db.ExecuteDataTable("SelectState");
        ddlState.DataSource = dt;
        ddlState.DataTextField = "State_Name";
        ddlState.DataValueField = "State_Name";
        ddlState.DataBind();
        ddlState.Items.Insert(0, "-----Select State----");
        ddlState.Items[0].Value = "0";
    }
    public static void bindCity(DropDownList drdCity,string StateID)
    {
        DbConnection db = new DbConnection();
        db.AddParameter("@State_Name", StateID);
        DataTable dt = db.ExecuteDataTable("SelectCity");
        drdCity.DataSource = dt;
        drdCity.DataTextField = "City_Name";
        drdCity.DataValueField = "City_Name";
        drdCity.DataBind();
        drdCity.Items.Insert(0, "-----Select City----");
        drdCity.Items[0].Value = "0";
    }
    public static void bindUserType(DropDownList ddlUserType)
    {
        DbConnection db = new DbConnection();
        DataTable dt = db.ExecuteDataTable("SelectUserType");
        ddlUserType.DataSource = dt;
        ddlUserType.DataTextField = "UserType";
        ddlUserType.DataValueField = "UserTypeId";
        ddlUserType.DataBind();
        ddlUserType.Items.Insert(0, "-----Select User Type----");
        ddlUserType.Items[0].Value = "0";
    }
    
    public static DateTime GetDate(string GetDate)
    {
        string res = GetDate.Substring(6, 4);
        int yy = Convert.ToInt32(GetDate.Substring(6));
        int Mm = Convert.ToInt32(GetDate.Substring(3,2));
        int Dd = Convert.ToInt32(GetDate.Substring(0, 2));
        string D1 = new DateTime(yy,Mm,Dd).ToString("yyyy/MM/dd");
        return DateTime.Parse(D1);
    }

    public static string GetDateForSearch(string DateVal)
    {
        DateTime date = DateTime.ParseExact(DateVal, "dd/MM/yyyy", CultureInfo.InvariantCulture);
        return date.ToString("dd/MM/yyyy");
    }
    public static DateTime getCurrentDateTime()
    {
        TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
        DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);
        return indianTime;
    }
    public static void checkSession()
    {
        if (HttpContext.Current.Session["AdminId"] == null)
        {
            HttpContext.Current.Response.Redirect("~/Login.aspx");
        }
    }

    /// <summary>
    /// Generates New ID Input String must be in Format "XXXXXX-0000000/10-11"
    /// </summary>
    public static string GenerateNewID(string MaxLastID, string IDFormat)
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
            complaintNum = RandomSentCode(3) + "-" + temp + "/" + GetFinYear(System.DateTime.Now.Date.ToString());
            return complaintNum;
        }

        else
        {
            string newno = ComNo + "/" + GetFinYear(System.DateTime.Now.Date.ToString());
            return newno;
        }
    }
    public static string RandomSentCode(int size)
    {
        StringBuilder builder = new StringBuilder();
        Random random = new Random();
        char ch;
        for (int i = 0; i < size; i++)
        {
            ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
            builder.Append(ch.ToString());

        }

        return builder.ToString();
    }

    public static string GetFinYear(string sdate)
    {
        string finyear = "";
        DateTime s = Convert.ToDateTime(sdate);

        int m = s.Month;
        int y = int.Parse(string.Format("{0:yy}", s));
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


    public static string ToUpperFirstLetter(this string source)
    {
        if (string.IsNullOrEmpty(source))
            return string.Empty;
        string S = ""; char a;
        string[] str = source.Split(' ');
        for (int i = 0; i < str.Length; i++)
        {
            char[] letters = str[i].ToCharArray();
            a = char.ToUpper(letters[0]);
            S = S + a + str[i].Substring(1, str[i].Length - 1).ToLower() + " ";
        }
        return (S.Trim());
    }
    public static string Chop(this string s, int length)
    {
        var sb = new StringBuilder();
        try
        {
            s = StripHTML(s);
            if (s.Length < length)
            {
                sb.Append(s);
            }
            else
            {
                var words = s.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
                if (words[0].Length > length)
                    sb.Append(words[0].Substring(0, length));

                foreach (var word in words)
                {
                    if ((sb + word).Length > length)
                        return string.Format("{0}...", sb.ToString().TrimEnd(' '));
                    sb.Append(word + " ");
                }
            }
        }
        catch (Exception ex) { throw ex; }
        return string.Format("{0}", sb.ToString().TrimEnd(' '));
    }
    private static string StripHTML(string source)
    {
        try
        {
            string result;

            result = source.Replace("\r", " ");
            result = result.Replace("\n", " ");
            result = result.Replace("\t", string.Empty);
            result = System.Text.RegularExpressions.Regex.Replace(result, @"( )+", " ");

            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"<( )*head([^>])*>", "<head>",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"(<( )*(/)( )*head( )*>)", "</head>",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     "(<head>).*(</head>)", string.Empty,
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);

            // remove all scripts (prepare first by clearing attributes)
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"<( )*script([^>])*>", "<script>",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"(<( )*(/)( )*script( )*>)", "</script>",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            //result = System.Text.RegularExpressions.Regex.Replace(result,
            //         @"(<script>)([^(<script>\.</script>)])*(</script>)",
            //         string.Empty,
            //         System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"(<script>).*(</script>)", string.Empty,
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);

            // remove all styles (prepare first by clearing attributes)
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"<( )*style([^>])*>", "<style>",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"(<( )*(/)( )*style( )*>)", "</style>",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     "(<style>).*(</style>)", string.Empty,
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);

            // insert tabs in spaces of <td> tags
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"<( )*td([^>])*>", "\t",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);

            // insert line breaks in places of <BR> and <LI> tags
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"<( )*br( )*>", "\r",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"<( )*li( )*>", "\r",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);

            // insert line paragraphs (double line breaks) in place
            // if <P>, <DIV> and <TR> tags
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"<( )*div([^>])*>", "\r\r",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"<( )*tr([^>])*>", "\r\r",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"<( )*p([^>])*>", "\r\r",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);

            // Remove remaining tags like <a>, links, images,
            // comments etc - anything that's enclosed inside < >
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"<[^>]*>", string.Empty,
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);

            // replace special characters:
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @" ", " ",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);

            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"&bull;", " * ",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"&lsaquo;", "<",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"&rsaquo;", ">",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"&trade;", "(tm)",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"&frasl;", "/",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"&lt;", "<",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"&gt;", ">",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"&copy;", "(c)",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"&reg;", "(r)",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            // Remove all others. More can be added, see
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"&(.{2,6});", string.Empty,
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);

            // for testing
            //System.Text.RegularExpressions.Regex.Replace(result,
            //       this.txtRegex.Text,string.Empty,
            //       System.Text.RegularExpressions.RegexOptions.IgnoreCase);

            // make line breaking consistent
            result = result.Replace("\n", "\r");

            result = System.Text.RegularExpressions.Regex.Replace(result,
                     "(\r)( )+(\r)", "\r\r",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     "(\t)( )+(\t)", "\t\t",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     "(\t)( )+(\r)", "\t\r",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     "(\r)( )+(\t)", "\r\t",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            // Remove redundant tabs
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     "(\r)(\t)+(\r)", "\r\r",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            // Remove multiple tabs following a line break with just one tab
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     "(\r)(\t)+", "\r\t",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            // Initial replacement target string for line breaks
            string breaks = "\r\r\r";
            // Initial replacement target string for tabs
            string tabs = "\t\t\t\t\t";
            for (int index = 0; index < result.Length; index++)
            {
                result = result.Replace(breaks, "\r\r");
                result = result.Replace(tabs, "\t\t\t\t");
                breaks = breaks + "\r";
                tabs = tabs + "\t";
            }

            // That's it.
            return result;
        }
        catch
        {
            return source;
        }
    }
    public static string GetIPAddress()
    {
        string hostName = Dns.GetHostName(); // Retrive the Name of HOST

        Console.WriteLine(hostName);

        // Get the IP

        string myIP = Dns.GetHostByName(hostName).AddressList[0].ToString();

        //Console.WriteLine("My IP Address is :" + myIP);

        //Console.ReadKey();

        return myIP;
    }
    public static string GenrateOrderNo(string MaxLastID, string IDFormat)
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
        if (ComNo != string.Empty)
        {
            string arr1 = ComNo.Substring(0, 2);
            string arr2 = ComNo.Substring(2);

            int num = int.Parse(arr2) + 1;
            string temp = num.ToString();
            int len = 3 - temp.Length;
            while (len >= 1)
            {
                temp = "0" + temp;
                len--;
            }
            complaintNum = arr1 + temp;
            return complaintNum;
        }
        else
        {
            return ComNo;

        }




    }
    //public static DateTime ToDateFormat(this string date)
    //{
    //    System.Globalization.DateTimeFormatInfo dateInfo = new System.Globalization.DateTimeFormatInfo();
    //    dateInfo.ShortDatePattern = "dd/MM/yyyy";
    //    DateTime objDate = Convert.ToDateTime(date, dateInfo);

    //    return objDate;
    //}
}