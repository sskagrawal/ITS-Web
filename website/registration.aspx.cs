using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindEmployeeType();
        }
        }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string Mob = string.Empty;
        try
        {
            Mob = DataAccess.GetSingleValue("select MobileNo from UserDetails where MobileNo='" + txtMobNo.Text + "'");
        }
        catch { }
        if (Mob == string.Empty)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [UserDetails]([UserName],[PassWord],[Createon],[MobileNo],[Name],[InActive],[UserTypeID],[EmailID]) VALUES(@UserName,@PassWord,@Createon,@MobileNo,@Name,@InActive,@UserTypeID,@EmailID) Select SCOPE_IDENTITY();");
            cmd.Parameters.AddWithValue("@UserName", txtName.Text);
            cmd.Parameters.AddWithValue("@PassWord", txtPSWD.Text.Trim());
            cmd.Parameters.AddWithValue("@Createon", DateTime.Now);
            cmd.Parameters.AddWithValue("@MobileNo", txtMobNo.Text);
            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            cmd.Parameters.AddWithValue("@EmailID", txtEmailID.Text);
            if (drdIndustries.SelectedValue == "3")
            {
                cmd.Parameters.AddWithValue("@InActive", "True");
            }
            else if(drdIndustries.SelectedValue == "2")
            {
                cmd.Parameters.AddWithValue("@InActive", "True");
            }
            else if(drdIndustries.SelectedValue == "7")
            {
                cmd.Parameters.AddWithValue("@InActive", "False");
            }
                
            cmd.Parameters.AddWithValue("@UserTypeID", drdIndustries.SelectedValue);
            string Var = DataAccess.InsertExecuteScalar(cmd);
            
            if (drdIndustries.SelectedValue == "3")
            {
                if (fuUploadResm.HasFile)
                {
                    SaveUploadFile(Var);

                }
               // jobCat = "JobSheeker";
            }

            string msg = "Congratulation!Sir / Mam " + txtName.Text + ", You are successfully registered with ITS Gwalior, User Name: " + txtMobNo.Text + " ad Password: " + txtPSWD.Text + ", For login click here : https://itsgwalior.com."; 
           // string msg = "Hi " + txtName.Text + ", Welcome to ITS Gwalior family. Your user id:-" + txtMobNo.Text + " and Password:-" + txtPSWD.Text + " Url:- https://itsgwalior.com/";
            if (txtMobNo.Text != string.Empty)
            {
                SendSMS.ProcessSMS(txtMobNo.Text, msg, "1207162460292631960");
            }
            SendMessage();
            //alert.Visible = true;
            //lblMSG.Text = "Your registration has been successfully completed";
            if (drdIndustries.SelectedValue == "3") //&& Var != string.Empty
            {
                DataTable dt = DataAccess.GetData("Select * from UserDetails where ID='" + Var + "'");
                if (dt.Rows.Count > 0 && dt != null)
                {
                    Session["ttppd"] = dt.Rows[0]["UserTypeID"].ToString();
                    Session["sridd"] = dt.Rows[0]["ID"].ToString();
                    /// Session["LogTime"] = "First";
                    Response.Redirect("~/Jobseeker/job-profile.aspx");
                }
            }
            else if (drdIndustries.SelectedValue == "2")
            {
                DataTable dt = DataAccess.GetData("Select * from UserDetails where ID='" + Var + "'");
                if (dt.Rows.Count > 0 && dt != null)
                {
                    Session["ttppd"] = dt.Rows[0]["UserTypeID"].ToString();
                    Session["sridd"] = dt.Rows[0]["ID"].ToString();
                    Response.Redirect("~/Employer/my-profile.aspx");
                }
            }
            else if (drdIndustries.SelectedValue == "7")
            {
                alert.Visible = true;
                lblMSG.Text = "You are Registered Successfully.";
            }
        }
        else
        {
            alert.Visible = true;
            lblMSG.Text = "This mobile number is already registered";

        }
        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
        //CLR();
    }
    private void BindEmployeeType()
    {

        DataTable dt = DataAccess.GetData("Select * from [UserType] where ID NOT IN (1,4,5) "); // ID !='1'
        if (dt.Rows.Count > 0 && dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Text = dr["UserTypeName"].ToString();
                item.Value = dr["ID"].ToString();
                drdIndustries.Items.Add(item);
            }
        }
    }
    public void SendMessage()
    {
        try
        {
            string _EmailBody = "Dear Mr/Miss Admin ";
            _EmailBody += "<br/>New Registration From ITS Gwalior website ";
            _EmailBody += "<br/><br/> You can see details from <a href='https://itsgwalior.com/Admin/Login.aspx'> Click Here</a>";
            _EmailBody += "<br/><br/> Full Name: " + txtName.Text;
            _EmailBody += "<br/><br/> E-mail :   " + txtEmailID.Text;
            _EmailBody += "<br/><br/> Mobile:  " + txtMobNo.Text;
           // _EmailBody += "<br/><br/> Subject:  " + txtSubject.Text;
           // _EmailBody += "<br/><br/> Message:  " + txtMessage.Text;

            string from = ConfigurationManager.AppSettings["MailUsername"].ToString();
            string To = ConfigurationManager.AppSettings["AdminMailID"].ToString();
            string subject = "New " + drdIndustries.SelectedItem.Text + " Registration by "+txtName.Text+" From ITS Gwalior website ";
            SendMail.SendEmail(from, To, subject, _EmailBody, hdfCV.Value);

            //divMsg.Visible = true;
            //lblMsg.Text = "Your enquiry has been submitted successfully";



        }
        catch (Exception ex)
        {
            //alert.Visible = true;
            //lblMSG.Text = "Some Error Occured,Pleaser try later";
        }



    }
    private void SaveUploadFile(string userid)
    {
        string filename = Path.GetFileName(fuUploadResm.PostedFile.FileName);
        hdfCV.Value = Path.GetFileName(fuUploadResm.PostedFile.FileName);
        string extension = Path.GetExtension(filename);
        string contentType = fuUploadResm.PostedFile.ContentType;
        HttpPostedFile file = fuUploadResm.PostedFile;
        byte[] document = new byte[file.ContentLength];
        file.InputStream.Read(document, 0, file.ContentLength);

        //Validations  
        if ((extension == ".pdf") || (extension == ".doc") || (extension == ".docx") || (extension == ".xls") || (extension == ".jpg") || (extension == ".jpeg") || (extension == ".png"))//extension  
        {
            if (file.ContentLength <= 31457280)//size  
            {
                fuUploadResm.SaveAs(Server.MapPath("~/CV/" + fuUploadResm.FileName));
                //SqlCommand cmd = new SqlCommand("INSERT INTO [CVProfile]([CvName],[Name],[MobileNo],[CrearteOn],[Indrustre]) VALUES(@CvName,@Name,@MobileNo,@CrearteOn,@Indrustre)");
                //cmd.Parameters.AddWithValue("@CvName", hdfCvName.Value);
                //cmd.Parameters.AddWithValue("@Name", txtName.Text);
                //cmd.Parameters.AddWithValue("@MobileNo", txtMobile.Text);
                //cmd.Parameters.AddWithValue("@Indrustre", drdIndustries.SelectedValue);
                //cmd.Parameters.AddWithValue("@CrearteOn", DateTime.Now);
                //DataAccess.InsertExecuteNonQuery(cmd);
                //DivMsg.Visible = true;
                //lblMSG.Text = "Your cv upload successfully";
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                //txtMobile.Text = string.Empty;
                //txtName.Text = string.Empty;
                //drdIndustries.ClearSelection();
                //hdfCvName.Value = string.Empty;

                SqlCommand cmdCV = new SqlCommand("INSERT INTO [CVProfile]([CvName],[Name],[MobileNo],[CrearteOn],[UserID]) VALUES(@CvName,@Name,@MobileNo,@CrearteOn,@UserID)");
                cmdCV.Parameters.AddWithValue("@CvName", hdfCV.Value);
                cmdCV.Parameters.AddWithValue("@Name", txtName.Text);
                cmdCV.Parameters.AddWithValue("@MobileNo", txtMobNo.Text);
                cmdCV.Parameters.AddWithValue("@CrearteOn", DateTime.Now);
                //cmdCV.Parameters.AddWithValue("@Indrustre",);
                cmdCV.Parameters.AddWithValue("@UserID", userid);
                DataAccess.InsertExecuteNonQuery(cmdCV);
            }
            else
            { Response.Write("Inavlid File size"); return; }
        }
        else
        {
            Response.Write("Inavlid File"); return;
        }
    }
}