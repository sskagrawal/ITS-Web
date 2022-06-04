using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.Security.Cryptography;
using System.Data.SqlClient;

public partial class Buyer_PaymentConfirmation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.Form["txnid"] != null)
            {
                string[] merc_hash_vars_seq;
                string merc_hash_string = string.Empty;
                string merc_hash = string.Empty;
                string order_id = string.Empty;
                string hash_seq = "key|txnid|amount|productinfo|firstname|email|u df1|udf2|udf3|udf4|udf5||||||salt";

                if (Request.Form["status"] == "success")
                {

                    merc_hash_vars_seq = hash_seq.Split('|');
                    Array.Reverse(merc_hash_vars_seq);
                    merc_hash_string = ConfigurationManager.AppSettings["SALT"] + "|" + Request.Form["status"];


                    foreach (string merc_hash_var in merc_hash_vars_seq)
                    {
                        merc_hash_string += "|";
                        merc_hash_string = merc_hash_string + (Request.Form[merc_hash_var] != null ? Request.Form[merc_hash_var] : "");

                    }
                    Response.Write(merc_hash_string);
                    //exit;
                    merc_hash = Generatehash512(merc_hash_string).ToLower();



                    if (merc_hash != Request.Form["hash"])
                    {
                        //Response.Write("Hash value did not matched");
                        lblMsg.Text = "Hash value did not matched";
                       // btPrintInv.Visible = false;

                    }
                    else
                    {
                        order_id = Request.Form["txnid"];

                        //Response.Write("value matched");

                        lblMsg.Text = "Your Payment is successful";
                       // btPrintInv.Visible = true;

                        //Hash value did not matched
                    }

                }


                else
                {



                    //Response.Write("Hash value did not matched");
                    lblMsg.Text = "Hash value did not matched";
                  //  btPrintInv.Visible = false;
                    // osc_redirect(osc_href_link(FILENAME_CHECKOUT, 'payment' , 'SSL', null, null,true));

                }
                hdfOrderId.Value = Request.Form["Productinfo"];

                SqlCommand cmd = new SqlCommand("update [OnlinePaymentDetail] set [OrderStatus]=@OrderStatus,[PaymentMode]=@PaymentMode,[TrackingId]=@TrackingId,[PayAmount]=@PayAmount,[MerHashString]=@MerHashString where [OnlinePaymentID]=@OnlinePaymentID ");
               // SqlCommand cmd = new SqlCommand("INSERT INTO [PaymentDetail]([TransactionID],[PayStatus],[PayMode],[PayAmount],[PayuMoneyID],[MerHashString],[CreatedOn],[OrderMasterID],[ErrorDesc],[ErrorMsg],UserEmail) VALUES(@TransactionID,@PayStatus,@PayMode,@PayAmount,@PayuMoneyID,@MerHashString,@CreatedOn,@OrderMasterID,@ErrorDesc,@ErrorMsg,@UserEmail)");
              //  cmd.Parameters.AddWithValue("@TransactionID", Request.Form["txnid"]);
                cmd.Parameters.AddWithValue("@OrderStatus", Request.Form["status"]);
                cmd.Parameters.AddWithValue("@PaymentMode", Request.Form["mode"]);
                cmd.Parameters.AddWithValue("@PayAmount", Request.Form["amount"]);
                cmd.Parameters.AddWithValue("@TrackingId", Request.Form["PayuMoneyId"]);
                cmd.Parameters.AddWithValue("@MerHashString", merc_hash_string);
               // cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
                cmd.Parameters.AddWithValue("@OnlinePaymentID", hdfOrderId.Value);
               // cmd.Parameters.AddWithValue("@ErrorDesc", Request.Form["error"]);
               // cmd.Parameters.AddWithValue("@ErrorMsg", Request.Form["error_Message"]);
               // cmd.Parameters.AddWithValue("@UserEmail", Request.Form["email"]);

                DataAccess.InsertExecuteNonQuery(cmd);
                if (Request.Form["status"] == "success")
                {
                    if (merc_hash != Request.Form["hash"])
                    {
                        //Response.Write("Hash value did not matched");
                        //lblMsg.Text = "Hash value did not matched";
                        // btPrintInv.Visible = false;
                        Response.Redirect("~/payment-failure.aspx?trkId=" + DB_Configuration.Encryptdata(Request.Form["PayuMoneyId"]) + "&ordSt=" + DB_Configuration.Encryptdata(Request.Form["status"]));
                    }
                    else
                    {
                        Response.Redirect("~/p-success.aspx?trkId=" + DB_Configuration.Encryptdata(Request.Form["PayuMoneyId"]) + "&ordSt=" + DB_Configuration.Encryptdata(Request.Form["status"]));
                    }
                    }

                }
            else
            {
                lblMsg.Text = "You have not initiate the payment transaction";
            }
        }

        catch (Exception ex)
        {
            //Response.Write("<span style='color:red'>" + ex.Message + "</span>");
            lblMsg.Text = "There is Technical Problem Please try after some time";
           // btPrintInv.Visible = false;


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

    protected void btnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/default.aspx");
    }
    //protected void btPrintInv_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("BuyerInvoice.aspx?InvNo=" + Convert.ToString(hdfOrderId.Value));
    //}
}