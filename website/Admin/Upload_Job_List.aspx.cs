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

    private void Bind_Job_grdView()
    {
        DataTable dt = DataAccess.GetData("select * from [Job_Master] where  JobCategory !='JobSheeker'");
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
        //bindBranchList();
        CustPager.Reload();
        Bind_Job_grdView();
    }
    protected void Edit(object sender, ImageClickEventArgs e)
    {
        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;

        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfID")).Value);

        if (btndetails.ID.Equals("imgbtnUpdate"))
        {
            Response.Redirect("~/Admin/Upload_job.aspx?PID=" + ID);

        }
        else if (btndetails.ID.Equals("imgbtnDelete"))
        {

            SqlCommand cmd = new SqlCommand("DELETE FROM [Job_Master]  WHERE  [job_Id] =" + ID + "");
            DataAccess.InsertExecuteNonQuery(cmd);


        }
        Bind_Job_grdView();
        CustPager.Reload();
    }
}