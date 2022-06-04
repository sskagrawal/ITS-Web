using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class ForgetPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //string Mob = string.Empty;
        //try
        //{
        //    Mob = DataAccess.GetSingleValue("select MobileNo from UserDetails where MobileNo='" + txtMobNo.Text + "'");
        //}
        //catch { }

        SqlCommand cmd = new SqlCommand("select MobileNo,[Name],[PassWord],[EmailID],[PartyID] from UserDetails where MobileNo=@MobileNo");
        cmd.Parameters.AddWithValue("@MobileNo", txtMobNo.Text);


        DataTable dt = DataAccess.GetData(cmd);
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0]["MobileNo"].ToString() != string.Empty)
            {
                
                string msg = "Dear "+dt.Rows[0]["Name"].ToString()+ " , Welcome to ITS Gwalior Family. Your login username - " + txtMobNo.Text + " and Password - " + dt.Rows[0]["PassWord"].ToString() + ". For access click here https://itsgwalior.com/";
                if (txtMobNo.Text != string.Empty)
                {
                    SendSMS.ProcessSMS(txtMobNo.Text, msg, "1207164025125032866");
                    Sendmail(dt);
                    alert.Visible = true;
                    lblMSG.Text = "SMS/Email sent to your Mobile No or Email. Please have a check";
                }
                if(dt.Rows[0]["MobileNo"].ToString()!=string.Empty)
                {
                    
                }
            }
            else
            {
                alert.Visible = true;
                lblMSG.Text = "You are not registred with us";
            }
        }
        else
        {
            alert.Visible = true;
            lblMSG.Text = "You are not registred with us";
        }
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
    }
    private void Sendmail(DataTable dt)
    {
        
            DataTable dtPartyDet = DataAccess.GetData("select Email from [PartyMaster] where  [PartyID]=" + dt.Rows[0]["PartyID"].ToString() + "");
            if (dtPartyDet.Rows.Count > 0)
            {
                string _EmailBody = "Dear " + dt.Rows[0]["Name"].ToString() + ", ";
                _EmailBody += "<br/> Welcome to Its Gwalior";
                _EmailBody += "<br/><br/> Your Login Details are given below";
                _EmailBody += "<br/><br/> User Name: " + txtMobNo.Text;
                _EmailBody += "<br/><br/> Password: " + dt.Rows[0]["PassWord"].ToString();
            _EmailBody += "<br/>For access click here https://itsgwalior.com/ ";

                string from = ConfigurationManager.AppSettings["MailUsername"].ToString();
                string To = dtPartyDet.Rows[0]["Email"].ToString();//Convert.ToString(txtEmailId.Text);
                string subject = "Password Recovery From Its Gwalior Website";
                //  SendMail.SendEmail(from, To, subject, _EmailBody, "");
                SendMail.SendWebEmail(from, To, subject, _EmailBody);

            alert.Visible = true;
            lblMSG.Text = "Email sent to your Reistred Email. Please have a check";
        }
        
    }
}