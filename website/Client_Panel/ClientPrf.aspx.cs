using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Client_Panel_ClientPrf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillCountry();
            bindState();

            ddlState.Items.FindByValue("1640").Selected = true;
            FillBusinessCate();
            bindJobSubCategory();
            BindJobType();
            BindQalification();
            BindExperince();
            //bindskill2();


            if (Session["partyid"] != null)
            {
                hdfClientId.Value = Session["partyid"].ToString();
                BindgvDocument();
                BindGridViewProjectList();

            }

            if (Session["ttppd"] != null)
            {
                hdfusertypeid.Value = Session["ttppd"].ToString();

                if (hdfusertypeid.Value == "4" || hdfusertypeid.Value == "2")
                {
                    divjobtype.Visible = false;
                    divcompDetail.Visible = true;
                    divMaxBudget.Visible = true;
                    lblMinBudget.Text = "Min Budget";
                    divWorkExperience.Visible = false;
                    BindDet();


                }

                if (hdfusertypeid.Value == "3")
                {
                    divWorkExperience.Visible = true;
                    divcompDetail.Visible = false;
                    divMaxBudget.Visible = false;
                    divjobtype.Visible = true;
                    lblMinBudget.Text = "Budget";
                    BindDet();

                    BindRefereceDetail();


                }
                
            }



        }
    }


    public void BindgvDocument()
    {
        DataTable dt = DataAccess.GetData("Select * from [PartyDocument_Master] Where [PartyID]=" + hdfClientId.Value + " ");
        if (dt.Rows.Count > 0)
        {
            gvFileDetails.DataSource = dt;
            gvFileDetails.DataBind();
        }
    }
    private void FillCountry()
    {
        DataTable dt = DataAccess.GetData("select * from Mst_Country_Master ");
        if (dt != null && dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["Country_Id"].ToString();
                item.Text = dr["Country_Name"].ToString();
                ddlCountry.Items.Add(item);
            }
            ddlCountry.SelectedValue = "101";
        }
    }
    protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindState();
        ClientScript.RegisterStartupScript(this.GetType(), "displayalertmessage", "bindkeyword('" + hdfClientId.Value + "');bindSkill('" + hdfClientId.Value + "');displaydiv2();", true);
    }

    public void bindState()
    {
        ListItem item = new ListItem();
        item.Value = "";
        item.Text = "Select State";
        ddlState.Items.Add(item);
        DataTable dt = DataAccess.GetData("SELECT  * FROM [StateMaster] Where [Country_Id]=" + ddlCountry.SelectedValue + " ");
        foreach (DataRow row in dt.Rows)
        {
            ListItem item1 = new ListItem();
            item1.Value = row["State_Id"].ToString();
            item1.Text = row["State_Name"].ToString();
            ddlState.Items.Add(item1);
        }

    }
    public void FillBusinessCate()
    {
        ListItem item = new ListItem();
        item.Value = "0";
        item.Text = "Select Category";
        ddlBusinessCat.Items.Add(item);
        DataTable dt = DataAccess.GetData("SELECT  * FROM [Industry_Mst] ");
        foreach (DataRow row in dt.Rows)
        {
            ListItem item1 = new ListItem();
            item1.Value = row["ID"].ToString();
            item1.Text = row["Industry"].ToString();
            ddlBusinessCat.Items.Add(item1);
        }
    }
    protected void bindJobSubCategory()
    {
        ddljobSubCategory.Items.Clear();
        ListItem item = new ListItem("Select Job ", "0");
        ddljobSubCategory.Items.Add(item);
        DataTable dt = DataAccess.GetData("Select * from [JobSubCategory] Where [ID]=" + ddlBusinessCat.SelectedValue + " ");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                ListItem item1 = new ListItem(row["JobSubCateName"].ToString(), row["JobSubCat_Id"].ToString());
                ddljobSubCategory.Items.Add(item1);
            }
        }
    }
    private void BindDet()
    {
        DataTable dt = DataAccess.GetData("select * from [PartyMaster] where [PartyID]=" + hdfClientId.Value + "");
        if (dt.Rows.Count > 0)
        {
            ltrDisplayProfile.Text = string.Empty;
            txtName.Text = dt.Rows[0]["Party_name"].ToString();
            txtMobNo.Text = dt.Rows[0]["mobile_no"].ToString();
            txtGstNo.Text = dt.Rows[0]["Gst_no"].ToString();
            txtEmailId.Text = dt.Rows[0]["Email"].ToString();
            txtAltMobNo.Text = dt.Rows[0]["phone_no"].ToString();
            txtAddr.Text = dt.Rows[0]["address"].ToString();
            txtPernName.Text = dt.Rows[0]["Contact_person_name"].ToString();
            txtPinCode.Text = dt.Rows[0]["pincode"].ToString();

            txtCityName.Text = dt.Rows[0]["City"].ToString();
            txtShortDest.Text = dt.Rows[0]["ShortDescription"].ToString();
            txtLongDest.Text = dt.Rows[0]["LongDescription"].ToString();
            txtDesignation.Text = dt.Rows[0]["Designation"].ToString();
            txtwebsite.Text = dt.Rows[0]["Website"].ToString();
            lblshortDesc.Text = dt.Rows[0]["ShortDescription"].ToString();
            lblLongDesc.Text = dt.Rows[0]["LongDescription"].ToString();

            if (dt.Rows[0]["CompEstablishedDate"].ToString() != string.Empty)
            {
                //  txtEstablishedDte.Text = Convert.ToDateTime(dt.Rows[0]["CompEstablishedDate"].ToString()).ToString("dd/MM/yyyy");
            }
            if (dt.Rows[0]["job_Title"].ToString() != string.Empty)
            {

                lblJobTitle.Text = dt.Rows[0]["job_Title"].ToString();
            }
            else
            {
                lblJobTitle.Text = dt.Rows[0]["Comp_tagline"].ToString();
            }

            if (dt.Rows[0]["Time_Unit"].ToString() != string.Empty)
            {
                ddlUnit.SelectedValue = dt.Rows[0]["Time_Unit"].ToString();
            }
            else
            {
                //ddlUnit.SelectedItem.Text = dt.Rows[0]["Time_Unit"].ToString();
            }




            if (dt.Rows[0]["JobType"].ToString() != string.Empty)
            {
                drdJobType.SelectedItem.Text = dt.Rows[0]["JobType"].ToString();
            }


            DataTable dt2 = DataAccess.GetData("Select * from  [PartyDocument_Master] where [PartyID]=" + hdfClientId.Value + " and [Document_Name]='Banner Photo'    ");
            if (dt2.Rows.Count > 0)
            {

                ltrDisplayProfile.Text += "<div class='up-head-w' style='background-image:url(../ClientContractDoc/" + dt2.Rows[0]["Upload_File"].ToString() + ")'> ";
            }

            else
            {
                ltrDisplayProfile.Text += "<div class='up-head-w' style='background-image:url(../ClientContractDoc/CompBanner.jpg)'> ";

            }

            ltrDisplayProfile.Text += "<div class='up-social'>";
            ltrDisplayProfile.Text += "<a href='#'><i class='os-icon os-icon-twitter'></i></a><a href='#'><i class='os-icon os-icon-facebook'>";
            ltrDisplayProfile.Text += "</i></a></div>";
            ltrDisplayProfile.Text += "<div class='up-main-info'>";
            ltrDisplayProfile.Text += "<h2 class='up-header'> " + dt.Rows[0]["Contact_person_name"].ToString() + " </h2>";
            ltrDisplayProfile.Text += "<h5 class='up-sub-header'> " + dt.Rows[0]["Comp_tagline"].ToString() + "</h5>";
            ltrDisplayProfile.Text += "<h5 class='up-sub-header'> " + dt.Rows[0]["Comp_Category"].ToString() + "</h6></div>";
            ltrDisplayProfile.Text += "<svg class='decor' width='842px' height='219px' viewbox='0 0 842 219' preserveaspectratio='xMaxYMax meet' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'><g transform = 'translate(-381.000000, -362.000000)' fill='#FFFFFF'><path class='decor-path' d='M1223,362 L1223,581 L381,581 C868.912802,575.666667 1149.57947,502.666667 1223,362 Z'></path></g></svg></div>";
            FillCountry();

            if (dt.Rows[0]["country"].ToString() != string.Empty)
            {

                ddlCountry.SelectedValue = dt.Rows[0]["country"].ToString();
            }

            bindState();
            ddlState.SelectedValue = dt.Rows[0]["state"].ToString();
            txttagline.Text = dt.Rows[0]["Comp_tagline"].ToString();
            FillBusinessCate();
            ddlBusinessCat.ClearSelection();

            if (dt.Rows[0]["Comp_Category"].ToString() != string.Empty)
            {

                ddlBusinessCat.Items.FindByText(dt.Rows[0]["Comp_Category"].ToString()).Selected = true;
            }

            txtJobTitle.Text = dt.Rows[0]["job_Title"].ToString();
            if (dt.Rows[0]["job_Qulalification"].ToString() != string.Empty)
            {
                drdQualification.SelectedItem.Text = dt.Rows[0]["job_Qulalification"].ToString();
            }
            else
            {
                // drdQualification.SelectedItem.Text = dt.Rows[0]["job_Qulalification"].ToString();
            }


            bindJobSubCategory();
            if (dt.Rows[0]["JobSubCat_Id"].ToString() != string.Empty && dt.Rows[0]["JobSubCat_Id"].ToString() != "0")
            {
                ddljobSubCategory.SelectedValue = dt.Rows[0]["JobSubCat_Id"].ToString();
            }

            //txtTimeDuration.Text = dt.Rows[0]["Time_Duration"].ToString();
            //ddlUnit.SelectedItem.Text = dt.Rows[0]["Time_Unit"].ToString(); 
            if (dt.Rows[0]["Exp"].ToString() != string.Empty)
            {
                drdExp.Items.FindByText(dt.Rows[0]["Exp"].ToString()).Selected = true;
            }

            txtMiniSalary.Text = dt.Rows[0]["Min_Salary"].ToString();
            txtMaxSalary.Text = dt.Rows[0]["Max_Salary"].ToString();
            txtBankName.Text = dt.Rows[0]["Bank_Name"].ToString();
            txtAccHolderName.Text = dt.Rows[0]["AccountHname"].ToString();
            txtBranchName.Text = dt.Rows[0]["BranceName"].ToString();
            txtAccNumber.Text = dt.Rows[0]["AccountNo"].ToString();
            txtIFSCcode.Text = dt.Rows[0]["IFSCCoad"].ToString();
            bindskill2();
            BindJobSkill();


            bindKeyword();
            //ClientScript.RegisterStartupScript(this.GetType(), "displayalertmessage", "bindkeyword('" + hdfClientId.Value + "');", true);
            // bindSelectedKeyword1();
        }
    }

    public void BindJobSkill()
    {
        //ltrJobList.Text = "";
        //DataTable dtskill = DataAccess.GetData("Select distinct [Skill_Name] from [View_Post_Job_Skill] Where [PartyID]=" + hdfClientId.Value + " ");
        //if (dtskill.Rows.Count > 0)
        //{
        //    string selectedCountries = hfSelected.Value;
        //    string comCont = string.Empty;
        //    for (int i = 0; i < dtskill.Rows.Count; i = i + 1)
        //    {
        //        //hfSelected.Value = comCont + dtskill.Rows[i]["Skill_Name"].ToString();
        //        //comCont = ",";
        //        ltrJobList.Text += "<li class='nav-item'><a class='nav-link active' data-toggle='tab' href='#' aria-expanded='true'>" + dtskill.Rows[i]["Skill_Name"].ToString() + " </a></li>";

        //    }
        //}
        ////ddlSkill2.SelectedValue = hfSelected.Value;
    }
   


    //public void bindSelectedKeyword1()
    //{
    //    ltrSeletedkeywrd.Text = "";
    //    DataTable dtkywrd = DataAccess.GetData("Select distinct [Keyword] from [View_Job_Keyword_Master] Where [PartyID]=" + hdfClientId.Value + " ");
    //    if (dtkywrd.Rows.Count > 0)
    //    {
    //        string selectedCountries = hfSelected.Value;
    //        string comCont = string.Empty;
    //        for (int i = 0; i < dtkywrd.Rows.Count; i = i + 1)
    //        {

    //            ltrSeletedkeywrd.Text += "<li class='nav-item'><a class='nav-link active' data-toggle='tab' href='#' aria-expanded='true'>" + dtkywrd.Rows[i]["Keyword"].ToString() + " </a></li>";

    //        }
    //    }
      
    //}


    //Update Personal Profile
    protected void btnUpdate1_Click(object sender, EventArgs e)
    {
        UpdateProfileNext();
        // ClientScript.RegisterStartupScript(this.GetType(), "displayalertmessage", "displaydiv1();", true);
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "bindkeyword('" + hdfClientId.Value + "');bindSkill('" + hdfClientId.Value + "');displaydiv1();", true);

    }

    protected void btnbtnNext1_Click(object sender, EventArgs e)
    {
        UpdateJobProfileNext();
        ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "bindkeyword('" + hdfClientId.Value + "');bindSkill('" + hdfClientId.Value + "');displaydiv2();", true);
       
    }





    public void  UpdateProfileNext()
    {

        SqlCommand cmd = new SqlCommand("update [PartyMaster] set [Reference_Id]=@Reference_Id, [Contact_person_name]=@Contact_person_name,[Email]=@Email,[mobile_no]=@mobile_no,[phone_no]=@phone_no  where [PartyID]=" + hdfClientId.Value + "");

        if (hdfRefId.Value != string.Empty)
        {
            cmd.Parameters.AddWithValue("@Reference_Id", hdfRefId.Value);
        }
        else
        {
            cmd.Parameters.AddWithValue("@Reference_Id", DBNull.Value);
        }
        cmd.Parameters.AddWithValue("@Contact_person_name", txtPernName.Text);
      //  cmd.Parameters.AddWithValue("@Contact_person_name", txtPernName.Text);
        cmd.Parameters.AddWithValue("@Email", txtEmailId.Text);
        cmd.Parameters.AddWithValue("@mobile_no", txtMobNo.Text);
        cmd.Parameters.AddWithValue("@phone_no", txtAltMobNo.Text);
        DataAccess.InsertExecuteNonQuery(cmd);
        
        //   alertDiv.Visible = true;
        // lblMsg.Text = "Personal Profile Updated Successfully";
        BindDet();
      

    }


    public void UpdateJobProfileNext()
    {
        SqlCommand cmd = new SqlCommand("update [PartyMaster] set [Comp_Category]=@Comp_Category,[JobSubCat_Id]=@JobSubCat_Id,[Party_name]=@Party_name,[Gst_no]=@Gst_no,[Designation]=@Designation,[Website]=@Website,[Exp]=@Exp, [ShortDescription]=@ShortDescription ,[LongDescription]=@LongDescription,[Comp_tagline]=@Comp_tagline ,[job_Title]=@job_Title,[job_Qulalification]=@job_Qulalification, [Time_Duration]=@Time_Duration,[Time_Unit]=@Time_Unit,[Min_Salary]=@Min_Salary,[Max_Salary]=@Max_Salary,[CompEstablishedDate]=@CompEstablishedDate,JobType=@JobType where [PartyID]=" + hdfClientId.Value + " ");

        cmd.Parameters.AddWithValue("@Comp_Category", ddlBusinessCat.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@JobSubCat_Id", ddljobSubCategory.SelectedValue);     
        if (txtName.Text != string.Empty)
        {
            cmd.Parameters.AddWithValue("@Party_name", txtName.Text);
        }
        else
        {
            cmd.Parameters.AddWithValue("@Party_name", "");

        }
        if (txtGstNo.Text != string.Empty)
        {
            cmd.Parameters.AddWithValue("@Gst_no", txtGstNo.Text);
        }
        else
        {

            cmd.Parameters.AddWithValue("@Gst_no", txtGstNo.Text);
        }

        if (txtDesignation.Text != string.Empty)
        {
            cmd.Parameters.AddWithValue("@Designation", txtDesignation.Text);
        }
        else
        {
            cmd.Parameters.AddWithValue("@Designation", "");

        }

        if (txtwebsite.Text != string.Empty)
        {
            cmd.Parameters.AddWithValue("@Website", txtwebsite.Text);
        }
        else
        {
            cmd.Parameters.AddWithValue("@Website", "");

        }
        if (drdExp.SelectedItem.Text != "Select Experience")
        {
            cmd.Parameters.AddWithValue("@Exp", drdExp.SelectedItem.Text);
        }
        else
        {
            cmd.Parameters.AddWithValue("@Exp", DBNull.Value);
        }

        cmd.Parameters.AddWithValue("@ShortDescription", txtShortDest.Text);
        cmd.Parameters.AddWithValue("@LongDescription", txtLongDest.Text);
        cmd.Parameters.AddWithValue("@Comp_tagline", txttagline.Text);
        if (txtJobTitle.Text != string.Empty)
        {

            cmd.Parameters.AddWithValue("@job_Title", txtJobTitle.Text);
        }
        else
        {
            cmd.Parameters.AddWithValue("@job_Title", "");
        }

        if (drdQualification.SelectedItem.Text != "Select Qualification")
        {
            cmd.Parameters.AddWithValue("@job_Qulalification", drdQualification.SelectedItem.Text);
        }
        else
        {
            cmd.Parameters.AddWithValue("@job_Qulalification", DBNull.Value);
        }


        cmd.Parameters.AddWithValue("@Time_Duration", string.Empty);


        if (ddlUnit.SelectedValue != "0")
        {

            cmd.Parameters.AddWithValue("@Time_Unit", ddlUnit.SelectedValue);
        }

        else
        {

            cmd.Parameters.AddWithValue("@Time_Unit", DBNull.Value);

        }


        if (txtMiniSalary.Text != string.Empty)
        {
            cmd.Parameters.AddWithValue("@Min_Salary", txtMiniSalary.Text);
        }
        else
        {
            cmd.Parameters.AddWithValue("@Min_Salary", "0");
        }

        if (txtMaxSalary.Text != string.Empty)
        {
            cmd.Parameters.AddWithValue("@Max_Salary", txtMaxSalary.Text);
        }
        else
        {
            cmd.Parameters.AddWithValue("@Max_Salary", "0");
        }
        if (txtEstablishedDte.Text != string.Empty)
        {
            // cmd.Parameters.AddWithValue("@CompEstablishedDate", txtEstablishedDte.Text.ToDateFormat());
        }
        else
        {
            cmd.Parameters.AddWithValue("@CompEstablishedDate", DBNull.Value);
        }

        if (drdJobType.SelectedItem.Text != "Select Job Type")
        {
            cmd.Parameters.AddWithValue("@JobType", drdJobType.SelectedItem.Text);
        }
        else
        {
            cmd.Parameters.AddWithValue("@JobType", DBNull.Value);
        }


        DataAccess.InsertExecuteNonQuery(cmd);

        bindSelectedSkill();
        bindSelectedKeyword();

        //  alertDiv.Visible = true;
        //  lblMsg.Text = "Job Profile Updated Successfully";
        BindDet();
        //  ClientScript.RegisterStartupScript(this.GetType(), "displayalertmessage", "displaydiv2();", true);
        // Response.Redirect("displaydiv()");
        //Response.Redirect(Request.RawUrl);

    }

    //Update Job Profile
    protected void btnUpdate2_Click(object sender, EventArgs e)
    {
        UpdateJobProfileNext();
        ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "bindkeyword('" + hdfClientId.Value + "');bindSkill('" + hdfClientId.Value + "');displaydiv2();", true);
        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "bindkeyword('" + hdfClientId.Value + "');bindSkill('" + hdfClientId.Value + "');displaydiv2();", true);
        //ClientScript.RegisterStartupScript(this.GetType(), "displayalertmessage", "displaydiv2();", true);



    }


   

    //Update Contact Profile

    protected void btnContact_Click(object sender, EventArgs e)
    {

        UpdateContactNext();

        ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "bindkeyword('" + hdfClientId.Value + "');bindSkill('" + hdfClientId.Value + "');displaydiv3();", true);
    }


    public void UpdateContactNext()
    {

        SqlCommand cmd = new SqlCommand("update [PartyMaster] set [country]=@country,[state]=@state,[City]=@City,[address]=@address,[pincode]=@pincode where [PartyID]=" + hdfClientId.Value + " ");
        cmd.Parameters.AddWithValue("@country", ddlCountry.SelectedValue);
        cmd.Parameters.AddWithValue("@state", ddlState.SelectedValue);
        cmd.Parameters.AddWithValue("@City", txtCityName.Text);
        cmd.Parameters.AddWithValue("@address", txtAddr.Text);
        cmd.Parameters.AddWithValue("@pincode", txtPinCode.Text);
        DataAccess.InsertExecuteNonQuery(cmd);
      //  alertDiv.Visible = true;
      //  lblMsg.Text = "Contact Detail Updated Successfully";
        BindDet();
       // ClientScript.RegisterStartupScript(this.GetType(), "alert", "displaydiv2();", true);

    }



    protected void btnbankDetail_Click(object sender, EventArgs e)
    {
        UpdateBankNext();
        ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "bindkeyword('" + hdfClientId.Value + "');bindSkill('" + hdfClientId.Value + "');displaydiv5();", true);

        //Response.Redirect(Request.RawUrl);
    }

    public void UpdateBankNext()
    {

        SqlCommand cmd = new SqlCommand("update [PartyMaster] set  [Bank_Name]=@Bank_Name,[AccountHname]=@AccountHname,[BranceName]=@BranceName,[AccountNo]=@AccountNo,[IFSCCoad]=@IFSCCoad where [PartyID]=" + hdfClientId.Value + " ");
        cmd.Parameters.AddWithValue("@Bank_Name", txtBankName.Text);
        cmd.Parameters.AddWithValue("@AccountHname", txtAccHolderName.Text);
        cmd.Parameters.AddWithValue("@BranceName", txtBranchName.Text);
        cmd.Parameters.AddWithValue("@AccountNo", txtAccNumber.Text);
        cmd.Parameters.AddWithValue("@IFSCCoad", txtIFSCcode.Text);
        DataAccess.InsertExecuteNonQuery(cmd);
        alertDiv.Visible = true;
        lblMsg.Text = "Bank Detail Updated Successfully";
        BindDet();
      //  ClientScript.RegisterStartupScript(this.GetType(), "displayalertmessage", "displaydiv4();", true);
    }

    public void bindskill2()
    {
        ddlSkill2.Items.Clear();    
        DataTable dt = DataAccess.GetData("Select Distinct * from [Skill_Master] where [JobSubCat_Id]="+ ddljobSubCategory.SelectedValue + " ");
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


    public void bindSelectedSkill()
    {
        // Insert Skills
        if (hdfClientId.Value != string.Empty)
        {
            string selectedCountries = hfSelected.Value;
            string countries = "";
            for (int i = 0; i < selectedCountries.Split(',').Length; i++)
            {
                countries += selectedCountries.Split(',')[i] + " \\n";

                DataTable dt = DataAccess.GetData("select * from [Post_JobSkill] where Skill_id=" + selectedCountries.Split(',')[i] + " and PartyID=" + hdfClientId.Value + " ");
                if (dt.Rows.Count > 0)
                {

                }
                else
                {
                    SqlCommand cmdskill = new SqlCommand("insert into [Post_JobSkill] ([Skill_id],[PartyID]) Values (@Skill_id,@PartyID) ");
                    cmdskill.Parameters.AddWithValue("@Skill_id", selectedCountries.Split(',')[i]);
                    cmdskill.Parameters.AddWithValue("@PartyID", hdfClientId.Value);
                    DataAccess.InsertExecuteNonQuery(cmdskill);
                }
                
            }
        }
    
        ddlSkill2.SelectedIndex = -1;     

    }
    protected void ddlBusinessCat_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindJobSubCategory();
        bindKeyword();
        ClientScript.RegisterStartupScript(this.GetType(), "displayalertmessage", "bindkeyword('" + hdfClientId.Value + "');bindSkill('" + hdfClientId.Value + "');displaydiv1();", true);
    } 

    protected void btnAddDocument_Click(object sender, EventArgs e)
    { 
        if (fuDocument.HasFile) 
        {
            if (File.Exists(Server.MapPath("ClientContractDoc/" + hdfPhoto.Value)))
            {
                File.Delete(Server.MapPath("ClientContractDoc/" + hdfPhoto.Value));
            }
            fuDocument.SaveAs(Server.MapPath("~/ClientContractDoc/" + fuDocument.FileName));
            hdfPhoto.Value = fuDocument.FileName;
        }

                      if (hdfdoc_id.Value == string.Empty)
                    {
                        SqlCommand cmd = new SqlCommand("INSERT INTO [PartyDocument_Master]([Document_Name],[Upload_File],[PartyID],[CreatedOn]) VALUES(@Document_Name,@Upload_File ,@PartyID,@CreatedOn)");
                        cmd.Parameters.AddWithValue("@Document_Name", ddlDocument.SelectedValue);
                        cmd.Parameters.AddWithValue("@Upload_File", hdfPhoto.Value);
                        cmd.Parameters.AddWithValue("@PartyID", hdfClientId.Value);
                        cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
                        DataAccess.InsertExecuteNonQuery(cmd);
                        alertDiv.Visible = true;
                        lblMsg.Text = "File saved successfully";
                    }

                    else
                    {
                        SqlCommand cmd = new SqlCommand("UPDATE [PartyDocument_Master] SET [Document_Name]=@Document_Name,[Upload_File]=@Upload_File,[PartyID]=@PartyID  WHERE [Document_Id] = " + hdfdoc_id.Value + " ");
                        cmd.Parameters.AddWithValue("@Document_Name", ddlDocument.SelectedValue);
                        cmd.Parameters.AddWithValue("@Upload_File", hdfPhoto.Value);
                        cmd.Parameters.AddWithValue("@PartyID", hdfClientId.Value);
                        DataAccess.InsertExecuteNonQuery(cmd);
                    
                        alertDiv.Visible = true;
                        lblMsg.Text = "record update successfully";
                    }

                    BindgvDocument();
        ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "bindkeyword('" + hdfClientId.Value + "');bindSkill('" + hdfClientId.Value + "');displaydiv3();", true);
        //ClientScript.RegisterStartupScript(this.GetType(), "displayalertmessage", "bindkeyword('" + hdfClientId.Value + "');bindSkill('" + hdfClientId.Value + "');displaydiv3();", true);
                    Clr();
          
    }

    public void Clr()
    {
        ddlDocument.ClearSelection();

    }
    protected void btnDownload_Click(object sender, ImageClickEventArgs e)
    {
        string _Id = ((ImageButton)sender).CommandArgument;
        SqlCommand cmd = new SqlCommand("SELECT * FROM [PartyDocument_Master] WHERE [Document_Id]=" + _Id + "  ");
        cmd.Parameters.AddWithValue("@Document_Id", _Id);
        DataTable dt = DataAccess.GetData(cmd);
        if (dt != null)
        {
            download(dt);
        }
    }

    private void download(DataTable dt)
    {
        //  Byte[] bytes = (Byte[])dt.Rows[0]["File_Data"];
        Response.Buffer = true;
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //   Response.ContentType = dt.Rows[0]["File_Content_Type"].ToString();
        Response.AddHeader("content-disposition", "attachment;filename=" + dt.Rows[0]["Upload_File"].ToString());
        // Response.BinaryWrite(bytes);
        Response.Flush();
        Response.End();
    }

    protected void imgbtnEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtn = sender as ImageButton;
        GridViewRow grdRow = (GridViewRow)imgbtn.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdRow.FindControl("hdf_ID")).Value);
        hdfdoc_id.Value = ID.ToString();

        DataTable dt = DataAccess.GetData("Select * from [PartyDocument_Master] Where [Document_Id]=" + hdfdoc_id.Value + " ");
        if (dt.Rows.Count > 0)
        {
            ddlDocument.SelectedValue = dt.Rows[0]["Document_Name"].ToString();
            hdfPhoto.Value = dt.Rows[0]["Upload_File"].ToString();        
            btnAddDocument.Text = "Update";
        }
        ClientScript.RegisterStartupScript(this.GetType(), "displayalertmessage", "bindkeyword('" + hdfClientId.Value + "');bindSkill('" + hdfClientId.Value + "');displaydiv3();", true);

    }

    protected void Delete(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtn = sender as ImageButton;
        GridViewRow grdRow = (GridViewRow)imgbtn.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdRow.FindControl("hdf_ID")).Value);
        hdfdoc_id.Value = ID.ToString();

        SqlCommand cmd = new SqlCommand("Delete from [PartyDocument_Master] where [Document_Id] = " + hdfdoc_id.Value + "");
        DataAccess.InsertExecuteNonQuery(cmd);
        BindgvDocument();    
        alertDiv.Visible = true;
        lblMsg.Text = "Record Delete Sucessfully";
        ClientScript.RegisterStartupScript(this.GetType(), "displayalertmessage", "bindkeyword('" + hdfClientId.Value + "');bindSkill('" + hdfClientId.Value + "');displaydiv3();", true);
    }





    protected void gvFileDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {      

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hdfdocid = (HiddenField)e.Row.FindControl("hdfDocId");
          
            Literal ltrCv = (Literal)e.Row.FindControl("ltrDoc");

            DataTable dt = DataAccess.GetData("Select * from [PartyDocument_Master] Where [Document_Id]=" + hdfdocid.Value + " ");
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["Upload_File"].ToString() != string.Empty)
                {
                    ltrCv.Text = "<a href='../../ClientContractDoc/" + dt.Rows[0]["Upload_File"].ToString() + "' target='_blank'><img src='../img/Download.gif' alt='' /></a>";
                }
            }
        }
    }

    protected void ddljobSubCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindskill2();
        ClientScript.RegisterStartupScript(this.GetType(), "displayalertmessage", "bindkeyword('" + hdfClientId.Value + "');bindSkill('" + hdfClientId.Value + "');displaydiv1();", true);
    }

    protected void btnViewProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("Client_profile_big.aspx");        
    }

    protected void btnAddWork_Click(object sender, EventArgs e)
    {

        if (fuProjectFile.HasFile)
        {
            if (File.Exists(Server.MapPath("ClientContractDoc/" + hdfProjectFile.Value)))
            {
                File.Delete(Server.MapPath("ClientContractDoc/" + hdfProjectFile.Value));
            }
            fuProjectFile.SaveAs(Server.MapPath("~/ClientContractDoc/" + fuProjectFile.FileName));
            hdfProjectFile.Value = fuProjectFile.FileName;
        }

        if (hdfProject_id.Value == string.Empty)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [Party_Project_Master]([Project_Name],[Project_Desc],[Project_Image],[CreatedOn],[PartyID]) VALUES(@Project_Name,@Project_Desc,@Project_Image,@CreatedOn,@PartyID)");
            cmd.Parameters.AddWithValue("@Project_Name", txtProjectName.Text);
            cmd.Parameters.AddWithValue("@Project_Desc", txtProjectDesc.Text);
            cmd.Parameters.AddWithValue("@Project_Image", hdfProjectFile.Value);          
            cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
            cmd.Parameters.AddWithValue("@PartyID", hdfClientId.Value);
            DataAccess.InsertExecuteNonQuery(cmd);
            alertDiv.Visible = true;
            lblMsg.Text = "Project File  saved successfully";
        }

        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [Party_Project_Master] SET [Project_Name]=@Project_Name,[Project_Desc]=@Project_Desc,[Project_Image]=@Project_Image,[PartyID]=@PartyID  WHERE [Project_Id] = " + hdfProject_id.Value + " ");
            cmd.Parameters.AddWithValue("@Project_Name", txtProjectName.Text);
            cmd.Parameters.AddWithValue("@Project_Desc", txtProjectDesc.Text);
            cmd.Parameters.AddWithValue("@Project_Image", hdfProjectFile.Value);         
            cmd.Parameters.AddWithValue("@PartyID", hdfClientId.Value);
            DataAccess.InsertExecuteNonQuery(cmd);

            alertDiv.Visible = true;
            lblMsg.Text = "Project File update successfully";
        }

        BindGridViewProjectList();
        ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "bindkeyword('" + hdfClientId.Value + "');bindSkill('" + hdfClientId.Value + "');displaydiv1();", true);
        ClrProjectField();

    }

    public void ClrProjectField()
    {
        txtProjectName.Text = string.Empty;
        txtProjectDesc.Text = string.Empty;
        hdfProjectFile.Value = string.Empty;


    }

    protected void imgProjectbtnEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtn = sender as ImageButton;
        GridViewRow grdRow = (GridViewRow)imgbtn.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdRow.FindControl("hdfProjId")).Value);
        hdfProject_id.Value = ID.ToString();

        DataTable dt = DataAccess.GetData("Select * from [Party_Project_Master] Where [Project_Id]=" + hdfProject_id.Value + " ");
        if (dt.Rows.Count > 0)
        {
            txtProjectName.Text= dt.Rows[0]["Project_Name"].ToString();
            txtProjectDesc.Text= dt.Rows[0]["Project_Desc"].ToString();
            hdfProjectFile.Value = dt.Rows[0]["Project_Image"].ToString();         
            btnAddWork.Text = "Update";
        }
        ClientScript.RegisterStartupScript(this.GetType(), "displayalertmessage", "bindkeyword('" + hdfClientId.Value + "');bindSkill('" + hdfClientId.Value + "');displaydiv5();", true);
    }

    protected void imgProjectbtnDelete_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtn = sender as ImageButton;
        GridViewRow grdRow = (GridViewRow)imgbtn.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdRow.FindControl("hdfProjId")).Value);
        hdfProject_id.Value = ID.ToString();

        SqlCommand cmd = new SqlCommand("Delete from [Party_Project_Master] where [Project_Id] = " + hdfProject_id.Value + "");
        DataAccess.InsertExecuteNonQuery(cmd);
         BindGridViewProjectList();
        alertDiv.Visible = true;
        lblMsg.Text = "Record Delete Sucessfully";
        ClientScript.RegisterStartupScript(this.GetType(), "displayalertmessage", "bindkeyword('" + hdfClientId.Value + "');bindSkill('" + hdfClientId.Value + "');displaydiv5();", true);
    }


    public void BindGridViewProjectList()
    {

        DataTable dt = DataAccess.GetData("Select * from [Party_Project_Master] Where [PartyID]=" + hdfClientId.Value + " ");
        if (dt.Rows.Count > 0)
        {

            gvWorkExp.DataSource = dt;
            gvWorkExp.DataBind();

        }

    }

    protected void gvWorkExp_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hdfProject_id = (HiddenField)e.Row.FindControl("hdfProjId");
            HiddenField hdfProjectimg = (HiddenField)e.Row.FindControl("hdfProjectimg");

            Literal ltrProject = (Literal)e.Row.FindControl("ltrProject");


            if (hdfProject_id.Value != string.Empty && hdfProjectimg.Value != string.Empty)
            {
                ltrProject.Text += "<a href='../ClientContractDoc/" + hdfProjectimg.Value + "' target='_blank' class='img-thumbnail'>";
                ltrProject.Text += "<img src = '../ClientContractDoc/" + hdfProjectimg.Value + "' class='img-thumbnail' height='70px' width='110px' alt='news Image'/></a>";
            }

            else
            {
                ltrProject.Text += "<img src = '../ClientContractDoc/DummyProjectImg.jpg' class='img-thumbnail' height='70px' width='110px' alt='news Image'/>";

            }
          


        }


    }


    public void bindKeyword()
    {

        ddlKeyword.Items.Clear();
        DataTable dt = DataAccess.GetData("Select Distinct * from [Keyword_Master] where [JobCat_Id]=" + ddlBusinessCat.SelectedValue+ " ");
        if (dt.Rows.Count > 0)
        {

            foreach (DataRow dr in dt.Rows)
            {
                ListItem item1 = new ListItem();
                item1.Value = dr["Keyword_Id"].ToString();
                item1.Text = dr["Keyword"].ToString();
                //item1.Selected = true;
                ddlKeyword.Items.Add(item1);
            }
        }

    }




    public void bindSelectedKeyword()
    {
        // Insert Keyword
        if (hdfClientId.Value != string.Empty)
        {

          
            string selectedCountries = hdfSelectedkeywrd.Value; 
            string countries = "";
            for (int i = 0; i < selectedCountries.Split(',').Length; i++)
            {
                countries += selectedCountries.Split(',')[i] + " \\n";
                string keyword_Id = string.Empty;
                DataTable dtkywrd = DataAccess.GetData("Select [Keyword_Id] from [Job_Keyword] Where [Keyword_Id]='"+ selectedCountries.Split(',')[i] + "' and [PartyID]=" + hdfClientId.Value + " ");
                if (dtkywrd.Rows.Count > 0)
                {
                    keyword_Id = dtkywrd.Rows[0]["Keyword_Id"].ToString();
                    hdfkywdId.Value = keyword_Id.ToString();
                }

                if (keyword_Id == string.Empty)
                {

                    SqlCommand cmdkywrd = new SqlCommand("insert into [Job_Keyword] ([Keyword_Id],[PartyID]) Values (@Keyword_Id,@PartyID) ");
                    cmdkywrd.Parameters.AddWithValue("@Keyword_Id", selectedCountries.Split(',')[i]);
                    cmdkywrd.Parameters.AddWithValue("@PartyID", hdfClientId.Value);
                    DataAccess.InsertExecuteNonQuery(cmdkywrd);
                }

                else
                {

                 //   alertDiv.Visible = true;
                 //   lblMsg.Text = "Keyword Pre Selected";


                }
            }
        }

        ddlKeyword.SelectedIndex = -1;
        //ClientScript.RegisterStartupScript(this.GetType(), "displayalertmessage", "bindkeyword('"+ hdfClientId.Value + "');", true);
        //  ClientScript.RegisterStartupScript(this.GetType(), "alert", "displaydiv1();", true);
    }



    protected void btnAutoSubmit_Click(object sender, EventArgs e)
    {
        string sqlQuery = string.Empty;
        sqlQuery = "select * from [PartyMaster] ";
        string whereConcatenator = " WHERE ";


        sqlQuery += whereConcatenator;
        sqlQuery += "Party_Type='7'";


        if (txtExpert.Text != string.Empty)
        {
            if (txtExpert.Text.Contains("-"))
            {
                string[] strArr = txtExpert.Text.Split('-');
                sqlQuery += whereConcatenator;
                sqlQuery += "Contact_person_name = '" + strArr[0] + "'";
                whereConcatenator = "and ";
                sqlQuery += " COLLATE SQL_Latin1_General_CP1_CS_AS ";
            }
            else
            {
                sqlQuery += whereConcatenator;
                sqlQuery += "Contact_person_name = '" + txtExpert.Text + "')";
                whereConcatenator = "and ";
               
            }
            DataTable dt = DataAccess.GetData(sqlQuery);
            if(dt.Rows.Count>0)
            {
                hdfRefId.Value = dt.Rows[0]["Contact_person_name"].ToString();
            }
        }

    }



    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchDelPrsn(string prefixText, int count, string contextKey)
    {
        DataTable dt = DataAccess.GetData("select distinct [PartyID], [Contact_person_name] from [PartyMaster] WHERE ([Contact_person_name] like '" + prefixText + "%') and [Party_Type]=7 ");
        List<string> customers = new List<string>();
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {

                customers.Add(dr["Contact_person_name"].ToString());
            }
        }
        return customers;

    }



    public void BindRefereceDetail()
    {



    }


    protected void btnNextProfile_Click(object sender, EventArgs e)
    {
        UpdateProfileNext();
        ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "bindkeyword('" + hdfClientId.Value + "');bindSkill('"+hdfClientId.Value+"');displaydiv1();", true);
        //ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "displaydiv1();", true);
       
        //ClientScript.RegisterStartupScript(this.GetType(), "displayalertmessage", "bindkeyword('" + hdfClientId.Value + "');", true);
        // ClientScript.RegisterStartupScript(this.GetType(), "alert", "displaydiv1();", true);
    }

  

   

    // UpdateContactNext()

    protected void btnNext2_Click(object sender, EventArgs e)
    {
        UpdateContactNext();
     
        ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "bindkeyword('" + hdfClientId.Value + "');bindSkill('" + hdfClientId.Value + "');displaydiv3();", true);
    }

    //  

    protected void btnBankNext_Click(object sender, EventArgs e)
    {

         UpdateBankNext();
        ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "bindkeyword('" + hdfClientId.Value + "');bindSkill('" + hdfClientId.Value + "');displaydiv5();", true);
        // ClientScript.RegisterStartupScript(this.GetType(), "displayalertmessage", "displaydiv5();", true);

    }
}