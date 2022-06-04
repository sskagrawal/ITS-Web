using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Configuration;
using System.Net.Mail;
public partial class _Default : System.Web.UI.Page
{


    public DataTable DtSlider { get; set; }
    public string SliderTitle { get; set; }
    public string Slider_SubTitle { get; set; }
    public string SliderImg { get; set; }





    public DataTable DtSubSlider { get; set; }
    public string WebUrl { get; set; }
    public string SubSliderImage { get; set; }


    protected void Page_Load(object sender, EventArgs e)
    {    


       BindSlider();
       Bind_Sub_Slider();      

    }


    public void BindSlider()
    {

        DataTable dt = DataAccess.GetData("Select * from [SliderMaster]  order by [Sort] asc");

        if (dt.Rows.Count > 0)
        {
            DtSlider = dt;
            SliderTitle = DtSlider.Rows[0]["SliderTitle"].ToString();
            Slider_SubTitle = DtSlider.Rows[0]["Slider_SubTitle"].ToString();
            SliderImg = DtSlider.Rows[0]["SliderImg"].ToString();

        }
    }


    public void Bind_Sub_Slider()
    {


        DataTable dt = DataAccess.GetData("Select * from [SubSliderMaster] order by Sort");

        if (dt.Rows.Count > 0)
        {
            DtSubSlider = dt;

            //WebUrl = DtSubSlider.Rows[0]["WebUrl"].ToString();
            //SubSliderImage = DtSubSlider.Rows[0]["SubSliderImage"].ToString();

        }
    
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtAdfdgf.Value == "9")
            {
                string _EmailBody = "Dear Mr/Miss Admin ";
                _EmailBody += "<br/>Enquiry from its Gwalior website ";
                _EmailBody += "<br/><br/> Contact Details are given below";
                _EmailBody += "<br/><br/> Full Name: " + name.Value;
                _EmailBody += "<br/><br/> E-mail :   " + emailid.Value;
                _EmailBody += "<br/><br/> Mobile:  " + mobile.Value;
                _EmailBody += "<br/><br/> Subject:  " + drdService.SelectedValue;
                //  _EmailBody += "<br/><br/> Message:  " + txtMessage.Text;

                string from = ConfigurationManager.AppSettings["MailUsername"].ToString();
                string To = ConfigurationManager.AppSettings["AdminMailID"].ToString();

                string subject = "Enquiry from its Gwalior website PopUp Window";
                SendMail.SendWebEmail(from, To, subject, _EmailBody);

                divMsg.Visible = true;
                lblmsg.Text = "Your Message sent successfully";

                ClrFun();
            }
            else
            {
                divMsg.Visible = true;
                lblmsg.Text = "Please Enter correct Answer";
            }


        }
        catch (Exception ex)
        {
            divMsg.Visible = true;
            lblmsg.Text = "Some Error Occured,Pleaser try later";
        }
        //  ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);

    }

    public void ClrFun()
    {
        name.Value = string.Empty;
        emailid.Value = string.Empty;
        mobile.Value = string.Empty;
        drdService.ClearSelection();

    }
}