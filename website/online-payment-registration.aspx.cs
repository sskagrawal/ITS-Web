using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using Encryption.AES;
using System.Collections.Specialized;
using System.Security.Cryptography;
using System.Configuration;
using Razorpay.Api;

public partial class OnlinePaymentRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //FillCountry();
            //FillState(ddlCountry.SelectedValue);
        }
    }
    protected void lbtnSubmit_Click(object sender, EventArgs e)
    {
       
    }
    //PayPik Payment Gateway integration
    //private void bindPayment(string ordId,string trnsId)
    //{
    //    string txnagId = "paygate";
    //    string txnmerchantId = "201812100003";
    //    string txnmerchantKey = "a55ciWNVveBceulHDSg7weXlrMcIrEoCPK21SVR1/QM=";

    //    string txnorderNumber = ordId;
    //    string txnAmount = (!String.IsNullOrEmpty(txtAmount.Text)) ? txtAmount.Text : string.Empty;
    //    string txnCountry = "IND";
    //    string txnCountryCurrency = "INR";
    //    string txnType = "SALE";
    //    string txnsuccessUrl = "https://itsgwalior.com/MerchantSuccess.aspx";
    //    string txnfailureUrl = "https://itsgwalior.com/MerchantFailure.aspx";
    //    string txnChannel = "WEB";



    //    string pgId =string.Empty;
    //    string pgPayMode = string.Empty;
    //    string pgscheme = string.Empty;
    //    string pgEmiMonths = string.Empty;

    //    string ccCardNo =string.Empty;
    //    string ccExpMonth =string.Empty;
    //    string ccexpYear = string.Empty;
    //    string ccCardName = string.Empty;
    //    string ccCvv2 = string.Empty;

    //    string custName = (!String.IsNullOrEmpty(txtCustName.Text)) ? txtCustName.Text : string.Empty;
    //    string custEmailId = (!String.IsNullOrEmpty(txtEmailID.Text)) ? txtEmailID.Text : string.Empty;
    //    string custMobileNo = (!String.IsNullOrEmpty(txtMobNo.Text)) ? txtMobNo.Text : string.Empty;
    //    string custUniqueId = string.Empty;
    //    string custisLoggedIn = string.Empty;



    //    string billAddress = (!String.IsNullOrEmpty(txtAddr.Text)) ? txtAddr.Text : string.Empty;
    //    string billCity = (!String.IsNullOrEmpty(txtCity.Text)) ? txtCity.Text : string.Empty;
    //    string billState = (!String.IsNullOrEmpty(ddlState.SelectedValue)) ? ddlState.SelectedValue : string.Empty;
    //    string billCountry = (!String.IsNullOrEmpty(ddlCountry.SelectedValue)) ? ddlCountry.SelectedValue : string.Empty;
    //    string billZip = (!String.IsNullOrEmpty(txtZipCode.Text)) ? txtZipCode.Text : string.Empty;



    //    string shipAddress = string.Empty;
    //    string shipCity = string.Empty;
    //    string shipState = string.Empty;
    //    string shipCountry = string.Empty;
    //    string shipZip = string.Empty;
    //    string shipDays =  string.Empty;
    //    string shipAddressCount =string.Empty;


    //    string itemCount = string.Empty;
    //    string itemValue =  string.Empty;
    //    string itemCategory =string.Empty;


    //    string udf1 = string.Empty;
    //    string udf2 = string.Empty;
    //    string udf3 = string.Empty;
    //    string udf4 = string.Empty;
    //    string udf5 = string.Empty;


    //    string txn_details = txnagId + "|" + txnmerchantId + "|" + txnorderNumber + "|" + txnAmount + "|" + txnCountry + "|" + txnCountryCurrency + "|" + txnType + "|" + txnsuccessUrl + "|" + txnfailureUrl + "|" + txnChannel;
    //    string pg_details = pgId + "|" + pgPayMode + "|" + pgscheme + "|" + pgEmiMonths;
    //    string card_details = ccCardNo + "|" + ccExpMonth + "|" + ccexpYear + "|" + ccCvv2 + "|" + ccCardName;
    //    string cust_details = custName + "|" + custEmailId + "|" + custMobileNo + "|" + custUniqueId + "|" + custisLoggedIn;
    //    string bill_details = billAddress + "|" + billCity + "|" + billState + "|" + billCountry + "|" + billZip;
    //    string ship_details = shipAddress + "|" + shipCity + "|" + shipState + "|" + shipCountry + "|" + shipZip + "|" + shipDays + "|" + shipAddressCount;
    //    string item_details = itemCount + "|" + itemValue + "|" + itemCategory;
    //    string other_details = udf1 + "|" + udf2 + "|" + udf3 + "|" + udf4 + "|" + udf5;

    //    MyCryptoClass aes = new MyCryptoClass();
    //    string enc_txn_details = aes.encrypt(txn_details);
    //    string enc_pg_details = aes.encrypt(pg_details);
    //    string enc_card_details = aes.encrypt(card_details);
    //    string enc_cust_details = aes.encrypt(cust_details);
    //    string enc_bill_details = aes.encrypt(bill_details);
    //    string enc_ship_details = aes.encrypt(ship_details);
    //    string enc_item_details = aes.encrypt(item_details);
    //    string enc_other_details = aes.encrypt(other_details);


    //    NameValueCollection data = new NameValueCollection();
    //    data.Add("me_id", txnmerchantId);
    //    data.Add("txn_details", enc_txn_details);
    //    data.Add("pg_details", enc_pg_details);
    //    data.Add("card_details", enc_card_details);
    //    data.Add("cust_details", enc_cust_details);
    //    data.Add("bill_details", enc_bill_details);
    //    data.Add("ship_details", enc_ship_details);
    //    data.Add("item_details", enc_item_details);
    //    data.Add("other_details", enc_other_details);
    //    HttpHelper.RedirectAndPOST(this.Page, "https://avantgardepayments.com/agcore/payment", data);
    //}

    private void BindPayPara(string ordid, string trnscid)
    {
        System.Collections.Hashtable data = new System.Collections.Hashtable(); // adding values in gash table for data post
        string key = ConfigurationManager.AppSettings["MERCHANT_KEY"];
        string salt= ConfigurationManager.AppSettings["SALT"];

        data.Add("key", key);
        data.Add("salt", salt);
       
        data.Add("txnid", trnscid);
        string AmountForm = Convert.ToDecimal(txtAmount.Text.Trim()).ToString("g29");// eliminating trailing zeros
        data.Add("amount", AmountForm);
        data.Add("productinfo", ordid);
        data.Add("firstname", txtCustName.Text.Trim());
        data.Add("email", txtEmailID.Text.Trim());
        data.Add("mobile", txtMobNo.Text.Trim());
        //string retrnUrl = "PaymentConfirmation.aspx";
        string surl = ((HttpContext.Current.Request.ServerVariables["HTTPS"] != "" && HttpContext.Current.Request.ServerVariables["HTTP_HOST"] != "off") || HttpContext.Current.Request.ServerVariables["SERVER_PORT"] == "443") ? "https://" : "http://";
        surl += HttpContext.Current.Request.ServerVariables["HTTP_HOST"] + HttpContext.Current.Request.ServerVariables["REQUEST_URI"] + "/PaymentConfirmation.aspx";
       
        data.Add("surl", surl);
        data.Add("furl",surl);
        data.Add("udf5", "");
        //data.Add("mihpayid", "");
        //data.Add("status", "");
       
        byte[] hash;
        //string postData = new System.IO.StreamReader(Request.InputStream).ReadToEnd();
       // dynamic data = JsonConvert.DeserializeObject(postData);
        string d = key + "|" + trnscid + "|" + AmountForm + "|" + ordid + "|" + txtCustName.Text.Trim() + "|" + txtEmailID.Text.Trim() + "|||||||||||" + salt;
        var datab = Encoding.UTF8.GetBytes(d);
        using (SHA512 shaM = new SHA512Managed())
        {
            hash = shaM.ComputeHash(datab);
        }
        data.Add("hash", GetStringFromHash(hash));
        string URL= ConfigurationManager.AppSettings["PAYU_BASE_URL"];
        string strForm = PreparePOSTForm(URL, data);
        Page.Controls.Add(new LiteralControl(strForm));

        //string json = "{\"success\":\"" + GetStringFromHash(hash) + "\"}";
        //Response.Clear();
        //Response.ContentType = "application/json; charset=utf-8";
        //Response.Write(json);
        //Response.End();
        //  System.Collections.Hashtable data = new System.Collections.Hashtable(); // adding values in gash table for data post

        //  data.Add("key", "");
        //  data.Add("txnid", trnscid);
        //  //data.Add("merchant_id", "139453");
        //  string AmountForm = Convert.ToDecimal(txtAmount.Text.Trim()).ToString("g29");// eliminating trailing zeros
        //  txtAmount.Text = AmountForm;
        //  data.Add("amount", AmountForm);
        //  data.Add("pinfo", ordid);

        ////  data.Add("currency", "INR");
        ////  data.Add("redirect_url", "https://itsgwalior.com/PaymentConfirmation.aspx");
        ////  data.Add("cancel_url", "https://itsgwalior.com/PaymentConfirmation.aspx");
        //  data.Add("fname", txtCustName.Text.Trim());
        ////  data.Add("billing_address", txtAddr.Text.Trim());
        // // data.Add("billing_city", txtCity.Text.Trim());
        // // data.Add("billing_state", ddlState.SelectedValue.Trim());
        // // data.Add("billing_zip", txtZipCode.Text.Trim());
        // // data.Add("billing_country", ddlCountry.SelectedValue.Trim());

        //  data.Add("email", txtEmailID.Text.Trim());
        //  data.Add("mobile", txtMobNo.Text.Trim());
        //  //data.Add("state", state.Text.Trim());
        //  //data.Add("country", country.Text.Trim());
        //  //data.Add("zipcode", zipcode.Text.Trim());
        //  //data.Add("udf1", udf1.Text.Trim());
        //  //data.Add("udf2", udf2.Text.Trim());
        //  //data.Add("udf3", udf3.Text.Trim());
        //  //data.Add("udf4", udf4.Text.Trim());
        //  //data.Add("udf5", udf5.Text.Trim());
        //  //data.Add("pg", pg.Text.Trim());
        //  //data.Add("service_provider", service_provider.Text.Trim());

        //  string action1 = "ccavRequestHandler.aspx";
        //  string strForm = PreparePOSTForm(action1, data);
        //  Page.Controls.Add(new LiteralControl(strForm));
    }
    private static string GetStringFromHash(byte[] hash)
    {
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < hash.Length; i++)
        {
            result.Append(hash[i].ToString("X2").ToLower());
        }
        return result.ToString();
    }
    private string PreparePOSTForm(string url, System.Collections.Hashtable data)      // post form
    {
        
        //Set a name for the form
        string formID = "customerData";
        //Build the form using the specified data to be posted.
        StringBuilder strForm = new StringBuilder();
        strForm.Append("<form id=\"" + formID + "\" name=\"" +
                       formID + "\" action=\"" + url +
                       "\" method=\"POST\">");

        foreach (System.Collections.DictionaryEntry key in data)
        {

            strForm.Append("<input type=\"hidden\" name=\"" + key.Key +
                           "\" value=\"" + key.Value + "\">");
        }


        strForm.Append("</form>");
        //Build the JavaScript which will do the Posting operation.
        StringBuilder strScript = new StringBuilder();
        strScript.Append("<script language='javascript'>");
        strScript.Append("var v" + formID + " = document." +
                         formID + ";");
        strScript.Append("v" + formID + ".submit();");
        strScript.Append("</script>");
        //Return the form and the script concatenated.
        //(The order is important, Form then JavaScript)
        return strForm.ToString() + strScript.ToString();
    }
    private void FillCountry()
    {
        //ListItem item = new ListItem();
        //item.Value = "";
        //item.Text = "Select";
        //ddlCountry.Items.Add(item);



        //DataTable dt = DataAccess.GetData("SELECT  [Country_Id],[Country_Code],[Country_Name],[Country_Call_Code] FROM [Mst_Country_Master]");
        //foreach (DataRow row in dt.Rows)
        //{
        //    ListItem item1 = new ListItem();
        //    item1.Value = row["Country_Name"].ToString();
        //    item1.Text = row["Country_Name"].ToString();
        //    ddlCountry.Items.Add(item1);


        //}

        //ddlCountry.SelectedValue = "India";
    }
    private void FillState(string CountryName)
    {
        //ddlState.Items.Clear();
        //ListItem item = new ListItem();
        //item.Value = "";
        //item.Text = "Select";
        //ddlState.Items.Add(item);

        //if (ddlCountry.SelectedValue != "0")
        //{
        //    string Country_Id = DataAccess.GetSingleValue("SELECT  [Country_Id] FROM [Mst_Country_Master] WHERE [Country_Name]='" + CountryName + "'");

        //    SqlCommand cmd = new SqlCommand("SELECT  * FROM [StateMaster] WHERE [Country_Id]=@Country_Id");
        //    cmd.Parameters.AddWithValue("@Country_Id", Country_Id);
        //    DataTable dt = DataAccess.GetData(cmd);
        //    foreach (DataRow row in dt.Rows)
        //    {
        //        ListItem item1 = new ListItem();
        //        item1.Value = row["State_Name"].ToString();
        //        item1.Text = row["State_Name"].ToString();
        //        ddlState.Items.Add(item1);
        //    }
        //}
    }
    //protected void ddlPerCountry_SelectedIndexChanged(object sender, EventArgs e)
    //{

    //}
    protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        //FillState(ddlCountry.SelectedValue);
    }
    protected void ddlCountry_SelectedIndexChanged1(object sender, EventArgs e)
    {
       // FillState(ddlCountry.SelectedValue);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        string transactionId = String.Format("{0:ddMMyyyyhhmmss}", DateTime.Now);
        SqlCommand cmd = new SqlCommand("INSERT INTO [OnlinePaymentDetail]([TransactionID],[PayAmount],[Currency],[PBillName],[PBillAddr],[PBillCity],[PBillState],[PBillCountry],[PBillMobile],[PBillEmailID],[CreatedOn],[CustPinCode])VALUES(@TransactionID,@PayAmount,@Currency,@PBillName,@PBillAddr,@PBillCity,@PBillState,@PBillCountry,@PBillMobile,@PBillEmailID,@CreatedOn,@CustPinCode);select scope_identity();");
        //cmd.Parameters.AddWithValue("@OnlinePaymentID",);
        cmd.Parameters.AddWithValue("@TransactionID", transactionId);
        cmd.Parameters.AddWithValue("@PayAmount", txtAmount.Text);
        cmd.Parameters.AddWithValue("@Currency", "INR");
        cmd.Parameters.AddWithValue("@PBillName", txtCustName.Text);
        cmd.Parameters.AddWithValue("@PBillAddr", txtAddr.Text);
        cmd.Parameters.AddWithValue("@PBillCity", string.Empty);
        cmd.Parameters.AddWithValue("@PBillState", string.Empty);
        cmd.Parameters.AddWithValue("@PBillCountry", string.Empty);
        cmd.Parameters.AddWithValue("@PBillMobile", txtMobNo.Text);
        cmd.Parameters.AddWithValue("@PBillEmailID", txtEmailID.Text);
        cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
        cmd.Parameters.AddWithValue("@CustPinCode", txtZipCode.Text);
        string ordId = DataAccess.InsertExecuteScalar(cmd);

        Session["ordId"] = ordId;
     //   Session["trnsId"] = transactionId;
        Response.Redirect("selectPayGateway.aspx");
        // bindPayment(ordId, transactionId);
        //BindPayPara(ordId, transactionId);
       ///// goToPay(ordId, transactionId);
    }

    //Razor pay integration
    private void goToPay(string ordId,string trnsId)
    {
        // Response.Redirect("Default4.aspx?nm=" + txtCustName.Text + "&mb=" + txtMobNo.Text + "&em=" + txtEmailID.Text + "&am=" + txtAmount.Text + "&ord=" + ordId + "&tr=" + trnsId + "");

        System.Net.ServicePointManager.SecurityProtocol |= System.Net.SecurityProtocolType.Tls12;

        //  string AmountForm = Convert.ToDecimal(txtAmount.Text.Trim()).ToString("g29");// eliminating trailing zeros

        string amount = (Convert.ToDecimal(txtAmount.Text) * 100).ToString();
        string contact = txtMobNo.Text;
        string name = txtCustName.Text;
        string product = ordId;
        string email = txtEmailID.Text;

        Dictionary<string, object> input = new Dictionary<string, object>();
        input.Add("amount", amount);
        input.Add("currency", "INR");
        input.Add("receipt", trnsId);
        input.Add("payment_capture", 1);

        string key = "rzp_test_400qynenV4xz7V";
        string secret = "5BR9d8J4VSMFaAVXPRVIr0LD";

        RazorpayClient client = new RazorpayClient(key, secret);

        Razorpay.Api.Order order = client.Order.Create(input);
        string orderId = order["id"].ToString();

        StringBuilder strForm = new StringBuilder();
        string url = "RazorpayCallBack.aspx";
        string formID = "customerData";

        strForm.Append("<form id=\"" + formID + "\" name=\"" + formID + "\" action=\"" + url + "\" method=\"post\">");

        strForm.Append("<script src='https://checkout.razorpay.com/v1/checkout.js' data-key=\"" + key + "\" ");
        strForm.Append("data-amount=\"" + amount + "\" data-name='Razorpay' data-description=\"" + product + "\"");
        strForm.Append("data-order_id=\"" + orderId + "\" data-prefill.name=\"" + name + "\" data-prefill.email=\"" + email + "\"");
        strForm.Append("data-prefill.contact=\"" + contact + "\"> </script>");
        /// strForm.Append("document.getElementById('rzp-button1').onclick()")



        //Build the JavaScript which will do the Posting operation.
        //StringBuilder strScript = new StringBuilder();
        //strScript.Append("<script language='javascript'>");
        //strScript.Append("var v" + formID + " = document." +
        //                 formID + ";");
        //strScript.Append("v" + formID + ".submit();");
        //strScript.Append("</script>");
        //strForm.Append("</form>");
        string str1 = strForm.ToString();
        Page.Controls.Add(new LiteralControl(str1));
    }
}