using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Client_Panel_My_Job_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["partyid"] != null)
            {
                hdfUserID.Value = Session["partyid"].ToString();
                BindJobList();

            }

            else
            {
                Response.Redirect("~/default.aspx");
            }

        }
    }
    private void BindJobList()
    {
        DataTable dt = DataAccess.GetData("select * from [View_FindJob] where [PartyID]=" + hdfUserID.Value + " ");
        if (dt.Rows.Count > 0 && dt != null)
        {
            gvMyJobList.DataSource = dt;
            gvMyJobList.DataBind();
        }

        else
        {

            //dt.Rows.Add(dt.NewRow());

            //gvMyJobList.DataSource = dt;

            //gvMyJobList.DataBind();

            //int TotalColumns = gvMyJobList.Rows[0].Cells.Count;

            //gvMyJobList.Rows[0].Cells.Clear();

            //gvMyJobList.Rows[0].Cells.Add(new TableCell());

            //gvMyJobList.Rows[0].Cells[0].ColumnSpan = TotalColumns;

            //gvMyJobList.Rows[0].Cells[0].Text = "No records Found";



        }


    }


    protected void Edit_Click(object sender, EventArgs e)
    {
        ImageButton ImgBtnWork = sender as ImageButton;

        GridViewRow grdView = (GridViewRow)ImgBtnWork.NamingContainer;

        int jobid = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfjobid")).Value);

        if (ImgBtnWork.ID.Equals("imgbtnEdit"))
        {

            Response.Redirect("Post-Job.aspx?PID=" + jobid);
        }

        else if (ImgBtnWork.ID.Equals("ImgbtnDelete"))
        {
            try
            {

                SqlCommand cmd = new SqlCommand("delete from [Job_Master] where [job_Id]=" + jobid + "");
                DataAccess.InsertExecuteNonQuery(cmd);

                alert.Visible = true;
                lblMSG.Text = "Job Successfully Deleted";
                alert.Attributes.Add("class", "alert alert-success alert-dismissable");
                BindJobList();
            }

            catch (Exception ex)
            {

                alert.Visible = true;
                lblMSG.Text = ex.Message;
            }



        }

    }

    protected void gvMyJobList_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hdfjobid = (HiddenField)e.Row.FindControl("hdfjobid");
            Label lblSkill = (Label)e.Row.FindControl("lblSkill");
            Literal ltrskill = (Literal)e.Row.FindControl("ltrskill");


            DataTable dt = DataAccess.GetData(" Select * from [View_Post_Job_Skill] where [job_Id]=" + hdfjobid.Value + "  ");
            if (dt.Rows.Count > 0)
            {
                ltrskill.Text += "<ul class='nav nav-pills smaller hidden-sm-down' style='flex-direction:column;'>";
                foreach (DataRow dr1 in dt.Rows)
                {                   
                    ltrskill.Text += "<li class='nav-item' style='padding-top:2px;'><a class='nav-link active'>" + dr1["Skill_Name"].ToString() + "</a></li>";
                }
                ltrskill.Text += "</ul>";
            }

            Literal ltrlProposals = (Literal)e.Row.FindControl("ltrlProposals");
            DataTable dtProposalCount = DataAccess.GetData("select count(*) as totCount from [Proposal_Master] where [job_Id]=" + hdfjobid.Value + "");
            if (dtProposalCount.Rows.Count > 0)
            {
                if(Convert.ToInt32(dtProposalCount.Rows[0]["totCount"])>0)
                {
                    ltrlProposals.Text = "<a href='Proposal_List.aspx?jid=" + hdfjobid.Value + "'>" + dtProposalCount.Rows[0]["totCount"].ToString() + "</a>";
                }
                else
                {
                    ltrlProposals.Text = "";
                }
                
            }

        }
    }
}