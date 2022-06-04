using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

public partial class Admin_Sale_View_Salevoucher : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["sridd"] != null)
            {
                string convertKey = (string)(Session["sridd"]);

                HDFUserID.Value = convertKey;

                DataTable dt = DataAccess.GetData("Select * from UserDetails where ID=" + HDFUserID.Value + "");
                if (dt.Rows.Count > 0 && dt != null)
                {
                    hdfprty.Value = dt.Rows[0]["PartyID"].ToString();
                   
                }
                if(hdfprty.Value!=string.Empty)
                {
                    BindGrid();
                    bindClientDetail(hdfprty.Value);
                }
                

            }
            else
            {
                Response.Redirect("~/Admin/Login.aspx");
            }

          


            if (Request.QueryString["PID"] != null)
            {
                hdfprty.Value = Request.QueryString["PID"].ToString();
                BindGrid();
                bindClientDetail(hdfprty.Value);
            }
            BindServiceTp();
            chkgst.Checked = true;
        }




    }
    private void BindGrid()
    {
        if (hdfprty.Value != string.Empty)
        {
            //VoucherNo = '" + hdfVch.Value + "' and Status='Active'
            DataTable dt = DataAccess.GetData("select * from View_ClientServices where  PartyID=" + hdfprty.Value + " and Status='Active'");
            if (dt.Rows.Count > 0 && dt != null)
            {
                grdView.DataSource = dt;
                grdView.DataBind();
            }
            else
            {
                dt.Rows.Add(dt.NewRow());
                grdView.DataSource = dt;
                grdView.DataBind();
                int TotalColumns = grdView.Rows[0].Cells.Count;
                grdView.Rows[0].Cells.Clear();
                grdView.Rows[0].Cells.Add(new TableCell());
                grdView.Rows[0].Cells[0].ColumnSpan = TotalColumns;
                grdView.Rows[0].Cells[0].Text = "No records Found";
            }
        }
    }

    private void bindClientDetail(string ClntId)
    {



        DataTable dt = DataAccess.GetData("select * from View_Party WHERE PartyID=" + ClntId + "");
        if (dt.Rows.Count > 0)
        {
            //custImg.ImageUrl = "~/CustomerImage/" + dt1.Rows[0]["CustImage"].ToString();
            //TxtCustumerName.Text = dt.Rows[0]["Name"].ToString();
            //TxtCampanyname.Text = dt.Rows[0]["Campany_name"].ToString();
            //TxtMobileno.Text = dt.Rows[0]["Mobile_no"].ToString();
            //TxtEmail.Text = dt.Rows[0]["Email"].ToString();
            //TxtCity.Text = dt.Rows[0]["City"].ToString();
            //TxtAddress.Text = dt.Rows[0]["Address"].ToString();
            //TxtPincode.Text = dt.Rows[0]["Pincode"].ToString();
            //TxtArea.Text = dt.Rows[0]["Area"].ToString();

           // hdfPartyID.Value = dt.Rows[0]["PartyID"].ToString();
            lblPartyN.Text = dt.Rows[0]["Party_name"].ToString();
           // txtParty.Text = dt.Rows[0]["Party_name"].ToString();
           // HdflbName.Value = dt.Rows[0]["Party_name"].ToString();
            lblEmailID.Text = dt.Rows[0]["Email"].ToString();
            //HdflbEmail.Value = dt.Rows[0]["Email"].ToString();
            lblPmob.Text = dt.Rows[0]["mobile_no"].ToString();
           // Hdflbmobno.Value = dt.Rows[0]["mobile_no"].ToString();
            //LblArea.Text = dt.Rows[0]["Area"].ToString();
            lblAddress.Text = dt.Rows[0]["address"].ToString();
           // Lblpartycat.Text = dt.Rows[0]["Party_Category"].ToString();
            Lblusertype.Text = dt.Rows[0]["UserTypeName"].ToString();
            // HdflbAdd.Value = dt.Rows[0]["address"].ToString();
        }
    }

    protected void btn_back(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/Party/PartyList.aspx");

    }
    protected void lbtnAddService_Click(object sender, EventArgs e)
    {
        //partyinfo();
        //programmaticModalPopup.Show();


    }
    //public void partyinfo()
    //{
    //    lblAddress.Text = HdflbAdd.Value;
    //    lblEmailID.Text = HdflbEmail.Value;
    //    lblPmob.Text = Hdflbmobno.Value;
    //    lblPartyN.Text = HdflbName.Value;
    //}

    
  

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        programmaticModalPopup.Hide();
        BindGrid();
        //if (hdfSaleVID.Value != string.Empty)
        //{
        //    Response.Redirect("~/Admin/Sale/CreateSaleVoucher.aspx?SaleID=" + hdfSaleVID.Value);
        //}
        //else
        //{
        //    Response.Redirect("~/Admin/Sale/CreateSaleVoucher.aspx");
        //}

    }
    //End Model Popup Service

    protected void drdServiceTp_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drdServiceTp.SelectedItem.Text == "Website" || drdServiceTp.SelectedItem.Text == "Software")
        {

            divAMCCharge.Visible = true;
            divRenewSrvcAmt.Visible = false;

        }

        else
        {
            divRenewSrvcAmt.Visible = true;
            divAMCCharge.Visible = false;

        }
        if (drdServiceTp.SelectedItem.Text == "Domain" || drdServiceTp.SelectedItem.Text == "domain")
        {
            domDiv.Visible = true;
        }
        else
        {
            domDiv.Visible = false;
        }
        BindServiceGST();
        bindService();
    }

    private void BindServiceGST()
    {
        DataTable dt = DataAccess.GetData("Select * from Category where CatID='" + drdServiceTp.SelectedValue + "'");
        if (dt.Rows.Count > 0 && dt != null)
        {
            txtGst.Text = dt.Rows[0]["Gst"].ToString();
            Hdfvalue.Value = dt.Rows[0]["Gst"].ToString();
        }
    }

    protected void drdService_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable dt = DataAccess.GetData("Select * from SubCategory where CatID='" + drdServiceTp.SelectedValue + "'");
        if (dt.Rows.Count > 0 && dt != null)
        {
            txtSerAnt.Text = dt.Rows[0]["Amount"].ToString();
            Hdfservicevalue.Value = dt.Rows[0]["Amount"].ToString();

            txtReNewAmt.Text = dt.Rows[0]["RenewAmt"].ToString();
            //txtGstAmt.Text = dt.Rows[0]["Gst"].ToString();
            //txtTamount.Text = dt.Rows[0]["Gst"].ToString();
        }
        int Gst = 0;
        int SAmt = 0;
        int TAmt = 0;
        int GstAmt = 0;
        if (txtGst.Text != string.Empty && txtGst.Text != string.Empty && txtSerAnt.Text != string.Empty && txtSerAnt.Text != null)
        {
            Gst = Convert.ToInt32(txtGst.Text);
            SAmt = Convert.ToInt32(txtSerAnt.Text);
            GstAmt = SAmt * Gst / 100;
            txtGstAmt.Text = Convert.ToString(GstAmt);
            TAmt = SAmt + GstAmt;
            txtTamount.Text = Convert.ToString(TAmt);
        }
    }
    protected void Edit(object sender, EventArgs e)
    {
        ImageButton imgBtn = sender as ImageButton;

        GridViewRow grdRow = (GridViewRow)imgBtn.NamingContainer;
        HiddenField hdfPartyID = (HiddenField)(grdRow.FindControl("hdfParty"));
      //  HiddenField hdfVoucherID = (HiddenField)(grdRow.FindControl("hdfVoucherID"));
        HiddenField hdfVoucerType = (HiddenField)(grdRow.FindControl("hdfVoucerType"));
        HiddenField hdfServId = (HiddenField)(grdRow.FindControl("hdfServId"));
       // hdfVDID.Value = hdfVoucherID.Value;
        if (imgBtn.ID.Equals("imgbtnEdit"))
        {
            //DataTable dt = DataAccess.GetData("select * from [VoucherDetails] WHERE VoucherDetailsID='" + hdfVoucherID.Value + "'");
            //if (dt.Rows.Count > 0 && dt != null)
            //{
            //    //programmaticModalPopup.Show();
            //    hdfPartyID.Value = dt.Rows[0]["PartyId"].ToString();
            //    bindService();
            //    //drdService.SelectedItem.Text = dt.Rows[0]["Product_Name"].ToString();
            //    txtSerAnt.Text = dt.Rows[0]["Per_unit_Rate_Price"].ToString();
            //    txtGst.Text = dt.Rows[0]["Gst"].ToString();
            //    txtGstAmt.Text = dt.Rows[0]["Gst_Amount"].ToString();
            //    txtTamount.Text = dt.Rows[0]["Amount"].ToString();
            //    txtDisS.Text = dt.Rows[0]["ServiceDis"].ToString();
            //    txtSerAnt.Text = dt.Rows[0]["PurchasePrice"].ToString();
            //    txtReNewAmt.Text = dt.Rows[0]["RenewPrice"].ToString();
            //    txtAmcCharge.Text = dt.Rows[0]["AMC_Charge"].ToString();
            //    BindServiceTp();
            //    drdServiceTp.SelectedValue = dt.Rows[0]["ServiceTp"].ToString();
            //    if (drdServiceTp.SelectedItem.Text == "Domain" || drdServiceTp.SelectedItem.Text == "domain")
            //    {
            //        domDiv.Visible = true;
            //        txtDomnName.Text= dt.Rows[0]["DomainName"].ToString();
            //    }
            //    else
            //    {
            //        domDiv.Visible = false;
            //    }
            //    if (drdServiceTp.SelectedItem.Text == "Website" || drdServiceTp.SelectedItem.Text == "Software")
            //    {

            //        divAMCCharge.Visible = true;
            //        divRenewSrvcAmt.Visible = false;

            //    }

            //    else
            //    {
            //        divRenewSrvcAmt.Visible = true;
            //        divAMCCharge.Visible = false;

            //    }
            //    if (txtGst.Text == "0")
            //    {
            //        chkgst.Checked = false;
            //    }
            //    else
            //    {
            //        chkgst.Checked = true;
            //    }
            //    //if (drdServiceTp.SelectedItem.Text == "Website" || drdServiceTp.SelectedItem.Text == "Software")
            //    //{

            //    //    divAMCCharge.Visible = true;
            //    //    divRenewSrvcAmt.Visible = false;

            //    //}

            //    //else
            //    //{
            //    //    divRenewSrvcAmt.Visible = true;
            //    //    divAMCCharge.Visible = false;

            //    //}
            //    if (txtGst.Text == "0")
            //    {
            //        chkgst.Checked = false;
            //    }
            //    else
            //    {
            //        chkgst.Checked = true;
            //    }
            //    bindService();
            //    drdService.SelectedValue = dt.Rows[0]["Service"].ToString();
            //    txtSerDate.Text = Convert.ToDateTime(dt.Rows[0]["PurchaseDate"]).ToString("dd-MM-yyyy");
            //    txtRendate.Text = Convert.ToDateTime(dt.Rows[0]["RenewDate"]).ToString("dd-MM-yyyy");
            //    drdPurTP.SelectedItem.Text = dt.Rows[0]["PurchaseType"].ToString();


            //    programmaticModalPopup.Show();
            //    UpdatePanel1.Update();
            //}
            ////Response.Redirect("~/Payment/PaymetMaster.aspx?VoucherID=" + hdfVoucherID.Value + "&PartyID=" + hdfPartyID.Value + "&VoucherType=" + hdfVoucerType.Value);
        }
        else if (imgBtn.ID.Equals("imgbtnDelete"))
        {
           
            SqlCommand cmd = new SqlCommand("DELETE FROM [VoucherDetails] WHERE [Service_Id]='" + hdfServId.Value + "'");
            DataAccess.InsertExecuteNonQuery(cmd);

            SqlCommand cmd1 = new SqlCommand("DELETE FROM [ClientService] WHERE [SerID]='" + hdfServId.Value + "'");
            DataAccess.InsertExecuteNonQuery(cmd1);
        }
        BindGrid();


    }
    private void bindService()
    {
        drdService.Items.Clear();
        ListItem item1 = new ListItem();
        item1.Value = "0";
        item1.Text = "--Select Service--";
        drdService.Items.Add(item1);
        //Service Type In dropdown
        DataTable dt = DataAccess.GetData("Select * from SubCategory where CatID='" + drdServiceTp.SelectedValue + "' ");
        if (dt.Rows.Count > 0 && dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["SubCat"].ToString();
                item.Text = dr["SubCategoryN"].ToString();
                drdService.Items.Add(item);
            }
        }
    }
    private void BindServiceTp()
    {
        drdServiceTp.Items.Clear();
        ListItem item1 = new ListItem();
        item1.Value = "0";
        item1.Text = "--Select Service Type--";
        drdServiceTp.Items.Add(item1);
        //Service Type In dropdown
        DataTable dt = DataAccess.GetData("Select * from Category ");
        if (dt.Rows.Count > 0 && dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["CatID"].ToString();
                item.Text = dr["CategoryName"].ToString();
                drdServiceTp.Items.Add(item);
            }
        }
    }
    protected void btnPlan_Click(object sender, EventArgs e)
    {
        BindGrid();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        DateTime StSerDate = new DateTime();
        if (txtSerDate.Text != string.Empty)
        {
            StSerDate = DateTime.ParseExact(txtSerDate.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture);
        }
        DateTime ReNewDate = new DateTime();
        if (txtRendate.Text != string.Empty)
        {
            ReNewDate = DateTime.ParseExact(txtRendate.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture);
        }
        SqlCommand cmd = new SqlCommand("UPDATE [VoucherDetails] SET [Product_Name] = @Product_Name,[Per_unit_Rate_Price] = @Per_unit_Rate_Price,[Gst] = @Gst,[Gst_Amount] = @Gst_Amount,[Amount] = @Amount,[ServiceDis] = @ServiceDis,[PurchasePrice] = @PurchasePrice,[RenewPrice] = @RenewPrice,[ServiceTp] = @ServiceTp,[Service] = @Service,[PurchaseDate] = @PurchaseDate,[RenewDate] = @RenewDate,[PurchaseType] = @PurchaseType,[Is_service]=@Is_service,[DomainName]=@DomainName,[AMC_Charge]=@AMC_Charge WHERE VoucherDetailsID='" + hdfVDID.Value + "'");
        cmd.Parameters.AddWithValue("@VoucherNo", hdfVch.Value);
        cmd.Parameters.AddWithValue("@PartyId", hdfPartyID.Value);
        cmd.Parameters.AddWithValue("@Product_Name", drdService.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@Per_unit_Rate_Price", txtSerAnt.Text);
        cmd.Parameters.AddWithValue("@Gst", txtGst.Text);
        cmd.Parameters.AddWithValue("@Gst_Amount", txtGstAmt.Text);
        cmd.Parameters.AddWithValue("@Amount", txtTamount.Text);
        cmd.Parameters.AddWithValue("@ServiceDis", txtDisS.Text);
        //cmd.Parameters.AddWithValue("@PurchasePrice", txtSerAnt.Text);
        cmd.Parameters.AddWithValue("@RenewPrice", txtReNewAmt.Text);
        cmd.Parameters.AddWithValue("@ServiceTp", drdServiceTp.SelectedValue);
        cmd.Parameters.AddWithValue("@Service", drdService.SelectedValue);
        cmd.Parameters.AddWithValue("@PurchaseDate", StSerDate);
        cmd.Parameters.AddWithValue("@RenewDate", ReNewDate);
        cmd.Parameters.AddWithValue("@PurchaseType", drdPurTP.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@DomainName", txtDomnName.Text);

        if (Chkservice.Checked)

        {
            cmd.Parameters.AddWithValue("@Is_service", "free");
            cmd.Parameters.AddWithValue("@PurchasePrice", Hdfservicevalue.Value);
            //chkgst.Checked = false;
        }
        else
        {
            cmd.Parameters.AddWithValue("@PurchasePrice", txtSerAnt.Text);
            cmd.Parameters.AddWithValue("@Is_service", "");
        }
        if (txtAmcCharge.Text != string.Empty)
        {
            cmd.Parameters.AddWithValue("@AMC_Charge", txtAmcCharge.Text);
        }
        else
        {
            cmd.Parameters.AddWithValue("@AMC_Charge", "0");
        }


        DataAccess.InsertExecuteNonQuery(cmd);

        SqlCommand cmdd = new SqlCommand("UPDATE [ClientService] SET [PartyID] = @PartyID,[ServiceTPID] = @ServiceTPID,[ServiceID] = @ServiceID,[ReNewdate] = @ReNewdate,[PurCahseDate] = @PurCahseDate,[DomainName]=@DomainName WHERE [VoucerID]='" + hdfVDID.Value + "'");
        cmdd.Parameters.AddWithValue("@PartyID", hdfPartyID.Value);
        cmdd.Parameters.AddWithValue("@ServiceTPID", drdServiceTp.SelectedValue);
        cmdd.Parameters.AddWithValue("@ServiceID", drdService.SelectedValue);
        cmdd.Parameters.AddWithValue("@ReNewdate", ReNewDate);
        cmdd.Parameters.AddWithValue("@PurCahseDate", StSerDate);
        cmdd.Parameters.AddWithValue("@DomainName", txtDomnName.Text);
        DataAccess.InsertExecuteNonQuery(cmdd);
        Divalert.Visible = true;
        lblMSGSer.Text = "Service Update successfully";
        programmaticModalPopup.Hide();
        BindGrid();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("CreateSaleVoucher.aspx?NSVID=" + hdfprty.Value);
    }
}
