using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Controle_ProductList : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindcategory();

            if (Session["partyid"] != null)
            {
                hdfClientId.Value = Session["partyid"].ToString();
                binddata();            
                CustPager.Reload();
            }


            //if (Request.QueryString["NID"] != null)
            //{
            //    hdfid.Value = Request.QueryString["NID"].ToString();
            //}

        }

    }

    public void bindcategory()
    {

        ddl_Category.Items.Clear();
        ListItem item1 = new ListItem();
        item1.Text = "-Select Category-";
        item1.Value = "0";
        ddl_Category.Items.Add(item1);

        DataTable dt = DataAccess.GetData("select * from [ecom_CategoryMaster] ");
        if (dt != null && dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["CategoryID"].ToString();
                item.Text = dr["CategoryName"].ToString();

                ddl_Category.Items.Add(item);
            }
        }
    }

    //public void binddata()
    //{



    //    DataTable dt = DataAccess.GetData("select * from [View_ecom_ProductDetail] Where [EditedBy]=" + hdfClientId.Value+" ");
    //    if (dt.Rows.Count > 0)
    //    {
    //        gv_product.DataSource = dt;
    //        gv_product.DataBind();
    //        int TotalPage = dt.Rows.Count;
    //        CustPager.TotalRecords = TotalPage;
    //        CustPager.TotalPage = TotalPage % gv_product.PageSize == 0 ? TotalPage / gv_product.PageSize : TotalPage / gv_product.PageSize + 1;
    //    }
    //}
    protected void imgbtnEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtn = sender as ImageButton;
        GridViewRow grdRow = (GridViewRow)imgbtn.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdRow.FindControl("hdf_ID")).Value);
        hdfid.Value = ID.ToString();
        Response.Redirect("~/Admin/Ecommerce/AddUpdateProduct2.aspx?PrdId=" + ID);
    }
    protected void Delete(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtn = sender as ImageButton;
        GridViewRow grdRow = (GridViewRow)imgbtn.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdRow.FindControl("hdf_ID")).Value);
        hdfid.Value = ID.ToString();

        SqlCommand cmd = new SqlCommand("Delete from [ecom_Product] where [Product_id] = " + hdfid.Value + "");
        DataAccess.InsertExecuteNonQuery(cmd);
        binddata();
        CustPager.Reload();
        divMsg.Visible = true;
        lblmsg.Text = "Record Delete Sucessfully";
    }

    protected void CustPager_PageChanged(object sender, CustomPageChangeArgs e)
    {
        gv_product.PageSize = e.CurrentPageSize;
        gv_product.PageIndex = e.CurrentPageNumber - 1;
        binddata();
        CustPager.Reload();
    }
    private void ClearTextbox()
    {
        hdfid.Value = string.Empty;
    }
    public void binddata()
    {
        string Query = string.Empty;
        Query = "select * from [View_ecom_ProductDetail]";
        string whereConcatenator = " WHERE ";
        if (txtSearch.Text != string.Empty)
        {
            Query += whereConcatenator;
            Query += "product_name like '" + txtSearch.Text.TrimStart() + "%' ";
            whereConcatenator = " and ";
        }

        if (ddl_Category.SelectedValue != "0")
        {

            Query += whereConcatenator;
            Query += "CategoryID=" + ddl_Category.SelectedValue + " ";
            whereConcatenator = " and ";
        }

        if (ddlsubcategory.SelectedValue != "0")
        {

            Query += whereConcatenator;
            Query += "SubCategoryID=" + ddlsubcategory.SelectedValue + " ";
            whereConcatenator = " and ";

        }

        if (ddlChildCategory.SelectedValue != "0")
        {
            Query += whereConcatenator;
            Query += "ChildCategoryId=" + ddlChildCategory.SelectedValue + " ";
            whereConcatenator = " and ";
        }

        //if (ddlStatus.SelectedValue != string.Empty)
        //{

        //    Query += whereConcatenator;
        //    Query += "Status=" + ddlStatus.SelectedValue + " ";
        //    whereConcatenator = " and ";

        //}       

        if (hdfClientId.Value != string.Empty)
        {
               Query += whereConcatenator;
               Query += "EditedBy=" + hdfClientId.Value + " ";
               whereConcatenator = " and ";

        }

        //else
        //{
        //    Query += whereConcatenator;
        //    Query += "EditedBy IS NULL ";
        //    whereConcatenator = " and ";

        //}

        DataTable dt = DataAccess.GetData(Query);
        if (dt != null)
        {
            gv_product.DataSource = dt;
            gv_product.DataBind();

            int TotalPage = dt.Rows.Count;
            CustPager.TotalRecords = TotalPage;
            CustPager.TotalPage = TotalPage % gv_product.PageSize == 0 ? TotalPage / gv_product.PageSize : TotalPage / gv_product.PageSize + 1;

        }
        else
        {

            dt.Rows.Add(dt.NewRow());

            gv_product.DataSource = dt;

            gv_product.DataBind();

            int TotalColumns = gv_product.Rows[0].Cells.Count;

            gv_product.Rows[0].Cells.Clear();

            gv_product.Rows[0].Cells.Add(new TableCell());

            gv_product.Rows[0].Cells[0].ColumnSpan = TotalColumns;

            gv_product.Rows[0].Cells[0].Text = "No records Found";



        }

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        binddata();
    }

    protected void ddl_Category_SelectedIndexChanged(object sender, EventArgs e)
    {
        binddata();
        bindSubCategory();
    }

    public void bindSubCategory()
    {
        ddlsubcategory.Items.Clear();
        ListItem item1 = new ListItem();
        item1.Text = "-Select Sub Category-";
        item1.Value = "0";
        ddlsubcategory.Items.Add(item1);

        DataTable dt = DataAccess.GetData("select * from [ecom_SubCategoryMaster] Where [CategoryID]=" + ddl_Category.SelectedValue + " ");
        if (dt != null && dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["SubCategoryID"].ToString();
                item.Text = dr["SubCategoryName"].ToString();
                ddlsubcategory.Items.Add(item);
            }
        }
    }

    protected void ddlsubcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        binddata();
        bindchildcategory();
    }

    public void bindchildcategory()
    {

        ddlChildCategory.Items.Clear();
        ListItem item1 = new ListItem();
        item1.Text = "-Select Child Category-";
        item1.Value = "0";
        ddlChildCategory.Items.Add(item1);

        DataTable dt = DataAccess.GetData("select * from [ecom_ChildCategoryMaster] Where [SubCategoryID]=" + ddlsubcategory.SelectedValue + " ");
        if (dt != null && dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["ChildCategoryId"].ToString();
                item.Text = dr["ChildCategoryName"].ToString();
                ddlChildCategory.Items.Add(item);
            }
        }
    }
    protected void ddlChildCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        binddata();
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtSearch.Text = string.Empty;
        ddl_Category.ClearSelection();
        ddlsubcategory.ClearSelection();
        ddlChildCategory.ClearSelection();
        //   ddlStatus.ClearSelection();
        binddata();
    }

    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        binddata();
    }


    protected void imgbtnActive_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtnEdit = sender as ImageButton;
        GridViewRow grdRow = (GridViewRow)imgbtnEdit.NamingContainer;

        string ID = (((HiddenField)(grdRow.FindControl("hdf_ID"))).Value).ToString();

        HiddenField hdfIsActive = (HiddenField)grdRow.FindControl("hdfIsActive");

        if (hdfIsActive.Value == "True")
        {
            SqlCommand cmd = new SqlCommand("UPDATE [ecom_Product] SET [Status] =0 WHERE [Product_id]=" + ID + " ");
            DataAccess.InsertExecuteNonQuery(cmd);
            divMsg.Visible = true;
            lblmsg.Text = "Product Inactive";


        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [ecom_Product] SET [Status] =1 WHERE [Product_id]=" + ID + " ");
            DataAccess.InsertExecuteNonQuery(cmd);

            divMsg.Visible = true;
            lblmsg.Text = "Product Active";
        }

        binddata();
        CustPager.Reload();

    }



    protected void gv_product_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            ImageButton imgbtnActive = (ImageButton)e.Row.FindControl("imgbtnActive");
            //  ImageButton imgbtnDelete = (ImageButton)e.Row.FindControl("imgbtnDelete");
            HiddenField hdfIsActive = (HiddenField)e.Row.FindControl("hdfIsActive");
            Button btndelete = (Button)e.Row.FindControl("btndelete");
            TextBox TxtdeleteCode = (TextBox)e.Row.FindControl("TxtdeleteCode");


            if (hdfIsActive.Value == "True")
            {
                imgbtnActive.ToolTip = "Active";
                imgbtnActive.ImageUrl = "~/image/icon_enable.png";
                //  imgbtnDelete.Visible = false;



            }
            else
            {
                imgbtnActive.ToolTip = "Dactive";
                imgbtnActive.ImageUrl = "~/image/icon_disable.png";
                //  imgbtnDelete.Visible = true;



            }

        }
    }
}