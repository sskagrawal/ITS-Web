using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class Admin_NewsList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_News_grdView();
        }

    }

    private void Bind_News_grdView()
    {
        DataTable dt = DataAccess.GetData("select * from [News_Master] order by CreatedOn desc");
        if (dt.Rows.Count > 0 && dt != null)
        {
            grdView.DataSource = dt;
            grdView.DataBind();

            int TotalPage = dt.Rows.Count;
            CustPager.TotalRecords = TotalPage;
            CustPager.TotalPage = TotalPage % grdView.PageSize == 0 ? TotalPage / grdView.PageSize : TotalPage / grdView.PageSize + 1;
        }
        else
        {
        }
    }
    protected void CustPager_PageChanged(object sender, CustomPageChangeArgs e)
    {
        grdView.PageSize = e.CurrentPageSize;
        grdView.PageIndex = e.CurrentPageNumber - 1;
        Bind_News_grdView();
        CustPager.Reload();
    }
    protected void Edit(object sender, ImageClickEventArgs e)
    {
        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;

        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfID")).Value);

        if (btndetails.ID.Equals("imgbtnUpdate"))
        {
            Response.Redirect("~/Admin/AddUpdateNews.aspx?PID=" + ID);
           
        }


       



        else if (btndetails.ID.Equals("imgbtnDelete"))
        {

            SqlCommand cmd = new SqlCommand("DELETE FROM [News_Master]  WHERE  News_Id =" + ID + "");
            DataAccess.InsertExecuteNonQuery(cmd);

         
        }
        Bind_News_grdView();
    }
}