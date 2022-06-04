using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Client_Panel_Billing_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            // BindSaleVoucherLISt();


            //if (Session["sridd"] != null)
            //{
            //    hdfUserID.Value = Session["sridd"].ToString();              
            //    BindServiceLISt();
            //}
            if (Session["partyid"] != null)
            {
                hdfUserID.Value = Session["partyid"].ToString();
                BindSaleVoucherLISt();

            }


            else
            {
                Response.Redirect("~/default.aspx");
            }





        }
    }

    private void BindSaleVoucherLISt()
    {
        //string Query = string.Empty;
        //Query = "select * from [View_VoucherMST] ";
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

       
        //Query += whereConcatenator;

        //Query += whereConcatenator;
        //Query += "ID !='1'";
       
        //Query += "order by VoucherMasterID desc";


        DataTable dt = DataAccess.GetData("Select * from [View_VoucherMST] where [PartyID]=" + hdfUserID.Value + " and ID !='1' order by VoucherMasterID desc   ");
      //  DataTable dt = DataAccess.GetData(Query);
        if (dt.Rows.Count > 0 && dt != null)
        {
            grdView.DataSource = dt;
            grdView.DataBind();

            //int TotalPage = dt.Rows.Count;
            //CustPager.TotalRecords = TotalPage;
            //CustPager.TotalPage = TotalPage % grdView.PageSize == 0 ? TotalPage / grdView.PageSize : TotalPage / grdView.PageSize + 1;
        }
        else
        {
        }
    }
    //protected void CustPager_PageChanged(object sender, CustomPageChangeArgs e)
    //{
    //    grdView.PageSize = e.CurrentPageSize;
    //    grdView.PageIndex = e.CurrentPageNumber - 1;
    //    BindSaleVoucherLISt();
    //    CustPager.Reload();
    //}
    protected void Edit(object sender, ImageClickEventArgs e)
    {
       
        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfVCHMST")).Value);
        HiddenField hdfStatus = (HiddenField)grdView.FindControl("hdfStatus");
        HiddenField hdfPartyID = (HiddenField)grdView.FindControl("hdfPartyID");

        //if (btndetails.ID.Equals("imgbtnUpdate"))
        //{
           
        //    Response.Redirect("~/Admin/Sale/CreateSaleVoucher.aspx?SaleID=" + ID);
        //}
        //else if (btndetails.ID.Equals("imgbtnDelete"))
        //{
        //    SqlCommand cmdDV = new SqlCommand("DELETE FROM [VoucherDetails]  WHERE  VoucherDetailsID =" + ID + "");
        //    DataAccess.InsertExecuteNonQuery(cmdDV);
        //    SqlCommand cmdVM = new SqlCommand("DELETE FROM [VoucherMaster]  WHERE  VoucherMasterID =" + ID + "");
        //    DataAccess.InsertExecuteNonQuery(cmdVM);
        //    SqlCommand cmdOC = new SqlCommand("DELETE FROM [OtherCharges]  WHERE  VoucherMasterID =" + ID + "");
        //    DataAccess.InsertExecuteNonQuery(cmdOC);
        //}
        if (btndetails.ID.Equals("imgbtnPayment"))
        {
            Response.Redirect("~/Admin/Payment/RecivedPayment.aspx?sID=" + ID + "&PID=" + hdfPartyID.Value);
        }
        BindSaleVoucherLISt();

    }
    private string Encrypt(string clearText)
    {
        string EncryptionKey = "MAKV2SPBNI99212";
        byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(clearBytes, 0, clearBytes.Length);
                    cs.Close();
                }
                clearText = Convert.ToBase64String(ms.ToArray());
            }
        }
        return clearText;
    }

    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("CreateSaleVoucher.aspx");
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindSaleVoucherLISt();
    }
    protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        DataRowView drview = e.Row.DataItem as DataRowView;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hdfStatus = (HiddenField)e.Row.FindControl("hdfStatus");
            Literal ltrStatus = (Literal)e.Row.FindControl("ltrStatus");

            if (hdfStatus.Value == "Paid")
            {
                ltrStatus.Text = "<div class='status-pill yellow' data-title='Paid' data-toggle='tooltip' data-original-title='' title='' style='background-color:#00FF01;'></div>";
            }
            else if (hdfStatus.Value == "Pending ")
            {
                ltrStatus.Text = "<div class='status-pill yellow' data-title='Pending' data-toggle='tooltip' data-original-title='' title=''  style='background-color:#FF0000;'></div>";
            }
            Label lblDueAmt = (Label)e.Row.FindControl("lblDueAmt");
            LinkButton lnkBtnPayNow = (LinkButton)e.Row.FindControl("lnkBtnPayNow");
            if (lblDueAmt.Text == "0" || lblDueAmt.Text == "0.00")
            {
                lnkBtnPayNow.Visible = false;
            }
            else
            {
                lnkBtnPayNow.Visible = true;
            }

        }
    }
    protected void btn_back(object sender, EventArgs e)
    {
        Response.Redirect("AddParty.aspx");

    }

    protected void lnkBtnPayNow_Click(object sender, EventArgs e)
    {

    }

    protected void lnkBtnPayNow_Click1(object sender, EventArgs e)
    {
        LinkButton btndetails = sender as LinkButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfVCHMST")).Value);
        Response.Redirect("~/Admin/Payment/RecivedPayment.aspx?sID=" + ID + "&PID=" + ID);
    }
}