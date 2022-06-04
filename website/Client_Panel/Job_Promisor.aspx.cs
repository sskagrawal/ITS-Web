using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Client_Panel_Job_Promisor : System.Web.UI.Page
{
    public DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["partyid"] != null)
            {
                hdfUserID.Value = Session["partyid"].ToString();

                hdfusertypeid.Value = Session["ttppd"].ToString();

                if (hdfusertypeid.Value == "3")
                {
                    BindJobPromisorList();
                }

            }

            else
            {
                Response.Redirect("~/default.aspx");
            }

        }
    }

    private void BindJobPromisorList()
    {

        DataTable dt = DataAccess.GetData("select * from [View_Proposal] where [ApplicantId]=" + hdfUserID.Value + " ");
        if (dt.Rows.Count > 0 && dt != null)
        {
            gvProposlList.DataSource = dt;
            gvProposlList.DataBind();
        }


    }
    protected void Edit_Click(object sender, EventArgs e)
    {
        ImageButton ImgBtnWork = sender as ImageButton;

        GridViewRow grdView = (GridViewRow)ImgBtnWork.NamingContainer;

        int Proposalid = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfJobId")).Value);

        
        Response.Redirect("Full_Job_Profile.aspx?JID=" + Proposalid);


    }



    protected void gvProposlList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hdfProposalDesc = (HiddenField)e.Row.FindControl("hdfProposalDesc");
            Label lblJobProposal = (Label)e.Row.FindControl("lblJobProposal");

            
                  HiddenField hdfjobId = (HiddenField)e.Row.FindControl("hdfJobId");

            string jobProposal = hdfProposalDesc.Value.ToString();
            int headingLength1 = jobProposal.Length;
            if (headingLength1 > 120)
            {
                string str1 = jobProposal.Substring(0, 120);
                lblJobProposal.Text = str1 + ".....<a href='Full_Job_Profile.aspx?JID="+ hdfjobId.Value+ "' style='text-decoration:none;'>View more</a> <br/> ";

            }


            Label lbldepositReq = (Label)e.Row.FindControl("lblDepostReq");

            Literal ltrDeposReq = (Literal)e.Row.FindControl("ltrDepReq");

            if (lbldepositReq.Text != string.Empty)
            {
                ltrDeposReq.Text = "<span>Deposit Required : </span>";
            }

            

            HiddenField hdfAppcantId = (HiddenField)e.Row.FindControl("hdfAppcantId");
            Label lblCompName = (Label)e.Row.FindControl("lblCompanyName");
            Literal ltrCompName = (Literal)e.Row.FindControl("ltrCompName");
            

            if (hdfAppcantId.Value != string.Empty)
            {

                DataTable dt = DataAccess.GetData("Select Party_name from [PartyMaster] Where [PartyID]=" + hdfAppcantId.Value + "   ");
                if (dt.Rows.Count > 0)
                {

                    ltrCompName.Text= dt.Rows[0]["Party_name"].ToString();
                }
            }



            HiddenField hdfstatus = (HiddenField)e.Row.FindControl("hdfStatus");

            Literal ltrstatus = (Literal)e.Row.FindControl("ltrStatus");
            Literal ltrlWrkStream = (Literal)e.Row.FindControl("ltrlWrkStream");

            if (hdfstatus.Value != string.Empty && hdfstatus.Value == "Pending")
            {
                ltrstatus.Text = "<div class='value-pair'><div class='value badge badge-pill badge-danger'>" + hdfstatus.Value + "</div></div>";
                
            }

            else
            {
                ltrstatus.Text = "<div class='value-pair'><div class='value badge badge-pill badge-success'>" + hdfstatus.Value + "</div></div>";

            }

            if (hdfstatus.Value != string.Empty && hdfstatus.Value == "Approved")
            {
                ltrlWrkStream.Text = "<a class='btn btn-outline-danger' href='WorkStreamList.aspx?jID=" + hdfjobId.Value + "'><i class='fa fa-comments'></i> <span>Work Stream</span></a>";
            }


        }
    }
}