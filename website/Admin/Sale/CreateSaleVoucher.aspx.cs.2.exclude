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
using CodeEngine.Framework.QueryBuilder;
using CodeEngine.Framework.QueryBuilder.Enums;



public partial class Admin_Sale_CreateSaleVoucher : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            if (Request.QueryString["PID"] != null)
            {
                hdfPartyID.Value = Request.QueryString["PID"].ToString();
                bindClientDetail();
                //  bindClientDetail(hdfPartyID.Value);
                BindGrid();

            }
            if (Request.QueryString["NSVID"] != null)
            {
                BindVoucherNo();
                txtInvoiceD.Text = DateTime.Now.ToString("dd-MM-yyyy");
                hdfPartyID.Value = Request.QueryString["NSVID"].ToString();

                //  bindClientDetail(hdfPartyID.Value);
                bindClientDetail();
            }
            if (Request.QueryString["SaleID"] != null)
            {
                hdfSaleVID.Value = Request.QueryString["SaleID"].ToString();
               

                DataTable dt = DataAccess.GetData("select * from View_VoucherMST where VoucherMasterID='" + hdfSaleVID.Value + "' ");
                if (dt.Rows.Count > 0 && dt != null)
                {
                    hdfVch.Value = dt.Rows[0]["VoucherNo"].ToString();
                    lblinVoice.Text = dt.Rows[0]["VoucherNo"].ToString();
                    hdfPartyID.Value = dt.Rows[0]["PartyID"].ToString();
                    hdfPartyTpID.Value = dt.Rows[0]["PartyTypeID"].ToString();
                    lblAddress.Text = dt.Rows[0]["PartyAddress"].ToString();
                    lblPmob.Text = dt.Rows[0]["mobile_no"].ToString();
                    txtInvoiceD.Text = Convert.ToDateTime(dt.Rows[0]["VoucherDate"]).ToString("dd/MM/yyyy");//, Vcdate);
                    txtRemark.Text = dt.Rows[0]["Remark"].ToString();
                    txtOfDicAmt.Text = dt.Rows[0]["Total_After_Discount"].ToString();
                    txtToChr.Text = dt.Rows[0]["Total_Charges"].ToString();
                    txtTotAmt.Text = dt.Rows[0]["Amount"].ToString();
                    txtDis.Text = dt.Rows[0]["Discount"].ToString();
                    txtGtAmt.Text = dt.Rows[0]["Total_Amount"].ToString();                 
                    txtParty.Text = dt.Rows[0]["Party_name"].ToString();                 
                    lblAddress.Text = dt.Rows[0]["PartyAddress"].ToString();
                    lblEmailID.Text = dt.Rows[0]["Email"].ToString();
                    lblPartyN.Text = dt.Rows[0]["Party_name"].ToString();
                   // lblPmob.Text = dt.Rows[0]["mobile_no"].ToString();
                    txtGrandTAmt.Text = dt.Rows[0]["GrandTotal"].ToString();

                }
                BindGrid();
                BindOtherChr();
            }
            else
            {
                BindVoucherNo();
                txtInvoiceD.Text = DateTime.Now.ToString("dd-MM-yyyy");

            }

           
                BindServiceTp();
        
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
        string ID_Format = "its-000";
        string T_Roll_No = ID_Gen.GenrateProductID(MaxID, ID_Format);
        lblinVoice.Text = T_Roll_No;
        hdfVch.Value = T_Roll_No;
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



    //Model Popup Add Service
    protected void lbtnAddService_Click(object sender, EventArgs e)
    {
        partyinfo();
        programmaticModalPopup.Show();
        

    }


    public void partyinfo()
    {
        lblAddress.Text = HdflbAdd.Value;
        lblEmailID.Text = HdflbEmail.Value;
        lblPmob.Text = Hdflbmobno.Value;
        lblPartyN.Text = HdflbName.Value;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
       
        if (hdfVDID.Value == string.Empty)
        {
            string servId = string.Empty;
            if (drdPurTP.SelectedValue == "1")
            {

               
                    SqlCommand cmdd = new SqlCommand("INSERT INTO [ClientService] ([PartyID],[ServiceTPID],[ServiceID],[NextReNewdate],[PurCahseDate],[CreateDate],[DomainName],[NextRenewPrice],[PurchasePrice]) VALUES(@PartyID,@ServiceTPID,@ServiceID,@NextReNewdate,@PurCahseDate,@CreateDate,@DomainName,@NextRenewPrice,@PurchasePrice); select scope_identity();");
                    cmdd.Parameters.AddWithValue("@PartyID", hdfPartyID.Value);
                    cmdd.Parameters.AddWithValue("@ServiceTPID", drdServiceTp.SelectedValue);
                    cmdd.Parameters.AddWithValue("@ServiceID", drdService.SelectedValue);
                    if (txtRendate.Text != string.Empty)
                    {
                        cmdd.Parameters.AddWithValue("@NextReNewdate", txtRendate.Text.ToDateFormat());
                    }
                    else
                    {
                        cmdd.Parameters.AddWithValue("@NextReNewdate", DBNull.Value);
                    }
                    if (txtSerDate.Text != string.Empty)
                    {
                        cmdd.Parameters.AddWithValue("@PurCahseDate", txtSerDate.Text.ToDateFormat());
                    }
                    else
                    {
                        cmdd.Parameters.AddWithValue("@PurCahseDate", DBNull.Value);
                    }
                    cmdd.Parameters.AddWithValue("@CreateDate", DateTime.Now);
                    cmdd.Parameters.AddWithValue("@DomainName", txtDomnName.Text);

                    if (txtReNewAmt.Text != string.Empty)
                    {
                        cmdd.Parameters.AddWithValue("@NextRenewPrice", txtReNewAmt.Text);
                    }
                    else
                    {
                        cmdd.Parameters.AddWithValue("@NextRenewPrice", "0");
                    }
                    if (txtSerAnt.Text != string.Empty)
                    {
                        cmdd.Parameters.AddWithValue("@PurchasePrice", txtSerAnt.Text);
                    }
                    else
                    {
                        cmdd.Parameters.AddWithValue("@PurchasePrice", "0");
                    }
                    servId = DataAccess.InsertExecuteScalar(cmdd);

                btnSubmit.Text = "Submit";
                }


            else
            {
               
                    SqlCommand cmdd = new SqlCommand("UPDATE [ClientService] set [NextReNewdate]=@NextReNewdate,[LastRenewedOn]=@LastRenewedOn,[NextRenewPrice]=@NextRenewPrice where SerID=@SerID");
                    if (txtRendate.Text != string.Empty)
                    {
                        cmdd.Parameters.AddWithValue("@NextReNewdate", txtRendate.Text.ToDateFormat());
                    }
                    else
                    {
                        cmdd.Parameters.AddWithValue("@NextReNewdate", DBNull.Value);
                    }
                    if (txtSerDate.Text != string.Empty)
                    {
                        cmdd.Parameters.AddWithValue("@LastRenewedOn", txtSerDate.Text.ToDateFormat());
                    }
                    else
                    {
                        cmdd.Parameters.AddWithValue("@LastRenewedOn", DBNull.Value);
                    }

                    if (txtReNewAmt.Text != string.Empty)
                    {
                        cmdd.Parameters.AddWithValue("@NextRenewPrice", txtReNewAmt.Text);
                    }
                    else
                    {
                        cmdd.Parameters.AddWithValue("@NextRenewPrice", "0");
                    }

                    cmdd.Parameters.AddWithValue("@SerID", drdClntSrvc.SelectedValue);

                    DataAccess.InsertExecuteNonQuery(cmdd);
                }
          

            SqlCommand cmd = new SqlCommand("INSERT INTO [VoucherDetails] ([VoucherNo],[PartyId],[Service_Id],[Quantity],[Per_unit_Rate_Price],[Gst],[Gst_Amount],[Amount],[Unit],[Inactive],[ServiceDis],[Is_service],[CreatedOn],[Purchase_Type],[Purchase_Renew_Date]) VALUES(@VoucherNo,@PartyId,@Service_Id,@Quantity,@Per_unit_Rate_Price,@Gst,@Gst_Amount,@Amount,@Unit,@Inactive,@ServiceDis,@Is_service,@CreatedOn,@Purchase_Type,@Purchase_Renew_Date)  Select SCOPE_IDENTITY()");
           
            cmd.Parameters.AddWithValue("@VoucherNo", hdfVch.Value);
            cmd.Parameters.AddWithValue("@PartyId", hdfPartyID.Value);
            if(servId!=string.Empty)
            {
                cmd.Parameters.AddWithValue("@Service_Id", servId);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Service_Id", drdClntSrvc.SelectedValue);
            }
            
            cmd.Parameters.AddWithValue("@Quantity", "1");
            if(txtSerAnt.Text!=string.Empty)
            {
                cmd.Parameters.AddWithValue("@Per_unit_Rate_Price", txtSerAnt.Text);
                cmd.Parameters.AddWithValue("@Amount", txtSerAnt.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Per_unit_Rate_Price", "0" );
                cmd.Parameters.AddWithValue("@Amount", "0");
            }
            //if(txtGst.Text!=string.Empty)
            //{
            //    cmd.Parameters.AddWithValue("@Gst", txtGst.Text);
            //}
            //else
            //{
                cmd.Parameters.AddWithValue("@Gst", "0");
           // }
            //if(txtGstAmt.Text!=string.Empty)
            //{
            //    cmd.Parameters.AddWithValue("@Gst_Amount", txtGstAmt.Text);
            //}
            //else
            //{
                cmd.Parameters.AddWithValue("@Gst_Amount", "0");
           // }

            //if(txtTamount.Text!=string.Empty)
            //{
            //    cmd.Parameters.AddWithValue("@Amount", txtTamount.Text);
            //}
            //else
            //{
               
           // }

            cmd.Parameters.AddWithValue("@Unit", "1");
            cmd.Parameters.AddWithValue("@Inactive", "True");
            cmd.Parameters.AddWithValue("@ServiceDis", txtDisS.Text);
            cmd.Parameters.AddWithValue("@Purchase_Type", drdPurTP.SelectedItem.Text);
            if(txtSerDate.Text!=string.Empty)
            {
                cmd.Parameters.AddWithValue("@Purchase_Renew_Date", txtSerDate.Text.ToDateFormat());

            }
            else
            {
                cmd.Parameters.AddWithValue("@Purchase_Renew_Date", DBNull.Value);

            }

            cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
            // cmd.Parameters.AddWithValue("@ServiceTp", drdServiceTp.SelectedValue);
            //  cmd.Parameters.AddWithValue("@Service", drdService.SelectedValue);
            // cmd.Parameters.AddWithValue("@PurchaseDate", StSerDate);
            //  cmd.Parameters.AddWithValue("@RenewDate", ReNewDate);
            // cmd.Parameters.AddWithValue("@PurchaseType", drdPurTP.SelectedItem.Text);

            if (Chkservice.Checked)

            {
                cmd.Parameters.AddWithValue("@Is_service", "free");
                //cmd.Parameters.AddWithValue("@PurchasePrice", Hdfservicevalue.Value);
                //chkgst.Checked = false;
            }
           else
            {
               // cmd.Parameters.AddWithValue("@PurchasePrice", txtSerAnt.Text);
                cmd.Parameters.AddWithValue("@Is_service","");
            }
           // cmd.Parameters.AddWithValue("@DomainName", txtDomnName.Text);
            //if(txtAmcCharge.Text!=string.Empty)
            //{
            //    cmd.Parameters.AddWithValue("@AMC_Charge", txtAmcCharge.Text);
            //}
            //else
            //{
            //    cmd.Parameters.AddWithValue("@AMC_Charge", "0");
            //}
            //cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
        //    cmd.Parameters.AddWithValue("@NextRenewDate",)
            

            string VID = DataAccess.InsertExecuteScalar(cmd);
            Divalert.Visible = true;
            lblMSGSer.Text = "Service add successfully";
            BindGrid();

            if (VID != string.Empty)
            {
                
            }
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [VoucherDetails] SET [Per_unit_Rate_Price] = @Per_unit_Rate_Price,[Gst] = @Gst,[Gst_Amount] = @Gst_Amount,[Amount] = @Amount,[ServiceDis] = @ServiceDis,[Is_service]=@Is_service,[CreatedOn]=@CreatedOn,[Purchase_Type]=@Purchase_Type,[Purchase_Renew_Date]=@Purchase_Renew_Date WHERE VoucherDetailsID='" + hdfVDID.Value + "'");
            //cmd.Parameters.AddWithValue("@VoucherNo", hdfVch.Value);
            //cmd.Parameters.AddWithValue("@PartyId", hdfPartyID.Value);
            //cmd.Parameters.AddWithValue("@Product_Name", drdService.SelectedItem.Text);


            //if (txtSerAnt.Text != string.Empty)
            //{
            //    cmd.Parameters.AddWithValue("@Per_unit_Rate_Price", txtSerAnt.Text);
            //}
            //else
            //{
            //    cmd.Parameters.AddWithValue("@Per_unit_Rate_Price", "0");
            //}

            if (txtSerAnt.Text != string.Empty)
            {
                cmd.Parameters.AddWithValue("@Per_unit_Rate_Price", txtSerAnt.Text);
                cmd.Parameters.AddWithValue("@Amount", txtSerAnt.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Per_unit_Rate_Price", "0");
                cmd.Parameters.AddWithValue("@Amount", "0");
            }
            //if (txtGst.Text != string.Empty)
            //{
            //    cmd.Parameters.AddWithValue("@Gst", txtGst.Text);
            //}
            //else
            //{
            cmd.Parameters.AddWithValue("@Gst", "0");
           // }
            //if (txtGstAmt.Text != string.Empty)
            //{
            //    cmd.Parameters.AddWithValue("@Gst_Amount", txtGstAmt.Text);
            //}
            //else
            //{
                cmd.Parameters.AddWithValue("@Gst_Amount", "0");
            //}

            //if (txtTamount.Text != string.Empty)
            //{
            //    cmd.Parameters.AddWithValue("@Amount", txtTamount.Text);
            //}
            //else
            //{
              //  cmd.Parameters.AddWithValue("@Amount", "0");
            //}
            cmd.Parameters.AddWithValue("@ServiceDis", txtDisS.Text);
       
            cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
            if (txtRendate.Text != string.Empty)
            {
                cmd.Parameters.AddWithValue("@Purchase_Renew_Date", txtRendate.Text.ToDateFormat());
            }
            else
            {
                cmd.Parameters.AddWithValue("@Purchase_Renew_Date", DBNull.Value);
            }
          
            cmd.Parameters.AddWithValue("@Purchase_Type", drdPurTP.SelectedItem.Text);
           
            if (Chkservice.Checked)
            {
                cmd.Parameters.AddWithValue("@Is_service", "free");
               // cmd.Parameters.AddWithValue("@PurchasePrice", Hdfservicevalue.Value);
                //chkgst.Checked = false;
            }
            else
            {
                //cmd.Parameters.AddWithValue("@PurchasePrice", txtSerAnt.Text);
                cmd.Parameters.AddWithValue("@Is_service", "");
            }



            DataAccess.InsertExecuteNonQuery(cmd);

            SqlCommand cmdd = new SqlCommand("UPDATE [ClientService] set [NextReNewdate]=@NextReNewdate,[LastRenewedOn]=@LastRenewedOn,[NextRenewPrice]=@NextRenewPrice where SerID=@SerID");

            if (txtRendate.Text != string.Empty)
            {
                cmdd.Parameters.AddWithValue("@NextReNewdate", txtRendate.Text.ToDateFormat());
            }
            else
            {
                cmdd.Parameters.AddWithValue("@NextReNewdate", DBNull.Value);
            }
            if (txtSerDate.Text != string.Empty)
            {
                cmdd.Parameters.AddWithValue("@LastRenewedOn", txtSerDate.Text.ToDateFormat());
            }
            else
            {
                cmdd.Parameters.AddWithValue("@LastRenewedOn", DBNull.Value);
            }

            if (txtReNewAmt.Text != string.Empty)
            {
                cmdd.Parameters.AddWithValue("@NextRenewPrice", txtReNewAmt.Text);
            }
            else
            {
                cmdd.Parameters.AddWithValue("@NextRenewPrice", "0");
            }
            cmdd.Parameters.AddWithValue("@SerID", drdClntSrvc.SelectedValue);

            DataAccess.InsertExecuteNonQuery(cmdd);
            Divalert.Visible = true;
            lblMSGSer.Text = "Service Update successfully";
            BindGrid();
           
            
        }

      
        txtDisS.Text = string.Empty;    
        txtRendate.Text = string.Empty;
        txtReNewAmt.Text = string.Empty;
        txtSerAnt.Text = string.Empty;
        txtSerDate.Text = string.Empty;    
        drdService.ClearSelection();
        drdServiceTp.ClearSelection();
        drdPurTP.ClearSelection();    
        txtDomnName.Text = string.Empty;
       // chkgst.Checked = true;
        Chkservice.Checked = false;
        hdfVDID.Value = string.Empty; 

        programmaticModalPopup.Hide();

    }

    private void BindGrid()                             
    {
        if (hdfPartyID.Value != string.Empty)
        {
            //VoucherNo = '" + hdfVch.Value + "'
            if (hdfVch.Value != string.Empty)
            {
                DataTable dt = DataAccess.GetData("select * from View_VoucherDetails where  PartyID=" + hdfPartyID.Value + " and VoucherNo='" + hdfVch.Value + "' order by [PartyID] desc");
                if (dt.Rows.Count > 0 && dt != null)
                {
                    gvDetails.DataSource = dt;
                    gvDetails.DataBind();
                }
            }
            else
            {
                DataTable dt = DataAccess.GetData("select * from View_VoucherDetails where  PartyID=" + hdfPartyID.Value + " order by [PartyID] desc");
                if (dt.Rows.Count > 0 && dt != null)
                {
                    gvDetails.DataSource = dt;
                    gvDetails.DataBind();
                }
            }
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        programmaticModalPopup.Hide();
        BindGrid();        
    }
    //End Model Popup Service

    protected void drdServiceTp_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (drdServiceTp.SelectedItem.Text == "Website" || drdServiceTp.SelectedItem.Text == "Software")
        {

           // divAMCCharge.Visible = true;
          //  divRenewSrvcAmt.Visible = false;

        }

        else 
        {
            //divRenewSrvcAmt.Visible = true;
           // divAMCCharge.Visible = false;

        }


        if(drdServiceTp.SelectedItem.Text=="Domain" || drdServiceTp.SelectedItem.Text=="domain" )
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
           // txtGst.Text = dt.Rows[0]["Gst"].ToString();
            Hdfvalue.Value = dt.Rows[0]["Gst"].ToString();
        }
    }

    protected void drdService_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable dt = DataAccess.GetData("Select * from [SubCategory] where CatID='" + drdServiceTp.SelectedValue + "'");
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
        //if (txtGst.Text != string.Empty && txtGst.Text != string.Empty && txtSerAnt.Text != string.Empty && txtSerAnt.Text != null)
        //{
        //    Gst = Convert.ToInt32(txtGst.Text);
        //    SAmt = Convert.ToInt32(txtSerAnt.Text);
        //    GstAmt = SAmt * Gst / 100;
        //    txtGstAmt.Text = Convert.ToString(GstAmt);
        //    TAmt = SAmt + GstAmt;
        //    txtTamount.Text = Convert.ToString(TAmt);
        //}
        if (txtSerAnt.Text != string.Empty && txtSerAnt.Text != null)
        {
           // Gst = Convert.ToInt32(txtGst.Text);
            SAmt = Convert.ToInt32(txtSerAnt.Text);
            GstAmt = SAmt * Gst / 100;
           // txtGstAmt.Text = Convert.ToString(GstAmt);
            TAmt = SAmt + GstAmt;
          //  txtTamount.Text = Convert.ToString(TAmt);
        }
    }
    protected void Edit(object sender, EventArgs e)
    {
        ImageButton imgBtn = sender as ImageButton;

        GridViewRow grdRow = (GridViewRow)imgBtn.NamingContainer;
        HiddenField hdfPartyID = (HiddenField)(grdRow.FindControl("hdfParty"));
        HiddenField hdfVoucherID = (HiddenField)(grdRow.FindControl("hdfVoucherID"));
        HiddenField hdfVoucerType = (HiddenField)(grdRow.FindControl("hdfVoucerType"));
        HiddenField hdfServId = (HiddenField)(grdRow.FindControl("hdfServId"));

        hdfVDID.Value = hdfVoucherID.Value;
        if (imgBtn.ID.Equals("imgbtnEdit"))
        {
            DataTable dt = DataAccess.GetData("select * from [View_VoucherDetails] WHERE VoucherDetailsID='" + hdfVoucherID.Value + "'");
            if (dt.Rows.Count > 0 && dt != null)
            {
                //programmaticModalPopup.Show();
                hdfPartyID.Value = dt.Rows[0]["PartyId"].ToString();
                bindService();
                //drdService.SelectedItem.Text = dt.Rows[0]["Product_Name"].ToString();
                txtSerAnt.Text = dt.Rows[0]["Per_unit_Rate_Price"].ToString();
               // txtGst.Text = dt.Rows[0]["Gst"].ToString();
             //   txtGstAmt.Text = dt.Rows[0]["Gst_Amount"].ToString();
              //  txtTamount.Text = dt.Rows[0]["Amount"].ToString();
                txtDisS.Text = dt.Rows[0]["ServiceDis"].ToString();
                txtSerAnt.Text = dt.Rows[0]["PurchasePrice"].ToString();
                txtReNewAmt.Text = dt.Rows[0]["NextRenewPrice"].ToString(); 
                BindServiceTp();
                drdServiceTp.SelectedValue = dt.Rows[0]["ServiceTPID"].ToString();
                bindService();
                drdService.SelectedValue = dt.Rows[0]["ServiceID"].ToString();
                txtSerDate.Text = Convert.ToDateTime(dt.Rows[0]["PurCahseDate"]).ToString("dd-MM-yyyy");
                txtRendate.Text = Convert.ToDateTime(dt.Rows[0]["NextReNewdate"]).ToString("dd-MM-yyyy");
                drdPurTP.ClearSelection();
                drdPurTP.Items.FindByText(dt.Rows[0]["Purchase_Type"].ToString()).Selected = true ;
                servDiv.Visible = true;

                btnSubmit.Text = "Update";

                // txtAmcCharge.Text = dt.Rows[0]["AMC_Charge"].ToString();
                //if (drdServiceTp.SelectedItem.Text == "Website" || drdServiceTp.SelectedItem.Text == "Software")
                //{

                //    divAMCCharge.Visible = true;
                //    divRenewSrvcAmt.Visible = false;

                //}

                //else
                //{
                //    divRenewSrvcAmt.Visible = true;
                //    divAMCCharge.Visible = false;

                //}
                //if (txtGst.Text=="0")
                //{
                //    chkgst.Checked = false;
                //}
                //else
                //{
                //    chkgst.Checked = true;
                //}
                //programmaticModalPopup.Show();


                UpdatePanel1.Update();
            }
            //Response.Redirect("~/Payment/PaymetMaster.aspx?VoucherID=" + hdfVoucherID.Value + "&PartyID=" + hdfPartyID.Value + "&VoucherType=" + hdfVoucerType.Value);
        }
        else if (imgBtn.ID.Equals("imgbtnDelete"))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM [VoucherDetails] WHERE VoucherDetailsID='" + hdfVoucherID.Value + "'");
            DataAccess.InsertExecuteNonQuery(cmd);
            SqlCommand cmd1 = new SqlCommand("DELETE FROM [ClientService] WHERE [SerID]='" + hdfServId.Value + "'");
            DataAccess.InsertExecuteNonQuery(cmd1);
        }
        BindGrid();


    }

    protected void btnSaveCharge_Click(object sender, EventArgs e)
    {
        if (hdfoThCHar.Value == string.Empty)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [OtherCharges]([CompanyId],[VoucherNo],[ChargesName],[ChargeAmount],[CreateOn],[VoucherMasterID],[Inactive]) VALUES(@CompanyId,@VoucherNo,@ChargesName,@ChargeAmount,@CreateOn,@VoucherMasterID,@Inactive)");
            cmd.Parameters.AddWithValue("@CompanyId", " ");
            cmd.Parameters.AddWithValue("@VoucherNo", hdfVch.Value);
            cmd.Parameters.AddWithValue("@ChargesName", txtOthSName.Text);
            cmd.Parameters.AddWithValue("@ChargeAmount", txtOthCharge.Text);
            cmd.Parameters.AddWithValue("@CreateOn", DateTime.Now);
            cmd.Parameters.AddWithValue("@VoucherMasterID", " ");
            cmd.Parameters.AddWithValue("@Inactive", "True");
            DataAccess.InsertExecuteNonQuery(cmd);
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [OtherCharges] SET [ChargesName] = @ChargesName,[ChargeAmount] = @ChargeAmount WHERE ChargesID='" + hdfoThCHar.Value + "'");
            cmd.Parameters.AddWithValue("@ChargesName", txtOthSName.Text);
            cmd.Parameters.AddWithValue("@ChargeAmount", txtOthCharge.Text);
            DataAccess.InsertExecuteNonQuery(cmd);
        }
        BindOtherChr();
        hdfoThCHar.Value = string.Empty;
        txtOthCharge.Text = string.Empty;
        txtOthSName.Text = string.Empty;
        txtOthSName.Focus();
    }

    private void BindOtherChr()
    {
        DataTable dt = DataAccess.GetData("Select * from OtherCharges  where VoucherNo='" + hdfVch.Value + "'");
        if (dt.Rows.Count > 0 && dt != null)
        {
            gridotherChr.DataSource = dt;
            gridotherChr.DataBind();
        }
        
    }
    protected void OthEdit(object sender, EventArgs e)
    {
        ImageButton imgBtn = sender as ImageButton;

        GridViewRow grdRow = (GridViewRow)imgBtn.NamingContainer;
        HiddenField hdfChrID = (HiddenField)(grdRow.FindControl("hdfChrID"));
        hdfoThCHar.Value = hdfChrID.Value;
        if (imgBtn.ID.Equals("imgbtnEdit"))
        {
            DataTable dt = DataAccess.GetData("Select * from OtherCharges where ChargesID='" + hdfChrID.Value + "'");
            if (dt.Rows.Count > 0 && dt != null)
            {
                txtOthSName.Text = dt.Rows[0]["ChargesName"].ToString();
                txtOthCharge.Text = dt.Rows[0]["ChargeAmount"].ToString();
            }
        }
        else if (imgBtn.ID.Equals("imgbtnDelete"))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM [OtherCharges] WHERE ChargesID='" + hdfoThCHar.Value + "'");
            DataAccess.InsertExecuteNonQuery(cmd);
        }
        BindOtherChr();
    }
    public double Amount = 0;
    public double SpRice = 0;
    public double GstAmt = 0;
    protected void gvDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int DEmochargeAmount = 0;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblAmt = (Label)e.Row.FindControl("lblAmt");
            Label lblSprice = (Label)e.Row.FindControl("lblSprice");
           // Label lblGSTPrice = (Label)e.Row.FindControl("lblGSTPrice");
            if (lblAmt.Text != string.Empty)
            {
                Amount += Convert.ToDouble(lblAmt.Text);
                // DEmochargeAmount = Convert.ToInt32(lblCAmt.Text);
                txtTotAmt.Text = Convert.ToString(Amount);
                txtGtAmt.Text = Convert.ToString(Amount);
                txtGrandTAmt.Text = Convert.ToString(Amount);

            }
            if (lblSprice.Text != string.Empty)
            {
                SpRice += Convert.ToDouble(lblSprice.Text);

            }
            //if (lblGSTPrice.Text != string.Empty)
            //{
            //    GstAmt += Convert.ToDouble(lblGSTPrice.Text);
            //}
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblPriceP = (Label)e.Row.FindControl("lblPriceP");
         //   Label lblGstAmt = (Label)e.Row.FindControl("lblGstAmt");
            Label lblTAmt = (Label)e.Row.FindControl("lblTAmt");
            if (Amount != 0)
            {
                lblTAmt.Text = Convert.ToString(Amount);
            }
            if (SpRice != 0)
            {
                lblPriceP.Text = Convert.ToString(SpRice);
            }
            //if (GstAmt != 0)
            //{
            //    lblGstAmt.Text = Convert.ToString(GstAmt);
            //}

        }
    }
    public double chargeAmount = 0;
    public double totalAmount = 0;
    protected void gridotherChr_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int DEmochargeAmount = 0;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblCAmt = (Label)e.Row.FindControl("lblCAmt");
            if (lblCAmt.Text != string.Empty)
            {
                chargeAmount += Convert.ToDouble(lblCAmt.Text);
                // DEmochargeAmount = Convert.ToInt32(lblCAmt.Text);
                txtToChr.Text = Convert.ToString(chargeAmount);
            }
            if (txtTotAmt.Text != string.Empty)
            {
                totalAmount = Convert.ToDouble(txtTotAmt.Text);
                // chargeAmount += 
                totalAmount += chargeAmount;

            }
            if (txtDis.Text != string.Empty)
            {
                totalAmount -= Convert.ToInt32(txtDis.Text);
            }
            txtGtAmt.Text = Convert.ToString(totalAmount);
            txtGrandTAmt.Text = Convert.ToString(totalAmount);
            //chargeAmount = 0;
            //  totalAmount = DEmochargeAmount;

        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblOtCAmt = (Label)e.Row.FindControl("lblOtCAmt");
            if (chargeAmount != 0)
            {
                lblOtCAmt.Text = Convert.ToString(chargeAmount);
            }
        }

    }

    protected void btnSubMitSaleV_Click(object sender, EventArgs e)
    {
        try {
            string date = Request.Form[lblAddress.UniqueID];
            if (hdfSaleVID.Value == string.Empty)
            {
                SaveVoucherMaster();
                Response.Redirect("SaleVoucherList.aspx");
            }
            else
            {
                SqlCommand cmd = new SqlCommand("UPDATE [VoucherMaster]  SET [PartyID] = @PartyID,[PartyTypeID] = @PartyTypeID,[VoucherDate] = @VoucherDate,[Remark] = @Remark,[Total_After_Discount] = @Total_After_Discount,[Total_Charges] = @Total_Charges,[Amount] = @Amount,[Discount] = @Discount,[Total_Amount] = @Total_Amount,[DueAmt] = @DueAmt,[GrandTotal]=@GrandTotal WHERE VoucherMasterID='" + hdfSaleVID.Value + "' ");
                cmd.Parameters.AddWithValue("@VoucherNo", hdfVch.Value);
                cmd.Parameters.AddWithValue("@PartyID", hdfPartyID.Value);
                cmd.Parameters.AddWithValue("@PartyTypeID", hdfPartyTpID.Value);
                if (txtInvoiceD.Text != string.Empty)
                {
                    cmd.Parameters.AddWithValue("@VoucherDate", txtInvoiceD.Text.ToDateFormat());
                }
                else
                {
                    cmd.Parameters.AddWithValue("@VoucherDate", DBNull.Value);
                }
                cmd.Parameters.AddWithValue("@Remark", txtRemark.Text);
                if (txtOfDicAmt.Text != string.Empty)
                {
                    cmd.Parameters.AddWithValue("@Total_After_Discount", txtOfDicAmt.Text);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Total_After_Discount", "0");
                }
                if (txtToChr.Text != string.Empty)
                {
                    cmd.Parameters.AddWithValue("@Total_Charges", txtToChr.Text);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Total_Charges", "0");
                }
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
                if (txtGtAmt.Text != string.Empty)
                {
                    cmd.Parameters.AddWithValue("@Total_Amount", txtGtAmt.Text);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Total_Amount", "0");
                }
                if (txtGrandTAmt.Text != string.Empty)
                {
                    cmd.Parameters.AddWithValue("@DueAmt", txtGrandTAmt.Text);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@DueAmt", "0");
                }
                if (txtGrandTAmt.Text != string.Empty)
                {
                    cmd.Parameters.AddWithValue("@GrandTotal", txtGrandTAmt.Text);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@GrandTotal", "0");
                }
                //  cmd.Parameters.AddWithValue("@Total_After_Discount", txtOfDicAmt.Text);
                //cmd.Parameters.AddWithValue("@Total_Charges", txtToChr.Text);
                //cmd.Parameters.AddWithValue("@Amount", txtTotAmt.Text);
                //cmd.Parameters.AddWithValue("@Discount", txtDis.Text);
                // cmd.Parameters.AddWithValue("@Total_Amount", txtGtAmt.Text);
                // cmd.Parameters.AddWithValue("@DueAmt", txtGtAmt.Text);
                // cmd.Parameters.AddWithValue("@GrandTotal", txtGrandTAmt.Text);
                DataAccess.InsertExecuteNonQuery(cmd);
                alert.Visible = true;
                lblMSG.Text = "Sale voucher update successfully";
            }
            SaveVoucherMaster();
            BindVoucherNo();
            txtParty.Focus();
            //ClrVM();
        }
        catch(Exception ex)
        {
            alert.Visible = true;
            lblMSG.Text = "Error : "+ex.Message;
        }

    }

    private void SaveVoucherMaster()
    {
        
            SqlCommand cmd = new SqlCommand("INSERT INTO [VoucherMaster]([VoucherNo],[PartyID],[PartyTypeID],[Terms],[VoucherDate],[extra_charges_Name],[extra_charges_Amount],[Remark],[CompanyID],[Inactive],[Voucher_Type],[Total_After_Discount],[Total_Charges],[Amount],[Discount],[Total_Amount],[DepositAmt],[DueAmt],[PaymentStatus],[DocFile],[pCategory],[GrandTotal]) VALUES(@VoucherNo,@PartyID,@PartyTypeID,@Terms,@VoucherDate,@extra_charges_Name,@extra_charges_Amount,@Remark,@CompanyID,@Inactive,@Voucher_Type,@Total_After_Discount,@Total_Charges,@Amount,@Discount,@Total_Amount,@DepositAmt,@DueAmt,@PaymentStatus,@DocFile,@pCategory,@GrandTotal) Select SCOPE_IDENTITY()");
            cmd.Parameters.AddWithValue("@VoucherNo", hdfVch.Value);
            cmd.Parameters.AddWithValue("@PartyID", hdfPartyID.Value);
            cmd.Parameters.AddWithValue("@PartyTypeID", hdfPartyTpID.Value);
            // cmd.Parameters.AddWithValue("@Address", lblAddress.Text);
            // cmd.Parameters.AddWithValue("@MobileNo", lblPmob.Text);
            //   cmd.Parameters.AddWithValue("@State", " ");
            //   cmd.Parameters.AddWithValue("@City", " ");
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
            cmd.Parameters.AddWithValue("@Remark", txtRemark.Text);
            cmd.Parameters.AddWithValue("@CompanyID", " ");
            cmd.Parameters.AddWithValue("@Inactive", "True");
            cmd.Parameters.AddWithValue("@Voucher_Type", "Sale");
            if (txtOfDicAmt.Text != string.Empty)
            {
                cmd.Parameters.AddWithValue("@Total_After_Discount", txtOfDicAmt.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Total_After_Discount", "0");
            }
            if (txtToChr.Text != string.Empty)
            {
                cmd.Parameters.AddWithValue("@Total_Charges", txtToChr.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Total_Charges", "0");
            }
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
            if (txtGtAmt.Text != string.Empty)
            {
                cmd.Parameters.AddWithValue("@Total_Amount", txtGtAmt.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Total_Amount", "0");
            }

            cmd.Parameters.AddWithValue("@DepositAmt", "0");
            //if(txtGrandTAmt.Text!=string.Empty)
            //{
            //    cmd.Parameters.AddWithValue("@DueAmt", txtGrandTAmt.Text);
            //}
            //else
            //{
            //    cmd.Parameters.AddWithValue("@DueAmt", "0");
            //}

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

            string VMID = DataAccess.InsertExecuteScalar(cmd);


            SqlCommand cmdVD = new SqlCommand("UPDATE [VoucherDetails] SET [VoucherMasterID] = '" + VMID + "' WHERE VoucherNo='" + hdfVch.Value + "'");
            DataAccess.InsertExecuteNonQuery(cmdVD);
            DataTable dtClntServ = DataAccess.GetData("select * from [VoucherDetails] where [VoucherMasterID]=" + VMID + "");
            if (dtClntServ.Rows.Count > 0)
            {
                foreach (DataRow dr in dtClntServ.Rows)
                {
                    SqlCommand cmdUpdServ = new SqlCommand("update [ClientService] set [Status]='Active' where [SerID]=" + dr["Service_Id"].ToString() + "");
                    DataAccess.InsertExecuteNonQuery(cmdUpdServ);
                }
            }

            SqlCommand cmdOC = new SqlCommand("UPDATE [OtherCharges] SET [VoucherMasterID] = '" + VMID + "' WHERE VoucherNo='" + hdfVch.Value + "'");
            DataAccess.InsertExecuteNonQuery(cmdOC);
            alert.Visible = true;
            lblMSG.Text = "Sale voucher create successfully";
            
    }

    protected void btnAutoSubmit_Click(object sender, EventArgs e)
    {
        SelectQueryBuilder query = new SelectQueryBuilder();
        query.SelectFromTable("PartyMaster");
        query.SelectAllColumns();

        if (txtParty.Text != string.Empty)
        {
            query.AddWhere("Party_name", Comparison.Like, txtParty.Text + '%');

        }

        string Query = query.BuildQuery();
        DataTable dt = DataAccess.GetData(Query);
        if (dt.Rows.Count > 0)
        {
            hdfclient.Value = dt.Rows[0]["PartyID"].ToString();
            //   bindClientDetail(hdfclient.Value);
            bindClientDetail();
               BindGrid();
        }
    }


   // private void bindClientDetail(string ClntId)
      private void bindClientDetail()
    {



        DataTable dt = DataAccess.GetData("select * from PartyMaster WHERE PartyID=" + hdfPartyID.Value+ "");
        if (dt.Rows.Count > 0)
        {            
            hdfPartyID.Value = dt.Rows[0]["PartyID"].ToString();
            lblPartyN.Text = dt.Rows[0]["Party_name"].ToString();
            txtParty.Text = dt.Rows[0]["Party_name"].ToString();
            HdflbName.Value = dt.Rows[0]["Party_name"].ToString();
            lblEmailID.Text = dt.Rows[0]["Email"].ToString();
            HdflbEmail.Value = dt.Rows[0]["Email"].ToString();
            lblPmob.Text = dt.Rows[0]["mobile_no"].ToString();
            Hdflbmobno.Value = dt.Rows[0]["mobile_no"].ToString();      
            lblAddress.Text = dt.Rows[0]["address"].ToString();
            HdflbAdd.Value = dt.Rows[0]["address"].ToString();
        }
    }



    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchEmpByName(string prefixText, int count)
    {
        DataTable dt = DataAccess.GetData("select [Party_name] from [PartyMaster] WHERE Is_active=1 and Party_name like '" + prefixText + "%'");
        List<string> customers = new List<string>();
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {

                customers.Add(dr["Party_name"].ToString());
            }
        }
        return customers;

    }

    private void ClrVM()
    {
        txtDis.Text = string.Empty;
        txtDisS.Text = string.Empty;
       // txtGst.Text = string.Empty;
        //txtGstAmt.Text = string.Empty;
        txtGtAmt.Text = string.Empty;
        txtInvoiceD.Text = string.Empty;
        txtOfDicAmt.Text = string.Empty;
        txtOthCharge.Text = string.Empty;
        txtOthSName.Text = string.Empty;
        txtParty.Text = string.Empty;
        txtRemark.Text = string.Empty;
        txtRendate.Text = string.Empty;
        txtReNewAmt.Text = string.Empty;
        txtSerAnt.Text = string.Empty;
        txtSerDate.Text = string.Empty;
      //  txtTamount.Text = string.Empty;
        txtToChr.Text = string.Empty;
        txtTotAmt.Text = string.Empty;
        hdfoThCHar.Value = string.Empty;
      //  hdfPartyID.Value = string.Empty;
        hdfPartyTpID.Value = string.Empty;
        //hdfVch.Value = string.Empty;
        DataTable dt = new DataTable();
        gridotherChr.DataSource = dt;
        gridotherChr.DataBind();
        gvDetails.DataSource = dt;
        gvDetails.DataBind();
    }

    protected void btnPlan_Click(object sender, EventArgs e)
    {
        BindGrid();
    }
    protected void btnpay_Click(object sender, EventArgs e)
    {
        try
        {
            SaveVoucherMaster();
            Response.Redirect("~/Admin/Payment/RecivedPayment.aspx?SID=" + Hdfsale.Value + "&PID=" + hdfPartyID.Value);
        }
        catch(Exception ex)
        {
            alert.Visible = true;
            lblMSG.Text = "Error : "+ex.Message;
        }
    }


    protected void drdClntSrvc_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        DataTable dt = DataAccess.GetData("select NextRenewPrice,[ServiceTPID],[NextReNewdate] from [View_ClientService_Final] where [SerID]=" + drdClntSrvc.SelectedValue + "");
        if(dt.Rows.Count>0)
        {
            txtSerAnt.Text = dt.Rows[0]["NextRenewPrice"].ToString();
            if (dt.Rows[0]["NextReNewdate"].ToString() != string.Empty)
            {
                txtSerDate.Text = Convert.ToDateTime(dt.Rows[0]["NextReNewdate"].ToString()).ToString("dd-MM-yyyy");
            }
            DataTable dt1 = DataAccess.GetData("Select * from Category where CatID='" + dt.Rows[0]["ServiceTPID"].ToString() + "'");
            if (dt1.Rows.Count > 0 && dt1 != null)
            {
                //txtGst.Text = dt1.Rows[0]["Gst"].ToString();
                Hdfvalue.Value = dt1.Rows[0]["Gst"].ToString();


            }

            double Gst = 0;
            double SAmt = 0;
            double TAmt = 0;
            double GstAmt = 0;
            //if (txtGst.Text != string.Empty && txtGst.Text != string.Empty && txtSerAnt.Text != string.Empty && txtSerAnt.Text != null)
            //{
            //    Gst = Convert.ToDouble(txtGst.Text);
            //    SAmt = Convert.ToDouble(txtSerAnt.Text);
            //    GstAmt = SAmt * Gst / 100;
            //    txtGstAmt.Text = Convert.ToString(GstAmt);
            //    TAmt = SAmt + GstAmt;
            //    txtTamount.Text = Convert.ToString(TAmt);
            //}
            if (txtSerAnt.Text != string.Empty && txtSerAnt.Text != null)
            {
               // Gst = Convert.ToDouble(txtGst.Text);
                SAmt = Convert.ToDouble(txtSerAnt.Text);
                GstAmt = SAmt * Gst / 100;
                //txtGstAmt.Text = Convert.ToString(GstAmt);
                TAmt = SAmt + GstAmt;
              //  txtTamount.Text = Convert.ToString(TAmt);
            }
        }
    }

    protected void drdPurTP_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(drdPurTP.SelectedValue=="1")
        {
            renewDiv.Visible = false;
            newDiv.Visible = true;
            lblServDateText.Text = "Start Service Date";
            servDiv.Visible = true;
            btnSubmit.Visible = true;
           
        }
        else if(drdPurTP.SelectedValue=="2")
        {
            renewDiv.Visible = true;
            newDiv.Visible = false;
            lblServDateText.Text = "Renew Date";
            BindClientServ();
            servDiv.Visible = true;
            btnSubmit.Visible = true;
        }
    }
    private void BindClientServ()
    {
        drdClntSrvc.Items.Clear();
        ListItem item = new ListItem("Select Services", "");
        drdClntSrvc.Items.Add(item);

        DataTable dt = DataAccess.GetData("select [CategoryName],[SubCategoryN],[SerID],[DomainName] from [View_ClientService_Final] where [PartyID]=" + hdfPartyID.Value + " and Purchase_Type='New' and VoucherMasterID IS NOT NULL");
        if(dt.Rows.Count>0)
        {
            foreach(DataRow dr in dt.Rows)
            {
                ListItem item1 = new ListItem(dr["CategoryName"].ToString()+"-"+dr["SubCategoryN"].ToString()+" "+ dr["DomainName"].ToString(), dr["SerID"].ToString());
                drdClntSrvc.Items.Add(item1);
            }
        }
    }

    protected void txtSerDate_TextChanged(object sender, EventArgs e)
    {
        DateTime theDate = txtSerDate.Text.ToDateFormat();
        DateTime yearInTheFuture = theDate.AddYears(1);
        txtRendate.Text = yearInTheFuture.ToString("dd-MM-yyyy");
    }
}