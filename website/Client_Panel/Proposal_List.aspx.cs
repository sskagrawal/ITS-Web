using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Client_Panel_Proposal_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["partyid"] != null)
            {
                hdfUserID.Value = Session["partyid"].ToString();
                
                BindProposalList();

            }

            else
            {
                Response.Redirect("~/default.aspx");
            }

        }
    }

    private void BindProposalList()
    {
        string qry = string.Empty;
        if(Request.QueryString["jid"] != null)
        {
            if(Request.QueryString["jid"].ToString() != string.Empty)
            {
                qry = "select * from [View_Proposal] where [PartyID]=" + hdfUserID.Value + " and [job_Id]="+ Request.QueryString["jid"].ToString() + " ";
            }
            else
            {
                qry = "select * from [View_Proposal] where [PartyID]=" + hdfUserID.Value + " ";
            }
        }
        else
        {
            qry = "select * from [View_Proposal] where [PartyID]=" + hdfUserID.Value + " ";
        }

        DataTable dt = DataAccess.GetData(qry);
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

        int Proposalid = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfProposalid")).Value);

        if (ImgBtnWork.ID.Equals("imgbtnView"))
        {

            Response.Redirect("ViewProposal.aspx?PSLID=" + Proposalid);
        }

      

    }



    protected void gvProposlList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hdfProposalDesc = (HiddenField)e.Row.FindControl("hdfProposalDesc");
            Label lblJobProposal = (Label)e.Row.FindControl("lblJobProposal");

              HiddenField hdfProposlId= (HiddenField)e.Row.FindControl("hdfProposalid");
            HiddenField hdfJobID = (HiddenField)e.Row.FindControl("hdfJobID");

            string jobProposal = hdfProposalDesc.Value.ToString();
            int headingLength1 = jobProposal.Length;
            if (headingLength1 > 120)
            {
                string str1 = jobProposal.Substring(0, 120);
                lblJobProposal.Text = str1 + ".....<a href='ViewProposal.aspx?PSLID="+ hdfProposlId.Value + "' style='text-decoration:none;'>View more</a> <br/> ";

            }


            Label lbldepositReq = (Label)e.Row.FindControl("lblDepostReq");

            Literal ltrDeposReq = (Literal)e.Row.FindControl("ltrDepReq");

            Literal ltrlWrkStream = (Literal)e.Row.FindControl("ltrlWrkStream");

            if (lbldepositReq.Text != string.Empty)
            {
                ltrDeposReq.Text = "<span>Deposite Req:</span>";
            }


            HiddenField hdfstatus = (HiddenField)e.Row.FindControl("hdfStatus");

            Literal ltrstatus = (Literal)e.Row.FindControl("ltrStatus");
            Literal Literal1 = (Literal)e.Row.FindControl("Literal1");

            if (hdfstatus.Value != string.Empty && hdfstatus.Value == "Pending")
            {
                ltrstatus.Text = "<div class='value-pair'><div class='value badge badge-pill badge-danger'>" + hdfstatus.Value + "</div></div>";
               // Literal1.Text = "<a class='btn btn-outline-primary' href='ViewProposal.aspx?PSLID=" + hdfProposlId.Value + "'><i class='fa fa-hand-o-right'></i><span> Accept</span></a>";
            }

            else if(hdfstatus.Value== "Accepted")
            {
                ltrstatus.Text = "<div class='value-pair'><div class='value badge badge-pill badge-success'>" + hdfstatus.Value + "</div></div>";
                //Literal1.Text = "<a class='btn btn-outline-primary' href='ViewProposal.aspx?PSLID=" + hdfProposlId.Value + "'><i class='fa fa-hand-o-right'></i><span> Approve</span></a>";

            }
            else if (hdfstatus.Value == "Approved")
            {
                ltrstatus.Text = "<div class='value-pair'><div class='value badge badge-pill badge-success'>" + hdfstatus.Value + "</div></div>";
                // Literal1.Text = "<a class='btn btn-outline-primary' href='ViewProposal.aspx?PSLID=" + hdfProposlId.Value + "'><i class='fa fa-hand-o-right'></i><span> Complete</span></a>";
                ltrlWrkStream.Text = "<a class='btn btn-outline-danger' href='WorkStreamList.aspx?jID=" + hdfJobID.Value + "&pid="+hdfProposlId.Value+ "'><i class='fa fa-comments'></i> <span>Work Stream</span></a>";
            }
            else if (hdfstatus.Value == "Complete")
            {
                ltrstatus.Text = "<div class='value-pair'><div class='value badge badge-pill badge-success'>" + hdfstatus.Value + "</div></div>";
               // Literal1.Text = "<a class='btn btn-outline-primary' href='ViewProposal.aspx?PSLID=" + hdfProposlId.Value + "'><i class='fa fa-hand-o-right'></i><span> View</span></a>";

            }
            Literal1.Text = "<a class='btn btn-outline-primary' href='ViewProposal.aspx?PSLID=" + hdfProposlId.Value + "'><i class='fa fa-hand-o-right'></i><span> View</span></a>";

        }
}
}