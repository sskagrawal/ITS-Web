using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Client_Panel_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {           
            if (Session["partyid"] != null)
            {
                hdfpartyid.Value = Session["partyid"].ToString();
                //  BindMessage();
                bindtotalService();
                bindtotalInvoice();
                bindSerRenewDate();
                BindServiceLISt();
            }
            else
            {
                Response.Redirect("~/default.aspx");
            }
        }
    }

    public void bindtotalService()
    {
        DataTable dt = DataAccess.GetData("select count(SerID) as 'totalService' from [View_ClientServices] where [PartyID]=" + hdfpartyid.Value + " ");
        if (dt.Rows.Count > 0)
        {
            lbltotalService.Text = dt.Rows[0]["totalService"].ToString();
        }
    }


    public void bindtotalInvoice()
    {
        DataTable dt = DataAccess.GetData("select count(VoucherMasterID) as 'totalInvoice'  from [View_VoucherMST] where [PartyID]=" + hdfpartyid.Value + " ");
        //  DataTable dt = DataAccess.GetData("select count(SerID) as 'totalService' from [View_ClientServices] where [PartyID]=" + hdfpartyid.Value + " ");
        if (dt.Rows.Count > 0)
        {
            lbltotalInvoice.Text = dt.Rows[0]["totalInvoice"].ToString();
        }
    }


    public void bindSerRenewDate()
    {
        DataTable dt = DataAccess.GetData("select Distinct [NextReNewdate] from [View_ClientServices] where [PartyID]=" + hdfpartyid.Value + " ");
        //  DataTable dt = DataAccess.GetData("select count(SerID) as 'totalService' from [View_ClientServices] where [PartyID]=" + hdfpartyid.Value + " ");
        if (dt.Rows.Count > 0)
        {
            lblRenewDate.Text = Convert.ToDateTime(dt.Rows[0]["NextReNewdate"]).ToString("dd-MM-yyyy");
        }
    }


    private void BindServiceLISt()
    {


        DataTable dt = DataAccess.GetData("select * from [View_ClientServices] where [PartyID]=" + hdfpartyid.Value + " ");
        if (dt.Rows.Count > 0 && dt != null)
        {
            grdView.DataSource = dt;
            grdView.DataBind();


        }
        else
        {
        }
    }



    public double Amount = 0;
    protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblAmt = (Label)e.Row.FindControl("lblAmt");
            Label lblSprice = (Label)e.Row.FindControl("lblSprice");
            if (lblAmt.Text != string.Empty)
            {
                Amount += Convert.ToDouble(lblAmt.Text);

            }

        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblPriceP = (Label)e.Row.FindControl("lblPriceP");

            if (Amount != 0)
            {
                lblPriceP.Text = Convert.ToString(Amount);
            }


        }
    }


    // lblRenewDate
    //public void BindMessage()
    //{

    //    DataTable dt = DataAccess.GetData("Select [PrjAmount],[PrjAdvAmt] from [PartyMaster] Where [PartyID]=" + hdfpartyid.Value+" ");
    //    if (dt.Rows.Count > 0)
    //    {
    //        lbltotalProjrctCost.Text = dt.Rows[0]["PrjAmount"].ToString();
    //        lblAdavanceAmt.Text = dt.Rows[0]["PrjAdvAmt"].ToString();
    //    }


    //}
}