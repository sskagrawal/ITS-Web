using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Client_Panel_Service_List : System.Web.UI.Page
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


        DataTable dt = DataAccess.GetData("select * from [View_ClientServices] where [PartyID]=" + hdfUserID.Value + " ");
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




}