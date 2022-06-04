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

public partial class Admin_Sale_SaleInvoice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindParty();
            string MaxRID = string.Empty;
            string ID_RFormat = string.Empty;
            ID_Generator ID_RGen = new ID_Generator();
            try
            {
                MaxRID = DataAccess.GetSingleValue("select top 1 [InvoiceNo] from [Sale_Invoice]  order by [SaleId] desc");
            }
            catch { }
            ID_RFormat = "INV-00000";
            txtInvoice.Text = ID_RGen.GenrateProductID(MaxRID, ID_RFormat);


            if (Request.QueryString["SInVID"] != null)
            {
                hdfSaleID.Value = Request.QueryString["SInVID"].ToString();
                bindInvoiceDetail();
            }


        }

    }


    public void bindInvoiceDetail()
    {
        DataTable dt = DataAccess.GetData("Select * from [Sale_Invoice] Where [SaleId] =" + hdfSaleID.Value + " ");
        if (dt.Rows.Count > 0)
        {
            BindParty();
            drdParty.SelectedValue = dt.Rows[0]["PartyID"].ToString();
            txtInvoice.Text = dt.Rows[0]["InvoiceNo"].ToString();
            txtInvoiceDate.Text = Convert.ToDateTime(dt.Rows[0]["SaleInvoiceDate"]).ToString("dd-MM-yyyy");
            txtPaidAmt.Text = dt.Rows[0]["ReceivedAmount"].ToString();
            txtDescription.Text = dt.Rows[0]["Description"].ToString();
            hdfInvoiceFile.Value = dt.Rows[0]["SaleInvoiceFile"].ToString();
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
        DataTable dt = DataAccess.GetData("Select * from [PartyMaster] where Is_active='1' and Party_Type='4' ");
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




    protected void btnSerParty_Click(object sender, EventArgs e)
    {
        BindPartDetails();

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
            if (File.Exists(Server.MapPath("~/SaleInvoice/" + fname)))
            {
                File.Delete(Server.MapPath("~/SaleInvoice/" + fname));
            }

            fuInvoiceFile.SaveAs(Server.MapPath("~/SaleInvoice/" + fname));
            hdfInvoiceFile.Value = fname;
        }



        if (hdfSaleID.Value == string.Empty)
        {

            SqlCommand cmd = new SqlCommand("Insert into [Sale_Invoice] ([PartyID],[InvoiceNo],[SaleInvoiceDate],[ReceivedAmount],[Description],[SaleInvoiceFile],[CreatedOn]) Values(@PartyID,@InvoiceNo,@SaleInvoiceDate,@ReceivedAmount,@Description,@SaleInvoiceFile,@CreatedOn) ");
            cmd.Parameters.AddWithValue("@PartyID", drdParty.SelectedValue);
            cmd.Parameters.AddWithValue("@InvoiceNo", txtInvoice.Text);
            cmd.Parameters.AddWithValue("@SaleInvoiceDate", txtInvoiceDate.Text.ToDateFormat());
            if (txtPaidAmt.Text != string.Empty)
            {
                cmd.Parameters.AddWithValue("@ReceivedAmount", txtPaidAmt.Text);
            }

            else
            {
                cmd.Parameters.AddWithValue("@ReceivedAmount", "0");
            }

            cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
            cmd.Parameters.AddWithValue("@SaleInvoiceFile", hdfInvoiceFile.Value);
            cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMSG.Text = "Sale Invoice Details Saved Successfully";

        }

        else
        {
            SqlCommand cmd = new SqlCommand("Update [Sale_Invoice] SET [PartyID]=@PartyID,[InvoiceNo]=@InvoiceNo,[SaleInvoiceDate]=@SaleInvoiceDate,[ReceivedAmount]=@ReceivedAmount,[Description]=@Description,[SaleInvoiceFile]=@SaleInvoiceFile Where [SaleId] =" +hdfSaleID.Value + "  ");
            cmd.Parameters.AddWithValue("@PartyID", drdParty.SelectedValue);
            cmd.Parameters.AddWithValue("@InvoiceNo", txtInvoice.Text);
            cmd.Parameters.AddWithValue("@SaleInvoiceDate", txtInvoiceDate.Text.ToDateFormat());
            if (txtPaidAmt.Text != string.Empty)
            {
                cmd.Parameters.AddWithValue("@ReceivedAmount", txtPaidAmt.Text);
            }

            else
            {
                cmd.Parameters.AddWithValue("@ReceivedAmount", "0");
            }
            cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
            cmd.Parameters.AddWithValue("@SaleInvoiceFile", hdfInvoiceFile.Value);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMSG.Text = "Sale Invoice Details Updated Successfully";

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
    }
}