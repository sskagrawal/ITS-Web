using Amity.ERP_Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Payment_AddPayment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindParty();
            txtReceiveeD.Text = DateTime.Now.ToString("dd-MM-yyyy");
            string MaxRID = string.Empty;
            string ID_RFormat = string.Empty;
            ID_Generator ID_RGen = new ID_Generator();

            try
            {
                MaxRID = DataAccess.GetSingleValue("select top 1 [RecipNo] from [Mst_Acct_Ledger]  order by [Trans_Id] desc");
            }
            catch { }
            ID_RFormat = "Rec-00000";
            lblinVoice.Text = ID_RGen.GenrateProductID(MaxRID, ID_RFormat);
            if (Request.QueryString["sID"] != null && Request.QueryString["PID"] != null)
            {
                hdfPartyID.Value = Request.QueryString["PID"].ToString();
                BindParty();
                drdParty.SelectedValue = hdfPartyID.Value;
                BindPartDetails();
                BindRecive();
                PayDiv.Visible = true;
                gvDetails.Visible = false;
                hdfVoucerMST.Value = Request.QueryString["sID"].ToString();
                BindAmount();

            }
        }

    }

    private void BindParty()
    {
        drdParty.Items.Clear();
        ListItem item1 = new ListItem();
        item1.Value = "0";
        item1.Text = "--Select--";
        drdParty.Items.Add(item1);
        DataTable dt = DataAccess.GetData("Select * from PartyMaster where Is_active='1' and Party_Type='4' ");
        if (dt.Rows.Count > 0 && dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["PartyID"].ToString();
                item.Text = dr["Party_name"].ToString();
                drdParty.Items.Add(item);
            }

        }
    }
    public int Amount = 0;
    public int SpRice = 0;
    public int GstAmt = 0;
    protected void gvDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    Label lblAmt = (Label)e.Row.FindControl("lblAmt");
        //    Label lblSprice = (Label)e.Row.FindControl("lblSprice");
        //    Label lblGSTPrice = (Label)e.Row.FindControl("lblGSTPrice");
        //    if (lblAmt.Text != string.Empty)
        //    {
        //        Amount += Convert.ToInt32(lblAmt.Text);
        //        // DEmochargeAmount = Convert.ToInt32(lblCAmt.Text);
        //        txtTotAmt.Text = Convert.ToString(Amount);
        //        txtGtAmt.Text = Convert.ToString(Amount); txtGrandTAmt.Text = Convert.ToString(Amount);
        //    }
        //    if (lblSprice.Text != string.Empty)
        //    {
        //        SpRice += Convert.ToInt32(lblSprice.Text);

        //    }
        //    if (lblGSTPrice.Text != string.Empty)
        //    {
        //        GstAmt += Convert.ToInt32(lblGSTPrice.Text);
        //    }
        //}
        //if (e.Row.RowType == DataControlRowType.Footer)
        //{
        //    Label lblPriceP = (Label)e.Row.FindControl("lblPriceP");
        //    Label lblGstAmt = (Label)e.Row.FindControl("lblGstAmt");
        //    Label lblTAmt = (Label)e.Row.FindControl("lblTAmt");
        //    if (Amount != 0)
        //    {
        //        lblTAmt.Text = Convert.ToString(Amount);
        //    }
        //    if (SpRice != 0)
        //    {
        //        lblPriceP.Text = Convert.ToString(SpRice);
        //    }
        //    if (GstAmt != 0)
        //    {
        //        lblGstAmt.Text = Convert.ToString(GstAmt);
        //    }

        //}
    }
    protected void Printf(object sender, EventArgs e)
    {
        ImageButton imgBtn = sender as ImageButton;
        GridViewRow grdRow = (GridViewRow)imgBtn.NamingContainer;
        //int hdfWorktransId = Convert.ToInt32(((HiddenField)(grdRow.FindControl("hdfWorkTransID"))).Value);
        HiddenField hdfPayMID = (HiddenField)grdRow.FindControl("hdfPayMID");
        //Label lblTamount = (Label)grdRow.FindControl("lblTamount");
        //Label lblDUAmt = (Label)grdRow.FindControl("lblDUAmt");
        //Label lblDpAmt = (Label)grdRow.FindControl("lblDpAmt");

        if (imgBtn.ID.Equals("imgbtnEdit"))
        {
            Response.Redirect("~/Admin/Payment/PrintReciept.aspx?PrId=" + hdfPayMID.Value);
        }

    }
    protected void btnPayment_Click(object sender, EventArgs e)
    {
        DateTime StDate = new DateTime();
        if (txtReceiveeD.Text != string.Empty)
        {
            StDate = DateTime.ParseExact(txtReceiveeD.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture);
        }
        SqlCommand cmd = new SqlCommand("INSERT INTO [Mst_Acct_Ledger] ([Com_Id],[Party_Id],[Acc_Id],[Bill_Id],[Date],[Particular],[Voucher_Type],[Voucher_No],[Credit],[Debit],[DiscountAmount],[ChequeNo],[Transection],[PartyTypeID],[PaymentMode],[RecipNo],[BankName],[BankIFSC],[DepositAmt],[DueAmt],[Recive],[Total],[Ref_no]) VALUES(@Com_Id,@Party_Id,@Acc_Id,@Bill_Id,@Date,@Particular,@Voucher_Type,@Voucher_No,@Credit,@Debit,@DiscountAmount,@ChequeNo,@Transection,@PartyTypeID,@PaymentMode,@RecipNo,@BankName,@BankIFSC,@DepositAmt,@DueAmt,@Recive,@Total,@Ref_no)");
        cmd.Parameters.AddWithValue("@Com_Id", " ");
        cmd.Parameters.AddWithValue("@Party_Id", drdParty.SelectedValue);
        cmd.Parameters.AddWithValue("@Acc_Id", " ");
        cmd.Parameters.AddWithValue("@Bill_Id", " ");
        cmd.Parameters.AddWithValue("@Date", StDate);
        cmd.Parameters.AddWithValue("@Particular", " ");
        cmd.Parameters.AddWithValue("@Voucher_Type", "Sale");
        cmd.Parameters.AddWithValue("@Voucher_No", hdfVch.Value);
        cmd.Parameters.AddWithValue("@Credit", txtRAmt.Text);
        cmd.Parameters.AddWithValue("@Debit", "0");
        cmd.Parameters.AddWithValue("@DiscountAmount", txtDisAmt.Text);
        cmd.Parameters.AddWithValue("@ChequeNo", txtBCheque.Text);
        cmd.Parameters.AddWithValue("@Transection", " ");
        cmd.Parameters.AddWithValue("@PartyTypeID", "");
        cmd.Parameters.AddWithValue("@PaymentMode", drdPaymentMode.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@RecipNo", lblinVoice.Text);
        cmd.Parameters.AddWithValue("@BankName", txtBName.Text);
        cmd.Parameters.AddWithValue("@BankIFSC", txtIFSC.Text);
        cmd.Parameters.AddWithValue("@DepositAmt", txtRAmt.Text);
        cmd.Parameters.AddWithValue("@DueAmt", txtDuAmt.Text);
        cmd.Parameters.AddWithValue("@Recive", "");
        cmd.Parameters.AddWithValue("@Total", lblDueAmt.Text);
        cmd.Parameters.AddWithValue("@Ref_no", Txtrefno.Text);
        DataAccess.InsertExecuteNonQuery(cmd);

        int DueAmt = 0;
        if (txtRAmt.Text != string.Empty && txtRAmt.Text != " ")
        {
            int DusAmt = 0;
            int DepAmt = 0;
            int TotalAmount = 0;
            int DisCount = 0;
            int Ramt = Convert.ToInt32(txtRAmt.Text);
            string TotalAmt = string.Empty;
            try
            {
                DataTable dt = DataAccess.GetData("Select * from VoucherMaster where [VoucherMasterID]='" + hdfVoucerMST.Value + "'");
                if (dt.Rows.Count > 0 && dt != null)
                {
                    DepAmt = Convert.ToInt32(dt.Rows[0]["DepositAmt"]);
                    // TotalAmount = Convert.ToInt32(dt.Rows[0]["TotalAmt"]);
                    DusAmt = Convert.ToInt32(dt.Rows[0]["DueAmt"]);
                    DisCount = Convert.ToInt32(dt.Rows[0]["Discount"]);
                }

            }
            catch { }
            //if (TotalAmount != 0)
            //{
            //TotalAmount = Convert.ToInt32(TotalAmt);
            DepAmt += Ramt;
            DusAmt -= Ramt;
            //}
            if (txtDisAmt.Text != string.Empty)
            {
                int DisC = Convert.ToInt32(txtDisAmt.Text);
                DusAmt -= DisC;
                DisCount += DisC;
                // DepAmt += Ramt;
            }
            if (DepAmt != 0)
            {
                SqlCommand cmdU = new SqlCommand("UPDATE [VoucherMaster] SET [Discount] = @Discount,[DepositAmt] = @DepositAmt,[DueAmt] = @DueAmt,[PaymentStatus] = @PaymentStatus WHERE [VoucherMasterID]='" + hdfVoucerMST.Value + "'");
                cmdU.Parameters.AddWithValue("@Discount", DisCount);
                cmdU.Parameters.AddWithValue("@DepositAmt", DepAmt);
                cmdU.Parameters.AddWithValue("@DueAmt", DusAmt);
                if (DepAmt != 0)
                {
                    cmdU.Parameters.AddWithValue("@PaymentStatus", "Panding");
                }
                else
                {
                    cmdU.Parameters.AddWithValue("@PaymentStatus", "paid");
                }
                DataAccess.InsertExecuteNonQuery(cmdU);

            }

        }
        BindAmount();
        BindRecive();
        txtRAmt.Text = string.Empty;
        txtSubQ.Text = string.Empty;
        drdPaymentMode.ClearSelection();
        txtDisAmt.Text = string.Empty;
        txtDuAmt.Text = string.Empty;
    }

    private void BindRecive()
    {
        DataTable dtt = DataAccess.GetData("Select * from Mst_Acct_Ledger where Voucher_No='" + hdfVch.Value + "' ");
        if (dtt.Rows.Count > 0 && dtt != null)
        {
            grdPayD.DataSource = dtt;
            grdPayD.DataBind();
        }
    }

    //protected void drdPaymentMode_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    //if (selected.Value == 5)
    //    //{
    //    //    txtIFSC.Visible = false;
    //    //}
    //    if (drdPaymentMode.SelectedValue == "0")
    //    {
    //        txtIFSC.Visible = false;
    //    }
    //} 

    protected void btnSerParty_Click(object sender, EventArgs e)
    {
        BindPartDetails();
        BindRecive();

    }

    private void BindPartDetails()
    {
        try
        {
            hdfVch.Value = DataAccess.GetSingleValue("select VoucherNo from [VoucherMaster] where [VoucherMasterID]='" + hdfVoucerMST.Value + "'");

            DataTable dtt = DataAccess.GetData("Select * from PartyMaster where [PartyID]='" + drdParty.SelectedValue + "'");
            if (dtt.Rows.Count > 0 && dtt != null)
            {
                lblAddress.Text = dtt.Rows[0]["address"].ToString();
                lblEmailID.Text = dtt.Rows[0]["Email"].ToString();
                lblPartyN.Text = dtt.Rows[0]["Party_name"].ToString();
                lblPmob.Text = dtt.Rows[0]["mobile_no"].ToString();
            }
            BindGrid();
        }
        catch { }
    }

    private void BindGrid()
    {
        DataTable dt = DataAccess.GetData("select * from View_RecivedPayment where PartyID='" + drdParty.SelectedValue + "'");
        if (dt.Rows.Count > 0 && dt != null)
        {
            gvDetails.DataSource = dt;
            gvDetails.DataBind();
        }
    }
    protected void Edit(object sender, ImageClickEventArgs e)
    {

        ImageButton imgBtn = sender as ImageButton;
        GridViewRow grdRow = (GridViewRow)imgBtn.NamingContainer;
       // string PartyID = (((HiddenField)(grdRow.FindControl("hdfPartyID"))).Value).ToString();
         hdfVoucerMST.Value = (((HiddenField)(grdRow.FindControl("hdfVCID"))).Value).ToString();
        //Label lblDamt = (Label)grdRow.FindControl("lblDUAmt");
        //Label lblTamt = (Label)grdRow.FindControl("lblTamount");
        //Label lblDpamt = (Label)grdRow.FindControl("lblDpAmt");
        //HiddenField hdfWorkTID = (HiddenField)grdRow.FindControl("hdfWorkTID");
      
        if (imgBtn.ID.Equals("imgbtnPayment"))
        {
            PayDiv.Visible = true;

            BindAmount();
        }

    }

    private void BindAmount()
    {
        DataTable dt = DataAccess.GetData("Select * from [VoucherMaster] where [VoucherMasterID]='" + hdfVoucerMST.Value + "'");
        if (dt.Rows.Count > 0 && dt != null)
        {
            lblTAmt.Text = dt.Rows[0]["GrandTotal"].ToString();
            lblDpAmt.Text = dt.Rows[0]["DepositAmt"].ToString();
            lblDueAmt.Text = dt.Rows[0]["DueAmt"].ToString();
            //txtRAmt.Text = dt.Rows[0]["DepositAmt"].ToString();
            txtDuAmt.Text = dt.Rows[0]["DueAmt"].ToString();
        }
    }

    public int Total = 0;
    protected void grdPayD_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hdfDueAmt = (HiddenField)e.Row.FindControl("hdfDueAmt");
            HiddenField hdfPartyID = (HiddenField)e.Row.FindControl("hdfPartyID");
            HiddenField hdfTAmt = (HiddenField)e.Row.FindControl("hdfTAmt");
            Label lblDpAmt = (Label)e.Row.FindControl("lblDpAmt");
            Label lblDUAmt = (Label)e.Row.FindControl("lblDUAmt");
            Label lblDiscount = (Label)e.Row.FindControl("lblDiscount");
            //DataTable dt = DataAccess.GetData("select * from [View_PartyMaster] where [IsContact]='1' and [PartyId]='" + hdfPartyID.Value + "'  ");
            //if (dt != null && dt.Rows.Count > 0)
            //{
            //lblParty.Text = dt.Rows[0]["CompanyName"].ToString() + " ," + dt.Rows[0]["MemberName"].ToString() + "," + dt.Rows[0]["Phone"].ToString();

            //}
            //,,
            int DpAmt = 0;
            if (lblDpAmt.Text != null && lblDpAmt.Text != string.Empty)
            {
                DpAmt = Convert.ToInt32(lblDpAmt.Text);
                Total += DpAmt;
                lblVDpAmt.Text = Convert.ToString(Total);

            }
            lblVDis.Text = lblDiscount.Text;
            lblVDue.Text = lblDUAmt.Text;
            lblVTAmt.Text = hdfTAmt.Value;
        }
    }
}