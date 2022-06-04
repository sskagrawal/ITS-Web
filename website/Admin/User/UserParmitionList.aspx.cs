using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_User_UserParmitionList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindUserParmition();
        }
    }

    private void BindUserParmition()
    {
        //string Query = string.Empty;
        //Query = "select * from [UserDetails] ";
        //string whereConcatenator = " WHERE ";

        //if (txtFromdate.Text != string.Empty)
        //{
        //    Query += whereConcatenator;
        //    Query += "  cast(Createon as date) >='" + txtFromdate.Text.Trim() + "'";
        //    whereConcatenator = " and ";
        //}
        //if (txtTodate.Text != string.Empty)
        //{
        //    Query += whereConcatenator;
        //    Query += " cast(Createon as date) <='" + txtTodate.Text.Trim() + "'";
        //    whereConcatenator = " and ";
        //}
        //if (drdSeacrchTP.SelectedValue == "1")
        //{
        //    Query += whereConcatenator;
        //    Query += "Name like '" + txtSearchValue.Text.Trim() + "%'";
        //    whereConcatenator = " and ";
        //}
        //if (drdSeacrchTP.SelectedValue == "2")
        //{
        //    Query += whereConcatenator;
        //    Query += "MobileNo ='" + txtSearchValue.Text.Trim() + "'";
        //    whereConcatenator = " and ";
        //}

        ////if (drdSeacrchTP.SelectedValue != "")
        ////{
        //Query += whereConcatenator;
        //Query += "UserTypeID !='1'";
        ////    Query += whereConcatenator;
        ////    Query += "ProductName like '" + txtSerch.Text.Trim() + "%'";
        ////    //Query += "convert(varchar,[NewsDate],103)='" + txtSerch.Text.Trim() + "'";
        ////    whereConcatenator = "and ";
        ////}
        //Query += "order by Createon desc";

        // DataTable dt = DataAccess.GetData(Query);

        DataTable dt = DataAccess.GetData("Select * from View_RolesParmition");//order by CreateOn  DESC
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
        BindUserParmition();
        CustPager.Reload();
    }
    protected void Edit(object sender, ImageClickEventArgs e)
    {
        //LinkButton btndetails = sender as LinkButton;
        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfBookingID")).Value);
        HiddenField hdfStatus = (HiddenField)grdView.FindControl("hdfStatus");

        if (btndetails.ID.Equals("imgbtnUpdate"))
        {
            //Response.Redirect(string.Format("~/Admin/AddUpdateUser.aspx?UID=" + ID));
        }
        else if (btndetails.ID.Equals("imgbtnDelete"))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM [User_Grant_Roles]  WHERE  User_Permission_ID =" + ID + "");
            DataAccess.InsertExecuteNonQuery(cmd);
        }
        BindUserParmition();

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindUserParmition();
    }
}