using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Text;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            if (Session["ttppd"] != null)
            {
                //string UserTypeID = Session["ttppd"].ToString();
                //if (UserTypeID == "2")
                //{
                //    DefaultMenu1.Visible = false;
                //    UserMenu1.Visible = true;
                //}
                //else if (UserTypeID == "3")
                //{
                //    DefaultMenu1.Visible = false;
                //    UserMenu1.Visible = false;
                //    JobSheekar1.Visible = true;
                //}


                //else if (UserTypeID == "4" || UserTypeID == "5")
                //{
                //    DefaultMenu1.Visible = false;
                //    UserMenu1.Visible = false;
                   
                //}




                //else
                //{
                //    DefaultMenu1.Visible = true;
                //    UserMenu1.Visible = false;
                //    JobSheekar1.Visible = false;
                //}
            }
            else
            {
                //DefaultMenu1.Visible = true;
                //UserMenu1.Visible = false;
                //JobSheekar1.Visible = false;
            }       

        }

        hdfpageName.Value = Path.GetFileName(Request.Path);
    }
    //public void DownLoad(string FName)
    //{
    //    string path = FName;
    //    System.IO.FileInfo file = new System.IO.FileInfo(path);
    //    if (file.Exists)
    //    {
    //        Response.Clear();
    //        Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
    //        //Response.AddHeader("Content-Length", file.Length.ToString());
    //        Response.ContentType = "application/octet-stream"; // download […]

    //    }
    //}
    //protected void btnLogin_Click(object sender, EventArgs e)
    //{

    //    DataTable dt = DataAccess.GetData("Select * from UserDetails where MobileNo='" + txtUserName.Text + "' and PassWord='"+txtPSWD.Text+"'");
    //    if (dt.Rows.Count > 0 && dt != null)
    //    {
    //        string UserTp = string.Empty;
    //        Session["ttppd"] = dt.Rows[0]["UserTypeID"].ToString();
    //        Session["sridd"]= dt.Rows[0]["ID"].ToString();
    //        UserTp = dt.Rows[0]["UserTypeID"].ToString();
    //        if (UserTp == "1")
    //        {
    //            Session["ID"] = dt.Rows[0]["ID"].ToString();
    //            Response.Redirect("~/Admin/Default.aspx");
    //        }
    //        else if (UserTp == "2")
    //        {
    //            //if (hdfpageName.Value == "FindJob.aspx" || hdfpageName.Value == "findJob.aspx")
    //            //{
    //            //    Response.Redirect("~/FindJob.aspx");
    //            //}
    //            //else
    //            //{
    //               Response.Redirect("~/MyProfile.aspx");
    //            //}
    //        }
    //        else if (UserTp == "3")
    //        {
    //            Response.Redirect("~/JobSheekarMyProfile.aspx");
    //        }
    //        else
    //        {

    //        }
    //    }
    //}

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        //SendMessage();
    }

    //public void SendMessage()
    //{
    //    try
    //    {
    //        if (txtAdfdgf.Value == "9")
    //        {
    //            string _EmailBody = "Dear Mr/Miss Admin ";
    //            _EmailBody += "<br/>Enquiry from its Gwalior website ";
    //            _EmailBody += "<br/><br/> Contact Details are given below";
    //            _EmailBody += "<br/><br/> Full Name: " + name.Value;
    //            _EmailBody += "<br/><br/> E-mail :   " + emailid.Value;
    //            _EmailBody += "<br/><br/> Mobile:  " + mobile.Value;
    //            _EmailBody += "<br/><br/> Subject:  " + drdService.SelectedValue;
    //            //  _EmailBody += "<br/><br/> Message:  " + txtMessage.Text;

    //            string from = ConfigurationManager.AppSettings["MailUsername"].ToString();
    //            string To = ConfigurationManager.AppSettings["AdminMailID"].ToString();

    //            string subject = "Enquiry from its Gwalior website PopUp Window";
    //            SendMail.SendWebEmail(from, To, subject, _EmailBody);

    //            divMsg.Visible = true;
    //            lblmsg.Text = "Your Message sent successfully";

    //            ClrFun();
    //        }
    //        else
    //        {
    //            divMsg.Visible = true;
    //            lblmsg.Text = "Please Enter correct Answer";
    //        }
            

    //    }
    //    catch (Exception ex)
    //    {
    //        divMsg.Visible = true;
    //        lblmsg.Text = "Some Error Occured,Pleaser try later";
    //    }
    //  //  ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);



    //}

    public void ClrFun()
    {
        //name.Value = string.Empty;
        //emailid.Value = string.Empty;
        //mobile.Value = string.Empty;
        //drdService.ClearSelection();   

    }

    
}
