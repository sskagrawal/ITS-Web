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

public partial class Admin_Sale_AddPartyService : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {          

            if (Request.QueryString["PID"] != null)
            {
                hdfPartyID.Value = Request.QueryString["PID"].ToString();
                BindClientServ();
                BindGrid();             
             
                //string FinYear = obj_IDGen.GetFinYear(DateTime.Now.Date.ToString());
                //drdSession.Items.FindByText(FinYear).Selected = true;


            }
            if (Request.QueryString["NSVID"] != null)
            {              
          
                hdfPartyID.Value = Request.QueryString["NSVID"].ToString();             
               
            }
           

            BindServiceTp();

        }
    }

    private void BindClientServ()
    {
        drdClntSrvc.Items.Clear();
        ListItem item = new ListItem("Select Services", "");
        drdClntSrvc.Items.Add(item);

        DataTable dt = DataAccess.GetData("select [CategoryName],[SubCategoryN],[SerID],[DomainName] from [View_ClientService_Final] where [PartyID]=" + hdfPartyID.Value + " and Purchase_Type='New' and VoucherMasterID IS NOT NULL");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item1 = new ListItem(dr["CategoryName"].ToString() + "-" + dr["SubCategoryN"].ToString() + " " + dr["DomainName"].ToString(), dr["SerID"].ToString());
                drdClntSrvc.Items.Add(item1);
            }
        }
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



 
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtSerDate.Text != string.Empty)
        {
            DateTime theDate = txtSerDate.Text.ToDateFormat();
            DateTime yearInTheFuture = theDate.AddYears(1);
            hdfNextRenewdate.Value = yearInTheFuture.ToString();
        }
        string servId = string.Empty;
        if (hdfClienrServiceId.Value == string.Empty)
        {

            SqlCommand cmdd = new SqlCommand("INSERT INTO [ClientService] ([PartyID],[ServiceTPID],[ServiceID],[NextReNewdate],[PurCahseDate],[CreateDate],[DomainName],[NextRenewPrice],[PurchasePrice]) VALUES(@PartyID,@ServiceTPID,@ServiceID,@NextReNewdate,@PurCahseDate,@CreateDate,@DomainName,@NextRenewPrice,@PurchasePrice); select scope_identity();");
            cmdd.Parameters.AddWithValue("@PartyID", hdfPartyID.Value);
            cmdd.Parameters.AddWithValue("@ServiceTPID", drdServiceTp.SelectedValue);
            cmdd.Parameters.AddWithValue("@ServiceID", drdService.SelectedValue);
            if (hdfNextRenewdate.Value != string.Empty)
            {
                cmdd.Parameters.AddWithValue("@NextReNewdate", hdfNextRenewdate.Value.ToDateFormat());
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
            alert.Visible = true;
            lblMSG.Text = "Service Add Successfully";
        }



       else {

            SqlCommand cmdd = new SqlCommand("UPDATE [ClientService] set [NextReNewdate]=@NextReNewdate,[PurCahseDate]=@PurCahseDate, [LastRenewedOn]=@LastRenewedOn,[NextRenewPrice]=@NextRenewPrice,[PurchasePrice]=@PurchasePrice ,[DomainName]=@DomainName,[ServiceTPID]=@ServiceTPID,[ServiceID]=@ServiceID where SerID=" + hdfClienrServiceId.Value+" ");
            if (hdfNextRenewdate.Value != string.Empty)
            {
                cmdd.Parameters.AddWithValue("@NextReNewdate", hdfNextRenewdate.Value.ToDateFormat());
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


            if (txtSerAnt.Text != string.Empty)
            {
                cmdd.Parameters.AddWithValue("@PurchasePrice", txtSerAnt.Text);
            }
            else
            {
                cmdd.Parameters.AddWithValue("@PurchasePrice", "0");
            }

            cmdd.Parameters.AddWithValue("@DomainName", txtDomnName.Text);

            cmdd.Parameters.AddWithValue("@ServiceTPID", drdServiceTp.SelectedValue);
            cmdd.Parameters.AddWithValue("@ServiceID", drdService.SelectedValue);

            DataAccess.InsertExecuteNonQuery(cmdd);
            alert.Visible = true;
            lblMSG.Text = "Service Updated Successfully";
        }
        BindGrid();

      

        drdServiceTp.ClearSelection();
        drdService.ClearSelection();     
        txtSerDate.Text = string.Empty;
        txtDomnName.Text = string.Empty;
        txtReNewAmt.Text = string.Empty;
        txtSerAnt.Text = string.Empty;
    }


   


    private void BindGrid()
    {
        if (hdfPartyID.Value != string.Empty)
        {
           
                DataTable dt = DataAccess.GetData("select * from [View_ClientServices] where  PartyID=" + hdfPartyID.Value + " order by [PartyID] desc");
                if (dt.Rows.Count > 0 && dt != null)
                {
                    gvDetails.DataSource = dt;
                    gvDetails.DataBind();
                }
            }
        }
   



    protected void drdServiceTp_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (drdServiceTp.SelectedItem.Text == "Website" || drdServiceTp.SelectedItem.Text == "Software")
        {


        }

        else
        {
            

        }


       
        bindService();
    }

 

    protected void drdService_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable dt = DataAccess.GetData("Select * from [SubCategory] where CatID='" + drdServiceTp.SelectedValue + "' and [SubCat]="+ drdService.SelectedValue + "");
        if (dt.Rows.Count > 0 && dt != null)
        {
            txtSerAnt.Text = dt.Rows[0]["Amount"].ToString();
            Hdfservicevalue.Value = dt.Rows[0]["Amount"].ToString();

            txtReNewAmt.Text = dt.Rows[0]["RenewAmt"].ToString();
          
        }
        int Gst = 0;
        int SAmt = 0;
        int TAmt = 0;
        int GstAmt = 0;
       
        if (txtSerAnt.Text != string.Empty && txtSerAnt.Text != null)
        {
          
            SAmt = Convert.ToInt32(txtSerAnt.Text);
            GstAmt = SAmt * Gst / 100;         
            TAmt = SAmt + GstAmt;
           
        }
    }
  

    

   
  
    public double Amount = 0;
    public double SpRice = 0;
    public double GstAmt = 0;
    protected void gvDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int DEmochargeAmount = 0;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
           
            Label lblSprice = (Label)e.Row.FindControl("lblSprice"); 
           
            if (lblSprice.Text != string.Empty)
            {
                SpRice += Convert.ToDouble(lblSprice.Text);

            }

        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblPriceP = (Label)e.Row.FindControl("lblPriceP");
          
            Label lblTAmt = (Label)e.Row.FindControl("lblTAmt");
            if (Amount != 0)
            {
                lblTAmt.Text = Convert.ToString(Amount);
            }
            if (SpRice != 0)
            {
                lblPriceP.Text = Convert.ToString(SpRice);
            }
          

        }
    }
  
   

    protected void drdClntSrvc_SelectedIndexChanged(object sender, EventArgs e)
    {

        DataTable dt = DataAccess.GetData("select NextRenewPrice,[ServiceTPID],[NextReNewdate] from [View_ClientService_Final] where [SerID]=" + drdClntSrvc.SelectedValue + "");
        if (dt.Rows.Count > 0)
        {
            txtSerAnt.Text = dt.Rows[0]["NextRenewPrice"].ToString();
            if (dt.Rows[0]["NextReNewdate"].ToString() != string.Empty)
            {
                txtSerDate.Text = Convert.ToDateTime(dt.Rows[0]["NextReNewdate"].ToString()).ToString("dd-MM-yyyy");
            }
            DataTable dt1 = DataAccess.GetData("Select * from Category where CatID='" + dt.Rows[0]["ServiceTPID"].ToString() + "'");
            if (dt1.Rows.Count > 0 && dt1 != null)
            {              
                Hdfvalue.Value = dt1.Rows[0]["Gst"].ToString();
            }

            double Gst = 0;
            double SAmt = 0;
            double TAmt = 0;
            double GstAmt = 0;
         
            if (txtSerAnt.Text != string.Empty && txtSerAnt.Text != null)
            {
             
                SAmt = Convert.ToDouble(txtSerAnt.Text);
                GstAmt = SAmt * Gst / 100;           
                TAmt = SAmt + GstAmt;
               
            }
        }
    }



    protected void Edit(object sender, EventArgs e)
    {
        ImageButton imgBtn = sender as ImageButton;

        GridViewRow grdRow = (GridViewRow)imgBtn.NamingContainer;
        HiddenField hdfPartyID = (HiddenField)(grdRow.FindControl("hdfParty"));       
        HiddenField hdfServId = (HiddenField)(grdRow.FindControl("hdfServId"));

        hdfClienrServiceId.Value = hdfServId.Value;
        if (imgBtn.ID.Equals("imgbtnEdit"))
        {
            DataTable dt = DataAccess.GetData("select * from [ClientService] WHERE SerID='" + hdfServId.Value + "'");
            if (dt.Rows.Count > 0 && dt != null)
            {
              
                hdfPartyID.Value = dt.Rows[0]["PartyId"].ToString();
                bindService();            
           
                txtSerAnt.Text = dt.Rows[0]["PurchasePrice"].ToString();
                txtReNewAmt.Text = dt.Rows[0]["NextRenewPrice"].ToString();
                BindServiceTp();
                drdServiceTp.SelectedValue = dt.Rows[0]["ServiceTPID"].ToString();
                bindService();
                drdService.SelectedValue = dt.Rows[0]["ServiceID"].ToString();
                txtSerDate.Text = Convert.ToDateTime(dt.Rows[0]["PurCahseDate"]).ToString("dd-MM-yyyy");
               hdfNextRenewdate.Value = Convert.ToDateTime(dt.Rows[0]["NextReNewdate"]).ToString();
                txtDomnName.Text = dt.Rows[0]["DomainName"].ToString();

                btnSubmit.Text = "Update";            


              
            }
        
        }
        else if (imgBtn.ID.Equals("imgbtnDelete"))
        {
           
            SqlCommand cmd1 = new SqlCommand("DELETE FROM [ClientService] WHERE [SerID]='" + hdfServId.Value + "'");
            DataAccess.InsertExecuteNonQuery(cmd1);
            BindGrid();
        }
    }
    protected void txtSerDate_TextChanged(object sender, EventArgs e)
    {
      
        DateTime theDate = txtSerDate.Text.ToDateFormat();
        DateTime yearInTheFuture = theDate.AddYears(1);
        hdfNextRenewdate.Value = yearInTheFuture.ToString("dd-MM-yyyy");
    }


    protected void btngotoInvove_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddSaleVoucher.aspx?PID=" + hdfPartyID.Value + "");
    }

    protected void btngotoInvove_Click1(object sender, EventArgs e)
    {

    }
}
