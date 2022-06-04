using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Services;

public partial class Default5 : System.Web.UI.Page
{
    public string key = string.Empty;
    public double amount = 0;
    public string contact = string.Empty;
    public string name = string.Empty;
    public string email = string.Empty;
    public string secret = string.Empty;
    public string desc = string.Empty;
    public string orderId = string.Empty;
    public string addr = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ordId"] != null)
        {

            DataTable dt = DataAccess.GetData("select * from [OnlinePaymentDetail] where [OnlinePaymentID]=" + Session["ordId"].ToString() + "");
            if (dt.Rows.Count > 0)
            {
                addr = dt.Rows[0]["PBillAddr"].ToString();
                goToRazorPay(dt.Rows[0]["TransactionID"].ToString(), dt.Rows[0]["PBillName"].ToString(), dt.Rows[0]["PBillMobile"].ToString(), dt.Rows[0]["PBillEmailID"].ToString(), dt.Rows[0]["PayAmount"].ToString());
                //ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "btnClick();", true);
            }
        }
        else
        {
            Response.Redirect("online-payment-registration.aspx");
        }
    }

    private void goToRazorPay(string trnsId, string custName, string custMob, string custEmail, string amt)
    {
        // Response.Redirect("Default4.aspx?nm=" + txtCustName.Text + "&mb=" + txtMobNo.Text + "&em=" + txtEmailID.Text + "&am=" + txtAmount.Text + "&ord=" + ordId + "&tr=" + trnsId + "");

        System.Net.ServicePointManager.SecurityProtocol |= System.Net.SecurityProtocolType.Tls12;

        //  string AmountForm = Convert.ToDecimal(txtAmount.Text.Trim()).ToString("g29");// eliminating trailing zeros

        amount = Convert.ToDouble(amt) * 100;
        contact = custMob;
        name = custName;
        string ordId = Session["ordId"].ToString();
        email = custEmail;
        desc = "Payment";

        Dictionary<string, object> input = new Dictionary<string, object>();
        input.Add("amount", amount);
        input.Add("currency", "INR");
        input.Add("receipt", trnsId);
        input.Add("payment_capture", 0);
        // input.Add("notes",desc );

        key = ConfigurationManager.AppSettings["razKey"];
        string secret = ConfigurationManager.AppSettings["razSecret"];

        RazorpayClient client = new RazorpayClient(key, secret);

        Razorpay.Api.Order order = client.Order.Create(input);
        orderId = order["id"].ToString();

        SqlCommand cmd = new SqlCommand("update [OnlinePaymentDetail] set [RazorPayOrderId]=@RazorPayOrderId where [OnlinePaymentID]=@OnlinePaymentID");
        cmd.Parameters.AddWithValue("@RazorPayOrderId", orderId);
        cmd.Parameters.AddWithValue("@OnlinePaymentID", ordId);
        DataAccess.InsertExecuteNonQuery(cmd);

        //StringBuilder strScript = new StringBuilder();
        //strScript.Append("<script language='javascript'>");
        //strScript.Append("var options = { 'key':\"" + key + "\",'amount':'" + amount + "','currency':'INR','name':'" + name + "','description':'" + desc + "','order_id':'" + orderId + "',");
        //strScript.Append("'handler':function (response){document.getElementById('rzp_paymentid').value = response.razorpay_payment_id;");
        //strScript.Append("document.getElementById('rzp_orderid').value = response.razorpay_order_id;document.getElementById('rzp-paymentresponse').click();},");
        //strScript.Append("'prefill':{'name':'" + name + "','email':'" + email + "','contact':'" + contact + "' },'notes':'" + addr + "'},'theme':{'color':'#F37254'}};");
        //strScript.Append("var rzp1 = new Razorpay(options);document.getElementById('rzp-button1').onclick = function(e){alert('hi');}</script>");

        //// strScript.Append("window.onload = function(){document.getElementById('rzp-button1').click();};</script>");
        //Page.Controls.Add(new LiteralControl(strScript.ToString()));

    }
    public void Complete()
    {
        // Payment data comes in url so we have to get it from url

        // This id is razorpay unique payment id which can be use to get the payment details from razorpay server
        string paymentId = Request.Params["rzp_paymentid"];

        // This is orderId
        string orderId = Request.Params["rzp_orderid"];
        key = ConfigurationManager.AppSettings["razKey"];
        string secret = ConfigurationManager.AppSettings["razSecret"];
        Razorpay.Api.RazorpayClient client = new Razorpay.Api.RazorpayClient(key, secret);

        Razorpay.Api.Payment payment = client.Payment.Fetch(paymentId);

        // This code is for capture the payment 
        Dictionary<string, object> options = new Dictionary<string, object>();
        options.Add("amount", payment.Attributes["amount"]);
        Razorpay.Api.Payment paymentCaptured = payment.Capture(options);
        string amt = paymentCaptured.Attributes["amount"];

        //// Check payment made successfully

        if (paymentCaptured.Attributes["status"] == "captured")
        {
            // Create these action method
            //return RedirectToAction("Success");
        }
        else
        {
            //return RedirectToAction("Failed");
        }
    }
    [WebMethod]
    public static string updPay(string payId,string ordId,string signt)
    {
        string paymentId = payId;
        string orderId = ordId;
        string signature = signt;

        string key = ConfigurationManager.AppSettings["razKey"];
        string secret = ConfigurationManager.AppSettings["razSecret"];
        RazorpayClient client = new RazorpayClient(key, secret);

        Dictionary<string, string> attributes = new Dictionary<string, string>();

        attributes.Add("razorpay_payment_id", paymentId);
        attributes.Add("razorpay_order_id", orderId);
        attributes.Add("razorpay_signature", signature);

        Utils.verifyPaymentSignature(attributes);

        SqlCommand cmd = new SqlCommand("update [OnlinePaymentDetail] set [RazorPayPaymentID]=@RazorPayPaymentID,[RazorPayTrnscStatus]=@RazorPayTrnscStatus where [RazorPayOrderId]=@RazorPayOrderId ");

        cmd.Parameters.AddWithValue("@RazorPayOrderId", orderId);
        cmd.Parameters.AddWithValue("@RazorPayPaymentID", paymentId);
        cmd.Parameters.AddWithValue("@RazorPayTrnscStatus", "Transaction Successfull");

        DataAccess.InsertExecuteNonQuery(cmd);

        return "aa";
    }
}