using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Admin_Purchase_Purchase_Invoice_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_Invoice_grdView();
        }

    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtFromdate.Text = string.Empty;
        txtTodate.Text = string.Empty;
        Bind_Invoice_grdView();
        CustPager.Reload();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Bind_Invoice_grdView();
    }

    private void Bind_Invoice_grdView()
    {

        string Query = string.Empty;
        Query = "select * from [View_PurchaseInvoice] ";
        string whereConcatenator = " WHERE ";

        if (txtFromdate.Text != string.Empty)
        {
            Query += whereConcatenator;
            Query += "  cast(InvoiceDate as date) >='" + txtFromdate.Text.Trim() + "'";
            whereConcatenator = " and ";
        }
        if (txtTodate.Text != string.Empty)
        {
            Query += whereConcatenator;
            Query += " cast(InvoiceDate as date) <='" + txtTodate.Text.Trim() + "'";
            whereConcatenator = " and ";
        }

        //if (ddlPartysearch.SelectedValue == "1")
        //{
        //    Query += whereConcatenator;
        //    Query += "Party_name like '" + txtsearch.Text + "%' ";
        //    whereConcatenator = " and ";
        //}

        //else if (ddlPartysearch.SelectedValue == "2")
        //{
        //    Query += whereConcatenator;
        //    Query += "Email like '" + txtsearch.Text + "%' ";
        //    whereConcatenator = " and ";
        //}

        //else if (ddlPartysearch.SelectedValue == "3")
        //{
        //    Query += whereConcatenator;
        //    Query += "mobile_no like '" + txtsearch.Text + "%' ";
        //    whereConcatenator = " and ";
        //}



        Query += "order by PurchaseId desc";    

        DataTable dt = DataAccess.GetData(Query);

      //  DataTable dt = DataAccess.GetData("select * from [View_PurchaseInvoice] order by [PurchaseId] desc");
        if (dt.Rows.Count > 0 && dt != null)
        {
            grdView.DataSource = dt;
            grdView.DataBind();

            int TotalPage = dt.Rows.Count;
            CustPager.TotalRecords = TotalPage;
            CustPager.TotalPage = TotalPage % grdView.PageSize == 0 ? TotalPage / grdView.PageSize : TotalPage / grdView.PageSize + 1;
        }
    }
    protected void CustPager_PageChanged(object sender, CustomPageChangeArgs e)
    {
        grdView.PageSize = e.CurrentPageSize;
        grdView.PageIndex = e.CurrentPageNumber - 1;
        Bind_Invoice_grdView();   //bindBranchList();
        CustPager.Reload();

    }
    protected void Edit(object sender, ImageClickEventArgs e)
    {
        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;

        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfID")).Value);

        if (btndetails.ID.Equals("imgbtnUpdate"))
        {
            Response.Redirect("PurchaseInvoice.aspx?PInVID=" + ID);

        }
        else if (btndetails.ID.Equals("imgbtnDelete"))
        {

            SqlCommand cmd = new SqlCommand("DELETE FROM [Purchase_Invoice]  WHERE  [PurchaseId] =" + ID + "");
            DataAccess.InsertExecuteNonQuery(cmd);


        }
        Bind_Invoice_grdView();
        CustPager.Reload();
    }




    protected void lnkExcel_Click(object sender, EventArgs e)
    {
        ExportGridToExcel();
    }


    private void ExportGridToExcel()
    {

        //grdView.Columns[5].Visible = false;
        //grdView.Columns[7].Visible = false;
        //grdView.Columns[8].Visible = false;

        grdView.Columns[7].Visible = false;
        grdView.Columns[9].Visible = false;
        grdView.Columns[10].Visible = false;


        Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName = "InvoiceFile" + DateTime.Now + ".xls";
        StringWriter strwritter = new StringWriter();
        HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        Response.Cache.SetCacheability(HttpCacheability.NoCache);


        //grdView.Columns[5].Visible = false;
        //grdView.Columns[7].Visible = false;
        //grdView.Columns[8].Visible = false;

        grdView.Columns[7].Visible = false;
        grdView.Columns[9].Visible = false;
        grdView.Columns[10].Visible = false;


        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
        grdView.GridLines = GridLines.Both;
        grdView.HeaderStyle.Font.Bold = true;
        grdView.RenderControl(htmltextwrtter);
        Response.Write(strwritter.ToString());
        Response.End();

    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        //required to avoid the runtime error "  
        //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
    }



    protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            HiddenField hdfInvFile1 = (HiddenField)e.Row.FindControl("hdfInvFile");
            Literal ltrInvFile = (Literal)e.Row.FindControl("ltrInvFile");

            if (hdfInvFile1.Value != string.Empty)
            {
                //ltrCrtifikt.Text = "<a title='Education Certificate'  href='../EduCertificate/" + hdfCrtifikt.Value + "'> <img src='images/Download.gif' alt='download'/></a>";
                ltrInvFile.Text = "<a title='Download Invoice File' href='../../PurchaseInvoice/"+ hdfInvFile1.Value + "' target='_blank'> <img src = '../../images/Download.gif' /></a>";

               
            }

        }
    }
}