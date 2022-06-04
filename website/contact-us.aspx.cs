using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net.Mail;

public partial class ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
        }
    }


    protected void lnkbtnSubmit_Click(object sender, EventArgs e)
    {
        string CorrectAnsValue = "5";

        string getAnsValue = txtAns.Text;

        if (CorrectAnsValue == getAnsValue)
        {
            string _EmailBody = "Dear Mr/Miss Admin ";
            _EmailBody += "<br/> New Enquiry Its Gwalior";
            _EmailBody += "<br/><br/> Contact Details are given below";
            _EmailBody += "<br/><br/> Full Name: " + txtName.Text;
            _EmailBody += "<br/><br/> Mobile no: " + txtMobile.Text;
            _EmailBody += "<br/><br/> E-mail :   " + txtEmail.Text;
            _EmailBody += "<br/><br/> Subject:  " + txtSubject.Text;
            //_EmailBody += "<br/><br/> City:      " + txtCity.Text;
            _EmailBody += "<br/><br/> Message:  " + txtMeage.Text;

            string from = ConfigurationManager.AppSettings["MailUsername"].ToString();
            string To = ConfigurationManager.AppSettings["AdminMailID"].ToString();//Convert.ToString(txtEmailId.Text);
            string subject = " New Enquiry From Its Gwalior Website Contact Page";
            //  SendMail.SendEmail(from, To, subject, _EmailBody, "");
            SendMail.SendWebEmail(from, To, subject, _EmailBody);
            lblMsg.Text = "Successfully Sent";

            ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            txtName.Text = string.Empty;
            txtMobile.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtSubject.Text = string.Empty;
            txtMeage.Text = string.Empty;
            txtAns.Text = string.Empty;


        }

        else
        {
            lblMsg.Text = "Fill Correct Answer";
        }
   
}
}