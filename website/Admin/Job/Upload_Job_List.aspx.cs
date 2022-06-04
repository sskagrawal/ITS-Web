using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Upload_Job_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_Job_grdView();
        }

    }



    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Bind_Job_grdView();
    }

    private void Bind_Job_grdView()
    {

        string Query = string.Empty;
        //Query = "select * from [View_PostJobList]";  
        Query = "select * from [View_JobPosting]";
        string whereConcatenator = "WHERE ";


        if (drdSearch.SelectedValue == "Name")
        {
            Query += whereConcatenator;
            Query += "Name like'" + txtSearchValue.Text + "%'";
            whereConcatenator = "and ";
        }


        if (drdSearch.SelectedValue == "Mobile")
        {
            Query += whereConcatenator;
            Query += "Mobile like'" + txtSearchValue.Text + "%'";
            whereConcatenator = "and ";
        }

        else if (drdSearch.SelectedValue == "CompanyName")
        {
            Query += whereConcatenator;
            Query += "CompanyName like'" + txtSearchValue.Text + "%'";
            whereConcatenator = "and ";
        }


       

        if (txtOpendate.Text != string.Empty)
        {
            Query += whereConcatenator;
            Query += "cast(jobopen_Date as date)='" + Convert.ToDateTime(txtOpendate.Text) + "'";
            whereConcatenator = " and ";
        }

        if (txtClosedate.Text != string.Empty)
        {
            Query += whereConcatenator;
            Query += "cast(jobClose_Date as date)='" + Convert.ToDateTime(txtClosedate.Text) + "'";
            whereConcatenator = " and ";
        }
       
        Query += whereConcatenator + "JobCategory!='JobSheeker' ";
        Query += " order by [OrderPosition] ASC ";

        DataTable dt = DataAccess.GetData(Query);

       
        //   DataTable dt = DataAccess.GetData("select * from [View_PostJobList] where  JobCategory !='JobSheeker' order by job_Id desc");
        if (dt.Rows.Count > 0 && dt != null)
        {
            grdView.DataSource = dt;
            grdView.DataBind();

            int TotalPage = dt.Rows.Count;
            CustPager.TotalRecords = TotalPage;
            CustPager.TotalPage = TotalPage % grdView.PageSize == 0 ? TotalPage / grdView.PageSize : TotalPage / grdView.PageSize + 1;
        }
    }
    protected void CustPager_PageChanged(object sender, CustomPageChangeArgs e)
    {
        grdView.PageSize = e.CurrentPageSize;
        grdView.PageIndex = e.CurrentPageNumber - 1;
        Bind_Job_grdView();   //bindBranchList();
        CustPager.Reload();
       
    }
    protected void Edit(object sender, ImageClickEventArgs e)
    {
        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;

        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfID")).Value);

        if (btndetails.ID.Equals("imgbtnUpdate"))
        {
            Response.Redirect("~/Admin/Job/Upload_job.aspx?PID=" + ID);

        }
        else if (btndetails.ID.Equals("imgbtnDelete"))
        {

            SqlCommand cmd = new SqlCommand("DELETE FROM [Job_Master]  WHERE  [job_Id] =" + ID + "");
            DataAccess.InsertExecuteNonQuery(cmd);
        }

        else if(btndetails.ID.Equals("imgbtnsetorder"))
        {
         
            Response.Redirect("~/Admin/adminjb/set-job-order.aspx?jid=" + ID);
           
        }

        Bind_Job_grdView();
        CustPager.Reload();
    }





    protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
    {

      
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            
            Label lblOrderId = (Label)e.Row.FindControl("lblOrderId");
            HiddenField hdfOrderId = (HiddenField)e.Row.FindControl("hdfOrderId");

            if (hdfOrderId.Value != string.Empty && hdfOrderId.Value != "999")
            {
                lblOrderId.Visible = true;


            }
            else
            {

                lblOrderId.Visible = false;
            }
         
          

        }

    }
}