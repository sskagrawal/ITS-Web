using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
using System.Web.Services;
using System.Configuration;
using System.Web.Script.Services;

public partial class Client_Panel_ViewProposal : System.Web.UI.Page
{
    public DataTable dt;
    public DataTable dt2;
    public string jobid = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["partyid"] != null)
            {
                if (Request.QueryString["PSLID"] != null)
                {
                    hdfCompPartyId.Value = Session["partyid"].ToString();
                    hdfPslId.Value = Request.QueryString["PSLID"].ToString();
                    BindEmpProposal();
                    CheckAgainAcceptProposal();
                    BindProposalList();
                }
            }
            else
            {
                Response.Redirect("~/Admin/Login.aspx");
            }

        }
    }


    public void CheckAgainAcceptProposal()
    {

        string ProposlStatus = string.Empty;
        DataTable dtp = DataAccess.GetData("Select * from [Proposal_Master] Where  [Proposal_Id] =" + hdfPslId.Value + " ");
        if (dtp.Rows.Count > 0)
        {
            ProposlStatus = dtp.Rows[0]["Status"].ToString();
            if (ProposlStatus == "Accepted")
            {
                //alert.Visible = true;
                //lblMSG.Text = "Proposal Prevously Accepted";
                btnAcceptProp.Visible = false;
                btnView.Visible = true;
                btnApproveJob.Visible = true;
            }
            else if(ProposlStatus == "Approved")
            {
                btnAcceptProp.Visible = false;
                btnView.Visible = true;
                btnApproveJob.Visible = false;
                DataTable dtWork = DataAccess.GetData("select * from View_JobWorkDetails where JobId=" + dtp.Rows[0]["job_Id"].ToString() + " and ReplyStatus='Work Done'");
                if(dtWork.Rows.Count>0)
                {
                    btnCompJob.Visible = true;
                    feedbkDiv.Visible = true;
                }
                
                hdfStatus.Value = dtp.Rows[0]["Status"].ToString();
                contRow.Visible = true;

            }
            else if (ProposlStatus == "Complete")
            {
                btnAcceptProp.Visible = false;
                btnView.Visible = true;
                btnApproveJob.Visible = false;
                btnCompJob.Visible = false;
                txtFeedbackDesc.Text= dtp.Rows[0]["FeedackDesc"].ToString();
                txtFeedbackDesc.Enabled = false;
                hdfStatus.Value= dtp.Rows[0]["Status"].ToString();
                hdfRatingVal.Value = dtp.Rows[0]["FeedbackRating"].ToString();
                feedbkDiv.Visible = true;
                contRow.Visible = true;
            }
            else if (ProposlStatus == "Pending")
            {
                btnAcceptProp.Visible = true;
                btnView.Visible = false;
                btnApproveJob.Visible = false;
                btnCompJob.Visible = false;
            }
        }


    }

    public void BindEmpProposal()
    {

        DataTable dt = DataAccess.GetData("Select * from [View_Proposal] Where [Proposal_Id]="+ hdfPslId.Value + "");
        if (dt.Rows.Count > 0)
        {
            lblEmpName.Text = dt.Rows[0]["Contact_person_name"].ToString();
            lblContNo.Text= dt.Rows[0]["mobile_no"].ToString();
            lblExperience.Text = dt.Rows[0]["Exp"].ToString();
           // lblFeedback.Text = dt.Rows[0]["Status"].ToString();
            lblCityName.Text = dt.Rows[0]["City"].ToString();
            lblUnit.Text = dt.Rows[0]["Time_Unit"].ToString();
            lblPrice.Text = dt.Rows[0]["Price"].ToString();
            lblReqDeposit.Text = dt.Rows[0]["DepositRequired"].ToString();
            lblProposalDate.Text = Convert.ToDateTime(dt.Rows[0]["CreatedOn"]).ToString("dd-MM-yyyy");
            lblProposalDesc.Text = dt.Rows[0]["Proposal_Desc"].ToString();
            hdfjobId.Value= dt.Rows[0]["job_Id"].ToString();
            jobid= dt.Rows[0]["job_Id"].ToString();
            hdfpartyid.Value = dt.Rows[0]["ApplicantId"].ToString();
            bind_PostJob_List();
        }


    }

    public void bind_PostJob_List()
    {
        dt = DataAccess.GetData("Select * from [View_FindJob] Where [job_Id] =" + hdfjobId.Value + " and   JobCategory !='JobSheeker' and  [Exp] IS NOT NULL and [MimiSalery] IS NOT NULL and [job_Qulalification]IS NOT NULL order by CreatedOn desc ");
        if (dt.Rows.Count > 0)
        {

            lblJobtitle.Text = dt.Rows[0]["job_Title"].ToString();
            lbljobpostingDate.Text = Convert.ToDateTime(dt.Rows[0]["CreatedOn"]).ToString("dd-MM-yyyy");
            lblPostedBy.Text = dt.Rows[0]["Party_name"].ToString();
            lbljobCity.Text = dt.Rows[0]["CityID"].ToString();
            lblJobExp.Text = dt.Rows[0]["Exp"].ToString();
            lbljobposition.Text = dt.Rows[0]["Position"].ToString();
            lblBudget.Text = dt.Rows[0]["MimiSalery"].ToString();
            lbljobQualification.Text = dt.Rows[0]["job_Qulalification"].ToString();
            lbljobType.Text = dt.Rows[0]["JobType"].ToString();
            lblJobField.Text = dt.Rows[0]["Industry"].ToString();
            lblJobDesc.Text = dt.Rows[0]["job_Desc"].ToString();

        }

    }

    protected void btnAcceptProp_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Update [Proposal_Master] SET [Status]=@Status Where [Proposal_Id]=" + hdfPslId.Value + " ");
        cmd.Parameters.AddWithValue("@Status","Accepted");
        DataAccess.InsertExecuteNonQuery(cmd);
        alert.Visible = true;
        lblMSG.Text = "Proposal Acceped Successfully";
        btnAcceptProp.Visible = false;
        btnView.Visible = true;
        btnApproveJob.Visible = true;
        sendAcceptNotfToJobseeker();
        sendAccptNotfToAdmn();

    }
    private void sendAcceptNotfToJobseeker()
    {
        DataTable dtJobDet = DataAccess.GetData("Select * from [PartyMaster] Where [PartyID]="+hdfpartyid.Value+" ");
        if (dtJobDet.Rows.Count > 0)
        {
            foreach (DataRow dr in dtJobDet.Rows)
            {
                if (dr["Email"].ToString() != string.Empty)
                {
                    //DataTable dtUserDet = DataAccess.GetData("Select * from [View_FindJob] Where [job_Id] =" + hdfjobId.Value + "");
                    //if (dtUserDet.Rows.Count > 0)
                    //{
                        string _EmailBody = "Hi " + dr["Contact_person_name"].ToString() + ", ";
                        _EmailBody += "<br/><br/> Your proposal is accepted by "+ lblPostedBy.Text + " for "+ lblJobtitle.Text + ".";
                       // _EmailBody += "<br/><br/> You have been invited to send proposal for the project " + txtJobTitle.Text + ".";
                        _EmailBody += "<br/><br/> <a href='https://itsgwalior.com/Admin/Login.aspx'>View Detail</a> ";
                        _EmailBody += "<br/><br/><br/><br/>Thank You";
                        _EmailBody += "<br/><br/>ITS Gwalior Support Team";


                        string from = ConfigurationManager.AppSettings["MailUsername"].ToString();
                        string To = dr["Email"].ToString();//Convert.ToString(txtEmailId.Text);
                        string subject = "Congratulation your Proposal is accepted by "+lblPostedBy.Text+" ";
                        //  SendMail.SendEmail(from, To, subject, _EmailBody, "");
                        SendMail.SendWebEmail(from, To, subject, _EmailBody);
                        //lblMsg.Text = "Successfully Sent";

                    //}



                    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                }
            }

        }

    }
    private void sendApprovNotfToJobseeker()
    {
        DataTable dtJobDet = DataAccess.GetData("Select * from [PartyMaster] Where [PartyID]=" + hdfpartyid.Value + " ");
        if (dtJobDet.Rows.Count > 0)
        {
            foreach (DataRow dr in dtJobDet.Rows)
            {
                if (dr["Email"].ToString() != string.Empty)
                {
                    //DataTable dtUserDet = DataAccess.GetData("Select * from [View_FindJob] Where [job_Id] =" + hdfjobId.Value + "");
                    //if (dtUserDet.Rows.Count > 0)
                    //{
                        string _EmailBody = "Hi " + dr["Contact_person_name"].ToString() + ", ";
                        _EmailBody += "<br/><br/> Your proposal is approved by " + lblPostedBy.Text + " for " + lblJobtitle.Text + ".";
                        // _EmailBody += "<br/><br/> You have been invited to send proposal for the project " + txtJobTitle.Text + ".";
                        _EmailBody += "<br/><br/> <a href='https://itsgwalior.com/Admin/Login.aspx'>View Detail</a> ";
                        _EmailBody += "<br/><br/><br/><br/>Thank You";
                        _EmailBody += "<br/><br/>ITS Gwalior Support Team";


                        string from = ConfigurationManager.AppSettings["MailUsername"].ToString();
                        string To = dr["Email"].ToString();//Convert.ToString(txtEmailId.Text);
                        string subject = "Congratulation your Proposal is approved by " + lblPostedBy.Text + " ";
                        //  SendMail.SendEmail(from, To, subject, _EmailBody, "");
                        SendMail.SendWebEmail(from, To, subject, _EmailBody);
                        //lblMsg.Text = "Successfully Sent";

                    //}



                    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                }
            }

        }

    }
    private void sendComplNotfToJobseeker()
    {
        DataTable dtJobDet = DataAccess.GetData("Select * from [PartyMaster] Where [PartyID]=" + hdfpartyid.Value + " ");
        if (dtJobDet.Rows.Count > 0)
        {
            foreach (DataRow dr in dtJobDet.Rows)
            {
                if (dr["Email"].ToString() != string.Empty)
                {
                    //DataTable dtUserDet = DataAccess.GetData("Select * from [View_FindJob] Where [job_Id] =" + hdfjobId.Value + "");
                    //if (dtUserDet.Rows.Count > 0)
                    //{
                        string _EmailBody = "Hi " + dr["Contact_person_name"].ToString() + ", ";
                        _EmailBody += "<br/><br/> Your proposal is Complete by " + lblPostedBy.Text + " for " + lblJobtitle.Text + ".";
                        // _EmailBody += "<br/><br/> You have been invited to send proposal for the project " + txtJobTitle.Text + ".";
                        _EmailBody += "<br/><br/> <a href='https://itsgwalior.com/Admin/Login.aspx'>View Detail</a> ";
                        _EmailBody += "<br/><br/><br/><br/>Thank You";
                        _EmailBody += "<br/><br/>ITS Gwalior Support Team";


                        string from = ConfigurationManager.AppSettings["MailUsername"].ToString();
                        string To = dr["Email"].ToString();//Convert.ToString(txtEmailId.Text);
                        string subject = "Congratulation your Proposal is complete by " + lblPostedBy.Text + " ";
                        //  SendMail.SendEmail(from, To, subject, _EmailBody, "");
                        SendMail.SendWebEmail(from, To, subject, _EmailBody);
                        //lblMsg.Text = "Successfully Sent";

                    //}



                    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                }
            }

        }
    }

    private void sendAccptNotfToAdmn()
    {
        DataTable dtJobDet = DataAccess.GetData("Select * from [PartyMaster] Where [PartyID]=" + hdfpartyid.Value + " ");
        if (dtJobDet.Rows.Count > 0)
        {
            //DataTable dtUserDet = DataAccess.GetData("Select * from [View_FindJob] Where [job_Id] =" + hdfjobId.Value + "");
            //if (dtUserDet.Rows.Count > 0)
            //{
                string _EmailBody = "Hi Admin";
                _EmailBody += "<br/><br/>Proposal of "+dtJobDet.Rows[0]["Contact_person_name"].ToString()+" for job "+lblJobtitle.Text+" is accepted by "+lblPostedBy.Text+"";
                // _EmailBody += "<br/><br/> You have been invited to send proposal for the project " + txtJobTitle.Text + ".";
                _EmailBody += "<br/><br/> <a href='https://itsgwalior.com/Admin/Login.aspx'>View Details</a> ";
                _EmailBody += "<br/><br/><br/><br/>Thank You";
                _EmailBody += "<br/><br/>ITS Gwalior Support Team";


                string from = ConfigurationManager.AppSettings["MailUsername"].ToString();
                string To = ConfigurationManager.AppSettings["AdminMailID"].ToString();
                string subject = "Proposal is accepted by " + lblPostedBy.Text;
                //  SendMail.SendEmail(from, To, subject, _EmailBody, "");
                SendMail.SendWebEmail(from, To, subject, _EmailBody);
                //lblMsg.Text = "Successfully Sent";

           // }
        }


        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);


    }

    private void sendApprvNotfToAdmn()
    {
        DataTable dtJobDet = DataAccess.GetData("Select * from [PartyMaster] Where [PartyID]=" + hdfpartyid.Value + " ");
        if (dtJobDet.Rows.Count > 0)
        {
            //DataTable dtUserDet = DataAccess.GetData("Select * from [View_FindJob] Where [job_Id] =" + hdfjobId.Value + "");
            //if (dtUserDet.Rows.Count > 0)
            //{
            string _EmailBody = "Hi Admin";
            _EmailBody += "<br/><br/>Proposal of " + dtJobDet.Rows[0]["Contact_person_name"].ToString() + " for job " + lblJobtitle.Text + " is approved by " + lblPostedBy.Text + "";
            // _EmailBody += "<br/><br/> You have been invited to send proposal for the project " + txtJobTitle.Text + ".";
            _EmailBody += "<br/><br/> <a href='https://itsgwalior.com/Admin/Login.aspx'>View Details</a> ";
            _EmailBody += "<br/><br/><br/><br/>Thank You";
            _EmailBody += "<br/><br/>ITS Gwalior Support Team";


            string from = ConfigurationManager.AppSettings["MailUsername"].ToString();
            string To = ConfigurationManager.AppSettings["AdminMailID"].ToString();
            string subject = "Proposal is approved by " + lblPostedBy.Text;
            //  SendMail.SendEmail(from, To, subject, _EmailBody, "");
            SendMail.SendWebEmail(from, To, subject, _EmailBody);
            //lblMsg.Text = "Successfully Sent";

            // }
        }


        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);


    }
    private void sendCompNotfToAdmn()
    {
        DataTable dtJobDet = DataAccess.GetData("Select * from [PartyMaster] Where [PartyID]=" + hdfpartyid.Value + " ");
        if (dtJobDet.Rows.Count > 0)
        {
            //DataTable dtUserDet = DataAccess.GetData("Select * from [View_FindJob] Where [job_Id] =" + hdfjobId.Value + "");
            //if (dtUserDet.Rows.Count > 0)
            //{
            string _EmailBody = "Hi Admin";
            _EmailBody += "<br/><br/>Proposal of " + dtJobDet.Rows[0]["Contact_person_name"].ToString() + " for job " + lblJobtitle.Text + " is Completed by " + lblPostedBy.Text + "";
            // _EmailBody += "<br/><br/> You have been invited to send proposal for the project " + txtJobTitle.Text + ".";
            _EmailBody += "<br/><br/> <a href='https://itsgwalior.com/Admin/Login.aspx'>View Details</a> ";
            _EmailBody += "<br/><br/><br/><br/>Thank You";
            _EmailBody += "<br/><br/>ITS Gwalior Support Team";


            string from = ConfigurationManager.AppSettings["MailUsername"].ToString();
            string To = ConfigurationManager.AppSettings["AdminMailID"].ToString();
            string subject = "Proposal is complete by " + lblPostedBy.Text;
            //  SendMail.SendEmail(from, To, subject, _EmailBody, "");
            SendMail.SendWebEmail(from, To, subject, _EmailBody);
            //lblMsg.Text = "Successfully Sent";

            // }
        }


        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);


    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        Response.Redirect("Client_profile_big.aspx?pId=" + hdfpartyid.Value + "&uTp="+ 3);
    }

    protected void btnApproveJob_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Update [Proposal_Master] SET [Status]=@Status Where [Proposal_Id]=" + hdfPslId.Value + " ");
        cmd.Parameters.AddWithValue("@Status", "Approved");
        DataAccess.InsertExecuteNonQuery(cmd);
        alert.Visible = true;
        lblMSG.Text = "Proposal Approved Successfully";
        btnCompJob.Visible = true;
        btnApproveJob.Visible = false;
        sendApprovNotfToJobseeker();
        sendApprvNotfToAdmn();
        CheckAgainAcceptProposal();
    }
    private void BindProposalList()
    {
        //and[PartyID] != "+hdfPartyid.Value+"
        DataTable dt = DataAccess.GetData("select top 5 * from [View_ProposalParty] where [job_Id]=" + hdfjobId.Value + " order by [Proposal_Id] desc ");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                string profilePic = "../images/dummy.jpg";
                DataTable dtIm = DataAccess.GetData("Select * from  [PartyDocument_Master] where [PartyID]=" + dr["PartyID"].ToString() + " and [Document_Name]='Profile Photo'");
                if (dtIm.Rows.Count > 0)
                {
                    if (dtIm.Rows[0]["Upload_File"].ToString() != string.Empty)
                    {
                        profilePic = "../ClientContractDoc/" + dtIm.Rows[0]["Upload_File"].ToString();
                    }
                }
                //string totProject = "0";
                //DataTable dtTotPrj = DataAccess.GetData("select count(*) as totPrj from [Proposal_Master] where [PartyID]=" + dr["PartyID"].ToString() + " and [Status]='Accepted'");
                //if (dtTotPrj.Rows.Count > 0)
                //{
                //    totProject = dtTotPrj.Rows[0]["totPrj"].ToString();
                //}
                string totCompletePrj = "0";
                DataTable dtTotCompPrj = DataAccess.GetData("select count(*) as totCompPrj from [Proposal_Master] where [PartyID]=" + dr["PartyID"].ToString() + " and [Status]='Complete'");
                if (dtTotCompPrj.Rows.Count > 0)
                {
                    totCompletePrj = dtTotCompPrj.Rows[0]["totCompPrj"].ToString();
                }
                string totFeedback = "0";
                DataTable dtFeedback = DataAccess.GetData("select count(*) totFeedback from [Proposal_Master] where [FeedackDesc] is not null and [FeedbackRating] is not null and [PartyID]=" + dr["PartyID"].ToString() + " and [Status]='Complete'");
                if(dtFeedback.Rows.Count>0)
                {
                    totFeedback = dtFeedback.Rows[0]["totFeedback"].ToString();
                }
                ltrlProposals.Text += "<div class='profile-tile'><div class='profile-tile-box'><div class='pt-avatar-w'>";
                ltrlProposals.Text += "<img alt='' src='" + profilePic + "' /></div><div class='pt-user-name'><a href='Client_profile_big.aspx?pId="+ dr["PartyID"].ToString() + "&uTp=3'>" + dr["Contact_person_name"].ToString() + "</a></div>";
                ltrlProposals.Text += "</div><div class='profile-tile-meta'><ul>";
                ltrlProposals.Text += "<li>Experiance:<strong>" + dr["Exp"].ToString() + "</strong></li>";
                ltrlProposals.Text += "<li>Complete Projects:<strong>" + totCompletePrj + "</strong></li>";
                ltrlProposals.Text += "<li>No of Feedback:<strong>"+totFeedback+"</strong></li></ul>";
                ltrlProposals.Text += "<div class='pt-btn'><a class='btn btn-success btn-sm' href='ViewProposal.aspx?PSLID=" + dr["Proposal_Id"].ToString() + "'>View Proposal</a></div>";
                ltrlProposals.Text += "</div></div>";
            }
        }

        DataTable dtProposalCount = DataAccess.GetData("select count(*) as totCount from [Proposal_Master] where [job_Id]=" + hdfjobId.Value + "");
        if (dtProposalCount.Rows.Count > 0)
        {
            lblProposalCount.Text = dtProposalCount.Rows[0]["totCount"].ToString();
        }
    }
    [WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProposalRating> saveratigg(string iPId, string iUserRating)
    {
        List<ProposalRating> BooksRatings = new List<ProposalRating>();
        try {
            SqlCommand cmd = new SqlCommand("update [Proposal_Master] set [FeedbackRating]=@FeedbackRating where [Proposal_Id]=@Proposal_Id");
            cmd.Parameters.AddWithValue("@FeedbackRating", iUserRating);
           // cmd.Parameters.AddWithValue("@FeedackDesc", DBNull.Value);
            cmd.Parameters.AddWithValue("@Proposal_Id", iPId);
            DataAccess.InsertExecuteNonQuery(cmd);

            
            string sQuery = "SELECT COUNT(FeedbackRating) TotalRatings, " +
                "ISNULL(CAST(CAST(SUM(FeedbackRating) AS NUMERIC(5,2)) / COUNT(FeedbackRating) AS NUMERIC(3,1)), 0) AverageRate " +
                "FROM [Proposal_Master] " + "WHERE Proposal_Id = " + iPId;

            ProposalRating obj_p = new ProposalRating();
            DataTable dt = DataAccess.GetData(sQuery);
            if (dt.Rows.Count > 0)
            {
                
                obj_p.AvgRatings = Convert.ToDouble(dt.Rows[0]["AverageRate"]);
                obj_p.TotalRatings = Convert.ToInt32(dt.Rows[0]["TotalRatings"]);

                //BooksRatings.Add(new ProposalRating
                //{
                //    TotalRatings = Convert.ToInt32(dt.Rows[0]["TotalRatings"]),
                //    AvgRatings = Convert.ToDouble(dt.Rows[0]["AverageRate"])
                //});
            }
            BooksRatings.Add(obj_p);
        }
        catch(Exception ex)
        {

        }
        return BooksRatings;
        //string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        //using (SqlConnection con = new SqlConnection(constr))
        //{
        //    using (SqlCommand cmd = new SqlCommand("INSERT INTO UserRatings VALUES(@Rating)"))
        //    {
        //        using (SqlDataAdapter sda = new SqlDataAdapter())
        //        {
        //            cmd.CommandType = CommandType.Text;
        //            cmd.Parameters.AddWithValue("@Rating", rating);
        //            cmd.Connection = con;
        //            con.Open();
        //            cmd.ExecuteNonQuery();
        //            con.Close();
        //        }
        //    }
        //}
    }
    [WebMethod]
    public static List<ProposalRating> getTotalRatings(int iPId)
    {
        List<ProposalRating> BooksRatings = new List<ProposalRating>();
        string sQuery = "SELECT COUNT(FeedbackRating) TotalRatings, " +
               "ISNULL(CAST(CAST(SUM(FeedbackRating) AS NUMERIC(5,2)) / COUNT(FeedbackRating) AS NUMERIC(3,1)), 0) AverageRate " +
               "FROM [Proposal_Master] " + "WHERE Proposal_Id = " + iPId;

        DataTable dt = DataAccess.GetData(sQuery);
        if(dt.Rows.Count>0)
        {
            BooksRatings.Add(new ProposalRating
            {
                TotalRatings = Convert.ToInt32(dt.Rows[0]["TotalRatings"]),
                AvgRatings = Convert.ToDouble(dt.Rows[0]["AverageRate"])
            });
        }
        return BooksRatings;
        //SqlConnection myConn = new SqlConnection(sConnString);
        //SqlCommand objComm = new SqlCommand(sQuery, myConn);

        //myConn.Open();

        //SqlDataReader reader = objComm.ExecuteReader();
        //if (reader.Read())
        //{
        //    BooksRatings.Add(new ProposalRating
        //    {
        //        TotalRatings = Convert.ToInt32(reader["TotalRatings"]),
        //        AvgRatings = Convert.ToDouble(reader["AverageRate"])
        //    });
        //}

        //myConn.Close();
    }


    protected void btnCompJob_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtFeedbackDesc.Text != string.Empty)
            {
                SqlCommand cmd = new SqlCommand("update [Proposal_Master] set [FeedackDesc]=@FeedackDesc,[Status]=@Status,[FeedbackRating]=@FeedbackRating where [Proposal_Id]=@Proposal_Id");
                cmd.Parameters.AddWithValue("@FeedbackRating", hdfRatingVal.Value);
                cmd.Parameters.AddWithValue("@FeedackDesc", txtFeedbackDesc.Text);
                cmd.Parameters.AddWithValue("@Proposal_Id", hdfPslId.Value);
                cmd.Parameters.AddWithValue("@Status", "Complete");
                DataAccess.InsertExecuteNonQuery(cmd);

                alert.Visible = true;
                lblMSG.Text = "Job Completed Successfully";
                btnCompJob.Visible = false;

                
                btnCompJob.Visible = false;
                //txtFeedbackDesc.Text = dtp.Rows[0]["FeedackDesc"].ToString();
                txtFeedbackDesc.Enabled = false;
                hdfStatus.Value = "Complete";
                //hdfRatingVal.Value = dtp.Rows[0]["FeedbackRating"].ToString();
                feedbkDiv.Visible = true;
                contRow.Visible = true;

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "bindStar();", true);
                sendCompNotfToAdmn();
                sendComplNotfToJobseeker();

            }
            else
            {
                alert.Visible = true;
                lblMSG.Text = "Please Enter Feedback Description";
            }
        }
        catch(Exception ex)
        {
            alert.Visible = true;
            lblMSG.Text = "Error : "+ex.Message;
        }
    }
}
public class ProposalRating
{
    public int TotalRatings = 0;
    public double AvgRatings = 0;
}