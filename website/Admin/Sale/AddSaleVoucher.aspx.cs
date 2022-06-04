using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Amity.ERP_Utilities;
public partial class Admin_Sale_SaleVouvher : System.Web.UI.Page
{

    public DataTable dtnew = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            if (Request.QueryString["PID"] != null)
            {
                hdfPartyID.Value = Request.QueryString["PID"].ToString();
                bindClientDetail();
                BindClientServices();
                GetGridviewItems();
                txtInvoiceD.Text = DateTime.Now.ToString("dd-MM-yyyy");
           
                BindVoucherNo();

                if (hdfRandomCode.Value == string.Empty)
                {
                    ID_Generator obj_IDGen = new ID_Generator();
                    string RandomCode = obj_IDGen.RandomAlphaNumeric(6);
                    hdfRandomCode.Value = RandomCode;

                }


            }
        }
    }






    private void BindVoucherNo()
    {
        string MaxID = string.Empty;

        ID_Generator ID_Gen = new ID_Generator();
        try
        {

            MaxID = DataAccess.GetSingleValue("select top 1 VoucherNo from [VoucherMaster]  order by VoucherMasterID desc");

        }
        catch { }
        string ID_Format = "ITS-000";
        string T_Roll_No = ID_Gen.GenrateProductID(MaxID, ID_Format);
        lblinVoice.Text = T_Roll_No;
        hdfVch.Value = T_Roll_No;
    }

    public void GetGridviewItems()
    {

        dtnew.Columns.Add(new System.Data.DataColumn("ServiceName", typeof(String)));
        dtnew.Columns.Add(new System.Data.DataColumn("ServicePrice", typeof(String)));
                        
    }

    public void Bindgridview()
    {      

    }
    private void bindClientDetail()
    {
        DataTable dt = DataAccess.GetData("select * from PartyMaster WHERE PartyID=" + hdfPartyID.Value + "");
        if (dt.Rows.Count > 0)
        {
            hdfPartyID.Value = dt.Rows[0]["PartyID"].ToString();
            lblPartyN.Text = dt.Rows[0]["Party_name"].ToString();        
            HdflbName.Value = dt.Rows[0]["Party_name"].ToString();
            lblEmailID.Text = dt.Rows[0]["Email"].ToString();
            HdflbEmail.Value = dt.Rows[0]["Email"].ToString();
            lblPmob.Text = dt.Rows[0]["mobile_no"].ToString();
            Hdflbmobno.Value = dt.Rows[0]["mobile_no"].ToString();
            lblAddress.Text = dt.Rows[0]["address"].ToString();
            HdflbAdd.Value = dt.Rows[0]["address"].ToString();
        }
    }





    public void BindClientServices()
    {
        ddlServiceName.ClearSelection();
        ListItem item1 = new ListItem();
        item1.Value = "0";
        item1.Text = "--Select Service Type--";
        ddlServiceName.Items.Add(item1);
        DataTable dt = DataAccess.GetData("Select * from [View_ClientServices] Where [PartyID]=" + hdfPartyID.Value + " ");
        if (dt.Rows.Count > 0 && dt != null)
        {

            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["SerID"].ToString();
                item.Text = dr["CategoryName"].ToString() + " - " + dr["SubCategoryN"].ToString() + " - " + dr["DomainName"].ToString()+"-"+dr["PurchasePrice"].ToString();
                ddlServiceName.Items.Add(item);
            }
        }
    }

    protected void ddlServiceName_SelectedIndexChanged(object sender, EventArgs e)
    {
        string serviceprice = string.Empty;
        DataTable dt = DataAccess.GetData("Select * from [View_ClientServices] Where [PartyID]=" + hdfPartyID.Value + " and SerID="+ddlServiceName.SelectedValue+" ");
        if (dt.Rows.Count > 0 && dt != null)
        {
            if (drdPurTP.SelectedValue == "1")
            {
                serviceprice = dt.Rows[0]["PurchasePrice"].ToString();
               // hdfRatePerUnit.Value = serviceprice;
            }
            else
            {
                serviceprice = dt.Rows[0]["NextRenewPrice"].ToString();
            }
            DataTable dtgst = DataAccess.GetData("Select * from Category where CatID='" + dt.Rows[0]["ServiceTPID"].ToString() + "'");
            if (dtgst.Rows.Count > 0 && dt != null)
            {              
                Hdfvalue.Value = dtgst.Rows[0]["Gst"].ToString();
            }

        }
        DataTable dtnewChek = DataAccess.GetData("Select * from [TemporaryVoucherDetail] Where [Service_Id]=" + ddlServiceName.SelectedValue + " and [RandomCode]='" + hdfRandomCode.Value + "' ");
        if (dtnewChek.Rows.Count > 0)
        {
        }
        else
        {
            SqlCommand cmd = new SqlCommand("Insert into [TemporaryVoucherDetail] ([Service_Id],[ServiceName],[ServicePrice],[RandomCode]) Values (@Service_Id,@ServiceName,@ServicePrice,@RandomCode) ");
            cmd.Parameters.AddWithValue("@Service_Id", ddlServiceName.SelectedValue);
            cmd.Parameters.AddWithValue("@ServiceName", ddlServiceName.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ServicePrice", serviceprice);
            cmd.Parameters.AddWithValue("@RandomCode", hdfRandomCode.Value);
            DataAccess.InsertExecuteNonQuery(cmd);
        }

        bindServiceGrdView();
     
       
       
    }

    public void bindServiceGrdView()
    {

        DataTable dtnew = DataAccess.GetData("Select * from [TemporaryVoucherDetail] Where [RandomCode]='" + hdfRandomCode.Value + "' ");
        if (dtnew.Rows.Count > 0)
        {
            grdView.DataSource = dtnew;
            grdView.DataBind();
        }
    }





    public double Amount = 0;
    public double SpRice = 0;
    public double GstAmt = 0;
    protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Label lblAmt = (Label)e.Row.FindControl("lblAmt");
            TextBox txtAmt = (TextBox)e.Row.FindControl("txtAmt");
            Label lblSprice = (Label)e.Row.FindControl("lblSprice");
            // Label lblGSTPrice = (Label)e.Row.FindControl("lblGSTPrice");
            if (txtAmt.Text != string.Empty)
            {
                Amount += Convert.ToDouble(txtAmt.Text);
                txtTotAmt.Text = Convert.ToString(Amount);             

            }
          
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblPriceP = (Label)e.Row.FindControl("lblPriceP");           
            TextBox txtAmt =(TextBox)e.Row.FindControl("txtAmt");         

            if (Amount != 0)
            {
                lblPriceP.Text += Convert.ToString(Amount);
              
            }    
           
        }
    }

    private void BindServiceGST()
    {
        
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        StoreSaleVoucherDetail();
        Response.Redirect("SaleVoucherList.aspx");
    }

    public void StoreSaleVoucherDetail()
    {

        foreach (GridViewRow item in grdView.Rows)
        {
            string ClientSerViceId = Convert.ToString(((HiddenField)item.FindControl("hdfClientServiceId")).Value);
            string Serviceprice = Convert.ToString(((TextBox)item.FindControl("txtAmt")).Text);
            string NextRenwdate = string.Empty;
            DataTable dt = DataAccess.GetData("Select * from [ClientService] Where [SerID]=" + ClientSerViceId + " and [PartyID]=" + hdfPartyID.Value + " ");
            if (dt.Rows.Count > 0)
            {
                NextRenwdate = Convert.ToDateTime(dt.Rows[0]["NextReNewdate"]).ToString("dd-MM-yyyy");
            }

            SqlCommand cmd = new SqlCommand("INSERT INTO [VoucherDetails] ([VoucherNo],[PartyId],[Service_Id],[Quantity],[Per_unit_Rate_Price],[Gst],[Gst_Amount],[Amount],[Unit],[Inactive],[ServiceDis],[Is_service],[CreatedOn],[Purchase_Type],[Purchase_Renew_Date]) VALUES(@VoucherNo,@PartyId,@Service_Id,@Quantity,@Per_unit_Rate_Price,@Gst,@Gst_Amount,@Amount,@Unit,@Inactive,@ServiceDis,@Is_service,@CreatedOn,@Purchase_Type,@Purchase_Renew_Date)  Select SCOPE_IDENTITY()");
            cmd.Parameters.AddWithValue("@VoucherNo", hdfVch.Value);
            cmd.Parameters.AddWithValue("@PartyId", hdfPartyID.Value);
            cmd.Parameters.AddWithValue("@Service_Id", ClientSerViceId);
            cmd.Parameters.AddWithValue("@Quantity", "1");
            cmd.Parameters.AddWithValue("@Per_unit_Rate_Price", Serviceprice);
            cmd.Parameters.AddWithValue("@Amount", Serviceprice);
            cmd.Parameters.AddWithValue("@Gst", "0");
            cmd.Parameters.AddWithValue("@Gst_Amount", "0");
            cmd.Parameters.AddWithValue("@Unit", "1");
            cmd.Parameters.AddWithValue("@Inactive", "True");
            cmd.Parameters.AddWithValue("@ServiceDis", "0");
            cmd.Parameters.AddWithValue("@Purchase_Type", drdPurTP.SelectedItem.Text);
            if (NextRenwdate != string.Empty)
            {
                cmd.Parameters.AddWithValue("@Purchase_Renew_Date", NextRenwdate.ToDateFormat());

            }
            else
            {
                cmd.Parameters.AddWithValue("@Purchase_Renew_Date", DBNull.Value);

            }

            cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);

            if (txtGtAmt.Text == "0")

            {
                cmd.Parameters.AddWithValue("@Is_service", "free");

            }
            else
            {

                cmd.Parameters.AddWithValue("@Is_service", "");
            }

            string VID = DataAccess.InsertExecuteScalar(cmd);
        }

        SaveVoucherMaster();
        alert.Visible = true;
        lblMsg.Text = "Voucher Details saves Sucessfully";      
    
    }

    protected void btnPayment_Click(object sender, EventArgs e)
    {
          StoreSaleVoucherDetail();
     //   int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfVCHMST")).Value);
      
        Response.Redirect("~/Admin/Payment/RecivedPayment.aspx?sID=" + hdfvmid.Value + "&PID=" + hdfPartyID.Value);
         //Response.Redirect("../Payment/RecivedPayment.aspx");
     
        
    }
    private void SaveVoucherMaster()
    {

        SqlCommand cmd = new SqlCommand("INSERT INTO [VoucherMaster]([VoucherNo],[PartyID],[PartyTypeID],[Terms],[VoucherDate],[extra_charges_Name],[extra_charges_Amount],[Remark],[CompanyID],[Inactive],[Voucher_Type],[Total_After_Discount],[Total_Charges],[Amount],[Discount],[Total_Amount],[DepositAmt],[DueAmt],[PaymentStatus],[DocFile],[pCategory],[GrandTotal],[is_gst],[gst_Amount]) VALUES(@VoucherNo,@PartyID,@PartyTypeID,@Terms,@VoucherDate,@extra_charges_Name,@extra_charges_Amount,@Remark,@CompanyID,@Inactive,@Voucher_Type,@Total_After_Discount,@Total_Charges,@Amount,@Discount,@Total_Amount,@DepositAmt,@DueAmt,@PaymentStatus,@DocFile,@pCategory,@GrandTotal,@is_gst,@gst_Amount) Select SCOPE_IDENTITY()");
        cmd.Parameters.AddWithValue("@VoucherNo", hdfVch.Value);
        cmd.Parameters.AddWithValue("@PartyID", hdfPartyID.Value);
        cmd.Parameters.AddWithValue("@PartyTypeID", hdfPartyTpID.Value);

        cmd.Parameters.AddWithValue("@Terms", " ");
        if (txtInvoiceD.Text != string.Empty)
        {
            cmd.Parameters.AddWithValue("@VoucherDate", txtInvoiceD.Text.ToDateFormat());
        }
        else
        {
            cmd.Parameters.AddWithValue("@VoucherDate", DBNull.Value);
        }

        cmd.Parameters.AddWithValue("@extra_charges_Name", " ");
        cmd.Parameters.AddWithValue("@extra_charges_Amount", " ");
        cmd.Parameters.AddWithValue("@Remark", "");
        cmd.Parameters.AddWithValue("@CompanyID", " ");
        cmd.Parameters.AddWithValue("@Inactive", "True");
        cmd.Parameters.AddWithValue("@Voucher_Type", "Sale");

        if (txtAdjust.Text != string.Empty)
        {
            cmd.Parameters.AddWithValue("@Total_After_Discount", txtAdjust.Text);
        }
        else
        {
            cmd.Parameters.AddWithValue("@Total_After_Discount", "0");
        }


        cmd.Parameters.AddWithValue("@Total_Charges", "0");

        if (txtTotAmt.Text != string.Empty)
        {
            cmd.Parameters.AddWithValue("@Amount", txtTotAmt.Text);
        }
        else
        {
            cmd.Parameters.AddWithValue("@Amount", "0");
        }
        if (txtDis.Text != string.Empty)
        {
            cmd.Parameters.AddWithValue("@Discount", txtDis.Text);
        }
        else
        {
            cmd.Parameters.AddWithValue("@Discount", "0");
        }
        if (txtAdjust.Text != string.Empty)
        {
            cmd.Parameters.AddWithValue("@Total_Amount", txtAdjust.Text);
        }
        else
        {
            cmd.Parameters.AddWithValue("@Total_Amount", "0");
        }

        cmd.Parameters.AddWithValue("@DepositAmt", "0");

        cmd.Parameters.AddWithValue("@PaymentStatus", "UnPaid");
        cmd.Parameters.AddWithValue("@DocFile", " ");
        cmd.Parameters.AddWithValue("@pCategory", " ");
        if (txtGrandTAmt.Text != string.Empty)
        {
            cmd.Parameters.AddWithValue("@DueAmt", txtGrandTAmt.Text);
            cmd.Parameters.AddWithValue("@GrandTotal", txtGrandTAmt.Text);
        }
        else
        {
            cmd.Parameters.AddWithValue("@DueAmt", "0");
            cmd.Parameters.AddWithValue("@GrandTotal", "0");
        }
        cmd.Parameters.AddWithValue("@is_gst", chkgst.Checked);

        if (txtGtAmt.Text != "0")
        {
            cmd.Parameters.AddWithValue("@gst_Amount", txtGtAmt.Text);
        }

        else
        {
            cmd.Parameters.AddWithValue("@gst_Amount", "0");
        }   

         string VMID = DataAccess.InsertExecuteScalar(cmd);

        hdfvmid.Value = VMID.ToString();

        SqlCommand cmdVD = new SqlCommand("UPDATE [VoucherDetails] SET [VoucherMasterID] = '" + VMID + "' WHERE VoucherNo='" + hdfVch.Value + "'");
        DataAccess.InsertExecuteNonQuery(cmdVD);

        SqlCommand cmdTV = new SqlCommand(" Delete from [TemporaryVoucherDetail]");
        DataAccess.InsertExecuteNonQuery(cmdTV);
        alert.Visible = true;
        lblMsg.Text = "Sale voucher create successfully";

    }


    protected void Edit(object sender, ImageClickEventArgs e)
    {

        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;

        TextBox txtAmt = (TextBox)grdView.FindControl("txtAmt");       

        int clientServ_id = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfClientServiceId")).Value);
        hdfClienrServiceId.Value = clientServ_id.ToString();

        SqlCommand cmd = new SqlCommand("Update [TemporaryVoucherDetail] SET [ServicePrice]= @ServicePrice Where [Service_Id]="+ hdfClienrServiceId.Value + " ");
        cmd.Parameters.AddWithValue("@ServicePrice", txtAmt.Text);
        DataAccess.InsertExecuteNonQuery(cmd);

        bindServiceGrdView();


    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtTotAmt.Text = string.Empty;
        txtAdjust.Text = string.Empty;
        txtDis.Text = string.Empty;
        txtGtAmt.Text = string.Empty;
        txtGrandTAmt.Text = string.Empty;
       // BindClientServices();
    }

   
}