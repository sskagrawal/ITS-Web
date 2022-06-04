using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Security.Cryptography;
using System.IO;
using System.Text;
using System.Drawing;
using System.Drawing.Drawing2D;

public partial class Admin_AddUpdateUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // BindIndustry();
            BindUserType();
            // BindUserRole();
            //if (Request.QueryString["PAGE"] != null)
            //{
            //    hdfPageName.Value = Request.QueryString["PAGE"].ToString();
            //}
            if (Request.QueryString["UID"] != null)
            {
                hdfID.Value = Utilities.Decrypt(Request.QueryString["UID"].ToString());
               
                BindUsers();
                //   string BID = Utilities.Decrypt(Request.QueryString["UID"].ToString());



                //if (BID != string.Empty)
                //{
                //    DataTable dt = DataAccess.GetData("Select * from UserDetails where ID=" + BID + "");
                //    if (dt.Rows.Count > 0 && dt != null)
                //    {
                //        rbtGendar.SelectedValue = dt.Rows[0]["Gendar"].ToString();
                //        txtName.Text = dt.Rows[0]["UserName"].ToString();
                //        txtPSWD.Text = dt.Rows[0]["PassWord"].ToString();
                //        txtName.Text = dt.Rows[0]["Name"].ToString();
                //        txtMob.Text = dt.Rows[0]["MobileNo"].ToString();
                //        txtAddress.Text = dt.Rows[0]["Address"].ToString();
                //        txtEmailID.Text = dt.Rows[0]["EmailID"].ToString();
                //        drdUserType.SelectedValue = dt.Rows[0]["UserTypeID"].ToString();
                //        if(drdUserType.SelectedValue=="3")
                //        {
                //            di_jobTitle.Visible = true;
                //            di_resume.Visible = true;
                //            di_applyfor.Visible = true;
                //            txtjobTitle.Text= dt.Rows[0]["JobTitle"].ToString();
                //            hdfResume.Value = dt.Rows[0]["UploadResume"].ToString();


                //        }


                       
                //        //txtCompanyName.Text = dt.Rows[0]["CompanyName"].ToString();
                //        // txtWebsite.Text = dt.Rows[0]["Website"].ToString();
                      
                //        //drdIndustry.SelectedValue  =dt.Rows[0]["Industry"].ToString();
                //       // drdUserType.SelectedValue = dt.Rows[0]["UserTypeID"].ToString();
                        
                //        // BindUserRole();
                //        // drdUserRole.SelectedValue=dt.Rows[0]["UserRoleID"].ToString();
                        
                //    }

                //}
            }
        }
    }


    public void BindUsers()


   {
        btnSubmit.Text = "Update";

        if (hdfID.Value != string.Empty)
        {
            DataTable dt = DataAccess.GetData("Select * from UserDetails where ID=" + hdfID.Value + "");
            if (dt.Rows.Count > 0 && dt != null)
            {
                rbtGendar.SelectedValue = dt.Rows[0]["Gendar"].ToString();
                txtName.Text = dt.Rows[0]["UserName"].ToString();
                txtPSWD.Text = dt.Rows[0]["PassWord"].ToString();
                txtName.Text = dt.Rows[0]["Name"].ToString();
                txtMob.Text = dt.Rows[0]["MobileNo"].ToString();
                txtAddress.Text = dt.Rows[0]["Address"].ToString();
                txtEmailID.Text = dt.Rows[0]["EmailID"].ToString();
                drdUserType.SelectedValue = dt.Rows[0]["UserTypeID"].ToString();

                DataTable dt2 = DataAccess.GetData("Select * from Job_Master where UserID=" + hdfID.Value + "");
                if (dt2.Rows.Count > 0)
                {
                    drd_Experience.SelectedValue = dt2.Rows[0]["Exp"].ToString();
                    drd_JobType.SelectedValue = dt2.Rows[0]["JobType"].ToString();
                    drd_Qualification.SelectedValue = dt2.Rows[0]["job_Qulalification"].ToString();
                    txtjobTitle.Text = dt2.Rows[0]["job_Title"].ToString();
                    txtsalary.Text = dt2.Rows[0]["salary"].ToString();
                    txt_education.Text = dt2.Rows[0]["OtherEducation"].ToString();


                }
                DataTable dt1 = DataAccess.GetData("Select * from CVProfile where UserID=" + hdfID.Value + "");
                if (dt1.Rows.Count > 0)
                {
                    hdfResume.Value = dt1.Rows[0]["CvName"].ToString();

                    if(hdfResume.Value!=string.Empty)
                    {
                        lblresume.Visible = true;
                        lblresume.Text = "already exist";
                    }
                }
                if (drdUserType.SelectedValue == "3")
                {

                    di_resume.Visible = true;
                    di_jobTitle.Visible = true;
                  
                    di_experience.Visible = true;
                    di_salary.Visible = true;
                    di_qualification.Visible = true;
                    di_Other_education.Visible = true;
                    di_JobType.Visible = true;

                    //txtjobTitle.Text = dt.Rows[0]["JobTitle"].ToString();

                   

                    


                    // drd_Experience.SelectedValue=dt.Rows[0]["Exp"].


                }
                if(drdUserType.SelectedValue == "2")
                {
                    di_company.Visible = true;
                    di_website.Visible = true;
                    txtCompanyname.Text= dt.Rows[0]["CompanyName"].ToString();
                    txtWebsite.Text= dt.Rows[0]["Website"].ToString();
                }

                if (drdUserType.SelectedValue == "7")
                {

                    di_landmark.Visible = true;
                    di_country.Visible = true;
                    di_state.Visible = true;

                    di_city.Visible = true;
                    di_zipcode.Visible = true;
                    di_jdate.Visible = true;

                    di_uploadImage.Visible = true;
                    di_bankDetails.Visible = true;
                    txtBankName.Visible = true;

                    di_bankName.Visible = true;

                    di_HolderName.Visible = true;
                    di_accountNO.Visible = true;
                    di_ifsc.Visible = true;



                 



                    txtLandMark.Text = dt.Rows[0]["Landmark"].ToString();
                    txtCity.Text = dt.Rows[0]["City"].ToString();
                    txtCountry.Text = dt.Rows[0]["Country"].ToString();
                    txtZipcode.Text = dt.Rows[0]["Zipcode"].ToString();
                    txtState.Text = dt.Rows[0]["State"].ToString();
                    hdfImage.Value = dt.Rows[0]["User_Image"].ToString();
                    txtBankName.Text = dt.Rows[0]["Bank_Name"].ToString();
                    txtAccountno.Text = dt.Rows[0]["Account_No"].ToString();
                    txtIfsc.Text = dt.Rows[0]["IFSC"].ToString();
                    if(dt.Rows[0]["Joining_Date"].ToString()!=string.Empty)
                    {
                        txtJdate.Text = Convert.ToDateTime(dt.Rows[0]["Joining_Date"]).ToString("dd/MM/yyyy");
                    }
                    
                   


                }




                    //txtCompanyName.Text = dt.Rows[0]["CompanyName"].ToString();
                    // txtWebsite.Text = dt.Rows[0]["Website"].ToString();

                    //drdIndustry.SelectedValue  =dt.Rows[0]["Industry"].ToString();
                    // drdUserType.SelectedValue = dt.Rows[0]["UserTypeID"].ToString();

                    // BindUserRole();
                    // drdUserRole.SelectedValue=dt.Rows[0]["UserRoleID"].ToString();

                }

        }

    }
    //private void BindUserRole()
    //{
    //    drdUserRole.Items.Clear();
    //    ListItem item1 = new ListItem();
    //    item1.Value = "0";
    //    item1.Text = "--Select User Role--";
    //    drdUserRole.Items.Add(item1);
    //    DataTable dt = DataAccess.GetData("Select * from User_Role ");
    //    if (dt.Rows.Count > 0 && dt != null)
    //    {
    //        foreach (DataRow dr in dt.Rows)
    //        {
    //            ListItem item = new ListItem();
    //            item.Value = dr["User_Role_ID"].ToString();
    //            item.Text = dr["User_Role"].ToString();
    //            drdUserRole.Items.Add(item);
    //        }
    //    }
    //}

    //private string Decrypt(string cipherText)
    //{
    //    string EncryptionKey = "MAKV2SPBNI99212";
    //    byte[] cipherBytes = Convert.FromBase64String(cipherText);
    //    using (Aes encryptor = Aes.Create())
    //    {
    //        Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
    //        encryptor.Key = pdb.GetBytes(32);
    //        encryptor.IV = pdb.GetBytes(16);
    //        using (MemoryStream ms = new MemoryStream())
    //        {
    //            using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
    //            {
    //                cs.Write(cipherBytes, 0, cipherBytes.Length);
    //                cs.Close();
    //            }
    //            cipherText = Encoding.Unicode.GetString(ms.ToArray());
    //        }
    //    }
    //    return cipherText;
    //}

    private void BindUserType()
    {
        DataTable dt = DataAccess.GetData("Select * from UserType where ID NOT IN (1,4,5) order by UserTypeName");
        if (dt.Rows.Count > 0 && dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem Item = new ListItem();
                Item.Value = dr["ID"].ToString();
                Item.Text = dr["UserTypeName"].ToString();
                drdUserType.Items.Add(Item);
            }
        }
    }


    //private void BindIndustry()
    //{
    //    DataTable dt = DataAccess.GetData("Select * from Industry_Mst order by Industry");
    //    if (dt.Rows.Count > 0 && dt != null)
    //    {
    //        foreach (DataRow dr in dt.Rows)
    //        {
    //            ListItem Item = new ListItem();
    //            Item.Value = dr["ID"].ToString();
    //            Item.Text = dr["Industry"].ToString();
    //            drdIndustry.Items.Add(Item);
    //        }
    //    }
    //}


    protected void btnSubmit_Click(object sender, EventArgs e)
    {

       

        string id;
        if (UploadImage.HasFile)
        {
            string extension1 = Path.GetExtension(UploadImage.FileName);
            if (extension1.ToLower() == ".png" || extension1.ToLower() == ".jpg" || extension1.ToLower() == ".jpeg")
            {
                Stream strm = UploadImage.PostedFile.InputStream;
                using (var image = System.Drawing.Image.FromStream(strm))
                {

                    int newWidth = 400; // New Width of Image in Pixel  
                    int newHeight = 400; // New Height of Image in Pixel  
                    var thumbImg = new Bitmap(newWidth, newHeight);
                    var thumbGraph = Graphics.FromImage(thumbImg);
                    thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
                    thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
                    thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                    var imgRectangle = new Rectangle(0, 0, newWidth, newHeight);
                    thumbGraph.DrawImage(image, imgRectangle);
                    // Save the file  
                    string targetPath = string.Empty;
                    targetPath = Server.MapPath(@"~\Admin\Company_Logo\") + UploadImage.FileName;
                    thumbImg.Save(targetPath, image.RawFormat);
                    hdfImage.Value = UploadImage.FileName;

                }
            }


        }

        if(fup_Resume.HasFile)
        {
            if (File.Exists(Server.MapPath("~/Resume/" + hdfResume.Value)))
            {
                File.Delete(Server.MapPath("~/Resume/" + hdfResume.Value));
            }

            fup_Resume.SaveAs(Server.MapPath("~/Resume/" + fup_Resume.FileName));
            hdfResume.Value = fup_Resume.FileName;


        }



        if (hdfID.Value == string.Empty)
        {


            SqlCommand cmd = new SqlCommand("INSERT INTO [UserDetails]([UserName],[PassWord],[MobileNo],[Address],[Name],[InActive],[UserTypeID],[EmailID],[Gendar],[Country],[State],[City],[Landmark],[Zipcode],[Bank_Name],[Account_Holder_Name],[Account_No],[IFSC],[User_Image],[CompanyName],[Website],[Joining_Date],[Createon]) VALUES(@UserName,@PassWord,@MobileNo,@Address,@Name,@InActive,@UserTypeID,@EmailID,@Gendar,@Country,@City,@State,@Landmark,@Zipcode,@Bank_Name,@Account_Holder_Name,@Account_No,@IFSC,@User_Image,@CompanyName,@Website,@Joining_Date,@Createon);select scope_identity()");
            cmd.Parameters.AddWithValue("@UserName", txtName.Text);
            cmd.Parameters.AddWithValue("@PassWord", txtPSWD.Text);
           
            cmd.Parameters.AddWithValue("@MobileNo", txtMob.Text);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            // cmd.Parameters.AddWithValue("@CompanyName", txtCompanyName.Text);
            // cmd.Parameters.AddWithValue("@Website", txtWebsite.Text);
            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            cmd.Parameters.AddWithValue("@InActive", "True");
            //cmd.Parameters.AddWithValue("@Industry", drdIndustry.SelectedValue);
            cmd.Parameters.AddWithValue("@UserTypeID", drdUserType.SelectedValue);


            cmd.Parameters.AddWithValue("@EmailID", txtEmailID.Text);
            cmd.Parameters.AddWithValue("@Createon",DateTime.Now);
            cmd.Parameters.AddWithValue("@Gendar", rbtGendar.SelectedValue);
            cmd.Parameters.AddWithValue("@Landmark", txtLandMark.Text);
            cmd.Parameters.AddWithValue("@City", txtCity.Text);
            cmd.Parameters.AddWithValue("@State", txtState.Text);
            cmd.Parameters.AddWithValue("@Country", txtCountry.Text);
            cmd.Parameters.AddWithValue("@Zipcode", txtZipcode.Text);
            //cmd.Parameters.AddWithValue("@Joining_Date",Utilities.GetDate(txtJdate.Text));
            cmd.Parameters.AddWithValue("@User_Image", hdfImage.Value);
            cmd.Parameters.AddWithValue("@Bank_Name", txtBankName.Text);
            cmd.Parameters.AddWithValue("@Account_Holder_Name", txtHolderName.Text);
            cmd.Parameters.AddWithValue("@Account_No", txtAccountno.Text);
            cmd.Parameters.AddWithValue("@IFSC", txtIfsc.Text);

            cmd.Parameters.AddWithValue("@CompanyName", txtCompanyname.Text);
            cmd.Parameters.AddWithValue("@Website", txtWebsite.Text);

            if (txtJdate.Text != string.Empty)
            {
                cmd.Parameters.AddWithValue("@Joining_Date", Utilities.GetDate(txtJdate.Text));
            }
            else
            {
                cmd.Parameters.AddWithValue("@Joining_Date", DBNull.Value);
            }
           // cmd.Parameters.AddWithValue("@Joining_Date", Utilities.GetDate().Text);
            //cmd.Parameters.AddWithValue("@UserRoleID", drdUserRole.SelectedValue);

           
          id = DataAccess.InsertExecuteScalar(cmd);


            if (drdUserType.SelectedValue == "3")
            {

                SqlCommand cmd1 = new SqlCommand("insert into Job_Master([job_Title],[job_Qulalification],[Exp],[JobType],[CreatedOn],[Salary],[OtherEducation],[UserID],[JobCategory])values(@job_Title,@job_Qulalification,@Exp,@JobType,@CreatedOn,@Salary,@OtherEducation,@UserID,@JobCategory )");
                    cmd1.Parameters.AddWithValue("@job_Title", txtjobTitle.Text);

                    cmd1.Parameters.AddWithValue("@job_Qulalification", drd_Qualification.SelectedValue);
                    cmd1.Parameters.AddWithValue("@JobType", drd_JobType.SelectedValue);
                    cmd1.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
                    cmd1.Parameters.AddWithValue("@Salary", txtsalary.Text);
                    cmd1.Parameters.AddWithValue("@OtherEducation", txt_education.Text);
                    cmd1.Parameters.AddWithValue("@Exp", drd_Experience.SelectedValue);
                cmd1.Parameters.AddWithValue("@JobCategory", "JobSheeker");
                cmd1.Parameters.AddWithValue("@UserID", id);
                    DataAccess.InsertExecuteNonQuery(cmd1);
            




            SqlCommand cmdCV = new SqlCommand("INSERT INTO [CVProfile]([CvName],[Name],[MobileNo],[CrearteOn],[UserID]) VALUES(@CvName,@Name,@MobileNo,@CrearteOn,@UserID)");
                cmdCV.Parameters.AddWithValue("@CvName", hdfResume.Value);
                cmdCV.Parameters.AddWithValue("@Name", txtName.Text);
                cmdCV.Parameters.AddWithValue("@MobileNo", txtMob.Text);
                cmdCV.Parameters.AddWithValue("@CrearteOn", DateTime.Now);
                //cmdCV.Parameters.AddWithValue("@Indrustre",);
                cmdCV.Parameters.AddWithValue("@UserID", id);
                DataAccess.InsertExecuteNonQuery(cmdCV);

            }

            alert.Visible = true;
            lblMsg.Text = "Record Saved Successfully";

            CLR();
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [UserDetails] SET [UserName] = @UserName,[PassWord] = @PassWord,[MobileNo] = @MobileNo,[Address] = @Address,[Name] = @Name, [EmailID] = @EmailID,[Gendar]=@Gendar,[CompanyName]=@CompanyName,[Website]=@Website,[Country]=@Country,[State]=@State,[City]=@City,[Landmark]=@Landmark,[Zipcode]=@Zipcode,[Bank_Name]=@Bank_Name,[Account_Holder_Name]=@Account_Holder_Name,[Account_No]=@Account_No,[IFSC]=@IFSC,[User_Image]=@User_Image,[Joining_Date]=@Joining_Date WHERE ID=" + hdfID.Value + "");
            cmd.Parameters.AddWithValue("@UserName", txtName.Text);
            cmd.Parameters.AddWithValue("@PassWord", txtPSWD.Text);
            cmd.Parameters.AddWithValue("@MobileNo", txtMob.Text);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@Name", txtName.Text);
           // cmd.Parameters.AddWithValue("@UserTypeID", drdUserType.SelectedValue);
            cmd.Parameters.AddWithValue("@EmailID", txtEmailID.Text);
            cmd.Parameters.AddWithValue("@Gendar", rbtGendar.SelectedValue);
           
            cmd.Parameters.AddWithValue("@CompanyName", txtCompanyname.Text);
            cmd.Parameters.AddWithValue("@Website", txtWebsite.Text);
            cmd.Parameters.AddWithValue("@Landmark", txtLandMark.Text);
            cmd.Parameters.AddWithValue("@City", txtCity.Text);
            cmd.Parameters.AddWithValue("@State", txtState.Text);
            cmd.Parameters.AddWithValue("@Country", txtCountry.Text);
            cmd.Parameters.AddWithValue("@Zipcode", txtZipcode.Text);
            //cmd.Parameters.AddWithValue("@Joining_Date",Utilities.GetDate(txtJdate.Text));
            cmd.Parameters.AddWithValue("@User_Image", hdfImage.Value);
            cmd.Parameters.AddWithValue("@Bank_Name", txtBankName.Text);
            cmd.Parameters.AddWithValue("@Account_Holder_Name", txtHolderName.Text);
            cmd.Parameters.AddWithValue("@Account_No", txtAccountno.Text);
            cmd.Parameters.AddWithValue("@IFSC", txtIfsc.Text);

            if (txtJdate.Text != string.Empty)
            {
                cmd.Parameters.AddWithValue("@Joining_Date", Utilities.GetDate(txtJdate.Text));
            }
            else
            {
                cmd.Parameters.AddWithValue("@Joining_Date", DBNull.Value);
            }
            // cmd.Parameters.AddWithValue("@Joining_Date", txtJdate.Text);

            DataAccess.InsertExecuteNonQuery(cmd);

            if (drdUserType.SelectedValue == "3")
            {

                string checkJobPRo = string.Empty;
                try
                {
                    checkJobPRo = DataAccess.GetSingleValue("select UserID from Job_Master where UserID='" + hdfID.Value + "'");
                }
                catch { }



                SqlCommand cmd2 = new SqlCommand("Update CVProfile set CvName=@CvName,Name=@Name,MobileNo=@MobileNo,CrearteOn=@CrearteOn where UserID=" + hdfID.Value + "");
                cmd2.Parameters.AddWithValue("@CvName", hdfResume.Value);
                cmd2.Parameters.AddWithValue("@Name", txtName.Text);
                cmd2.Parameters.AddWithValue("@MobileNo", txtMob.Text);
                cmd2.Parameters.AddWithValue("@CrearteOn", DateTime.Now);

                DataAccess.InsertExecuteNonQuery(cmd2);

                if (checkJobPRo != string.Empty)
                {

                    SqlCommand cmd3 = new SqlCommand("Update Job_Master set job_Title=@job_Title,job_Qulalification=@job_Qulalification,Exp=@Exp,JobType=@JobType,CreatedOn=@CreatedOn,Salary=@Salary,OtherEducation=@OtherEducation,[JobCategory]=@JobCategory where UserID= " + hdfID.Value + "");

                    cmd3.Parameters.AddWithValue("@job_Title", txtjobTitle.Text);

                    cmd3.Parameters.AddWithValue("@job_Qulalification", drd_Qualification.SelectedValue);
                    cmd3.Parameters.AddWithValue("@JobType", drd_JobType.SelectedValue);
                    cmd3.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
                    cmd3.Parameters.AddWithValue("@Salary", txtsalary.Text);
                    cmd3.Parameters.AddWithValue("@OtherEducation", txt_education.Text);
                    cmd3.Parameters.AddWithValue("@Exp", drd_Experience.SelectedValue);
                    cmd3.Parameters.AddWithValue("@JobCategory", "JobSheeker");
                    DataAccess.InsertExecuteNonQuery(cmd3);
                }
                else
                {
                    SqlCommand cmd1 = new SqlCommand("insert into Job_Master([job_Title],[job_Qulalification],[Exp],[JobType],[CreatedOn],[Salary],[OtherEducation],[UserID],[JobCategory])values(@job_Title,@job_Qulalification,@Exp,@JobType,@CreatedOn,@Salary,@OtherEducation,@UserID,@JobCategory )");
                    cmd1.Parameters.AddWithValue("@job_Title", txtjobTitle.Text);

                    cmd1.Parameters.AddWithValue("@job_Qulalification", drd_Qualification.SelectedValue);
                    cmd1.Parameters.AddWithValue("@JobType", drd_JobType.SelectedValue);
                    cmd1.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
                    cmd1.Parameters.AddWithValue("@Salary", txtsalary.Text);
                    cmd1.Parameters.AddWithValue("@OtherEducation", txt_education.Text);
                    cmd1.Parameters.AddWithValue("@Exp", drd_Experience.SelectedValue);
                    cmd1.Parameters.AddWithValue("@UserID", hdfID.Value);
                    cmd1.Parameters.AddWithValue("@JobCategory", "JobSheeker");
                    DataAccess.InsertExecuteNonQuery(cmd1);
                }
            }

            // cmd.Parameters.AddWithValue("@CompanyName", txtCompanyName.Text);
            // cmd.Parameters.AddWithValue("@Website", txtWebsite.Text);

            //cmd.Parameters.AddWithValue("@Industry", drdIndustry.SelectedValue);

            //  cmd.Parameters.AddWithValue("@UserRoleID", drdUserRole.SelectedValue);,[UserRoleID]=@UserRoleID 


            alert.Visible = true;
            lblMsg.Text = "Record Update Successfully";

        }
        
        //if (Request.QueryString["PAGE"] == null)
        //    {
        //    Response.Redirect("~/Admin/Job/CvList.aspx");
        //}
        //if (Request.QueryString["JOBSEEKER"] == null)
        //{
        //    Response.Redirect("~/Admin/Job/JobSheekarList.aspx");
        //}

    }


  

    private void CLR()
    {
        rbtGendar.ClearSelection();
        txtAddress.Text = string.Empty;
        //   txtCompanyName.Text = string.Empty;
        txtEmailID.Text = string.Empty;
        txtMob.Text = string.Empty;
        txtName.Text = string.Empty;
        txtPSWD.Text = string.Empty;
        // txtWebsite.Text = string.Empty;
        hdfID.Value = string.Empty;
        drdUserType.ClearSelection();
        // drdUserRole.ClearSelection();
    }

    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {

        if (drdUserType.SelectedValue == "2")
        {
            di_company.Visible = true;
            di_website.Visible = true;

            di_jobTitle.Visible = false;
            di_resume.Visible = false;
            di_experience.Visible = false;
            di_salary.Visible = false;
            di_qualification.Visible = false;
            di_Other_education.Visible = false;
            di_JobType.Visible = false;

            di_landmark.Visible = false;
            di_country.Visible = false;
            di_state.Visible = false;

            di_city.Visible = false;
            di_zipcode.Visible = false;
            di_jdate.Visible = false;

            di_uploadImage.Visible = false;
            di_bankDetails.Visible = false;
            txtBankName.Visible = false;

            di_HolderName.Visible = false;
            di_accountNO.Visible = false;
            di_ifsc.Visible = false;

        }

            if (drdUserType.SelectedValue == "3")
        {
            di_jobTitle.Visible = true;
            di_resume.Visible = true;

            di_experience.Visible = true;
            di_salary.Visible = true;
            di_qualification.Visible = true;
            di_Other_education.Visible = true;
            di_JobType.Visible = true;





            di_landmark.Visible = false;
            di_country.Visible = false;
            di_state.Visible = false;

            di_city.Visible = false;
            di_zipcode.Visible = false;
            di_jdate.Visible = false;

            di_uploadImage.Visible = false;
            di_bankDetails.Visible = false;
            txtBankName.Visible = false;

            di_HolderName.Visible = false;
            di_accountNO.Visible = false;
            di_ifsc.Visible = false;
            di_company.Visible = false;
            di_website.Visible = false;






        }

        if (drdUserType.SelectedValue == "7")
        {
            di_landmark.Visible = true;
            di_country.Visible = true;
            di_state.Visible = true;

            di_city.Visible = true;
            di_zipcode.Visible = true;
            di_jdate.Visible = true;

            di_uploadImage.Visible = true;
            di_bankDetails.Visible = true;
            txtBankName.Visible = true;

            di_bankName.Visible = true;
            di_HolderName.Visible = true;
            di_accountNO.Visible = true;
            di_ifsc.Visible = true;

            di_company.Visible = false;
            di_website.Visible = false;
            di_jobTitle.Visible = false;
            di_resume.Visible = false;
            di_applyfor.Visible = false;
            di_experience.Visible = false;
            di_salary.Visible = false;
            di_qualification.Visible = false;
            di_Other_education.Visible = false;
            di_JobType.Visible = false;

        }
        if(drdUserType.SelectedValue=="0")
        {
            di_company.Visible = false;
            di_website.Visible = false;
            di_jobTitle.Visible = false;
            di_resume.Visible = false;
            di_applyfor.Visible = false;
            di_experience.Visible = false;
            di_salary.Visible = false;
            di_qualification.Visible = false;
            di_Other_education.Visible = false;
            di_JobType.Visible = false;
            di_landmark.Visible = false;
            di_country.Visible = false;
            di_state.Visible = false;

            di_city.Visible = false;
            di_zipcode.Visible = false;
            di_jdate.Visible = false;

            di_uploadImage.Visible = false;
            di_bankDetails.Visible = false;
            txtBankName.Visible = false;

            di_HolderName.Visible = false;
            di_accountNO.Visible = false;
            di_ifsc.Visible = false;
            di_company.Visible = false;
            di_website.Visible = false;

        }
    }
}