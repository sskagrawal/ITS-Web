using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data.SqlClient;

public partial class Client_Panel_Client_profile_big : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["partyid"] != null)
            {
                Session["urrr"] = null;

                hdfClientId.Value = Session["partyid"].ToString();
                if (Request.QueryString["pId"] != null)
                {
                    hdfClientId.Value = Request.QueryString["pId"].ToString();
                }
                    if (Request.QueryString["uTp"] != null)
                {
                    hdfusertypeid.Value = Request.QueryString["uTp"].ToString();
             
                    stepContent4.Visible = false;
                    editPrflDiv.Visible = false;
                }
                else if (Session["ttppd"] != null)
                {
                    hdfusertypeid.Value = Session["ttppd"].ToString();
                }

                    if (hdfusertypeid.Value == "4" || hdfusertypeid.Value == "2")  // Company
                    {
                        divCompnay.Visible = true;
                        divCompGST.Visible = true;
                        divDesignation.Visible = true;
                        
                        divJobType.Visible = false;
                        divQualification.Visible = false;
                        establisedDiv.Visible = true;
                    //  budgetDiv.Visible = false;
                      divMinBudget.Visible = false;
                    BusJobTab.InnerText = "Business";

                        bind_ClientProfile();
                    }

                    else if (hdfusertypeid.Value == "3")
                    {
                        divCompnay.Visible = false;
                        divCompGST.Visible = false;
                        divDesignation.Visible = false;
                     

                        //divjobTitle.Visible = true;
                        divJobType.Visible = true;
                        divQualification.Visible = true;
                        expDiv.Visible = true;
                    // budgetDiv.Visible = true;
                       divMinBudget.Visible = true;
              
                        BusJobTab.InnerText = "Job Profile";
                        bind_ClientProfile();

                    }



                
            }
            else
            {
                if (Request.QueryString["pId"] != null)
                {
                    Session["urrr"] = "~/Client_Panel/Client_profile_big.aspx?uTp=3&pId="+ Request.QueryString["pId"].ToString();
                }
                    
                Response.Redirect("~/Admin/Login.aspx");
            }
        }
    }

    public string coverPhoto = string.Empty;

    public void bind_ClientProfile()
    {

        DataTable dt = DataAccess.GetData("select * from [PartyMaster] where [PartyID]=" + hdfClientId.Value + "");
        if (dt.Rows.Count > 0)
        {
            DataTable dtbnr = DataAccess.GetData("Select * from  [PartyDocument_Master] where [PartyID]=" + hdfClientId.Value + " and [Document_Name]='Banner Photo'     ");
            if (dtbnr.Rows.Count > 0)
            {

                if (dtbnr.Rows[0]["Upload_File"].ToString() != string.Empty)
                {
                    coverPhoto = "../ClientContractDoc/" + dtbnr.Rows[0]["Upload_File"].ToString() + "";
                    //ltrProfile.Text += "<div class='up-head-w' style='background-image:url(../ClientContractDoc/" + dtbnr.Rows[0]["Upload_File"].ToString() + ")'>";

                }

                else
                {
                    coverPhoto = "../ClientContractDoc/CompBanner.jpg";
                    //ltrProfile.Text += "<div class='up-head-w' style='background-image:url(../ClientContractDoc/CompBanner.jpg)'>";

                }
            }
            else
            {
                coverPhoto = "../ClientContractDoc/CompBanner.jpg";
                //ltrProfile.Text += "<div class='up-head-w' style='background-image:url(../ClientContractDoc/CompBanner.jpg)'>";

            }
            //ltrProfile.Text += "<div class='up-social'>";
            //ltrProfile.Text += "<a href='#'><i class='os-icon os-icon-twitter'></i></a>";
            //ltrProfile.Text += "<a href='#'><i class='os-icon os-icon-facebook'></i></a>";
            //ltrProfile.Text += "</div>";
            //ltrProfile.Text += "<div class='up-main-info'> ";
            //ltrProfile.Text += "<div class='user-avatar-w'>";
            //ltrProfile.Text += "<div class='user-avatar'>";

            DataTable dtpl = DataAccess.GetData("Select * from  [PartyDocument_Master] where [PartyID]=" + hdfClientId.Value + " and [Document_Name]='Profile Photo'");
            if (dtpl.Rows.Count > 0)
            {

                if (dtpl.Rows[0]["Upload_File"].ToString() != string.Empty)
                {
                    imgLogo.Src = "../ClientContractDoc/" + dtpl.Rows[0]["Upload_File"].ToString() + "";
                    //ltrProfile.Text += "<img alt = '' src='../ClientContractDoc/" + dtpl.Rows[0]["Upload_File"].ToString() + "'/>";
                }

                else
                {
                    imgLogo.Src = "../images/dummy.jpg";
                    //ltrProfile.Text += "<img alt = '' src='../ClientContractDoc/complogo.jpg'/>";

                }
            }
            else
            {
                imgLogo.Src = "../images/dummy.jpg";
                //ltrProfile.Text += "<img alt = '' src='../ClientContractDoc/complogo.jpg'/>";

            }


            if (hdfusertypeid.Value == "3")
            {

                lbl1.Text = dt.Rows[0]["Contact_person_name"].ToString();
                lbl2.Text = dt.Rows[0]["Comp_Category"].ToString();
            }

            else
            {
                lbl1.Text = dt.Rows[0]["Party_name"].ToString();
                lbl2.Text = dt.Rows[0]["Comp_tagline"].ToString();
            }


            //ltrProfile.Text += "</div>";
            //ltrProfile.Text += "</div>";
            //ltrProfile.Text += "<h1 class='up-header'>" + dt.Rows[0]["Party_name"].ToString() + "</h1>";
            //ltrProfile.Text += "<h5 class='up-sub-header'>" + dt.Rows[0]["Comp_tagline"].ToString() + "</h5>";
            //ltrProfile.Text += "</div>";
            //ltrProfile.Text += "<svg class='decor' width='842px' height='219px' viewBox='0 0 842 219' preserveAspectRatio='xMaxYMax meet' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'><g transform = 'translate(-381.000000, -362.000000)' fill='#FFFFFF'><path class='decor-path' d='M1223,362 L1223,581 L381,581 C868.912802,575.666667 1149.57947,502.666667 1223,362 Z'></path></g></svg>";
            //ltrProfile.Text += "</div>";

        }

        Bind_Client_Profile();
    
    }
    public void Bind_Client_Profile()
    {
        DataTable dt = DataAccess.GetData("select * from [View_PartyMaster_new] where [PartyID]=" + hdfClientId.Value + "");
        if (dt.Rows.Count > 0)
        {
            //Personal Profile
            //lblFullName.Text = dt.Rows[0]["Contact_person_name"].ToString();
            //lblMobile.Text = dt.Rows[0]["mobile_no"].ToString();

            //if (dt.Rows[0]["phone_no"].ToString() != string.Empty)
            //{
            //    lblWhatsapp.Text = dt.Rows[0]["phone_no"].ToString();
            //}
            //else
            //{
            //    lblWhatsapp.Text = "&nbsp;";
            //}
            //lblEmail.Text = dt.Rows[0]["Email"].ToString();

            //Job Profile         

            if (dt.Rows[0]["Comp_Category"].ToString() != string.Empty)
            {
               
                lblJobCategory.Text = dt.Rows[0]["Comp_Category"].ToString();
            }
            else
            {
                lblJobCategory.Text = "&nbsp;";
            }          


            if (dt.Rows[0]["JobSubCateName"].ToString() != string.Empty)
            {

                lbljobSubCategory.Text = dt.Rows[0]["JobSubCateName"].ToString();
            }
            else
            {
                lbljobSubCategory.Text = "&nbsp;";
            }

            //Job Skill
            DataTable dtskill = DataAccess.GetData("Select distinct [Skill_Name] from [View_Post_Job_Skill] Where [PartyID]=" + hdfClientId.Value + " ");
            if (dtskill.Rows.Count > 0)
            {

                  
                for (int i = 0; i < dtskill.Rows.Count; i = i + 1)
                {
                    ltrskill.Text += "<li class='nav-item'><a class='nav-link active' data-toggle='tab' href='#' aria-expanded='true' style='text-decoration:none;'>" + dtskill.Rows[i]["Skill_Name"].ToString() + " </a></li>&nbsp";

                }
            }          


            if (dt.Rows[0]["Party_name"].ToString() != string.Empty)
            {

                lblCompanyName.Text = dt.Rows[0]["Party_name"].ToString();
            }
            else
            {
                lblCompanyName.Text = "&nbsp;";
            }           


            if (dt.Rows[0]["Gst_no"].ToString() != string.Empty)
            {

                lblComGST.Text = dt.Rows[0]["Gst_no"].ToString();
            }
            else
            {
                lblComGST.Text = "&nbsp;";
            }           


            if (dt.Rows[0]["Designation"].ToString() != string.Empty)
            {

                lblDesignation.Text = dt.Rows[0]["Designation"].ToString();
            }
            else
            {
                lblDesignation.Text = "&nbsp;";
            }          


            if (dt.Rows[0]["Website"].ToString() != string.Empty)
            {

                lblwebsite.Text = dt.Rows[0]["Website"].ToString();
            }
            else
            {
                lblwebsite.Text = "&nbsp;";
            }          


            if (dt.Rows[0]["job_Title"].ToString() != string.Empty)
            {

                lblJobTitle.Text = dt.Rows[0]["job_Title"].ToString();
            }
            else
            {
                lblJobTitle.Text = dt.Rows[0]["Comp_tagline"].ToString(); 
            }          


            if (dt.Rows[0]["JobType"].ToString() != string.Empty)
            {

                lbljobtype.Text = dt.Rows[0]["JobType"].ToString();
            }
            else
            {
                lbljobtype.Text = "&nbsp;";
            }           


            if (dt.Rows[0]["job_Qulalification"].ToString() != string.Empty)
            {

                lblQualification.Text = dt.Rows[0]["job_Qulalification"].ToString();
            }
            else
            {
                lblQualification.Text = "&nbsp;";
            }

            if (dt.Rows[0]["Time_Unit"].ToString() != string.Empty)
            {

                lblJobPeriod.Text = dt.Rows[0]["Time_Unit"].ToString();
            }
            else
            {
                lblJobPeriod.Text = "&nbsp;";
            }

            if (dt.Rows[0]["Exp"].ToString() != string.Empty)
            {

                lblExperience.Text = dt.Rows[0]["Exp"].ToString();
                lbljobExp.Text = dt.Rows[0]["Exp"].ToString();

            }
            else
            {
                lblExperience.Text = "none";
                lbljobExp.Text = "none";
            }
            if (hdfusertypeid.Value == "4" || hdfusertypeid.Value == "2")
            {
                string compExp = string.Empty;
                if (dt.Rows[0]["CompEstablishedDate"].ToString() != string.Empty)
                {
                    DateTime estDt = Convert.ToDateTime(dt.Rows[0]["CompEstablishedDate"].ToString());

                    lbljobExp.Text = (DateTime.Now.Year - estDt.Year).ToString() + " Year(s)";
                    lblEstablishdDt.Text = Convert.ToDateTime(dt.Rows[0]["CompEstablishedDate"].ToString()).ToString("dd/MM/yyyy");
                }
                else
                {
                    lbljobExp.Text = "none";
                    lblEstablishdDt.Text = "&nbsp;";
                }


            }
            //else if (hdfusertypeid.Value == "3")
            //{
                

            //}
            if (hdfusertypeid.Value == "4" || hdfusertypeid.Value == "2")
            {
                string totServ = "0";
                DataTable dtTotServ = DataAccess.GetData("select count(*) as totServ from [View_ClientServices] where [PartyID]=" + hdfClientId.Value + "");
                if(dtTotServ.Rows.Count>0)
                {
                    totServ = dtTotServ.Rows[0]["totServ"].ToString();
                }
                string totobPost = "0";
                DataTable dtTotJob = DataAccess.GetData("select count(*) as totJob from View_FindJob where [PartyID]=" + hdfClientId.Value + "");
                if(dtTotJob.Rows.Count>0)
                {
                    totobPost = dtTotJob.Rows[0]["totJob"].ToString();
                }
                ltrlHireFollow.Text = "<a class='btn btn-secondary btn-sm' href=''> <i class='fa fa-user' aria-hidden='true'></i><span>Follow Me</span></a>";
                Heading1.Text = "Company Overview";
                ltrlCont1.Text = "<div class='value'>"+totServ+"</div><div class='label'>Total Services</div>";
                ltrlCont2.Text = "<div class='value'>0</div><div class='label'>Total Earning</div>";
                ltrlCont3.Text = "<div class='value'>0</div><div class='label'>Total Spent</div>";
                ltrlCont4.Text = "<div class='value'>"+totobPost+"</div><div class='label'>Total Job Post</div>";

                
            }
            else if (hdfusertypeid.Value == "3")
            {
                ltrlHireFollow.Text = "<a class='btn btn-secondary btn-sm' href=''> <i class='fa fa-user' aria-hidden='true'></i><span>Hire Me</span></a>";
                Heading1.Text = "Profile Statistics";
                ltrlCont1.Text = "<div class='value'>0</div><div class='label'>Total Earning</div>";
                ltrlCont2.Text = "<div class='value'>0</div><div class='label'>Job Completed</div>";
                ltrlCont3.Text = "<div class='value'>0</div><div class='label'>No of Feedback</div>";
                ltrlCont4.Text = "<div class='value'>0</div><div class='label'>Cancelled</div>";
            }

                if (dt.Rows[0]["Comp_tagline"].ToString() != string.Empty)
            {

                lblTagline.Text = dt.Rows[0]["Comp_tagline"].ToString();
            }
            else
            {
                lblTagline.Text = "&nbsp;";
            }


            if (dt.Rows[0]["Min_Salary"].ToString() != string.Empty)
            {
                lblminbudget.Text = dt.Rows[0]["Min_Salary"].ToString();
               
            }
            else
            {
                lblminbudget.Text = "&nbsp;";
            }          


            if (dt.Rows[0]["ShortDescription"].ToString() != string.Empty)
            {
              //  lblshortDesc.Text = dt.Rows[0]["ShortDescription"].ToString();
                lblShortDesc1.Text= dt.Rows[0]["ShortDescription"].ToString();
                shortDescDiv.Visible = true;
            }
            else
            {
                shortDescDiv.Visible = false;
              //  lblshortDesc.Text = "&nbsp;";
            }          


            if (dt.Rows[0]["LongDescription"].ToString() != string.Empty)
            {
                lblLongDesc.Text = dt.Rows[0]["LongDescription"].ToString();
            }
            else
            {
                lblLongDesc.Text = "&nbsp;";
            }
          
            if (hdfusertypeid.Value == "4" || hdfusertypeid.Value == "2")
            {
                //ltrlCatBudjt.Text = "<button class='btn btn-primary btn-sm'><i class='os-icon os-icon-link-3'></i><span>Category - </span>" + dt.Rows[0]["Comp_Category"].ToString() + "</button>";
            }
            else if (hdfusertypeid.Value == "3")
            {
                ltrlCatBudjt.Text = "<button class='btn btn-primary btn-sm'><i class='os-icon os-icon-link-3'></i><span>Budget - </span>" + dt.Rows[0]["Min_Salary"].ToString() + "</button>";
            }
                //Document

                DataTable dt2 = DataAccess.GetData("Select * from [PartyDocument_Master] Where [PartyID]=" + hdfClientId.Value + " ");
        if (dt2.Rows.Count > 0)
        {
            gvFileDetails.DataSource = dt2;
            gvFileDetails.DataBind();
        }

            //Bank Profile          

            if (dt.Rows[0]["Bank_Name"].ToString() != string.Empty)
            {
                lblBankName.Text = dt.Rows[0]["Bank_Name"].ToString();
            }
            else
            {
                lblBankName.Text = "&nbsp;";
            }           

            if (dt.Rows[0]["AccountHname"].ToString() != string.Empty)
            {
                lblAccHolder.Text = dt.Rows[0]["AccountHname"].ToString();
            }
            else
            {
                lblAccHolder.Text = "&nbsp;";
            }
           

            if (dt.Rows[0]["BranceName"].ToString() != string.Empty)
            {
                lblBranchName.Text = dt.Rows[0]["BranceName"].ToString();
            }
            else
            {
                lblBranchName.Text = "&nbsp;";
            }



          

            if (dt.Rows[0]["AccountNo"].ToString() != string.Empty)
            {
                lblAccNumber.Text = dt.Rows[0]["AccountNo"].ToString();
            }
            else
            {
                lblAccNumber.Text = "&nbsp;";
            }


            if (dt.Rows[0]["IFSCCoad"].ToString() != string.Empty)
            {
                lblIFSCCode.Text = dt.Rows[0]["IFSCCoad"].ToString();
            }
            else
            {
                lblIFSCCode.Text = "&nbsp;";
            }

           

        }
        hdfjobCatId.Value= dt.Rows[0]["ID"].ToString();
        bindSelectedKeyword1();
        BindProjectDetail();
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

    //KEYWORD

    public void bindSelectedKeyword1()
    {
        ltrSeletedkeywrd.Text = "";
        DataTable dtkywrd = DataAccess.GetData("Select distinct [Keyword] from [View_Job_Keyword_Master] Where [PartyID]=" + hdfClientId.Value + " ");
        if (dtkywrd.Rows.Count > 0)
        {
            string selectedCountries = hfSelected.Value;
            string comCont = string.Empty;
            for (int i = 0; i < dtkywrd.Rows.Count; i = i + 1)
            {

                ltrSeletedkeywrd.Text += "<li class='nav-item'><a class='nav-link active' data-toggle='tab' href='#' aria-expanded='true'>" + dtkywrd.Rows[i]["Keyword"].ToString() + " </a></li>";

            }
        }
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "displaydiv();", true);
    }   

    public void bindKeyword()
    {

        ddlKeyword.Items.Clear();
        DataTable dt = DataAccess.GetData("Select Distinct * from [Keyword_Master] where [JobCat_Id]=" + hdfjobCatId.Value + " ");
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

    public void BindProjectDetail()
    {
        if (hdfusertypeid.Value == "3")
        {

            DataTable dt = DataAccess.GetData("Select * from [Party_Project_Master]  Where [PartyID]=" + hdfClientId.Value + " ");
            if (dt.Rows.Count > 0)
            {

                ltrProject.Text +="<h6 class='element-header'>Work Details</h6>";
                ltrProject.Text +="<div class='element-box-tp'>";
                ltrProject.Text+="<div class='users-list-w'>";

                foreach (DataRow row in dt.Rows)
                {
                    ltrProject.Text += "<div class='user-w with-status'>";
                    ltrProject.Text += "<div class='user-avatar-w' style='width:150px!important;'>";
                    ltrProject.Text += "<div class='user-avatar' style='border-radius:0px!important;'>";

                    if (row["Project_Image"].ToString() != string.Empty)
                    {
                        ltrProject.Text += "<img src = '../ClientContractDoc/" + row["Project_Image"].ToString() + "'  class='img-thumbnail'/>";
                    }

                    ltrProject.Text += "</div></div>";
                    ltrProject.Text += "<div class='user-name'><h6 class='user-title'>" + row["Project_Name"].ToString() + "</h6>";
                    ltrProject.Text += "<div class='text-dark'>" + row["Project_Desc"].ToString() + " </div></div>";
                    ltrProject.Text += "</div>";
                }

                ltrProject.Text += "</div></div>";



            }
        }
    }

}
