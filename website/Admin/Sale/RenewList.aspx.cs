using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Sale_RenewList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindSaleVoucherLISt();
        }
    }
    private void BindSaleVoucherLISt()
    {
        //string Query = string.Empty;
        //Query = "select * from [View_ClientServices] ";
        //string whereConcatenator = " WHERE ";

        //if (txtFromdate.Text != string.Empty)
        //{
        //    Query += whereConcatenator;
        //    Query += "  cast(VoucherDate as date) >='" + txtFromdate.Text.Trim() + "'";
        //    whereConcatenator = " and ";
        //}
        //if (txtTodate.Text != string.Empty)
        //{
        //    Query += whereConcatenator;
        //    Query += " cast(VoucherDate as date) <='" + txtTodate.Text.Trim() + "'";
        //    whereConcatenator = " and ";
        //}
        //if (drdSeacrchTP.SelectedValue == "1")
        //{
        //    Query += whereConcatenator;
        //    Query += "VoucherNo = '" + txtSearchValue.Text.Trim() + "'";
        //    whereConcatenator = " and ";
        //}
        //if (drdSeacrchTP.SelectedValue == "2")
        //{
        //    Query += whereConcatenator;
        //    Query += "Name like '" + txtSearchValue.Text.Trim() + "%'";
        //    whereConcatenator = " and ";
        //}
        //if (drdSeacrchTP.SelectedValue == "3")
        //{
        //    Query += whereConcatenator;
        //    Query += "MobileNo ='" + txtSearchValue.Text.Trim() + "'";
        //    whereConcatenator = " and ";
        //}

        ////if (drdSeacrchTP.SelectedValue != "")
        ////{
        //Query += whereConcatenator;
        //Query += "ID !='1'";
        ////    Query += whereConcatenator;
        ////    Query += "ProductName like '" + txtSerch.Text.Trim() + "%'";
        ////    //Query += "convert(varchar,[NewsDate],103)='" + txtSerch.Text.Trim() + "'";
        ////    whereConcatenator = "and ";
        ////}
        //Query += "order by VoucherMasterID desc";

        //DataTable dt = DataAccess.GetData(Query);* from [View_Demo]  order by [DemoId] desc

        DataTable dt = DataAccess.GetData("select * from View_ClientServices");
        if (dt.Rows.Count > 0 && dt != null)
        {
            grdView.DataSource = dt;
            grdView.DataBind();

            
        }
        else
        {

        }
    }
    public string getExpiryDays(string servIddd,string purchDt)
    {
        string ExpDays = string.Empty;

        if (purchDt != string.Empty)
        {
            DateTime regDt = Convert.ToDateTime(purchDt);           
            var remainingDays = regDt.Subtract(DateTime.Today).Days;               
            ExpDays = remainingDays.ToString();
              
        }
        return ExpDays;
    }
    protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //DataRowView drview = e.Row.DataItem as DataRowView;
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    HiddenField hdfStatus = (HiddenField)e.Row.FindControl("hdfStatus");
        //    Literal ltrStatus = (Literal)e.Row.FindControl("ltrStatus");

        //    if (hdfStatus.Value == "Paid")
        //    {
        //        ltrStatus.Text = "<div class='status-pill yellow' data-title='Paid' data-toggle='tooltip' data-original-title='' title='' style='background-color:#00FF01;'></div>";
        //    }
        //    else if (hdfStatus.Value == "Pending ")
        //    {
        //        ltrStatus.Text = "<div class='status-pill yellow' data-title='Pending' data-toggle='tooltip' data-original-title='' title=''  style='background-color:#FF0000;'></div>";
        //    }
        //    Label lblDueAmt = (Label)e.Row.FindControl("lblDueAmt");
        //    LinkButton lnkBtnPayNow = (LinkButton)e.Row.FindControl("lnkBtnPayNow");
        //    if (lblDueAmt.Text == "0" || lblDueAmt.Text == "0.00")
        //    {
        //        lnkBtnPayNow.Visible = false;
        //    }
        //    else
        //    {
        //        lnkBtnPayNow.Visible = true;
        //    }

        //}
    }
}