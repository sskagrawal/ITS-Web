using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
public partial class Client_Panel_PaymentHisoty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e) 
    {
        if (!IsPostBack)
        {


            if (Session["partyid"] != null)
            {
                hdfUserID.Value = Session["partyid"].ToString();
                BindServiceLISt();

            }


            else
            {
                Response.Redirect("~/default.aspx");
            }

        }
    }



    private void BindServiceLISt()
    {


        DataTable dt = DataAccess.GetData("select * from [Mst_Acct_Ledger] where [Party_Id]=" + hdfUserID.Value + " ");
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

    protected void lnkBtnPayNow_Click1(object sender, EventArgs e)
    {
        LinkButton btndetails = sender as LinkButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfTrans_id")).Value);
        //HiddenField hdfPartyID = (HiddenField)grdView.FindControl("hdfPartyID");
        //Response.Redirect("~/Client_Panel/Invoice-List.aspx?trns_id=" + ID );
        Response.Redirect("~/Client_Panel/Invoice-List.aspx");
    }
}