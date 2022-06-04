using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class PrintReciept : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["PrId"] != null) 
        {
            hdfRegID.Value = Request.QueryString["PrId"].ToString();
            BindDetail();
        }
    }

    private void BindDetail()
    {
        DataTable dt = DataAccess.GetData("select * from [View_PaymentDetails] where [Trans_Id]=" + hdfRegID.Value + "");
        if (dt.Rows.Count > 0)
        {
            lblBillNo.Text = dt.Rows[0]["RecipNo"].ToString();
            lblDate.Text = string.Format("{0:dd/MM/yyyy}", dt.Rows[0]["Date"]);
            lblAmount.Text = dt.Rows[0]["GrandTotal"].ToString();            
                lblPartAmount.Text = dt.Rows[0]["GrandTotal"].ToString();
            //  lblPartAmount.Text = dt.Rows[0]["DepositAmt"].ToString();
            lblRAmt.Text = dt.Rows[0]["VMasterDp"].ToString();
            DueAmt.Text = dt.Rows[0]["VMasterDue"].ToString();
            lblParticular.Text = dt.Rows[0]["PaymentMode"].ToString();

            string PartyID = dt.Rows[0]["PartyID"].ToString();
            if (PartyID != string.Empty)
            {
                DataTable dtt = DataAccess.GetData("Select * from PartyMaster where [PartyID]='" + PartyID+"'");
                if (dtt.Rows.Count > 0 && dtt != null)
                {
                    lblCustName.Text = dtt.Rows[0]["Party_name"].ToString();
                    lblMobNo.Text = dtt.Rows[0]["mobile_no"].ToString();

                }
            }

        }
    }
}