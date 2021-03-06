using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Drawing2D;
using System.Drawing;
using System.IO;
using System.Collections.Specialized;
using System.Text;

public partial class Controle_ProductSize : System.Web.UI.UserControl
{
    public string Cattotal = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            bindcategory();
            binddata();
            CustPager.Reload();
            countcategory();
        }

    }

    public void bindcategory()
    {
        drdcategory.Items.Clear();
        ListItem item1 = new ListItem();
        item1.Text = "-Select Category-";
        item1.Value = "0";
        drdcategory.Items.Add(item1);

        DataTable dt = DataAccess.GetData("select * from [ecom_CategoryMaster] ");
        if (dt != null && dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["CategoryID"].ToString();
                item.Text = dr["CategoryName"].ToString();
                drdcategory.Items.Add(item);
            }
        }


    }

    public void countcategory()
    {

        Cattotal = DataAccess.GetSingleValue("select count (Sizemaster_id)  from [View_ecom_SizeMaster] ");
        {
            Label1.Text = Cattotal;
        }
    }


    public void binddata()
    {

        DataTable dt = DataAccess.GetData("select * from [View_ecom_SizeMaster]");
        if (dt.Rows.Count > 0)
        {
            grideViewCatogry.DataSource = dt;
            grideViewCatogry.DataBind();
            int TotalPage = dt.Rows.Count;
            CustPager.TotalRecords = TotalPage;
            CustPager.TotalPage = TotalPage % grideViewCatogry.PageSize == 0 ? TotalPage / grideViewCatogry.PageSize : TotalPage / grideViewCatogry.PageSize + 1;
        }

        else

        {
            dt.Rows.Add(dt.NewRow());
            grideViewCatogry.DataSource = dt;
            grideViewCatogry.DataBind();
            int TotalColumns = grideViewCatogry.Rows[0].Cells.Count;
            grideViewCatogry.Rows[0].Cells.Clear();
            grideViewCatogry.Rows[0].Cells.Add(new TableCell());
            grideViewCatogry.Rows[0].Cells[0].ColumnSpan = TotalColumns;
            grideViewCatogry.Rows[0].Cells[0].Text = "No records Found";


        }


    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (hdfid.Value == string.Empty)
            {
                SqlCommand cmd = new SqlCommand("Insert into [ecom_Size_master]([CategoryID],[Size_name]) values (@CategoryID,@Size_name)");
                cmd.Parameters.AddWithValue("@CategoryID", drdcategory.SelectedValue);
                cmd.Parameters.AddWithValue("@Size_name", txtsize.Text);
                DataAccess.InsertExecuteNonQuery(cmd);
                divMsg.Visible = true;
                lblmsg.Text = "Size Add Successfully";

            }
            else
            {
                SqlCommand cmd = new SqlCommand("UPDATE [ecom_Size_master] SET [CategoryID]=@CategoryID,[Size_name]=@Size_name  WHERE [Sizemaster_id]=" + hdfid.Value + "");

                cmd.Parameters.AddWithValue("@CategoryID", drdcategory.SelectedValue);
                cmd.Parameters.AddWithValue("@Size_name", txtsize.Text);
                DataAccess.InsertExecuteNonQuery(cmd);
                divMsg.Visible = true;
                lblmsg.Text = "Size update Sucessfully";
            }
        }

        catch (Exception ex)
        {
            divMsg.Visible = true;
            lblmsg.Text = "Some Error Occured, Pls Try Again." + ex.Message;
        }

        binddata();
        CustPager.Reload();
        //  binddata2();
        countcategory();

        clearField();
    }


    public void clearField()
    {
        drdcategory.ClearSelection();
        txtsize.Text = string.Empty;
    }

    protected void imgbtnEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtn = sender as ImageButton;
        GridViewRow grdRow = (GridViewRow)imgbtn.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdRow.FindControl("hdf_ID")).Value);
        hdfid.Value = ID.ToString();

        DataTable dt = DataAccess.GetData("select * from [ecom_Size_master] where [Sizemaster_id]=" + hdfid.Value + " ");
        if (dt.Rows.Count > 0)
        {
            bindcategory();
            drdcategory.SelectedValue = dt.Rows[0]["CategoryID"].ToString();
            txtsize.Text = dt.Rows[0]["Size_name"].ToString();
            Button2.Text = "Update";
        }
    }

    protected void Delete(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtn = sender as ImageButton;
        GridViewRow grdRow = (GridViewRow)imgbtn.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdRow.FindControl("hdf_ID")).Value);
        hdfid.Value = ID.ToString();

        SqlCommand cmd = new SqlCommand("Delete from [ecom_Size_master] where [Sizemaster_id] = " + hdfid.Value + "");
        DataAccess.InsertExecuteNonQuery(cmd);
        binddata();
        CustPager.Reload();
        countcategory();
        divMsg.Visible = true;
        lblmsg.Text = "Record Delete Sucessfully";

    }
    protected void CustPager_PageChanged(object sender, CustomPageChangeArgs e)
    {
        grideViewCatogry.PageSize = e.CurrentPageSize;
        grideViewCatogry.PageIndex = e.CurrentPageNumber - 1;
        binddata();
        CustPager.Reload();
    }
}