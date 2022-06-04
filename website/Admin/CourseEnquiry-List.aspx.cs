using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.IO;
using System.Security.Cryptography;
public partial class Admin_CourseEnquiry_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindCourseList();
            CustPager.Reload();
        }
    }
    
    private void bindCourseList()
    {
        

        DataTable dt = DataAccess.GetData("Select * from [CourseEnquiry_Master] ");
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
        bindCourseList();
        CustPager.Reload();
    }
    protected void Edit(object sender, ImageClickEventArgs e)
    {
     
        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfcorseEnId")).Value);
    

       if (btndetails.ID.Equals("imgbtnDelete"))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM [CourseEnquiry_Master]  WHERE  [CourseEnquiryId] =" + ID + "");
            DataAccess.InsertExecuteNonQuery(cmd);
        }
      
        bindCourseList();
        CustPager.Reload();
    }
    
}