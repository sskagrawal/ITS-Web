using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RazorpayCallBack : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["pi"] != null && Request.QueryString["oi"] != null && Request.QueryString["sgn"] != null)
            {
                string paymentId = Request.QueryString["pi"];
                string orderId = Request.QueryString["oi"];
                string signature = Request.QueryString["sgn"];

                string key = ConfigurationManager.AppSettings["razKey"];
                string secret = ConfigurationManager.AppSettings["razSecret"];

                RazorpayClient client = new RazorpayClient(key, secret);

                Dictionary<string, string> attributes = new Dictionary<string, string>();

                attributes.Add("razorpay_payment_id", paymentId);
                attributes.Add("razorpay_order_id", orderId);
                attributes.Add("razorpay_signature", signature);

              //  Utils.verifyPaymentSignature(attributes);

                SqlCommand cmd = new SqlCommand("update [OnlinePaymentDetail] set [RazorPayPaymentID]=@RazorPayPaymentID,[RazorPayTrnscStatus]=@RazorPayTrnscStatus where [RazorPayOrderId]=@RazorPayOrderId ");

                cmd.Parameters.AddWithValue("@RazorPayOrderId", orderId);
                cmd.Parameters.AddWithValue("@RazorPayPaymentID", paymentId);
                cmd.Parameters.AddWithValue("@RazorPayTrnscStatus", "Transaction Successfull");

                DataAccess.InsertExecuteNonQuery(cmd);

                lblMsg.Text = "Your Transaction is Successfull";
            }
            //pTxnId.InnerText = paymentId;
            //pOrderId.InnerText = orderId;
            //h1Message.InnerText = "Transaction Successfull";
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message.ToString();
            //h1Message.InnerText = "Transaction Unsuccessfull";
        }
    }

    protected void btnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}