using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Client_Panel_RenewService : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {         


            if (Session["partyid"] != null)
            {
                hdfUserID.Value = Session["partyid"].ToString();
               // BindPartyProfile();
                BindSaleVoucherLISt();
            }
            else
            {
                Response.Redirect("~/default.aspx");
            }

        }
    }


    //public void BindPartyProfile()
    //{





    //}
    private void BindSaleVoucherLISt()
    {
        

        DataTable dt = DataAccess.GetData("select * from View_ClientServices where [PartyID]=" + hdfUserID.Value + " ");
        if (dt.Rows.Count > 0 && dt != null)
        {
            grdView.DataSource = dt;
            grdView.DataBind();


        }
        else
        {
        }
    }
    public string getExpiryDays(string servIddd, string purchDt)
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
        //    
        //        lnkBtnPayNow.Visible = true;
        //    }

        //}
    }
}