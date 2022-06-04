using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Configuration;
using Amity.ERP_Utilities;

public partial class Controle_WebUserControl : System.Web.UI.UserControl
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

          //  Bind_Ads();

            string pageName = Path.GetFileName(Request.Path);

            if (pageName == "find-resumes.aspx" || pageName == "find-resumes.aspx")
            {
                hdfUserID.Value = "2";
            }
            else if (pageName == "find-job.aspx" || pageName == "find-job.aspx")
            {
                hdfUserID.Value = "3";
            }
            BindEmployeeType();
            drdIndustries.SelectedValue = hdfUserID.Value;


            if (Session["sridd"] != null)
            {
                Div1.Visible = false;
              //  Div2.Visible = true;
            }
            else
            {
                Div1.Visible = true;
              //  Div2.Visible = true;
            }
        }
    }

    //public void BindCountry()
    //{
    //    DataTable dt = DataAccess.GetData("select * from Mst_Country_Master order by Country_Name");
    //    if (dt != null && dt.Rows.Count > 0)
    //    {

    //        foreach (DataRow dr in dt.Rows)
    //        {
    //            ListItem item = new ListItem();
    //            item.Value = dr["Country_Id"].ToString();
    //            item.Text = dr["Country_Name"].ToString();
    //            drdCountry.Items.Add(item);
    //        }
    //        drdCountry.SelectedValue = "101";
    //    }
    //}



    //public void Bind_Ads()
    //{
    //    DataTable dt = DataAccess.GetData("Select * from [Ads_Master] order by Img_Position asc");
    //    if (dt.Rows.Count > 0 && dt != null)
    //    {

    //        for (int i = 0; i < dt.Rows.Count; i++)
    //        {              
    //           ltrAdsImag.Text += "<a target='_blank' href='"+dt.Rows[i]["ComLink"].ToString()+"'><img src='../AdsImage/" + dt.Rows[i]["Ads_Image"].ToString() + "' /></a>";

    //        }
    //    }

    //}
    private void BindEmployeeType()
    {
        //DataTable dt = DataAccess.GetData("Select * from [UserType] where ID NOT IN (1,4,5,7) "); // ID !='1'
        DataTable dt = DataAccess.GetData("Select * from [UserType] where ID NOT IN (1,4,5,7) "); // ID !='1'
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
    protected void lbtnSubmit_Click(object sender, EventArgs e)
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
            Mob = DataAccess.GetSingleValue("select MobileNo from [UserDetails] where [MobileNo]='" + txtMobNo.Text + "'");
        }
        catch { }
        if (Mob == string.Empty)
        {
            SqlCommand cmdParty = new SqlCommand("INSERT INTO [PartyMaster]([PartyCode],[Party_Type],[Contact_person_name],[mobile_no],[Email],[job_Title],[Createon],[JobSeekerOrderPosition]) VALUES(@PartyCode,@Party_Type, @Contact_person_name,@mobile_no,@Email,@job_Title, @Createon,@JobSeekerOrderPosition) Select SCOPE_IDENTITY();");
            cmdParty.Parameters.AddWithValue("@PartyCode", var);
            cmdParty.Parameters.AddWithValue("@Party_Type", drdIndustries.SelectedValue);
            cmdParty.Parameters.AddWithValue("@Contact_person_name", txtName.Text);
            cmdParty.Parameters.AddWithValue("@mobile_no", txtMobNo.Text);
            cmdParty.Parameters.AddWithValue("@Email", txtEmailID.Text);

            if (txtJobTitle.Text != string.Empty)
            {

                cmdParty.Parameters.AddWithValue("@job_Title", txtJobTitle.Text);
            }

            else
            {

                cmdParty.Parameters.AddWithValue("@job_Title", "");
            }


            cmdParty.Parameters.AddWithValue("@Createon",DateTime.Now);
            cmdParty.Parameters.AddWithValue("@JobSeekerOrderPosition","999");
            hdfpartyid.Value = DataAccess.InsertExecuteScalar(cmdParty);
            string PartyId = string.Empty;

            PartyId = hdfpartyid.Value;
            if (fuUploadResm.HasFile)
            {
                SaveUploadFile(PartyId);

            }

            SqlCommand cmd = new SqlCommand("INSERT INTO [UserDetails]([UserName],[PassWord],[Createon],[MobileNo],[Name],[InActive],[UserTypeID],[EmailID],[PartyID]) VALUES(@UserName,@PassWord,@Createon,@MobileNo,@Name,@InActive,@UserTypeID,@EmailID,@PartyID) Select SCOPE_IDENTITY();");
            cmd.Parameters.AddWithValue("@UserName", txtName.Text);
            cmd.Parameters.AddWithValue("@PassWord", txtPSWD.Text.Trim());
            cmd.Parameters.AddWithValue("@Createon", DateTime.Now);
            cmd.Parameters.AddWithValue("@MobileNo", txtMobNo.Text);
            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            cmd.Parameters.AddWithValue("@EmailID", txtEmailID.Text);
            cmd.Parameters.AddWithValue("@InActive", "True");
            cmd.Parameters.AddWithValue("@UserTypeID", drdIndustries.SelectedValue);
            cmd.Parameters.AddWithValue("@PartyID", hdfpartyid.Value);            
            string Var = DataAccess.InsertExecuteScalar(cmd);

          
            
               string msg= "Hi " + txtName.Text + " , Welcome to ITS Gwalior family. Your user id:- " + txtMobNo.Text + " and Password:- " + txtPSWD.Text + " , For login click here : https://itsgwalior.com ";
   
            if (txtMobNo.Text != string.Empty)
            {
                SendSMS.ProcessSMS(txtMobNo.Text, msg, "1207162460278866287");
            }

            SendMessage();
            alert.Visible = true;
            lblMSG.Text = "Your registration has been successfully completed";
            if (drdIndustries.SelectedValue == "3") //&& Var != string.Empty
            {
                DataTable dt = DataAccess.GetData("Select * from UserDetails where ID='" + Var + "'");
                if (dt.Rows.Count > 0 && dt != null)
                {
                    Session["ttppd"] = dt.Rows[0]["UserTypeID"].ToString();
                    Session["sridd"] = dt.Rows[0]["ID"].ToString();
                    Session["partyid"] = hdfpartyid.Value;
                    Response.Redirect("~/Client_Panel/jobDashboard.aspx");
                 

                }
            }
            else if (drdIndustries.SelectedValue == "2")
            {
                DataTable dt = DataAccess.GetData("Select * from UserDetails where ID='" + Var + "'");
                if (dt.Rows.Count > 0 && dt != null)
                {
                    Session["ttppd"] = dt.Rows[0]["UserTypeID"].ToString();
                    Session["sridd"] = dt.Rows[0]["ID"].ToString();
                    Session["partyid"] = hdfpartyid.Value;
                    Response.Redirect("~/Client_Panel/EmpDashbooard.aspx");
                }
            }
        }
        else
        {
            alert.Visible = true;
            lblMSG.Text = "This mobile number is already registered";

        }     
        CLR();
    }
    private void CLR()
    {
        txtEmailID.Text = string.Empty;
        txtMobNo.Text = string.Empty;
        txtName.Text = string.Empty;
        txtPSWD.Text = string.Empty;
        drdIndustries.ClearSelection();
        hdfCV.Value = string.Empty;        
    }


    private void SaveUploadFile(string userid)
    {

        if (fuUploadResm.HasFile)
        {
            if (File.Exists(Server.MapPath("ClientContractDoc/" + hdfCV.Value)))
            {
                File.Delete(Server.MapPath("ClientContractDoc/" + hdfCV.Value));
            }
            fuUploadResm.SaveAs(Server.MapPath("~/ClientContractDoc/" + fuUploadResm.FileName));
            hdfCV.Value = fuUploadResm.FileName;

            SqlCommand cmd = new SqlCommand("INSERT INTO [PartyDocument_Master]([Document_Name],[Upload_File],[PartyID],[CreatedOn]) VALUES(@Document_Name,@Upload_File ,@PartyID,@CreatedOn)");
            cmd.Parameters.AddWithValue("@Document_Name", "Resume File");
            cmd.Parameters.AddWithValue("@Upload_File", hdfCV.Value);
            cmd.Parameters.AddWithValue("@PartyID", userid);
            cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
            DataAccess.InsertExecuteNonQuery(cmd);
        }      
       
    }
    
    public void SendMessage()
    {
        try
        {
            string _EmailBody = "Dear Mr/Miss Admin ";
            _EmailBody += "<br/>New Registration From ITS Gwalior website ";
            _EmailBody += "<br/> You can see details from <a href='https://itsgwalior.com/Admin/Login.aspx'> Click Here</a>";
            _EmailBody += "<br/> Full Name: " + txtName.Text;
            _EmailBody += "<br/> E-mail: " + txtEmailID.Text;
            _EmailBody += "<br/> Mobile: " + txtMobNo.Text;
            _EmailBody += "<br/> Job Title: " + txtJobTitle.Text;         
            string from = ConfigurationManager.AppSettings["MailUsername"].ToString();
            string To = ConfigurationManager.AppSettings["AdminMailID"].ToString();
            string subject = "New " + drdIndustries.SelectedItem.Text + " Registration by " + txtName.Text + " From ITS Gwalior website ";
            SendMail.SendEmail(from, To, subject, _EmailBody,hdfCV.Value);
        }
        catch (Exception ex)
        {
            
        }      


    }
}