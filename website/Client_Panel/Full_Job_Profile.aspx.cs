using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
using System.Configuration;

public partial class Client_Panel_Full_Job_Profile : System.Web.UI.Page
{
    public DataTable dt;
    public DataTable dt2;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["partyid"] != null && Session["sridd"] != null)
            {
                hdfPartyid.Value = Session["partyid"].ToString();

                if (Session["ttppd"] != null)
                {
                    hdfusertypeid.Value = Session["ttppd"].ToString();

                    if (hdfusertypeid.Value == "2")  // Company
                    {
                        divProposalBtn.Visible = false;
                    }
                    else
                    {
                        divProposalBtn.Visible = true;

                    }

                }


                if (Request.QueryString["JID"] != string.Empty)
                {
                    jobid.Value = Request.QueryString["JID"].ToString();
                    bind_PostJob_List();
                    if(Request.QueryString["m"]!=null)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "show();", true);
                    }
                }

                CheckSentProposal();
                txtProposal_Desc.Height = 130;
                GetVisitorCounter();
                BindProposalList();
            }
            else
            {
                if (Request.QueryString["JID"] != null && Request.QueryString["m"] != null)
                {
                    Session["urrr"] = "~/Client_Panel/Full_Job_Profile.aspx?JID=" + Request.QueryString["JID"].ToString()+"&m=1";
                }

                Response.Redirect("~/Admin/Login.aspx");
            }

            
        }
    }

    public void GetVisitorCounter()
    {

        string MaxID = string.Empty;
        DataTable dt = DataAccess.GetData("select max(View_Counter) as 'Counter' from [View_FindJob]  ");
        if (dt.Rows.Count > 0)
        {
            MaxID = dt.Rows[0]["Counter"].ToString();

        }
        int maxNo = 0;
        if (MaxID == string.Empty)
        {
            maxNo = 1;
        }

        else
        {
            int parse = int.Parse(MaxID);
            maxNo = parse + 1;
        }

        SqlCommand cmd = new SqlCommand("Update [Job_Master] Set [View_Counter]=@View_Counter Where [job_Id]=" + jobid.Value + " ");
        cmd.Parameters.AddWithValue("@View_Counter", maxNo);
        DataAccess.InsertExecuteNonQuery(cmd);
        bind_PostJob_List();

    }

    public void CheckSentProposal()
    {
        string ProposlId = string.Empty;
        DataTable dtp = DataAccess.GetData("Select * from [Proposal_Master] Where  [PartyID] =" + hdfPartyid.Value + " and [job_Id]=" + jobid.Value + " ");
        if (dtp.Rows.Count > 0)
        {
            ProposlId = dtp.Rows[0]["Proposal_Id"].ToString();
            divProposalBtn.Visible = false;
            divProposalBtn2.Visible = true;

            proposalDiv.Visible = true;
            proposalStatus.InnerText = "Proposal " + dtp.Rows[0]["Status"].ToString();

            lblPrice.Text= dtp.Rows[0]["Price"].ToString();
            lblUnit.Text= dtp.Rows[0]["Time_Unit"].ToString();
            lblReqDeposit.Text= dtp.Rows[0]["DepositRequired"].ToString();
            lblProposalDesc.Text= dtp.Rows[0]["Proposal_Desc"].ToString();

            if(dtp.Rows[0]["Status"].ToString()== "Approved" || dtp.Rows[0]["Status"].ToString() == "Complete")
            {
                compContName.Visible = true;
                compContNo.Visible = true;
            }
            if (dtp.Rows[0]["Status"].ToString() == "Accepted")
            {
                proposalStatus.Attributes.Add("class", "mr-2 mb-2 btn btn-info btn-rounded");
            }
            //else if (dtp.Rows[0]["Status"].ToString() == "Approved")
            //{
            //    proposalStatus.Attributes.Add("class", "mr-2 mb-2 btn btn-warning btn-rounded");
            //}
            else if (dtp.Rows[0]["Status"].ToString() == "Complete" || dtp.Rows[0]["Status"].ToString() == "Approved")
            {
                proposalStatus.Attributes.Add("class", "mr-2 mb-2 btn btn-success btn-rounded");
            }
        }
    }  
    private void BindProposalList()
    {
        //and[PartyID] != "+hdfPartyid.Value+"
        DataTable dt = DataAccess.GetData("select * from [View_ProposalParty] where [job_Id]=" + jobid.Value + " and [PartyID] != " + hdfPartyid.Value + "");
        if(dt.Rows.Count>0)
        {
            foreach(DataRow dr in dt.Rows)
            {
                string profilePic = "../images/dummy.jpg";
                DataTable dtIm = DataAccess.GetData("Select * from  [PartyDocument_Master] where [PartyID]=" + dr["PartyID"].ToString() + " and [Document_Name]='Profile Photo'");
                if(dtIm.Rows.Count>0)
                {
                    if (dtIm.Rows[0]["Upload_File"].ToString() != string.Empty)
                    {
                        profilePic="../ClientContractDoc/" + dtIm.Rows[0]["Upload_File"].ToString();
                    }
                }
                string totProject = "0";
                DataTable dtTotPrj = DataAccess.GetData("select count(*) as totPrj from [Proposal_Master] where [PartyID]=" + dr["PartyID"].ToString() + " and [Status]='Accepted'");
                if(dtTotPrj.Rows.Count>0)
                {
                    totProject = dtTotPrj.Rows[0]["totPrj"].ToString();
                }
                ltrlProposals.Text += "<div class='profile-tile'><div class='profile-tile-box'><div class='pt-avatar-w'>";
                ltrlProposals.Text += "<img alt='' src='"+profilePic+"' /></div><div class='pt-user-name'>"+dr["Contact_person_name"].ToString()+"</div>";
                ltrlProposals.Text += "</div><div class='profile-tile-meta'><ul>";
                ltrlProposals.Text += "<li>Experiance:<strong>"+dr["Exp"].ToString()+"</strong></li>";
                ltrlProposals.Text += "<li>Complete Projects:<strong>"+totProject+"</strong></li>";
                ltrlProposals.Text += "<li>No of Feedback:<strong>2</strong></li></ul>";
                ltrlProposals.Text += "<div class='pt-btn'><a class='btn btn-success btn-sm' href='#'>Send Message</a></div>";
                ltrlProposals.Text += "</div></div>";
            }
        }

        DataTable dtProposalCount = DataAccess.GetData("select count(*) as totCount from [Proposal_Master] where [job_Id]=" + jobid.Value + "");
        if(dtProposalCount.Rows.Count>0)
        {
            lblProposalCount.Text = dtProposalCount.Rows[0]["totCount"].ToString();
        }
    }
    
    
     
    public void bind_PostJob_List()
    {


        dt = DataAccess.GetData("Select * from [View_FindJob] Where [job_Id] =" + jobid.Value + "");
        if (dt.Rows.Count > 0)
        {

        }

    }

    public DataTable BindJobSkill(string job_Id)
    {
        DataTable dtskill = DataAccess.GetData("Select distinct [Skill_Name] from [View_Post_Job_Skill] Where [job_Id]=" + job_Id + " ");
        return dtskill;

    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
       

        
            SqlCommand cmd = new SqlCommand("Insert into Proposal_Master ([job_Id],[PartyID],[Proposal_Desc],[Time_Unit],[Price],[DepositRequired],[CreatedOn],[Status]) Values (@job_Id,@PartyID,@Proposal_Desc, @Time_Unit,@Price,@DepositRequired,@CreatedOn,@Status) ");
            cmd.Parameters.AddWithValue("@job_Id", jobid.Value);
            cmd.Parameters.AddWithValue("@PartyID", hdfPartyid.Value);
            cmd.Parameters.AddWithValue("@Proposal_Desc", txtProposal_Desc.Text);
            cmd.Parameters.AddWithValue("@Time_Unit", ddlUnit.SelectedValue);

            if (txtFixPrice.Text != string.Empty)
            {
                cmd.Parameters.AddWithValue("@Price", txtFixPrice.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Price", "0");
            }



            if (txtDepositRequired.Text != string.Empty)
            {
                cmd.Parameters.AddWithValue("@DepositRequired", txtDepositRequired.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@DepositRequired", "0");
            }
            cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
            cmd.Parameters.AddWithValue("@Status", "Pending");
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMSG.Text = "Your Proposal Send Successfully";
        sendNotfToComp();
        CheckSentProposal();
        ClearField();
        bind_PostJob_List();

        ClientScript.RegisterStartupScript(this.GetType(), "alert", "hide();", true);

        // }



    }
    private void sendNotfToComp()
    {
        DataTable dtJobDet = DataAccess.GetData("Select * from [View_FindJob] Where [job_Id] =" + jobid.Value + "");
        if (dtJobDet.Rows.Count>0)
        {
            if(dtJobDet.Rows[0]["Email"].ToString()!=string.Empty)
            {
                DataTable dtUserDet = DataAccess.GetData("select * from [PartyMaster] where [PartyID]=" + hdfPartyid.Value + "");
                if(dtUserDet.Rows.Count>0)
                {
                    string _EmailBody = "Hi " + dtJobDet.Rows[0]["Contact_person_name"].ToString() + " ";
                    _EmailBody += "<br/><br/> You have received new proposal for your job " + dtJobDet.Rows[0]["job_Title"].ToString() + ".";
                    _EmailBody += "<br/><br/> Kindly review this proposal and let's get you job done quickly.";
                    _EmailBody += "<br/><br/> <strong>"+dtUserDet.Rows[0]["Contact_person_name"].ToString()+"</strong> has quoted for "+ txtFixPrice.Text + "  <a href='https://itsgwalior.com/Admin/Login.aspx'>View Proposal</a> ";


                    string from = ConfigurationManager.AppSettings["MailUsername"].ToString();
                    string To = dtJobDet.Rows[0]["Email"].ToString();//Convert.ToString(txtEmailId.Text);
                    string subject = "You have received new proposal for your job "+ dtJobDet.Rows[0]["job_Title"].ToString();
                    //  SendMail.SendEmail(from, To, subject, _EmailBody, "");
                    SendMail.SendWebEmail(from, To, subject, _EmailBody);
                    //lblMsg.Text = "Successfully Sent";

                }

                

                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }
        }
        
    }

    public void ClearField()
    {
        txtProposal_Desc.Text = string.Empty;   
        ddlUnit.ClearSelection();    
        txtFixPrice.Text = string.Empty;

    }
    private void BindProposalDet()
    {
        DataTable dt = DataAccess.GetData("select * from [Proposal_Master] where ");
    }

    //protected void btnSendMsg_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        SqlCommand cmd = new SqlCommand("INSERT INTO [JobWorkingDetail]([PartyId],[Messagedet],[JobId],[IsReplied],[AddedOn])VALUES(@PartyId,@Messagedet,@JobId,@IsReplied,@AddedOn)");
    //        cmd.Parameters.AddWithValue("@PartyId", hdfPartyid.Value);
    //        cmd.Parameters.AddWithValue("@Messagedet", txtMsg.Text);
    //        cmd.Parameters.AddWithValue("@JobId", jobid.Value);
    //        cmd.Parameters.AddWithValue("@IsReplied", false);
    //        //cmd.Parameters.AddWithValue("@ReplyStatus",);
    //        cmd.Parameters.AddWithValue("@AddedOn", DateTime.Now);
    //        DataAccess.InsertExecuteNonQuery(cmd);
    //        alert.Visible = true;
    //        lblMSG.Text = "Your Message Sent Successfully";

    //    }
    //    catch(Exception ex)
    //    {
    //        alert.Visible = true;
    //        lblMSG.Text = "Error : "+ex.Message;
    //    }
    //}

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("WorkStreamList.aspx?jID=" + jobid.Value);
    }
}