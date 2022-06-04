using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Job_AppliedJob : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridView();
        }
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindGridView();
    }

    private void BindGridView()
    {


        string Query = string.Empty;
        Query = "select * from [View_JobApplye]";

        string whereConcatenator = "WHERE ";


        if (drdSearch.SelectedValue == "Name")
        {
            Query += whereConcatenator;
            Query += "Name like'" + txtSearchValue.Text.Trim() + "%'";
            whereConcatenator = "and ";
        }


        if (drdSearch.SelectedValue == "MobileNo")
        {
            Query += whereConcatenator;
            Query += "MobileNo like'" + txtSearchValue.Text.Trim() + "%'";
            whereConcatenator = "and ";
        }


        if (drdSearch.SelectedValue == "job_Title")
        {
            Query += whereConcatenator;
            Query += "job_Title like'" + txtSearchValue.Text.Trim() + "%'";
            whereConcatenator = "and ";
        }

        //else if (drdSearch.SelectedValue == "CompanyName")
        //{
        //    Query += whereConcatenator;
        //    Query += "CompanyName like'" + txtSearchValue.Text + "%'";
        //    whereConcatenator = "and ";
        //}




        if (txtJobPostdate.Text != string.Empty)
        {
            Query += whereConcatenator;
            Query += "cast(CreateOn as date)='" + Convert.ToDateTime(txtJobPostdate.Text.Trim()) + "'";
            whereConcatenator = " and ";
        }

        //if (txtClosedate.Text != string.Empty)
        //{
        //    Query += whereConcatenator;
        //    Query += "cast(jobClose_Date as date)='" + Convert.ToDateTime(txtClosedate.Text) + "'";
        //    whereConcatenator = " and ";
        //}

        //Query += whereConcatenator + "JobCategory!='JobSheeker' ";
        Query += " order by [ID] desc ";

        DataTable dt = DataAccess.GetData(Query);

        //DataTable dt = DataAccess.GetData("Select * from [View_JobApplye] order by [ID] desc");
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
        BindGridView();
        CustPager.Reload();

    }

    public string GetCompName(object ReqID)
    {
        string compName = string.Empty;
        if (ReqID.ToString() != string.Empty)
        {
            DataTable dtCompName = DataAccess.GetData("select [UserName],[CompanyName] from [UserDetails] where [ID]=" + ReqID.ToString()+"");
            if(dtCompName.Rows.Count>0)
            {
                compName = dtCompName.Rows[0]["UserName"].ToString();
                if (dtCompName.Rows[0]["CompanyName"].ToString() != string.Empty)
                {
                    compName += " - "+ dtCompName.Rows[0]["CompanyName"].ToString();
                }
            }
        }

        return compName;
    }

    protected void Edit(object sender, ImageClickEventArgs e)
    {

        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;

        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfApplyJobID")).Value);
        SqlCommand cmd = new SqlCommand("DELETE FROM [JobApply]  WHERE  [ID] =" + ID + "");
            DataAccess.InsertExecuteNonQuery(cmd);



        BindGridView();
        CustPager.Reload();
    }

}