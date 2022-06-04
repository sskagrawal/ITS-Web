using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using PayPal.Api;

using Razorpay.Api;

public partial class selectPayGateway : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private void BindPayPara(string trnscid,string custName,string custMob,string custEmail,string amt)
    {
        //System.Collections.Hashtable data = new System.Collections.Hashtable(); // adding values in gash table for data post
        //string key = ConfigurationManager.AppSettings["MERCHANT_KEY"];
        //string salt = ConfigurationManager.AppSettings["SALT"];

        //data.Add("key", key);
        //data.Add("salt", salt);

        //data.Add("txnid", trnscid);
        //string AmountForm = Convert.ToDecimal(amt).ToString("g29");// eliminating trailing zeros
        //data.Add("amount", AmountForm);
        //data.Add("productinfo", Session["ordId"].ToString());
        //data.Add("firstname", custName);
        //data.Add("email",custEmail);
        //data.Add("mobile", custMob);
        ////string retrnUrl = "PaymentConfirmation.aspx";
        //string surl = ((HttpContext.Current.Request.ServerVariables["HTTPS"] != "" && HttpContext.Current.Request.ServerVariables["HTTP_HOST"] != "off") || HttpContext.Current.Request.ServerVariables["SERVER_PORT"] == "443") ? "https://" : "http://";
        //surl += HttpContext.Current.Request.ServerVariables["HTTP_HOST"] + HttpContext.Current.Request.ServerVariables["REQUEST_URI"] + "/PaymentConfirmation.aspx";

        //data.Add("surl", surl);
        //data.Add("furl", surl);
        //data.Add("udf5", "");
        ////data.Add("mihpayid", "");
        ////data.Add("status", "");

        //byte[] hash;
        ////string postData = new System.IO.StreamReader(Request.InputStream).ReadToEnd();
        //// dynamic data = JsonConvert.DeserializeObject(postData);
        //string d = key + "|" + trnscid + "|" + AmountForm + "|" + Session["ordId"].ToString() + "|" + custName + "|" + custEmail + "|||||||||||" + salt;
        //var datab = Encoding.UTF8.GetBytes(d);
        //using (SHA512 shaM = new SHA512Managed())
        //{
        //    hash = shaM.ComputeHash(datab);
        //}
        //data.Add("hash", GetStringFromHash(hash));
        //string URL = ConfigurationManager.AppSettings["PAYU_BASE_URL"];
        //string strForm = PreparePOSTForm(URL, data);
        //Page.Controls.Add(new LiteralControl(strForm));

        ////string json = "{\"success\":\"" + GetStringFromHash(hash) + "\"}";
        ////Response.Clear();
        ////Response.ContentType = "application/json; charset=utf-8";
        ////Response.Write(json);
        ////Response.End();
        ////  System.Collections.Hashtable data = new System.Collections.Hashtable(); // adding values in gash table for data post

        ////  data.Add("key", "");
        ////  data.Add("txnid", trnscid);
        ////  //data.Add("merchant_id", "139453");
        ////  string AmountForm = Convert.ToDecimal(txtAmount.Text.Trim()).ToString("g29");// eliminating trailing zeros
        ////  txtAmount.Text = AmountForm;
        ////  data.Add("amount", AmountForm);
        ////  data.Add("pinfo", ordid);

        //////  data.Add("currency", "INR");
        //////  data.Add("redirect_url", "https://itsgwalior.com/PaymentConfirmation.aspx");
        //////  data.Add("cancel_url", "https://itsgwalior.com/PaymentConfirmation.aspx");
        ////  data.Add("fname", txtCustName.Text.Trim());
        //////  data.Add("billing_address", txtAddr.Text.Trim());
        //// // data.Add("billing_city", txtCity.Text.Trim());
        //// // data.Add("billing_state", ddlState.SelectedValue.Trim());
        //// // data.Add("billing_zip", txtZipCode.Text.Trim());
        //// // data.Add("billing_country", ddlCountry.SelectedValue.Trim());

        ////  data.Add("email", txtEmailID.Text.Trim());
        ////  data.Add("mobile", txtMobNo.Text.Trim());
        ////  //data.Add("state", state.Text.Trim());
        ////  //data.Add("country", country.Text.Trim());
        ////  //data.Add("zipcode", zipcode.Text.Trim());
        ////  //data.Add("udf1", udf1.Text.Trim());
        ////  //data.Add("udf2", udf2.Text.Trim());
        ////  //data.Add("udf3", udf3.Text.Trim());
        ////  //data.Add("udf4", udf4.Text.Trim());
        ////  //data.Add("udf5", udf5.Text.Trim());
        ////  //data.Add("pg", pg.Text.Trim());
        ////  //data.Add("service_provider", service_provider.Text.Trim());

        ////  string action1 = "ccavRequestHandler.aspx";
        ////  string strForm = PreparePOSTForm(action1, data);
        ////  Page.Controls.Add(new LiteralControl(strForm));

        RemotePost myremotepost = new RemotePost();
        string key = ConfigurationManager.AppSettings["MERCHANT_KEY"];
        string AmountForm = Convert.ToDecimal(amt).ToString("g29");
        string amount = AmountForm;
        string productInfo = Session["ordId"].ToString();
        string firstName = name;
        string email = custEmail;
        string phone = custMob;
        string salt = ConfigurationManager.AppSettings["SALT"];

        //posting all the parameters required for integration.

        myremotepost.Url = ConfigurationManager.AppSettings["PAYU_BASE_URL"];
        myremotepost.Add("key", ConfigurationManager.AppSettings["MERCHANT_KEY"]);
        string txnid = trnscid;
        myremotepost.Add("txnid", txnid);
        myremotepost.Add("amount", amount);
        myremotepost.Add("productinfo", productInfo);
        myremotepost.Add("firstname", firstName);
        myremotepost.Add("phone", phone);
        myremotepost.Add("email", email);
        myremotepost.Add("surl", string.Concat("https://", Request.Url.Authority, Response.ApplyAppPathModifier("~/PaymentConfirmation.aspx")));//Change the success url here depending upon the port number of your local system.
        myremotepost.Add("furl", string.Concat("https://", Request.Url.Authority, Response.ApplyAppPathModifier("~/PaymentConfirmation.aspx")));//Change the failure url here depending upon the port number of your local system.
        myremotepost.Add("service_provider", "payu_paisa");
        string hashString = key + "|" + txnid + "|" + amount + "|" + productInfo + "|" + firstName + "|" + email + "|||||||||||" + salt;
        string hash = Generatehash512(hashString);
        myremotepost.Add("hash", hash);

        myremotepost.Post();
    }

    public class RemotePost
    {
        private System.Collections.Specialized.NameValueCollection Inputs = new System.Collections.Specialized.NameValueCollection();


        public string Url = "";
        public string Method = "post";
        public string FormName = "form1";

        public void Add(string name, string value)
        {
            Inputs.Add(name, value);
        }

        public void Post()
        {
            System.Web.HttpContext.Current.Response.Clear();

            System.Web.HttpContext.Current.Response.Write("<html><head>");

            System.Web.HttpContext.Current.Response.Write(string.Format("</head><body onload=\"document.{0}.submit()\">", FormName));
            System.Web.HttpContext.Current.Response.Write(string.Format("<form name=\"{0}\" method=\"{1}\" action=\"{2}\" >", FormName, Method, Url));
            for (int i = 0; i < Inputs.Keys.Count; i++)
            {
                System.Web.HttpContext.Current.Response.Write(string.Format("<input name=\"{0}\" type=\"hidden\" value=\"{1}\">", Inputs.Keys[i], Inputs[Inputs.Keys[i]]));
            }
            System.Web.HttpContext.Current.Response.Write("</form>");
            System.Web.HttpContext.Current.Response.Write("</body></html>");

            System.Web.HttpContext.Current.Response.End();
        }
    }
    public string Generatehash512(string text)
    {


        byte[] message = Encoding.UTF8.GetBytes(text);

        UnicodeEncoding UE = new UnicodeEncoding();
        byte[] hashValue;
        SHA512Managed hashString = new SHA512Managed();
        string hex = "";
        hashValue = hashString.ComputeHash(message);
        foreach (byte x in hashValue)
        {
            hex += String.Format("{0:x2}", x);
        }
        return hex;

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

    protected void RadioButton3_CheckedChanged(object sender, EventArgs e)
    {

    }

    protected void rblPayUMoney_CheckedChanged(object sender, EventArgs e)
    {
        if(Session["ordId"] !=null)
        {
            DataTable dt = DataAccess.GetData("select * from [OnlinePaymentDetail] where [OnlinePaymentID]=" + Session["ordId"].ToString() + "");
            if(dt.Rows.Count>0)
            {
                BindPayPara(dt.Rows[0]["TransactionID"].ToString(), dt.Rows[0]["PBillName"].ToString(), dt.Rows[0]["PBillMobile"].ToString(), dt.Rows[0]["PBillEmailID"].ToString(), dt.Rows[0]["PayAmount"].ToString());
            }
        }
    }

    protected void rblPayPal_CheckedChanged(object sender, EventArgs e)
    {
        if (Session["ordId"] != null)
        {
            DataTable dt = DataAccess.GetData("select * from [OnlinePaymentDetail] where [OnlinePaymentID]=" + Session["ordId"].ToString() + "");
            if (dt.Rows.Count > 0)
            {
                BindPaypalPaymentGateway( dt.Rows[0]["PayAmount"].ToString());
            }
        }
    }
    private void BindPaypalPaymentGateway(string amt)
    {
        // ### Api Context
        // Pass in a `APIContext` object to authenticate 
        // the call and to send a unique request id 
        // (that ensures idempotency). The SDK generates
        // a request id if you do not pass one explicitly. 
        // See [Configuration.cs](/Source/Configuration.html) to know more about APIContext.
        var apiContext = PayPal.Sample.Configuration.GetAPIContext();

        string payerId = Request.Params["PayerID"];
        if (string.IsNullOrEmpty(payerId))
        {
            // ###Items
            // Items within a transaction.
            var itemList = new ItemList()
            {
                items = new List<Item>()
                    {
                        new Item()
                        {
                            name = "Payment",
                            currency = "INR",
                            price = amt,
                            quantity = "1",
                            sku = "sku"
                        }
                    }
            };

            // ###Payer
            // A resource representing a Payer that funds a payment
            // Payment Method
            // as `paypal`
            var payer = new Payer() { payment_method = "paypal" };

            // ###Redirect URLS
            // These URLs will determine how the user is redirected from PayPal once they have either approved or canceled the payment.
            var baseURI = Request.Url.Scheme + "://" + Request.Url.Authority + "/PaymentWithPayPal.aspx?";
            var guid = Convert.ToString((new Random()).Next(100000));
            var redirectUrl = baseURI + "guid=" + guid;
            var redirUrls = new RedirectUrls()
            {
                cancel_url = redirectUrl + "&cancel=true",
                return_url = redirectUrl
            };

            // ###Details
            // Let's you specify details of a payment amount.
            var details = new Details()
            {
                tax = "0",
                shipping = "0",
                subtotal = amt
            };

            // ###Amount
            // Let's you specify a payment amount.
            var amount = new Amount()
            {
                currency = "INR",
                total = amt, // Total must be equal to sum of shipping, tax and subtotal.
                details = details
            };

            // ###Transaction
            // A transaction defines the contract of a
            // payment - what is the payment for and who
            // is fulfilling it. 
            var transactionList = new List<Transaction>();

            // The Payment creation API requires a list of
            // Transaction; add the created `Transaction`
            // to a List
            transactionList.Add(new Transaction()
            {
                description = "Transaction description.",
                invoice_number = Session["ordId"].ToString(),
                amount = amount,
                item_list = itemList
            });

            // ###Payment
            // A Payment Resource; create one using
            // the above types and intent as `sale` or `authorize`
            var payment = new PayPal.Api.Payment()
            {
                intent = "sale",
                payer = payer,
                transactions = transactionList,
                redirect_urls = redirUrls
            };

            // ^ Ignore workflow code segment
            #region Track Workflow
            // this.flow.AddNewRequest("Create PayPal payment", payment);
            #endregion

            // Create a payment using a valid APIContext
            var createdPayment = payment.Create(apiContext);
            var links = createdPayment.links.GetEnumerator();

            string ulrPay = string.Empty;
            while (links.MoveNext())
            {
                var link = links.Current;
                if (link.rel.ToLower().Trim().Equals("approval_url"))
                {
                    ulrPay = link.href;
                }
            }
            Session.Add(guid, createdPayment.id);
           // Session.Add("flow-" + guid, this.flow);
            Response.Redirect(ulrPay);


            // ^ Ignore workflow code segment
            #region Track Workflow
            //  this.flow.RecordResponse(createdPayment);
            #endregion

            // Using the `links` provided by the `createdPayment` object, we can give the user the option to redirect to PayPal to approve the payment.
            //var links = createdPayment.links.GetEnumerator();
            //while (links.MoveNext())
            //{
            //    var link = links.Current;
            //    if (link.rel.ToLower().Trim().Equals("approval_url"))
            //    {
            //        this.flow.RecordRedirectUrl("Redirect to PayPal to approve the payment...", link.href);
            //    }
            //}
            //Session.Add(guid, createdPayment.id);
            //Session.Add("flow-" + guid, this.flow);
        }
        else
        {
            var guid = Request.Params["guid"];

            // ^ Ignore workflow code segment
            #region Track Workflow
            //this.flow = Session["flow-" + guid] as RequestFlow;
            //this.RegisterSampleRequestFlow();
            //this.flow.RecordApproval("PayPal payment approved successfully.");
            #endregion

            // Using the information from the redirect, setup the payment to execute.
            var paymentId = Session[guid] as string;
            var paymentExecution = new PaymentExecution() { payer_id = payerId };
            var payment = new PayPal.Api.Payment() { id = paymentId };

            // ^ Ignore workflow code segment
            #region Track Workflow
            //this.flow.AddNewRequest("Execute PayPal payment", payment);
            #endregion

            // Execute the payment.
            var executedPayment = payment.Execute(apiContext, paymentExecution);
            // ^ Ignore workflow code segment
            #region Track Workflow
            //this.flow.RecordResponse(executedPayment);
            #endregion

            // For more information, please visit [PayPal Developer REST API Reference](https://developer.paypal.com/docs/api/).
        }
    }

    public string key = string.Empty;
    public double amount = 0;
    public string contact = string.Empty;
    public string name = string.Empty;
    public string email = string.Empty;
    public string secret = string.Empty;
    public string desc = string.Empty;
    public string ordId = string.Empty;
    public string addr = string.Empty;
    private void goToRazorPay(string trnsId,string custName,string custMob,string custEmail,string amt)
    {
        // Response.Redirect("Default4.aspx?nm=" + txtCustName.Text + "&mb=" + txtMobNo.Text + "&em=" + txtEmailID.Text + "&am=" + txtAmount.Text + "&ord=" + ordId + "&tr=" + trnsId + "");

        System.Net.ServicePointManager.SecurityProtocol |= System.Net.SecurityProtocolType.Tls12;

        //  string AmountForm = Convert.ToDecimal(txtAmount.Text.Trim()).ToString("g29");// eliminating trailing zeros

         amount = Convert.ToDouble(amt) * 100;
         contact = custMob;
         name = custName;
        ordId = Session["ordId"].ToString();
         email = custEmail;
        desc = "Payment";

        Dictionary<string, object> input = new Dictionary<string, object>();
        input.Add("amount", amount);
        input.Add("currency", "INR");
        input.Add("receipt", trnsId);
        input.Add("payment_capture", 0);
       // input.Add("notes",desc );

        key = "rzp_test_400qynenV4xz7V";
        string secret = "5BR9d8J4VSMFaAVXPRVIr0LD";

        RazorpayClient client = new RazorpayClient(key, secret);

        Razorpay.Api.Order order = client.Order.Create(input);
        string orderId = order["id"].ToString();

        StringBuilder strScript = new StringBuilder();
        strScript.Append("<script language='javascript'>");
        strScript.Append("var options = { 'key':\""+key+ "\",'amount':'"+ amount + "','currency':'INR','name':'"+name+ "','description':'"+desc+ "','order_id':'"+ orderId + "',");
        strScript.Append("'handler':function (response){document.getElementById('rzp_paymentid').value = response.razorpay_payment_id;");
        strScript.Append("document.getElementById('rzp_orderid').value = response.razorpay_order_id;document.getElementById('rzp-paymentresponse').click();},");
        strScript.Append("'prefill':{'name':'" + name + "','email':'" + email + "','contact':'" + contact + "' },'notes':'" + addr + "'},'theme':{'color':'#F37254'}};");
        strScript.Append("var rzp1 = new Razorpay(options);document.getElementById('rzp-button1').onclick = function(e){alert('hi');}</script>");
       
        // strScript.Append("window.onload = function(){document.getElementById('rzp-button1').click();};</script>");
        Page.Controls.Add(new LiteralControl(strScript.ToString()));

    }
    protected void rblRazorPay_CheckedChanged(object sender, EventArgs e)
    {
        if (Session["ordId"] != null)
        {
            //Response.Redirect("Default5.aspx");
            //DataTable dt = DataAccess.GetData("select * from [OnlinePaymentDetail] where [OnlinePaymentID]=" + Session["ordId"].ToString() + "");
            //if (dt.Rows.Count > 0)
            //{
            //    addr = dt.Rows[0]["PBillAddr"].ToString();
            //    goToRazorPay(dt.Rows[0]["TransactionID"].ToString(), dt.Rows[0]["PBillName"].ToString(), dt.Rows[0]["PBillMobile"].ToString(), dt.Rows[0]["PBillEmailID"].ToString(), dt.Rows[0]["PayAmount"].ToString());
            ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "btnClick();", true);
            //}
        }
    }
}