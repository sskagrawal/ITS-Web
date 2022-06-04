using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_Sale_Invoice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(Request.QueryString["vId"]!=null)
            {
                hdfVMId.Value = Request.QueryString["vId"].ToString();
                BindData();
            }
        }
    }
    private void BindData()
    {
        DataTable dt = DataAccess.GetData("select * from View_VoucherMST where VoucherMasterID=" + hdfVMId.Value+"");
        if(dt.Rows.Count>0)
        {
            lblPartyName.Text = dt.Rows[0]["Party_name"].ToString();
            lblPartyAddr.Text= dt.Rows[0]["PartyAddress"].ToString();
            lblMobNo.Text= dt.Rows[0]["mobile_no"].ToString();
            lblInvNo.Text= dt.Rows[0]["VoucherNo"].ToString();
            hdfAmount.Value= dt.Rows[0]["Amount"].ToString();
            hdfgstAmt.Value = dt.Rows[0]["gst_Amount"].ToString();
            hdfdisAmt.Value = dt.Rows[0]["Discount"].ToString();
            hdfgrandtotal.Value = dt.Rows[0]["GrandTotal"].ToString();
            lblGstNo.Text = dt.Rows[0]["Gst_no"].ToString();


            if (dt.Rows[0]["VoucherDate"].ToString()!=string.Empty)
            {
                lblinvDate.Text = Convert.ToDateTime(dt.Rows[0]["VoucherDate"]).ToString("dd/MM/yyyy");
            }
            //lblPayStatus.Text = dt.Rows[0]["PaymentStatus"].ToString();
            if (dt.Rows[0]["DueAmt"].ToString() == "0" || dt.Rows[0]["DueAmt"].ToString() == "0.00")
            {
                lblPayStatus.ForeColor = System.Drawing.Color.Green;
                lblPayStatus.Text = "Paid";

            }
            else
            {
                lblPayStatus.ForeColor = System.Drawing.Color.Red;
                lblPayStatus.Text = "UnPaid";
            }

            lblStateCityPnd.Text= dt.Rows[0]["City"].ToString()+","+ dt.Rows[0]["State_Name"].ToString()+","+ dt.Rows[0]["pincode"].ToString();

          



            //Voucher Mater table save  
            bool isgst = false;

            if(dt.Rows[0]["is_gst"].ToString()!=string.Empty && dt.Rows[0]["is_gst"].ToString() == "True")
            {
                isgst = true;

            }
            DataTable dtServ = DataAccess.GetData("select * from [View_VchMasterWithVchDet] where  [VoucherMasterID]=" + hdfVMId.Value + " ");
            if(dtServ.Rows.Count>0)
            {
                grdView.DataSource = dtServ;
                grdView.DataBind();

                //foreach(DataRow dr in dtServ.Rows)
                //{

                //    if(dr["Gst"].ToString()!=string.Empty && Convert.ToDouble(dr["Gst"].ToString()) >0)
                //    {
                //        isgst = true;
                //        break;
                //    }
                //}
            }
            string sqlQry = string.Empty;
            if(isgst)
            {
                sqlQry = "select * from [Company_detail] where [IsGst]='GST' ";
            }
            else
            {
                sqlQry = "select * from [Company_detail] where [IsGst]='Non GST' ";
            }
            DataTable dtComp = DataAccess.GetData(sqlQry);
            if(dtComp.Rows.Count>0)
            {
                lblCompanyName.Text = dtComp.Rows[0]["CompanyName"].ToString();
                lblcompAddr.Text= dtComp.Rows[0]["CompAddr"].ToString();
                lblCompMobNo.Text= dtComp.Rows[0]["ContactNo"].ToString();
                lblCompStCit.Text= dtComp.Rows[0]["CompPinCode"].ToString();
                imgPrf.ImageUrl= "~/companiesLogo/" + dtComp.Rows[0]["CompLogo"].ToString();

                lblAccNo.Text= dtComp.Rows[0]["AccNo"].ToString();
                lblBankName.Text= dtComp.Rows[0]["BankName"].ToString();
                lblIfscCode.Text= dtComp.Rows[0]["IfscCode"].ToString();
                lblAccHolderName.Text= dtComp.Rows[0]["AccHolderName"].ToString();
                lblCompGstNo.Text= dtComp.Rows[0]["GstNo"].ToString();

                if(isgst)
                {
                    lblGstText.Visible = true;
                }
                else
                {
                    lblGstText.Visible = false;
                }
            }

        }
    }

    double totAmt = 0;
    double totGst = 0;
    double grandTot = 0;
    double disc = 0;
    protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
      
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblSubTot = (Label)e.Row.FindControl("lblSubTot");
            Label lblGst = (Label)e.Row.FindControl("lblGst");
            Label lblGrandTot = (Label)e.Row.FindControl("lblGrandTot");
            Label lbldisc = (Label)e.Row.FindControl("lbldisc");

            lblSubTot.Text = hdfAmount.Value.ToString();
            lblGst.Text = hdfgstAmt.Value.ToString();
            lblGrandTot.Text = hdfgrandtotal.Value.ToString();
            lbldisc.Text = hdfdisAmt.Value.ToString();
        }
    }
}