using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
public partial class Admin_Sale_Sale_Invoice_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindCompanyName();
            Bind_Invoice_grdView();
            CustPager.Reload();
        }

    }

      public void bindCompanyName()
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

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Bind_Invoice_grdView();
    }

    private void Bind_Invoice_grdView()
    {


        string Query = string.Empty;
        Query = "select * from [View_VoucherMST] ";
        string whereConcatenator = " WHERE ";

        if (txtFromdate.Text != string.Empty)
        {
            Query += whereConcatenator;
            Query += "  cast(VoucherDate as date) >='" + txtFromdate.Text.Trim() + "'";
            whereConcatenator = " and ";
        }
        if (txtTodate.Text != string.Empty)
        {
            Query += whereConcatenator;
            Query += " cast(VoucherDate as date) <='" + txtTodate.Text.Trim() + "'";
            whereConcatenator = " and ";
        }


     

        if (ddlCompany.SelectedValue != "0")
        {
            string status = string.Empty;
            DataTable dtgst = DataAccess.GetData("Select [IsGst] from [Company_detail] Where [CompanyID]=" + ddlCompany.SelectedValue + " ");
            if (dtgst.Rows.Count > 0)
            {
              status = dtgst.Rows[0]["IsGst"].ToString();
            }
            if (status == "GST")
            {
                Query += whereConcatenator;
                Query += "is_gst= 1 ";
                whereConcatenator = " and ";
            }
            else
            {
                Query += whereConcatenator;
                Query += "is_gst IS NULL ";
                whereConcatenator = "and ";

            }
           
        }


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
        //    Query += "mobile_no ='" + txtSearchValue.Text.Trim() + "'";
        //    whereConcatenator = " and ";
        //}

        //if (drdSeacrchTP.SelectedValue != "")
        //{
        //  Query += whereConcatenator;
        //  Query += "ID !='1'";
        //    Query += whereConcatenator;
        //    Query += "ProductName like '" + txtSerch.Text.Trim() + "%'";
        //    //Query += "convert(varchar,[NewsDate],103)='" + txtSerch.Text.Trim() + "'";
        //    whereConcatenator = "and ";
        //}
        Query += "order by VoucherMasterID desc";

        //DataTable dt = DataAccess.GetData(Query);* from [View_Demo]  order by [DemoId] desc

        DataTable dt = DataAccess.GetData(Query);



      //  DataTable dt = DataAccess.GetData("select * from [View_VoucherMST]");
      
        if (dt.Rows.Count > 0 && dt != null)
        {
          

            grdView.DataSource = dt;
            grdView.DataBind();

            int TotalPage = dt.Rows.Count;
            CustPager.TotalRecords = TotalPage;
            CustPager.TotalPage = TotalPage % grdView.PageSize == 0 ? TotalPage / grdView.PageSize : TotalPage / grdView.PageSize + 1;
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
    protected void CustPager_PageChanged(object sender, CustomPageChangeArgs e)
    {
        grdView.PageSize = e.CurrentPageSize;
        grdView.PageIndex = e.CurrentPageNumber - 1;
        Bind_Invoice_grdView();   //bindBranchList();
        CustPager.Reload();

    }
  
    protected void lnkExcel_Click(object sender, EventArgs e)
    {
        ExportGridToExcel();
    }

    private void ExportGridToExcel()
    {

      
        Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName = "SaleInvoiceFile" + DateTime.Now + ".xls";
        StringWriter strwritter = new StringWriter();
        HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
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
        
    }

    protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {



            //

            HiddenField hdfVMId = (HiddenField)e.Row.FindControl("hdfVMId");


            Label lblCatgoryName = (Label)e.Row.FindControl("lblCategoryName");

            Label lblSubCategory = (Label)e.Row.FindControl("lblSubCategory");

            Label lblDomainName = (Label)e.Row.FindControl("lblDomainName");

            Literal ltrServices = (Literal)e.Row.FindControl("ltrServices");

            //ltrServices

            DataTable dt = DataAccess.GetData("select * from [View_VchMasterWithVchDet] where  [VoucherMasterID]=" + hdfVMId.Value + " ");
            
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {

                    ltrServices.Text+= "<div>"+row["CategoryName"].ToString() + " <span>-</span> " + row["SubCategoryN"].ToString() + "<span>-</span>" + row["DomainName"].ToString() + "<br/> ";

                    //lblCatgoryName.Text += dt.Rows[i]["CategoryName"].ToString()+"-";

                    //lblSubCategory.Text += dt.Rows[i]["SubCategoryN"].ToString();

                    //lblDomainName.Text += dt.Rows[i]["DomainName"].ToString();

                }

            }


        }
    }









    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtFromdate.Text = string.Empty;
        txtTodate.Text = string.Empty;
        Bind_Invoice_grdView();
        CustPager.Reload();
    }
}