using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing.Drawing2D;
using System.Drawing;
using System.IO;
using System.Data;
using System.Configuration;

public partial class Client_Panel_Post_Resume : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
                if (Session["partyid"] != null && Session["sridd"] != null)
                {
                    hdfPartyId.Value = Session["partyid"].ToString();
                    hdfUserID.Value = Session["sridd"].ToString();
                    BindJobType();
                    BindQalification();
                    BindExperince();
                    BindJobIndustry();              
                    BindState();                


                    drdState.Items.FindByValue("1640").Selected = true;
                    BindCity();
                    drdCity.Items.FindByValue("3460").Selected = true;             


                if (Request.QueryString["PID"] != null)
                {
                    hdfPostID.Value = Request.QueryString["PID"].ToString();
                    bindJobEdit();
                   

                }

            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }


   

    public void bindJobEdit()
    {

        DataTable dt = DataAccess.GetData("Select * from [Job_Master] where [job_Id]=" + hdfPostID.Value + "  ");
        if (dt.Rows.Count > 0 && dt != null)
        {


            BindJobIndustry();
            drdIndustry.SelectedValue = dt.Rows[0]["ID"].ToString();
            //drdIndustry.SelectedItem.Text = dt.Rows[0]["Industry"].ToString();
            bindJobSubCategory();
            ddljobSubCategory.SelectedValue = dt.Rows[0]["JobSubCat_Id"].ToString();

            // bindSelectedSkill();

            GetJobSkill();


            txtJobTitle.Text = dt.Rows[0]["job_Title"].ToString();
            txtDes.Text = dt.Rows[0]["job_Desc"].ToString();
            if(dt.Rows[0]["job_Qulalification"].ToString()!= "Not Required")
            {
                drdQualification.SelectedItem.Text = dt.Rows[0]["job_Qulalification"].ToString();
            }
            
            
            txtNoPosition.Text = dt.Rows[0]["Position"].ToString();
            drdJobType.SelectedItem.Text = dt.Rows[0]["JobType"].ToString();
            txtMinimum.Text = dt.Rows[0]["MimiSalery"].ToString();
            txtMaxmum.Text = dt.Rows[0]["MaxiMum"].ToString();
            if(dt.Rows[0]["Exp"].ToString()!= "Not Required")
            {
                drdExp.SelectedItem.Text = dt.Rows[0]["Exp"].ToString();
            }
            
            ddlUnit.SelectedItem.Text = dt.Rows[0]["Time_Duration"].ToString();
            txtTimeDuration.Text = dt.Rows[0]["Time_Unit"].ToString();
            drdState.SelectedItem.Text = dt.Rows[0]["StateID"].ToString();
            BindCity();
            drdCity.SelectedItem.Text = dt.Rows[0]["CityID"].ToString();

            if (dt.Rows[0]["FixPrice"].ToString() != string.Empty)
            {
                txtFixPrice.Text = dt.Rows[0]["FixPrice"].ToString();
            }

            else
            {

                txtFixPrice.Text ="0";

            }
        
          


        }

    }

    public void GetJobSkill()
    {
        //DataTable dt = DataAccess.GetData("Select [Skill_Name] from [View_Post_Job_Skill] where [job_Id]="+ hdfPostID.Value + " and [JobSubCat_Id]="+ ddljobSubCategory.SelectedValue + " ");
        //if (dt.Rows.Count > 0)
        //{

        //   // ltrJobSkill.Text += dt.Rows[0]["Skill_Name"].ToString(); 

        //}

        DataTable dt = DataAccess.GetData("Select [Skill_Name] from [View_Post_Job_Skill] where [job_Id]=" + hdfPostID.Value + " ");
        if (dt.Rows.Count > 0)
        {
            ltrJobSkill.Text += "<ul class='nav nav-pills smaller hidden-sm-down'>";
            foreach (DataRow row in dt.Rows)
            {
                // ListItem item1 = new ListItem(row["Skill_Name"].ToString());
                //  ltrJobSkill.Text += row["Skill_Name"].ToString();
                // ltrJobSkill.Text += "<div class='value-pair'><div class='value badge badge-pill badge-success' style='margin-top:7px;'>" + row["Skill_Name"].ToString() + "</div></div>";

                ltrJobSkill.Text += "<li class='nav-item'><a class='nav-link active' style='text-decoration:none;margin-top:7px;'>" + row["Skill_Name"].ToString() + "</a></li>";

                // ltrJobSkill.Text += "";
                // ddlSkill2.Items.Add(item1);
            }
            ltrJobSkill.Text += "</ul>"; 
        }


    }


    public void bindskill2()
    {      

        ddlSkill2.Items.Clear();
      
        DataTable dt = DataAccess.GetData("Select Distinct * from [Skill_Master] where [JobSubCat_Id]="+ddljobSubCategory.SelectedValue+"");
        if (dt.Rows.Count > 0)
        {

            foreach (DataRow dr in dt.Rows)
            {
                ListItem item1 = new ListItem();
                item1.Value = dr["Skill_id"].ToString();
                item1.Text = dr["Skill_Name"].ToString();
                ddlSkill2.Items.Add(item1);
            }
        }

    }   
    private void BindJobType()
    {
        drdJobType.Items.Clear();
        ListItem item = new ListItem("Select Job Type", "0");
        drdJobType.Items.Add(item);
        DataTable dt = DataAccess.GetData("Select * from JobType order by jobType");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                ListItem item1 = new ListItem(row["JobType"].ToString(), row["ID"].ToString());
                drdJobType.Items.Add(item1);
            }
        }

    }
    private void BindJobIndustry()
    {
        drdIndustry.Items.Clear();
        ListItem item = new ListItem("Select Job Industry", "0");
        drdIndustry.Items.Add(item);
        DataTable dt = DataAccess.GetData("Select * from [Industry_Mst] order by Industry");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                ListItem item1 = new ListItem(row["Industry"].ToString(), row["ID"].ToString());
                drdIndustry.Items.Add(item1);
            }
        }

    }
    private void BindExperince()
    {
        drdExp.Items.Clear();
        ListItem item = new ListItem("Select Experience", "0");
        drdExp.Items.Add(item);
        DataTable dt = DataAccess.GetData("Select * from EsperienceMST");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                ListItem item1 = new ListItem(row["Experience"].ToString(), row["ID"].ToString());
                drdExp.Items.Add(item1);
            }
        }

    }
    private void BindQalification()
    {
        drdQualification.Items.Clear();
        ListItem item = new ListItem("Select Qualification", "0");
        drdQualification.Items.Add(item);
        DataTable dt = DataAccess.GetData("Select * from Qalification");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                ListItem item1 = new ListItem(row["Qualification"].ToString(), row["ID"].ToString());
                drdQualification.Items.Add(item1);
            }
        }

    }
    private void BindCity()
    {
        

        drdCity.Items.Clear();
        ListItem item = new ListItem("Select City", "0");
        drdCity.Items.Add(item);
        DataTable dt = DataAccess.GetData("Select * from Mst_City_Master where State_Id='" + drdState.SelectedValue + "' ");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                ListItem item1 = new ListItem(row["City_Name"].ToString(), row["City_Id"].ToString());
                drdCity.Items.Add(item1);
            }
        }

    }
    private void BindState()
    {
        drdState.Items.Clear();
        ListItem item = new ListItem("Select State", "0");
        drdState.Items.Add(item);
        DataTable dt = DataAccess.GetData("Select * from StateMaster where Country_Id='101' order by State_Name");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                ListItem item1 = new ListItem(row["State_Name"].ToString(), row["State_Id"].ToString());
                drdState.Items.Add(item1);
            }
        }

    }


    protected void lbtnSubmit_Click(object sender, EventArgs e)
    {


        if (FileUpload1.HasFile)
        {
            if (File.Exists(Server.MapPath("post_job_doc/" + hdfPhoto.Value)))
            {
                File.Delete(Server.MapPath("post_job_doc/" + hdfPhoto.Value));
            }
            FileUpload1.SaveAs(Server.MapPath("~/post_job_doc/" + FileUpload1.FileName));
            hdfPhoto.Value = FileUpload1.FileName;           
        }
      

                    if (hdfPostID.Value == string.Empty)
                    {
                        SqlCommand cmd = new SqlCommand("INSERT INTO [Job_Master]([job_Title],[job_Desc],[job_Qulalification],[jobopen_Date],[job_Fees],[job_weblink],[CreatedOn],[Exp],[Position],[JobType],[JobCategory],[UserID],[MimiSalery],[MaxiMum],[Industry],[StateID],[CityID],[ID],[JobSubCat_Id],[Skill_id],[Time_Duration],[Time_Unit],[Project_File],[FixPrice],[PartyID],[OrderPosition]) VALUES(@job_Title,@job_Desc,@job_Qulalification,@jobopen_Date,@job_Fees,@job_weblink,@CreatedOn,@Exp,@Position,@JobType,@JobCategory,@UserID,@MimiSalery,@MaxiMum,@Industry,@StateID,@CityID,@ID,@JobSubCat_Id,@Skill_id,@Time_Duration,@Time_Unit,@Project_File,@FixPrice,@PartyID,@OrderPosition); select scope_identity(); ");
                        cmd.Parameters.AddWithValue("@job_Title", txtJobTitle.Text);
                        cmd.Parameters.AddWithValue("@job_Desc", txtDes.Text);
            if(drdQualification.SelectedItem.Text== "Select Qualification")
            {
                cmd.Parameters.AddWithValue("@job_Qulalification", "Not Required");
            }
            else
            {
                cmd.Parameters.AddWithValue("@job_Qulalification", drdQualification.SelectedItem.Text);
            }
                        
                        cmd.Parameters.AddWithValue("@jobopen_Date",DateTime.Now);                          
                        cmd.Parameters.AddWithValue("@job_Fees", " ");
                        cmd.Parameters.AddWithValue("@job_weblink", " ");
            if(drdExp.SelectedItem.Text== "Select Experience")
            {
                cmd.Parameters.AddWithValue("@Exp", "Not Required");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Exp", drdExp.SelectedItem.Text);
            }
                        
                        cmd.Parameters.AddWithValue("@Position", txtNoPosition.Text);
                        cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
                        cmd.Parameters.AddWithValue("@JobType", drdJobType.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@JobCategory", "Client");
                        cmd.Parameters.AddWithValue("@UserID", hdfUserID.Value);
                        cmd.Parameters.AddWithValue("@MimiSalery", txtMinimum.Text);
                        cmd.Parameters.AddWithValue("@MaxiMum", txtMaxmum.Text);
                        cmd.Parameters.AddWithValue("@Industry", drdIndustry.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@StateID", drdState.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@CityID", drdCity.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@ID", drdIndustry.SelectedValue);
                        cmd.Parameters.AddWithValue("@JobSubCat_Id", ddljobSubCategory.SelectedValue);
                        cmd.Parameters.AddWithValue("@Skill_id", "");
                        cmd.Parameters.AddWithValue("@Time_Duration", txtTimeDuration.Text);
                        cmd.Parameters.AddWithValue("@Time_Unit", ddlUnit.SelectedValue);
                        cmd.Parameters.AddWithValue("@Project_File", hdfPhoto.Value);
            if(txtFixPrice.Text!=string.Empty)
            {
                cmd.Parameters.AddWithValue("@FixPrice", txtFixPrice.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@FixPrice", "0");
            }
            cmd.Parameters.AddWithValue("@PartyID", hdfPartyId.Value);

            cmd.Parameters.AddWithValue("@OrderPosition","999");
            


                        //   DataAccess.InsertExecuteNonQuery(cmd);

            string postjob_id = DataAccess.InsertExecuteScalar(cmd);
                        hdfpostjob_id.Value = postjob_id.ToString();

                        bindSelectedSkill();

                        alert.Visible = true;
                        lblMSG.Text = "Record saved successfully";
            sendNotfToAdmn();
            sendNotfToJobseeker();


                    }

                    else
                    {
                        SqlCommand cmd = new SqlCommand("UPDATE [Job_Master] SET [job_Title]=@job_Title,[job_Desc]=@job_Desc,[job_Qulalification]=@job_Qulalification,[job_Fees]=@job_Fees,[job_weblink]=@job_weblink,[JobType]=@JobType,[MimiSalery]=@MimiSalery,[MaxiMum]=@MaxiMum,[Industry]=@Industry,[StateID]=@StateID,[CityID]=@CityID,[UserID]=@UserID,[ID]=@ID,[JobSubCat_Id]=@JobSubCat_Id,[Skill_id]=@Skill_id,[Time_Duration]=@Time_Duration,[Time_Unit]=@Time_Unit,[Project_File]=@Project_File,[FixPrice]=@FixPrice  WHERE [job_Id] = " + hdfPostID.Value + " ");
                        cmd.Parameters.AddWithValue("@job_Title", txtJobTitle.Text);
                        cmd.Parameters.AddWithValue("@job_Desc", txtDes.Text);
                        cmd.Parameters.AddWithValue("@job_Qulalification", drdQualification.SelectedItem.Text);                                     
                        cmd.Parameters.AddWithValue("@job_Fees", " ");
                        cmd.Parameters.AddWithValue("@job_weblink", " ");
                        cmd.Parameters.AddWithValue("@Exp", drdExp.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@Position", txtNoPosition.Text);
                        cmd.Parameters.AddWithValue("@JobType", drdJobType.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@UserID", hdfUserID.Value);
                        cmd.Parameters.AddWithValue("@MimiSalery", txtMinimum.Text);
                        cmd.Parameters.AddWithValue("@MaxiMum", txtMaxmum.Text);
                        cmd.Parameters.AddWithValue("@Industry", drdIndustry.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@StateID", drdState.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@CityID", drdCity.SelectedItem.Text);

                        cmd.Parameters.AddWithValue("@ID", drdIndustry.SelectedValue);
                        cmd.Parameters.AddWithValue("@JobSubCat_Id", ddljobSubCategory.SelectedValue);
                        cmd.Parameters.AddWithValue("@Skill_id", "");
                        cmd.Parameters.AddWithValue("@Time_Duration", txtTimeDuration.Text);
                        cmd.Parameters.AddWithValue("@Time_Unit", ddlUnit.SelectedValue);
                        cmd.Parameters.AddWithValue("@Project_File", hdfPhoto.Value);

                        if (txtFixPrice.Text != string.Empty)
                        {
                        cmd.Parameters.AddWithValue("@FixPrice", txtFixPrice.Text);
                        }
                         else
                        {
                        cmd.Parameters.AddWithValue("@FixPrice", "0");
                        }



                          DataAccess.InsertExecuteNonQuery(cmd);
                          bindSelectedSkill();
                          //bindSelectedSkillEdit();
                        alert.Visible = true;
                        lblMSG.Text = "Record update successfully";
                    }

        Clr();
    }


    //public void bindSelectedSkillEdit()
    //{
    //    // Insert Skills
    //    if (hdfpostjob_id.Value != string.Empty)
    //    {
    //        string selectedCountries = hfSelected.Value;
    //        string countries = "";
    //        for (int i = 0; i < selectedCountries.Split(',').Length; i++)
    //        {
    //            countries += selectedCountries.Split(',')[i] + " \\n";

    //            SqlCommand cmdskill = new SqlCommand("Update [Post_JobSkill] SET   [Skill_id]=@Skill_id,[job_Id]=@job_Id Where [Post_JobSkill_Id]="+ selectedCountries + "  ");

    //            cmdskill.Parameters.AddWithValue("@Skill_id", selectedCountries.Split(',')[i]);
    //            cmdskill.Parameters.AddWithValue("@job_Id", hdfpostjob_id.Value);
    //            DataAccess.InsertExecuteNonQuery(cmdskill);

    //        }
    //    }
     
    //    ddlSkill2.SelectedIndex = -1;
    //}


    public void bindSelectedSkill()
    {
        // Insert Skills
        if (hdfpostjob_id.Value != string.Empty)
        {
            string selectedCountries = hfSelected.Value;
            string countries = "";
            for (int i = 0; i < selectedCountries.Split(',').Length; i++)
            {
                countries += selectedCountries.Split(',')[i] + " \\n";

                SqlCommand cmdskill = new SqlCommand("insert into [Post_JobSkill] ([Skill_id],[job_Id]) Values (@Skill_id,@job_Id) ");

                cmdskill.Parameters.AddWithValue("@Skill_id", selectedCountries.Split(',')[i]);
                cmdskill.Parameters.AddWithValue("@job_Id", hdfpostjob_id.Value);
                DataAccess.InsertExecuteNonQuery(cmdskill);

            }
        }

     //   ClientScript.RegisterClientScriptBlock(this.GetType(), "", "alert('Selected Skills: \\n" + countries + "')", true);
        ddlSkill2.SelectedIndex = -1;
      

    }


    private void Clr()
    {
        drdIndustry.ClearSelection();
        hdfPostID.Value = string.Empty;      
        txtDes.Text = string.Empty;
        drdJobType.ClearSelection();
        drdQualification.ClearSelection();      
        txtJobTitle.Text = string.Empty;
        txtNoPosition.Text = string.Empty;     
        txtMaxmum.Text = string.Empty;
        txtMinimum.Text = string.Empty;
     
        drdCity.ClearSelection();    
        drdState.ClearSelection();
        txtFixPrice.Text = string.Empty;
        drdQualification.ClearSelection();     
        ddlUnit.ClearSelection();
        txtTimeDuration.Text = string.Empty;
        drdExp.ClearSelection();   
        ddljobSubCategory.ClearSelection();

    }
    protected void drdState_SelectedIndexChanged(object sender, EventArgs e)
    {
        drdCity.Focus();
        BindCity();
      
    }

    

    protected void drdIndustry_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindJobSubCategory();
       // bindSkill(); 
    }



    protected void bindJobSubCategory()
    {

        ddljobSubCategory.Items.Clear();
        ListItem item = new ListItem("Select Job ", "0");
        ddljobSubCategory.Items.Add(item);

        DataTable dt = DataAccess.GetData("Select * from [JobSubCategory] Where [ID]=" + drdIndustry.SelectedValue + " ");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                ListItem item1 = new ListItem(row["JobSubCateName"].ToString(), row["JobSubCat_Id"].ToString());
                ddljobSubCategory.Items.Add(item1);
            }
        }


    }

   
    protected void ddljobSubCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindskill2();
    }

    protected void ddlUnit_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if(ddlUnit.SelectedValue== "Fix Price")
        //{
        //    timeDuraionDiv.Visible = false;
        //    FixPriceDiv.Visible = true;
        //    minBudgtDiv.Visible = false;
        //    maxBudetDiv.Visible = false;
        //}
        //else
        //{
        //    timeDuraionDiv.Visible = true;
        //    FixPriceDiv.Visible = false;
        //    minBudgtDiv.Visible = true;
        //    maxBudetDiv.Visible = true;
        //}
    }
    private void sendNotfToJobseeker()
    {
        DataTable dtJobDet = DataAccess.GetData("Select * from [PartyMaster] Where [Comp_Category]='" + drdIndustry.SelectedItem.Text + "' ");
        if (dtJobDet.Rows.Count > 0)
        {
            foreach(DataRow dr in dtJobDet.Rows)
            {
                if (dr["Email"].ToString() != string.Empty)
                {
                    DataTable dtUserDet = DataAccess.GetData("select * from [PartyMaster] where [PartyID]=" + hdfPartyId.Value + "");
                    if (dtUserDet.Rows.Count > 0)
                    {
                        string _EmailBody = "Hi " + dr["Contact_person_name"].ToString() + " ";
                        _EmailBody += "<br/><br/> "+dtUserDet.Rows[0]["Contact_person_name"].ToString()+" is looking to hire a freelancer and is accepting proposals for their project.";
                        _EmailBody += "<br/><br/> You have been invited to send proposal for the project "+txtJobTitle.Text+".";
                        _EmailBody += "<br/><br/> <a href='https://itsgwalior.com/Admin/Login.aspx'>Send Proposal</a> ";
                        _EmailBody += "<br/><br/><br/><br/>Thank You";
                        _EmailBody += "<br/><br/>ITS Gwalior Support Team";


                        string from = ConfigurationManager.AppSettings["MailUsername"].ToString();
                        string To = dr["Email"].ToString();//Convert.ToString(txtEmailId.Text);
                        string subject = ""+ dr["Contact_person_name"].ToString() + ", You have received a job request ";
                        //  SendMail.SendEmail(from, To, subject, _EmailBody, "");
                        SendMail.SendWebEmail(from, To, subject, _EmailBody);
                        //lblMsg.Text = "Successfully Sent";

                    }



                    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                }
            }
            
        }

    }

    private void sendNotfToAdmn()
    {
        
                    DataTable dtUserDet = DataAccess.GetData("select * from [PartyMaster] where [PartyID]=" + hdfPartyId.Value + "");
                    if (dtUserDet.Rows.Count > 0)
                    {
                        string _EmailBody = "Hi Admin";
                        _EmailBody += "<br/><br/> " + dtUserDet.Rows[0]["Contact_person_name"].ToString() + " is posted a new project "+txtJobTitle.Text+"";
                       // _EmailBody += "<br/><br/> You have been invited to send proposal for the project " + txtJobTitle.Text + ".";
                        _EmailBody += "<br/><br/> <a href='https://itsgwalior.com/Admin/Login.aspx'>View Details</a> ";
                        _EmailBody += "<br/><br/><br/><br/>Thank You";
                        _EmailBody += "<br/><br/>ITS Gwalior Support Team";


                        string from = ConfigurationManager.AppSettings["MailUsername"].ToString();
                        string To = ConfigurationManager.AppSettings["AdminMailID"].ToString();
                        string subject = "A new project is posted by "+ dtUserDet.Rows[0]["Contact_person_name"].ToString();
                        //  SendMail.SendEmail(from, To, subject, _EmailBody, "");
                        SendMail.SendWebEmail(from, To, subject, _EmailBody);
                      

                    }



                  
               

    }
}