using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Client_Panel_Invoice_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["partyid"] != null)
            {
                hdfUserID.Value = Session["partyid"].ToString();
                BindInvoiceList();

            }

            else
            {
                Response.Redirect("~/default.aspx");
            }

        }
    }
    private void BindInvoiceList()
    {
        DataTable dt = DataAccess.GetData("select * from [View_VoucherMST] where [PartyID]=" + hdfUserID.Value + " ");
        if (dt.Rows.Count > 0 && dt != null)
        {
            grdView.DataSource = dt;
            grdView.DataBind();
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

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton btndetails = sender as LinkButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;

        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfID")).Value);

        if (btndetails.ID.Equals("LinkButton1"))
        {
            Response.Redirect("~/Client_Panel/Invoice.aspx?vmid=" + ID);
        } 

      

    }



    protected void linkVouvher_Click(object sender, EventArgs e)
    {
        LinkButton btndetails = sender as LinkButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;

        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfID")).Value);


        if (btndetails.ID.Equals("linkVoucherNo"))
        {
            Response.Redirect("~/Client_Panel/Invoice.aspx?vmid=" + ID);
        }
    }


    //protected void lnkBtnPayNow_Click1(object sender, EventArgs e)
    //{
    //    LinkButton btndetails = sender as LinkButton;
    //    GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;
    //  int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfTrans_id")).Value);

    //    Response.Redirect("~/Client_Panel/Invoice-List.aspx");
    //}

}