using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Drawing.Drawing2D;
using System.Drawing;
using System.Web.UI.HtmlControls;
using System.Configuration;
using Amity.ERP_Utilities;
public partial class Admin_Co_Ordinator : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["pid"] != null)
            {
                hdfpartyid.Value = Request.QueryString["pid"].ToString();
                bindCoOrdinator();

            }

        }
    }


    public void bindCoOrdinator()
    {
        DataTable dt = DataAccess.GetData("Select * from [PartyMaster] Where [PartyID]=" + hdfpartyid.Value + "");
        if (dt.Rows.Count > 0)
        {
            txtFullName.Text = dt.Rows[0]["Contact_person_name"].ToString();
            txtMobile.Text = dt.Rows[0]["mobile_no"].ToString();
            txtemail.Text = dt.Rows[0]["Email"].ToString();         
            btnSubmit.Text = "Update";

        }
    }

  

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        //string PartyID = string.Empty;
        string MaxID = string.Empty;
        string ID_Format = string.Empty;
        ID_Generator ID_Gen = new ID_Generator();

        try
        {
            MaxID = DataAccess.GetSingleValue("select top 1 PartyCode from [PartyMaster]  order by [PartyID] desc");
        }
        catch { }


        ID_Format = "PT-000";
        string var = ID_Gen.GenrateProductID(MaxID, ID_Format);

        string Mob = string.Empty;
        try
        {
            Mob = DataAccess.GetSingleValue("select MobileNo from [UserDetails] where [MobileNo]='" + txtMobile.Text + "'");
        }
        catch { }
        if (Mob == string.Empty)
        {
            SqlCommand cmdParty = new SqlCommand("INSERT INTO [PartyMaster]([PartyCode],[Party_Type],[Contact_person_name],[mobile_no],[Email],[job_Title],[Createon]) VALUES(@PartyCode,@Party_Type, @Contact_person_name,@mobile_no,@Email,@job_Title, @Createon) Select SCOPE_IDENTITY();");
            cmdParty.Parameters.AddWithValue("@PartyCode", var);
            cmdParty.Parameters.AddWithValue("@Party_Type", "7");
            cmdParty.Parameters.AddWithValue("@Contact_person_name", txtFullName.Text);
            cmdParty.Parameters.AddWithValue("@mobile_no", txtMobile.Text);
            cmdParty.Parameters.AddWithValue("@Email", txtemail.Text);                  
            cmdParty.Parameters.AddWithValue("@job_Title","Co-ordinator");
            cmdParty.Parameters.AddWithValue("@Createon", DateTime.Now);
            hdfpartyid.Value = DataAccess.InsertExecuteScalar(cmdParty);
            string PartyId = string.Empty;




            PartyId = hdfpartyid.Value;
            if (fuPhoto.HasFile)
            {
                SaveUploadFile(PartyId);

            }

            SqlCommand cmd = new SqlCommand("INSERT INTO [UserDetails]([UserName],[PassWord],[Createon],[MobileNo],[Name],[InActive],[UserTypeID],[EmailID],[PartyID]) VALUES(@UserName,@PassWord,@Createon,@MobileNo,@Name,@InActive,@UserTypeID,@EmailID,@PartyID) Select SCOPE_IDENTITY();");
            cmd.Parameters.AddWithValue("@UserName", txtFullName.Text);
            cmd.Parameters.AddWithValue("@PassWord", txtPSWD.Text.Trim());
            cmd.Parameters.AddWithValue("@Createon", DateTime.Now);
            cmd.Parameters.AddWithValue("@MobileNo", txtMobile.Text);
            cmd.Parameters.AddWithValue("@Name", txtFullName.Text);
            cmd.Parameters.AddWithValue("@EmailID", txtemail.Text);
            cmd.Parameters.AddWithValue("@InActive", "True");
            cmd.Parameters.AddWithValue("@UserTypeID", "7");
            cmd.Parameters.AddWithValue("@PartyID", hdfpartyid.Value);
            string Var = DataAccess.InsertExecuteScalar(cmd);
            string msg = "Hi " + txtFullName.Text + " , Welcome to ITS Gwalior family. Your user id:- " + txtMobile.Text + " and Password:- " + txtPSWD.Text + " , For login click here : https://itsgwalior.com ";

            if (txtMobile.Text != string.Empty)
            {
                SendSMS.ProcessSMS(txtMobile.Text, msg, "1207162460278866287");
            }
            SendMessage();
            alert.Visible = true;
            lblMsg.Text = "Your registration has been successfully completed";          
        }
        else
        {
            alert.Visible = true;
            lblMsg.Text = "This mobile number is already registered";

        }
        Cleratext();      
    }

    public void Cleratext()
    {
        txtFullName.Text = string.Empty;
            txtMobile.Text = string.Empty;
        txtemail.Text = string.Empty;
        txtPSWD.Text = string.Empty;
        hdfStdImage.Value = string.Empty;
    }


    private void SaveUploadFile(string userid)
    {
        string ImgCat = string.Empty;
        if (fuPhoto.HasFile)
        {
            ResizeImage(fuPhoto.FileName, 200, 150);
            hdfStdImage.Value = fuPhoto.FileName;
        }      

            SqlCommand cmd = new SqlCommand("INSERT INTO [PartyDocument_Master]([Document_Name],[Upload_File],[PartyID],[CreatedOn]) VALUES(@Document_Name,@Upload_File ,@PartyID,@CreatedOn)");
            cmd.Parameters.AddWithValue("@Document_Name", "Profile Photo");
            cmd.Parameters.AddWithValue("@Upload_File", hdfStdImage.Value);
            cmd.Parameters.AddWithValue("@PartyID", userid);
            cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
            DataAccess.InsertExecuteNonQuery(cmd);    

    }
    string targetPath = string.Empty;
    private string ResizeImage(string fileName, int width, int height)
    {
        // Check the extension of image  
        string extension = Path.GetExtension(fileName);
        if (extension.ToLower() == ".png" || extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg")
        {
            Stream strm = fuPhoto.PostedFile.InputStream;
            using (var image = System.Drawing.Image.FromStream(strm))
            {
                int newWidth = width; // New Width of Image in Pixel  
                int newHeight = height; // New Height of Image in Pixel  
                var thumbImg = new Bitmap(newWidth, newHeight);
                var thumbGraph = Graphics.FromImage(thumbImg);
                thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
                thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
                thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                var imgRectangle = new Rectangle(0, 0, newWidth, newHeight);
                thumbGraph.DrawImage(image, imgRectangle);
                // Save the file  
                targetPath = Server.MapPath(@"~\ClientContractDoc\") + fileName;
                thumbImg.Save(targetPath, image.RawFormat);
            }
        }

        return targetPath;
    }



    public void SendMessage()
    {
        try
        {
            string _EmailBody = "Dear Mr/Miss Admin ";
            _EmailBody += "<br/>New Registration From ITS Gwalior website ";
            _EmailBody += "<br/> You can see details from <a href='https://itsgwalior.com/Admin/Login.aspx'> Click Here</a>";
            _EmailBody += "<br/> Full Name: " + txtFullName.Text;
            _EmailBody += "<br/> E-mail: " + txtemail.Text;
            _EmailBody += "<br/> Mobile: " + txtMobile.Text;
            _EmailBody += "<br/> Job Title: " + "Co-Ordinator";
            string from = ConfigurationManager.AppSettings["MailUsername"].ToString();
            string To = ConfigurationManager.AppSettings["AdminMailID"].ToString();
            string subject = "New  Registration by " + txtFullName.Text + " From ITS Gwalior website ";
            SendMail.SendEmail(from, To, subject, _EmailBody, hdfStdImage.Value);
        }
        catch (Exception ex)
        {

        }


    }
}