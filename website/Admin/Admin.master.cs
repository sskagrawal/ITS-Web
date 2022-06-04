using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)

        {
            if (Session["sridd"] != null)
            {
                string convertKey = (string)(Session["sridd"]);

                hdfUserID.Value = convertKey;

                facility1();
               BindAdminProfile();
            }
            else
            {
                Response.Redirect("~/Admin/Login.aspx");
            }           

        }      

        }

    public void BindAdminProfile()
    {

        if (hdfUserID.Value != string.Empty)
        {

            DataTable dtPartyID = DataAccess.GetData("Select [PartyID] from  [UserDetails] where [ID]=" + hdfUserID.Value + "");
            if (dtPartyID.Rows.Count > 0)
            {

                hdfpartyid.Value = dtPartyID.Rows[0]["PartyID"].ToString();

            }
        }


        if (hdfpartyid.Value != string.Empty)
        {
            DataTable dt = DataAccess.GetData("Select * from  [PartyDocument_Master] where [PartyID]=" + hdfpartyid.Value + " and [Document_Name]='Profile Photo'     ");
            if (dt.Rows.Count > 0)
            {
                // lblCompany_Name.Text = dt.Rows[0]["Party_name"].ToString();
                //lblCompanyName2.Text = dt.Rows[0]["Party_name"].ToString();
                if (dt.Rows[0]["Upload_File"].ToString() != string.Empty)
                {
                    AdminImage.ImageUrl = "../ClientContractDoc/" + dt.Rows[0]["Upload_File"].ToString();
                    AImage.ImageUrl = "../ClientContractDoc/" + dt.Rows[0]["Upload_File"].ToString();

                    AdminImageRight.Src = "../ClientContractDoc/" + dt.Rows[0]["Upload_File"].ToString();
                    AImageRight.Src = "../ClientContractDoc/" + dt.Rows[0]["Upload_File"].ToString();
                }

                else
                {
                    //AdminImage.ImageUrl = "../ClientContractDoc/complogo.jpg";
                    //AImage.ImageUrl = "../ClientContractDoc/complogo.jpg";
                }

            }
            DataTable dtP = DataAccess.GetData("Select * from  [PartyMaster] where [PartyID]=" + hdfpartyid.Value + "");
            if (dtP.Rows.Count > 0)
            {
                lblAdmin_Name.Text = dtP.Rows[0]["Contact_person_name"].ToString();
                lblCompanyName2.Text = dtP.Rows[0]["Party_name"].ToString();

                lblAname.Text = dtP.Rows[0]["Contact_person_name"].ToString();
                lblUserNameR.Text= dtP.Rows[0]["Contact_person_name"].ToString();

                lblAdminNameMob.Text = dtP.Rows[0]["Contact_person_name"].ToString();
                DataTable dtUserType = DataAccess.GetData("select [UserTypeName] from [UserType] where [ID]=" + dtP.Rows[0]["Party_Type"].ToString() + "");
                if (dtUserType.Rows.Count > 0)
                {
                    lblUserType.Text = dtUserType.Rows[0]["UserTypeName"].ToString();
                    lblUserTypeMob.Text= dtUserType.Rows[0]["UserTypeName"].ToString();
                }
            }
        }

        else
        {



        }




    }

    public void facility1()
    {
        Literal1.Text = string.Empty;
        ltrFacility.Text = string.Empty;

        //if (Convert.ToInt32(Session["ttppd"]) == 7)
        //{
        //    //Literal1.Text += "<li><a href='" + Page.ResolveUrl("~/Admin/My_Profile.aspx") + "'><i class='os-icon os-icon-signs-11'></i><span>Company Profile</span></a></li>";
        //    ltrFacility.Text += "<ul class='main-menu'><li><a href = '" + Page.ResolveUrl("~/Admin/Default.aspx") + "'><div class='icon-w'><div class='os-icon os-icon-window-content'></div></div><span>Dashboard</span></a> </li>";
        //    ltrFacility.Text += "<li class='has-sub-menu'><a href = '#'><div class='icon-w'><div class='icon-people'></div></div><span>Employee</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/Employee/Timesheet.aspx") + "'>TimeSheet</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Employee/Show_Timesheet.aspx") + "'>Show TimeSheet</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Employee/Employee_Documents.aspx") + "'>Employee Document</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/Employee/MyProfile.aspx") + "'>My Profile</a></li></ul></li></ul>";
        //  //  ltrFacility.Text += "<li class='has-sub-menu'><a href = '#'><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Job Portal</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/Job/Upload_job.aspx") + "'>Add Jobs</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Job/Upload_Job_List.aspx") + "' > Job List</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Job/CvList.aspx") + "'> Resumes List</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/User/AddUpdateUser.aspx") + "'> Add User</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/User/JobSheekarList.aspx") + "'> Job Seekar List</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/User/EmployeeList.aspx") + "'> Employee List</a></li><li><a runat = 'server' href= '" + Page.ResolveUrl("~/Admin/Job/AppliedJob.aspx") + "'> Applied Job List</a></li></ul></li></ul>";
        //}


        //   if(Convert.ToInt32(Session["ttppd"]) == 4)
        if (Convert.ToInt32(Session["ttppd"]) == 4 || Convert.ToInt32(Session["ttppd"]) == 2 || Convert.ToInt32(Session["ttppd"]) == 3)
        {
            Literal1.Text += "<li><a href='" + Page.ResolveUrl("~/Client_Panel/Client_profile_big.aspx") + "'><i class='os-icon os-icon-signs-11'></i><span>My Profile</span></a></li>";
            if (Session["srv"] != null)
            {
                if (Session["srv"].ToString() == "job")
                {
                    shopLi.Attributes.Add("class", "");
                    webServLi.Attributes.Add("class", "");
                    jobSrvLi.Attributes.Add("class", "active");
                    
                    ltrFacility.Text += "<ul class='main-menu'><li><a href = '" + Page.ResolveUrl("~/Client_Panel/jobDashboard.aspx") + "'><div class='icon-w'><div class='os-icon os-icon-window-content'></div></div><span>Dashboard</span></a> </li>";
                    ltrlMobMenu.Text += "<ul class='main-menu'><li><a href = '" + Page.ResolveUrl("~/Client_Panel/jobDashboard.aspx") + "'><div class='icon-w'><div class='os-icon os-icon-window-content'></div></div><span>Dashboard</span></a> </li>";

                    if (Convert.ToInt32(Session["ttppd"]) == 4 || Convert.ToInt32(Session["ttppd"]) == 2)
                    {
                        ltrFacility.Text += "<li class='has-sub-menu'><a href=''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Job Post </span></a><ul class='sub-menu'> <li><a  href='" + Page.ResolveUrl("~/Client_Panel/Post-Job.aspx") + "'>Job Posting</a> </li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/My_Job_List.aspx") + "'>Job Post List</a></li></ul></li>";
                        ltrFacility.Text += "<li><a href='" + Page.ResolveUrl("~/Client_Panel/HireEmployee.aspx") + "'><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Hire Employee</span></a></li>";
                        ltrFacility.Text += "<li><a href='" + Page.ResolveUrl("~/Client_Panel/Proposal_List.aspx") + "'><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Proposal List</span></a></li>";

                        ltrlMobMenu.Text += "<li class='has-sub-menu'><a href=''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Job Post </span></a><ul class='sub-menu'> <li><a  href='" + Page.ResolveUrl("~/Client_Panel/Post-Job.aspx") + "'>Job Posting</a> </li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/My_Job_List.aspx") + "'>Job Post List</a></li></ul></li>";
                        ltrlMobMenu.Text += "<li><a href='" + Page.ResolveUrl("~/Client_Panel/HireEmployee.aspx") + "'><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Hire Employee</span></a></li>";
                        ltrlMobMenu.Text += "<li><a href='" + Page.ResolveUrl("~/Client_Panel/Proposal_List.aspx") + "'><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Proposal List</span></a></li>";
                    }
                    else
                    {
                        ltrFacility.Text += "<li class='has-sub-menu'><a href=''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Find Job </span></a><ul class='sub-menu'> <li><a  href='" + Page.ResolveUrl("~/Client_Panel/Post-Job_List.aspx") + "'>Find-Job</a></li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/RecomondedJobs.aspx") + "'>Jobs For You</a></li></ul></li>";
                        ltrFacility.Text += "<li><a href='" + Page.ResolveUrl("~/Client_Panel/Job_Promisor.aspx") + "'><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>My Proposals</span></a></li>";
                        ltrlMobMenu.Text += "<li class='has-sub-menu'><a href=''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Find Job </span></a><ul class='sub-menu'> <li><a  href='" + Page.ResolveUrl("~/Client_Panel/Post-Job_List.aspx") + "'>Find-Job</a></li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/RecomondedJobs.aspx") + "'>Jobs For You</a></li></ul></li>";
                        ltrlMobMenu.Text += "<li><a href='" + Page.ResolveUrl("~/Client_Panel/Job_Promisor.aspx") + "'><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>My Proposals</span></a></li>";
                    }


                    ltrFacility.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Support</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Create_Ticket.aspx") + "'>Create Ticket</a></li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/View_Ticket.aspx") + "'>Ticket List</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/AddUserPlan.aspx") + "'>Ticket Status</a></li><li></li></ul></li>";
                    ltrlMobMenu.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Support</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Create_Ticket.aspx") + "'>Create Ticket</a></li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/View_Ticket.aspx") + "'>Ticket List</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/AddUserPlan.aspx") + "'>Ticket Status</a></li></ul></li>";
                   // ltrlMobMenu.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>My Profile</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Create_Ticket.aspx") + "'>View Profile</a></li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/View_Ticket.aspx") + "'>Change Password</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/AddUserPlan.aspx") + "'>Logout</a></li></ul></li>";


                }
                else if (Session["srv"].ToString() == "shp")
                {
                    shopLi.Attributes.Add("class", "active");
                    jobSrvLi.Attributes.Add("class", "");
                    webServLi.Attributes.Add("class", "");
                    ltrFacility.Text += "<ul class='main-menu'><li><a href = '" + Page.ResolveUrl("~/Client_Panel/EccmDashboard.aspx") + "'><div class='icon-w'><div class='os-icon os-icon-window-content'></div></div><span>Dashboard</span></a> </li>";
                    ltrFacility.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>e-commerce</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Add_ProductSize.aspx") + "'>Add Product Size</a></li>  <li><a  href='" + Page.ResolveUrl("~/Client_Panel/AddUpdateProduct.aspx") + "'>Add Product</a></li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Product-List.aspx") + "'>Product List</a></li><li></li></ul></li>";


                    ltrFacility.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Support</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Create_Ticket.aspx") + "'>Create Ticket</a></li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/View_Ticket.aspx") + "'>Ticket List</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/AddUserPlan.aspx") + "'>Ticket Status</a></li><li></li></ul></li>";

                    ltrlMobMenu.Text += "<ul class='main-menu'><li><a href = '" + Page.ResolveUrl("~/Client_Panel/EccmDashboard.aspx") + "'><div class='icon-w'><div class='os-icon os-icon-window-content'></div></div><span>Dashboard</span></a> </li>";
                    ltrlMobMenu.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>e-commerce</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Add_ProductSize.aspx") + "'>Add Product Size</a></li>  <li><a  href='" + Page.ResolveUrl("~/Client_Panel/AddUpdateProduct.aspx") + "'>Add Product</a></li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Product-List.aspx") + "'>Product List</a></li><li></li></ul></li>";


                    ltrlMobMenu.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Support</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Create_Ticket.aspx") + "'>Create Ticket</a></li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/View_Ticket.aspx") + "'>Ticket List</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/AddUserPlan.aspx") + "'>Ticket Status</a></li><li></li></ul></li>";
                }
                else if (Session["srv"].ToString() == "web")
                {
                    jobSrvLi.Attributes.Add("class", "");
                    webServLi.Attributes.Add("class", "active");
                    shopLi.Attributes.Add("class", "");
                    ltrFacility.Text += "<ul class='main-menu'><li><a href = '" + Page.ResolveUrl("~/Client_Panel/Default.aspx") + "'><div class='icon-w'><div class='os-icon os-icon-window-content'></div></div><span>Dashboard</span></a> </li>";
                    ltrFacility.Text += "<li class='has-sub-menu'><a href=''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Web Services</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Service-List.aspx") + "'>Service List</a></li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Invoice-List.aspx") + "'>Invoice</a></li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/PaymentHistory.aspx") + "'>Payment History</a></li><li></li></ul></li>";
                    ltrFacility.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Support</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Create_Ticket.aspx") + "'>Create Ticket</a></li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/View_Ticket.aspx") + "'>Ticket List</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/AddUserPlan.aspx") + "'>Ticket Status</a></li><li></li></ul></li>";

                    ltrlMobMenu.Text += "<ul class='main-menu'><li><a href = '" + Page.ResolveUrl("~/Client_Panel/Default.aspx") + "'><div class='icon-w'><div class='os-icon os-icon-window-content'></div></div><span>Dashboard</span></a> </li>";
                    ltrlMobMenu.Text += "<li class='has-sub-menu'><a href=''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Web Services</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Service-List.aspx") + "'>Service List</a></li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Invoice-List.aspx") + "'>Invoice</a></li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/PaymentHistory.aspx") + "'>Payment History</a></li><li></li></ul></li>";
                    ltrlMobMenu.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Support</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Create_Ticket.aspx") + "'>Create Ticket</a></li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/View_Ticket.aspx") + "'>Ticket List</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/AddUserPlan.aspx") + "'>Ticket Status</a></li><li></li></ul></li>";
                }
            }
            //Literal1.Text += "<li><a href='" + Page.ResolveUrl("~/Client_Panel/Client_profile_big.aspx") + "'><i class='os-icon os-icon-signs-11'></i><span>My Profile</span></a></li>";
            //ltrFacility.Text += "<ul class='main-menu'><li><a href = '" + Page.ResolveUrl("~/Client_Panel/Default.aspx") + "'><div class='icon-w'><div class='os-icon os-icon-window-content'></div></div><span>Dashboard</span></a> </li>";

                                                                                                                                                                                                                                                                                                                                    
            //ltrFacility.Text += "<li class='has-sub-menu'><a href=''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Web Services</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Service-List.aspx") + "'>Service List</a></li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Invoice-List.aspx") + "'>Invoice</a></li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/PaymentHistory.aspx") + "'>Payment History</a></li><li></li></ul></li>";

            //ltrFacility.Text += "<li class='has-sub-menu'><a href=''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Find Job </span></a><ul class='sub-menu'> <li><a  href='" + Page.ResolveUrl("~/Client_Panel/Post-Job_List.aspx") + "'>Find-Job</a></li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/#") + "'>Recommended Job</a></li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/#") + "'>My Job</a></li> </ul></li>";

            //ltrFacility.Text += "<li class='has-sub-menu'><a href=''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Job Post </span></a><ul class='sub-menu'> <li><a  href='" + Page.ResolveUrl("~/Client_Panel/Post-Job.aspx") + "'>Job Posting</a> </li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Post-Job_List.aspx") + "'>Job Post List</a></li></ul></li>";
            //ltrFacility.Text += "<li><a href='" + Page.ResolveUrl("~/Client_Panel/HireEmployee.aspx") + "'><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Hire Employee</span></a></li>";


            //ltrFacility.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>e-commerce</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Add_ProductSize.aspx") + "'>Add Product Size</a></li>  <li><a  href='" + Page.ResolveUrl("~/Client_Panel/AddUpdateProduct.aspx") + "'>Add Product</a></li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Product-List.aspx") + "'>Product List</a></li><li></li></ul></li>";


            //ltrFacility.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Support</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Create_Ticket.aspx") + "'>Create Ticket</a></li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/View_Ticket.aspx") + "'>Ticket List</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/AddUserPlan.aspx") + "'>Ticket Status</a></li><li></li></ul></li>";
           
          
        }
        //else if (Convert.ToInt32(Session["ttppd"]) == 3)
        //{
        //    Literal1.Text += "<li><a href='" + Page.ResolveUrl("~/Client_Panel/Client_profile_big.aspx") + "'><i class='os-icon os-icon-signs-11'></i><span>My Profile</span></a></li>";
        //    ltrFacility.Text += "<ul class='main-menu'><li><a href = '" + Page.ResolveUrl("~/Client_Panel/Default.aspx") + "'><div class='icon-w'><div class='os-icon os-icon-window-content'></div></div><span>Dashboard</span></a> </li>";


            

        //    ltrFacility.Text += "<li class='has-sub-menu'><a href=''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Job Services</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Post-Job.aspx") + "'>Post-Job</a></li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Post-Job_List.aspx") + "'>Find-Job</a></li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Post-Resume.aspx") + "'>Post- Resume</a></li> <li><a  href='" + Page.ResolveUrl("~/Client_Panel/Resume-List.aspx") + "'>Resume-List</a></li><li></li></ul></li>";
        //    // ltrFacility.Text += "<li class='has-sub-menu'><a href =''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Bill</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Invoice.aspx") + "'>View Invoice</a></li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/AddUserPlan.aspx") + "'>Unpaid Invoice</a></li><li></li></ul></li>";
        //    ltrFacility.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Support</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Create_Ticket.aspx") + "'>Create Ticket</a></li><li><a  href='" + Page.ResolveUrl("~/Client_Panel/View_Ticket.aspx") + "'>Ticket List</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/AddUserPlan.aspx") + "'>Ticket Status</a></li><li></li></ul></li>";

        //}

        else if (Convert.ToInt32(Session["ttppd"]) == 1)
        {


           // Literal1.Text += "<li><a href='" + Page.ResolveUrl("~/Admin/My_Profile.aspx") + "'><i class='os-icon os-icon-signs-11'></i><span>Company Profile</span></a></li>";
            ltrFacility.Text += "<ul class='main-menu'><li><a href = '" + Page.ResolveUrl("~/Admin/Default.aspx") + "'><div class='icon-w'><div class='os-icon os-icon-window-content'></div></div><span>Dashboard</span></a> </li>";

            ltrFacility.Text += " <li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='icon-people'></div></div><span>Account</span></a><ul class='sub-menu'><li><a runat = 'server' href='" + Page.ResolveUrl("~/Admin/Party/AddParty.aspx") + "'>Add Party</a></li><li><a runat = 'server' href= '" + Page.ResolveUrl("~/Admin/Party/PartyList.aspx") + "'> Party List</a></li><li><a runat = 'server' href= '" + Page.ResolveUrl("~/Admin/Sale/AddSaleVoucher.aspx") + "'> Create Invoice </a></li><li><a runat ='server' href='" + Page.ResolveUrl("~/Admin/Sale/SaleVoucherList.aspx") + "'>Invoice List</a></li><li><a runat ='server' href='" + Page.ResolveUrl("~/Admin/Sale/RenewList.aspx") + "'>Renew List</a></li></ul></li>";

            ltrFacility.Text += " <li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='icon-paypal'></div></div><span>Payment</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/Payment/RecivedPayment.aspx") + "'>Receive Payemnt</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Payment/RecivedPaymentList.aspx") + "'> Received Payment List</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/Payment/OnlinePaymentList.aspx") + "'> Online Payment List</a></li></ul></li>";

            ltrFacility.Text += " <li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Purchase</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/Purchase/PurchaseInvoice.aspx") + "'>Purchase Invoice</a></li> <li><a  href='" + Page.ResolveUrl("~/Admin/Purchase/Purchase-Invoice-List.aspx") + "'>Purchase Invoice List</a></li> </ul></li>";

            ltrFacility.Text += " <li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Sale</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/Sale/Sale-Invoice-List.aspx") + "'>Sale Invoice List</a></li> </ul></li>";


            ltrFacility.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='icon-settings'></div></div><span>Master</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/Master/JobIndutry.aspx") + "'>Add Indutry</a></li>";
            ltrFacility.Text += "<li><a  href='" + Page.ResolveUrl("~/Admin/Master/JobSubCategory.aspx") + "'>Add Job Sub Category</a></li>";
            ltrFacility.Text += "<li><a  href='" + Page.ResolveUrl("~/Admin/Master/Add_Skill.aspx") + "'>Add Skill</a></li>";
            ltrFacility.Text += "<li><a  href='" + Page.ResolveUrl("~/Admin/Master/Add_Keyword.aspx") + "'>Add Keywords</a></li>";
            ltrFacility.Text += "<li><a  href='" + Page.ResolveUrl("~/Admin/Master/AddKeywordByExcel.aspx") + "'>Keyword by Excel</a></li>";
            ltrFacility.Text += "<li><a  href= '" + Page.ResolveUrl("~/Admin/Master/JobType.aspx") + "'> Job Type</a></li>";
            ltrFacility.Text += "<li><a  href= '" + Page.ResolveUrl("~/Admin/Master/AddQualification.aspx") + "'> Qualification </a></li>";
            ltrFacility.Text += "<li><a  href= '" + Page.ResolveUrl("~/Admin/Master/AdDexperience.aspx") + "'> Experience </a></li>";
            ltrFacility.Text += "<li><a  href= '" + Page.ResolveUrl("~/Admin/Master/ServiceCategory.aspx") + "'> Category </a></li>";
            ltrFacility.Text += "<li><a  href= '" + Page.ResolveUrl("~/Admin/Master/SubCategory.aspx") + "'> Sub Category</a></li>";


            ltrFacility.Text += "<li><a  href= '" + Page.ResolveUrl("~/Admin/Master/AddMenu.aspx") + "'> Add Menu</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Master/MenuList.aspx") + "'> Menu List</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/my_Companies.aspx") + "'>My Companies</a></li></ul></li>";

            ltrFacility.Text += " <li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='icon-user-follow'></div></div><span>User</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/User/User_Add.aspx") + "'>Add User</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/User/UserList.aspx") + "'> User List</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/User/UserRole.aspx") + "'> User Role</a></li></ul></li>";

            ltrFacility.Text += " <li class='has-sub-menu'><a href=''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Web Management</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/AddupdatesGallery.aspx") + "'>Add Update portfolio</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/GalleryList.aspx") + "'>portfolio List</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/AddUpdateNews.aspx") + "'> Add Update News</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/NewsList.aspx") + "'> News List</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Slider.aspx") + "'>Banner Slider</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/SubSlider.aspx") + "'>Portfolio Slider</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Advertisement.aspx") + "'> Add Advertisement</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/AdvertisementList.aspx") + "'> Advertisement List</a></li></ul></li>";

            ltrFacility.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Plan</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/AddPlan.aspx") + "'>Add Plan</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/AddUserPlan.aspx") + "'> User Plan</a></li><li><a href = '#'> Point </a></li></ul></li>";

            //ltrFacility.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='icon-people'></div></div><span>Party</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/Party/AddParty.aspx") + "'>Add Party</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Party/PartyList.aspx") + "'> Party List</a></li></ul></li>";

            //ltrFacility.Text += " <li class='has-sub-menu'><a href = '#'><div class='icon-w'><div class='icon-user-follow'></div></div><span>party2</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/User/AddUpdateUser.aspx") + "'>Add User</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/User/UserList.aspx") + "'> User List</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/User/UserRole.aspx") + "'> User Role</a></li></ul></li>";
            //ltrFacility.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='icon-people'></div></div><span>Employee</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/Employee/Staff_list.aspx") + "'>Employee List</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/Employee/Timesheet.aspx") + "'>TimeSheet</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/User/TimesheetList.aspx") + "'>Show TimeSheet</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Employee/Staff_Attendance.aspx") + "'>Employee Attandance</a></li></ul></li>"; 


            ltrFacility.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='icon-people'></div></div><span>Employee</span></a><ul class='sub-menu'><li><a href='" +Page.ResolveUrl("~/Admin/Employee/Staff_list.aspx") + "'>Employee List</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/Employee/Staff_Attendance.aspx") + "'>Attandance</a></li> <li><a  href='" + Page.ResolveUrl("~/Admin/Employee/View_Attendance.aspx") + "'>View Attandance</a></li>  <li><a  href='" + Page.ResolveUrl("~/Admin/Employee/Staff_Salary.aspx") + "'>Add Salary</a></li>   <li><a  href='" + Page.ResolveUrl("~/Admin/Employee/View_StaffSalary.aspx") + "'>View Salary</a></li> <li><a  href= '" + Page.ResolveUrl("~/Admin/User/TimesheetList.aspx") + "'>Show TimeSheet</a></li>  <li><a  href= '" + Page.ResolveUrl("~/Admin/User/TimesheetList.aspx") + "'>Show TimeSheet</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Employee/Employee_Documents.aspx") + "'>Employee Document</a></li></ul></li>";



            //ltrFacility.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='icon-people'></div></div><span>Company Profile</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/CompanyProfile1.aspx") + "'>Company Profile</a></li></ul></li>";



            //ltrFacility.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='icon-basket-loaded'></div></div><span>Sale</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/Sale/CreateSaleVoucher.aspx") + "'>Create Sale Voucher</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/Sale/SaleVoucherList.aspx") + "'>Sale Voucher List</a></li></ul></li>";

            ltrFacility.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='icon-people'></div></div><span>E-Commerce</span></a><ul class='sub-menu'><li><a href='" + Page.ResolveUrl("~/Admin/Ecommerce/Add_Category.aspx") + "'>Add Category</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/Ecommerce/Add-SubCategory.aspx") + "'>Add Sub Category</a></li> <li><a  href='" + Page.ResolveUrl("~/Admin/Ecommerce/Add-ChildCategory.aspx") + "'>Add Child Category</a></li> <li><a  href='" + Page.ResolveUrl("~/Admin/Ecommerce/Add-Home_Category.aspx") + "'>Add Home Category</a></li> <li><a  href='" + Page.ResolveUrl("~/Admin/Ecommerce/Add-ProductSize2.aspx") + "'>Add Size</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/Ecommerce/Add-ProductColor.aspx") + "'>Add Color</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/Ecommerce/AddUpdateProduct2.aspx") + "'>Add Product</a></li> <li><a  href='" + Page.ResolveUrl("~/Admin/Ecommerce/Product_List.aspx") + "'>Product List </a></li>   </ul></li>"; 


            ltrFacility.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Job Portal</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/Job/HireEmployeeCalltoAction.aspx") + "'>Call to Action Employee List</a></li> <li><a  href='" + Page.ResolveUrl("~/Admin/Job/FindJobCalltoAction.aspx") + "'>Call to Action Job List</a></li>   <li><a  href='" + Page.ResolveUrl("~/Admin/Job/Upload_job.aspx") + "'>Add Jobs</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Job/Upload_Job_List.aspx") + "' > Job List</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Job/CvList.aspx") + "'> Resumes List</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/User/AddUpdateUser.aspx") + "'> Add User</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/User/JobSheekarList.aspx") + "'> Job Seekar List</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/User/EmployeeList.aspx") + "'> Employee List</a></li><li><a runat = 'server' href= '" + Page.ResolveUrl("~/Admin/Job/AppliedJob.aspx") + "'> Applied Job List</a></li></ul></li>";
            ltrFacility.Text += "<li><a  href='" + Page.ResolveUrl("~/Admin/CourseEnquiry-List.aspx") + "'><div class='icon-w'><div class='icon-people'></div></div><span>Course Enquiry List</span></a></li></ul>";


            // //ltrFacility.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>E-Commerce</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/Ecommerce/Add_Category.aspx") + "'>Add Category</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Ecommerce/Add-SubCategory.aspx") + "' > Add Subcategory</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Ecommerce/Add-ChildCategory.aspx") + "'> Add Child Category</a></li> </ul></li></ul>";

            ltrlMobMenu.Text += "<ul class='main-menu'><li><a href = '" + Page.ResolveUrl("~/Admin/Default.aspx") + "'><div class='icon-w'><div class='os-icon os-icon-window-content'></div></div><span>Dashboard</span></a> </li>";

            ltrlMobMenu.Text += " <li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='icon-people'></div></div><span>Account</span></a><ul class='sub-menu'><li><a runat = 'server' href='" + Page.ResolveUrl("~/Admin/Party/AddParty.aspx") + "'>Add Party</a></li><li><a runat = 'server' href= '" + Page.ResolveUrl("~/Admin/Party/PartyList.aspx") + "'> Party List</a></li><li><a runat = 'server' href= '" + Page.ResolveUrl("~/Admin/Sale/AddSaleVoucher.aspx") + "'> Create Invoice </a></li><li><a runat ='server' href='" + Page.ResolveUrl("~/Admin/Sale/SaleVoucherList.aspx") + "'>Invoice List</a></li><li><a runat ='server' href='" + Page.ResolveUrl("~/Admin/Sale/RenewList.aspx") + "'>Renew List</a></li></ul></li>";

            ltrlMobMenu.Text += " <li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='icon-paypal'></div></div><span>Payment</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/Payment/RecivedPayment.aspx") + "'>Receive Payemnt</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Payment/RecivedPaymentList.aspx") + "'> Received Payment List</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/Payment/OnlinePaymentList.aspx") + "'> Online Payment List</a></li></ul></li>";


            ltrlMobMenu.Text += " <li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='icon-paypal'></div></div><span>Purchase</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/Purchase/PurchaseInvoice.aspx") + "'>Purchase Invoice</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Purchase/Purchase-Invoice-List.aspx") + "'> Purchase Invoice List</a></li> </ul></li>";

            ltrlMobMenu.Text += " <li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='icon-paypal'></div></div><span>Sale</span></a><ul class='sub-menu'><li><a  href= '" + Page.ResolveUrl("~/Admin/Sale/Sale-Invoice-List.aspx") + "'> Sale Invoice List</a></li></ul></li>";



            ltrlMobMenu.Text += "  <li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='icon-settings'></div></div><span>Master</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/Master/JobIndutry.aspx") + "'>Add Indutry</a></li> <li><a  href='" + Page.ResolveUrl("~/Admin/Master/JobSubCategory.aspx") + "'>Add Job Sub Category</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/Master/Add_Skill.aspx") + "'>Add Skill</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/Master/Add_Keyword.aspx") + "'>Add Keywords</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/Master/Add_Keyword.aspx") + "'>Keyword by Excel</a></li> <li><a  href= '" + Page.ResolveUrl("~/Admin/Master/JobType.aspx") + "'> Job Type</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Master/AddQualification.aspx") + "'> Qualification </a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Master/AdDexperience.aspx") + "'> Experience </a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Master/ServiceCategory.aspx") + "'> Category </a></li><li><a href= '" + Page.ResolveUrl("~/Admin/Master/SubCategory.aspx") + "'> Sub Category</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Master/AddMenu.aspx") + "'> Add Menu</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Master/MenuList.aspx") + "'> Menu List</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/my_Companies.aspx") + "'>My Companies</a></li></ul></li>";

            ltrlMobMenu.Text += " <li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='icon-user-follow'></div></div><span>User</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/User/User_Add.aspx") + "'>Add User</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/User/UserList.aspx") + "'> User List</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/User/UserRole.aspx") + "'> User Role</a></li></ul></li>";

            ltrlMobMenu.Text += " <li class='has-sub-menu'><a href=''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Web Management</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/AddupdatesGallery.aspx") + "'>Add Update portfolio</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/GalleryList.aspx") + "'>portfolio List</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/AddUpdateNews.aspx") + "'> Add Update News</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/NewsList.aspx") + "'> News List</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Slider.aspx") + "'>Banner Slider</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/SubSlider.aspx") + "'>Portfolio Slider</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Advertisement.aspx") + "'> Add Advertisement</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/AdvertisementList.aspx") + "'> Advertisement List</a></li></ul></li>";

            ltrlMobMenu.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Plan</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/AddPlan.aspx") + "'>Add Plan</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/AddUserPlan.aspx") + "'> User Plan</a></li><li><a href = '#'> Point </a></li></ul></li>";

            //ltrFacility.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='icon-people'></div></div><span>Party</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/Party/AddParty.aspx") + "'>Add Party</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Party/PartyList.aspx") + "'> Party List</a></li></ul></li>";

            //ltrFacility.Text += " <li class='has-sub-menu'><a href = '#'><div class='icon-w'><div class='icon-user-follow'></div></div><span>party2</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/User/AddUpdateUser.aspx") + "'>Add User</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/User/UserList.aspx") + "'> User List</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/User/UserRole.aspx") + "'> User Role</a></li></ul></li>";
            //ltrFacility.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='icon-people'></div></div><span>Employee</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/Employee/Staff_list.aspx") + "'>Employee List</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/Employee/Timesheet.aspx") + "'>TimeSheet</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/User/TimesheetList.aspx") + "'>Show TimeSheet</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Employee/Staff_Attendance.aspx") + "'>Employee Attandance</a></li></ul></li>"; 


            ltrlMobMenu.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='icon-people'></div></div><span>Employee</span></a><ul class='sub-menu'><li><a href='" + Page.ResolveUrl("~/Admin/Employee/Staff_list.aspx") + "'>Employee List</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/Employee/Staff_Attendance.aspx") + "'>Attandance</a></li> <li><a  href='" + Page.ResolveUrl("~/Admin/Employee/View_Attendance.aspx") + "'>View Attandance</a></li>  <li><a  href='" + Page.ResolveUrl("~/Admin/Employee/Staff_Salary.aspx") + "'>Add Salary</a></li>   <li><a  href='" + Page.ResolveUrl("~/Admin/Employee/View_StaffSalary.aspx") + "'>View Salary</a></li> <li><a  href= '" + Page.ResolveUrl("~/Admin/User/TimesheetList.aspx") + "'>Show TimeSheet</a></li>  <li><a  href= '" + Page.ResolveUrl("~/Admin/User/TimesheetList.aspx") + "'>Show TimeSheet</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Employee/Employee_Documents.aspx") + "'>Employee Document</a></li></ul></li>";



            //ltrFacility.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='icon-people'></div></div><span>Company Profile</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/CompanyProfile1.aspx") + "'>Company Profile</a></li></ul></li>";



            //ltrFacility.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='icon-basket-loaded'></div></div><span>Sale</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/Sale/CreateSaleVoucher.aspx") + "'>Create Sale Voucher</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/Sale/SaleVoucherList.aspx") + "'>Sale Voucher List</a></li></ul></li>";

            ltrlMobMenu.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='icon-people'></div></div><span>E-Commerce</span></a><ul class='sub-menu'><li><a href='" + Page.ResolveUrl("~/Admin/Ecommerce/Add_Category.aspx") + "'>Add Category</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/Ecommerce/Add-SubCategory.aspx") + "'>Add Sub Category</a></li> <li><a  href='" + Page.ResolveUrl("~/Admin/Ecommerce/Add-ChildCategory.aspx") + "'>Add Child Category</a></li> <li><a  href='" + Page.ResolveUrl("~/Admin/Ecommerce/Add-Home_Category.aspx") + "'>Add Home Category</a></li> <li><a  href='" + Page.ResolveUrl("~/Admin/Ecommerce/Add-ProductSize2.aspx") + "'>Add Size</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/Ecommerce/Add-ProductColor.aspx") + "'>Add Color</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/Ecommerce/AddUpdateProduct2.aspx") + "'>Add Product</a></li> <li><a  href='" + Page.ResolveUrl("~/Admin/Ecommerce/Product_List.aspx") + "'>Product List </a></li>   </ul></li>";


            ltrlMobMenu.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>Job Portal</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Admin/Job/HireEmployeeCalltoAction.aspx") + "'>Call to Action Employee List</a></li> <li><a  href='" + Page.ResolveUrl("~/Admin/Job/HireEmployeeCalltoAction.aspx") + "'>Call to Action Job List</a></li><li><a  href='" + Page.ResolveUrl("~/Admin/Job/Upload_job.aspx") + "'>Add Jobs</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Job/Upload_Job_List.aspx") + "' > Job List</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/Job/CvList.aspx") + "'> Resumes List</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/User/AddUpdateUser.aspx") + "'> Add User</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/User/JobSheekarList.aspx") + "'> Job Seekar List</a></li><li><a  href= '" + Page.ResolveUrl("~/Admin/User/EmployeeList.aspx") + "'> Employee List</a></li><li><a runat = 'server' href= '" + Page.ResolveUrl("~/Admin/Job/AppliedJob.aspx") + "'> Applied Job List</a></li></ul></li>";
            ltrlMobMenu.Text+= "<li class='has-sub-menu'><a  href='" + Page.ResolveUrl("~/Admin/CourseEnquiry-List.aspx") + "'><div class='icon-w'><div class='icon-people'></div></div><span>Course Enquiry List</span></a></li></ul>";
        }
        ltrlMobMenu.Text += "<li class='has-sub-menu'><a href = ''><div class='icon-w'><div class='os-icon os-icon-tasks-checked'></div></div><span>My Profile</span></a><ul class='sub-menu'><li><a  href='" + Page.ResolveUrl("~/Client_Panel/Client_profile_big.aspx") + "'>View Profile</a></li><li><a  href='#'>Change Password</a></li><li><a  href='" + Page.ResolveUrl("~/logout.aspx") + "'>Logout</a></li></ul></li>";

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["srv"] = "web";
        Response.Redirect("../Client_Panel/Default.aspx");
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Session["srv"] = "job";
        Response.Redirect("../Client_Panel/jobDashboard.aspx");
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Session["srv"] = "shp";
        Response.Redirect("../Client_Panel/EccmDashboard.aspx");
    }
}
