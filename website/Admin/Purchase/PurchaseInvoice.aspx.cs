using Amity.ERP_Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Purchase_PurchaseInvoice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindParty();
            BindCompany();
            string MaxRID = string.Empty;
            string ID_RFormat = string.Empty;
            ID_Generator ID_RGen = new ID_Generator();
            try
            {
                MaxRID = DataAccess.GetSingleValue("select top 1 [PurInvoiceNo] from [Purchase_Invoice]  order by [PurchaseId] desc");
            }
            catch { }
            ID_RFormat = "ITSP-00000";
            hdfPurInvNo.Value = ID_RGen.GenrateProductID(MaxRID, ID_RFormat);


            if (Request.QueryString["PInVID"] != null)
            {
                hdfPurchaseID.Value = Request.QueryString["PInVID"].ToString();
                bindInvoiceDetail();
            }


        }

    }

    public void BindCompany()
    {

        ddlCompany.Items.Clear();
        ListItem item = new ListItem("Select Company", "0");
        ddlCompany.Items.Add(item);

        DataTable dt = DataAccess.GetData("Select * from [Company_detail] ");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                ListItem item1 = new ListItem(row["CompanyName"].ToString(), row["CompanyID"].ToString());

                ddlCompany.Items.Add(item1);

            }
        }

    }


    public void bindInvoiceDetail()
    {
        DataTable dt = DataAccess.GetData("Select * from [Purchase_Invoice] Where [PurchaseId] =" + hdfPurchaseID.Value+" ");
        if (dt.Rows.Count > 0)
        {
            BindParty();
            drdParty.SelectedValue = dt.Rows[0]["PartyID"].ToString();
            txtInvoice.Text= dt.Rows[0]["InvoiceNo"].ToString();
            txtInvoiceDate.Text= Convert.ToDateTime(dt.Rows[0]["InvoiceDate"]).ToString("dd-MM-yyyy");
            txtPaidAmt.Text= dt.Rows[0]["PaidAmount"].ToString();
            txtDescription.Text= dt.Rows[0]["Description"].ToString();
            hdfInvoiceFile.Value= dt.Rows[0]["InvoiceFile"].ToString();
            btnSubmit.Text = "Update";     
     
        }
    }

    private void BindParty()
    {
        drdParty.Items.Clear();
        ListItem item1 = new ListItem();
        item1.Value = "0";
        item1.Text = "--Select--";
        drdParty.Items.Add(item1);
        DataTable dt = DataAccess.GetData("Select * from [PartyMaster] where Is_active='1' and Party_Type='5' ");
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
  

    private void BindPartDetails()
    {
        try
        {
         

            DataTable dtt = DataAccess.GetData("Select * from PartyMaster where [PartyID]='" + drdParty.SelectedValue + "'");
            if (dtt.Rows.Count > 0 && dtt != null)
            {
                lblAddress.Text = dtt.Rows[0]["address"].ToString();
                lblEmailID.Text = dtt.Rows[0]["Email"].ToString();
                lblPartyN.Text = dtt.Rows[0]["Party_name"].ToString();
                lblPmob.Text = dtt.Rows[0]["mobile_no"].ToString();                                    

            }
           
        }
        catch { }
    }  

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (fuInvoiceFile.HasFile)
        {
            System.IO.FileInfo file = new System.IO.FileInfo(fuInvoiceFile.PostedFile.FileName);
            string fname = file.Name.Remove((file.Name.Length - file.Extension.Length));
            fname = fname + file.Extension;
            if (File.Exists(Server.MapPath("~/PurchaseInvoice/" + fname)))
            {
                File.Delete(Server.MapPath("~/PurchaseInvoice/" + fname));
            }

            fuInvoiceFile.SaveAs(Server.MapPath("~/PurchaseInvoice/" + fname));
            hdfInvoiceFile.Value = fname;
        }



        if (hdfPurchaseID.Value== string.Empty)
        {

            SqlCommand cmd = new SqlCommand("Insert into [Purchase_Invoice] ([PartyID],[InvoiceNo],[InvoiceDate],[PaidAmount],[Description],[InvoiceFile],[CreatedOn],[CompanyID],[PurInvoiceNo]) Values(@PartyID,@InvoiceNo,@InvoiceDate,@PaidAmount,@Description,@InvoiceFile,@CreatedOn,@CompanyID,@PurInvoiceNo) ");
            cmd.Parameters.AddWithValue("@PartyID", drdParty.SelectedValue);
            cmd.Parameters.AddWithValue("@InvoiceNo", txtInvoice.Text);
            cmd.Parameters.AddWithValue("@InvoiceDate", txtInvoiceDate.Text.ToDateFormat());
            if (txtPaidAmt.Text != string.Empty)
            {
                cmd.Parameters.AddWithValue("@PaidAmount", txtPaidAmt.Text);
            }

            else
            {
                cmd.Parameters.AddWithValue("@PaidAmount", "0");
            }

            cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
            cmd.Parameters.AddWithValue("@InvoiceFile", hdfInvoiceFile.Value);
            cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
            cmd.Parameters.AddWithValue("@CompanyID", ddlCompany.SelectedValue);
            cmd.Parameters.AddWithValue("@PurInvoiceNo", hdfPurInvNo.Value);
           


            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMSG.Text = "Invoice Details Saved Successfully";

        }

        else
        {
            SqlCommand cmd = new SqlCommand("Update [Purchase_Invoice] SET [PartyID]=@PartyID,[InvoiceNo]=@InvoiceNo,[InvoiceDate]=@InvoiceDate,[PaidAmount]=@PaidAmount,[Description]=@Description,[InvoiceFile]=@InvoiceFile,[CompanyID]=@CompanyID Where [PurchaseId] =" + hdfPurchaseID.Value + "  ");
            cmd.Parameters.AddWithValue("@PartyID", drdParty.SelectedValue);
            cmd.Parameters.AddWithValue("@InvoiceNo", txtInvoice.Text);
            cmd.Parameters.AddWithValue("@InvoiceDate", txtInvoiceDate.Text.ToDateFormat());
            if (txtPaidAmt.Text != string.Empty)
            {
                cmd.Parameters.AddWithValue("@PaidAmount", txtPaidAmt.Text);
            }

            else
            {
                cmd.Parameters.AddWithValue("@PaidAmount", "0");
            }
            cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
            cmd.Parameters.AddWithValue("@InvoiceFile", hdfInvoiceFile.Value);
            cmd.Parameters.AddWithValue("@CompanyID", ddlCompany.SelectedValue);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMSG.Text = "Invoice Details Updated Successfully";

        }

        clearField();       
    }

    public void clearField()
    {
        drdParty.ClearSelection();
        txtInvoice.Text = string.Empty;
        txtInvoiceDate.Text = string.Empty;
        txtPaidAmt.Text = string.Empty;
        txtDescription.Text = string.Empty;
        hdfInvoiceFile.Value = string.Empty;
        ddlCompany.ClearSelection();
        hdfPurInvNo.Value = string.Empty;
    }



    protected void drdParty_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindPartDetails();
    }
}