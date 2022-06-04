using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_Payment_OnlinePaymentList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindGrid();
            CustPager.DataBind();
        }
    }
    private void BindGrid()
    {
        DataTable dt = DataAccess.GetData("select * from [OnlinePaymentDetail] order by [OnlinePaymentID] desc");
        if(dt.Rows.Count>0)
        {
            grdEmp.DataSource = dt;
            grdEmp.DataBind();

            int TotalPage = dt.Rows.Count;
            CustPager.TotalRecords = TotalPage;
            CustPager.TotalPage = TotalPage % grdEmp.PageSize == 0 ? TotalPage / grdEmp.PageSize : TotalPage / grdEmp.PageSize + 1;

        }
    }
    protected void CustPager_PageChanged(object sender, CustomPageChangeArgs e)
    {
        grdEmp.PageSize = e.CurrentPageSize;
        grdEmp.PageIndex = e.CurrentPageNumber - 1;
        BindGrid();
    }
}