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
public partial class Admin_Ecommerce_Add_ProductColor : System.Web.UI.Page
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

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string CatName = string.Empty;
            DataTable dtCatName = DataAccess.GetData("select Color_name from [ecom_Color_master] where Color_name ='" + txtcol.Text + "'  ");

            if (dtCatName.Rows.Count > 0)
            {
                CatName = dtCatName.Rows[0]["Color_name"].ToString();
            }

            if (hdfid.Value == string.Empty)
            {
                if (CatName == string.Empty)
                {
                    SqlCommand cmd = new SqlCommand("Insert into [ecom_Color_master]([Color_name],[CategoryID]) values (@Color_name,@CategoryID)");
                    cmd.Parameters.AddWithValue("@Color_name", txtcol.Text);
                    cmd.Parameters.AddWithValue("@CategoryID", drdcategory.SelectedValue);
                    DataAccess.InsertExecuteNonQuery(cmd);

                    divMsg.Visible = true;
                    lblmsg.Text = "Record Insert Successfully";              
                }

                else
                {
                    divMsg.Visible = true;
                    lblmsg.Text = "Colour already exist ";
                }
            }

            else
            {
                //SqlCommand cmd = new SqlCommand("UPDATE [ecom_Color_master] SET  [Color_name] = @Color_name ,[CategoryID]=@[CategoryID] WHERE [ColorMaster_id] =" + hdfid.Value + "");
                //cmd.Parameters.AddWithValue("@Color_name", txtcol.Text);
                //cmd.Parameters.AddWithValue("@CategoryID", drdcategory.SelectedValue);
                //DataAccess.InsertExecuteNonQuery(cmd);
                //divMsg.Visible = true;
                //lblmsg.Text = "Record update Sucessfully";
              
            }
        }

        catch (Exception ex)
        {
            divMsg.Visible = true;
            lblmsg.Text = "Some Error Occured, Pleaser try Again." + ex.Message;
        }

        binddata();
        CustPager.Reload();
        ClearTextbox();
    }

  
    public void binddata()
    {

        DataTable dt = DataAccess.GetData("select * from [View_ecomProductColor] ");
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


    public void countcategory()
    {

        Cattotal = DataAccess.GetSingleValue("select count(ColorMaster_id)  from ecom_Color_master ");
        {
            Label1.Text = Cattotal;
        }
    }


    protected void imgbtnEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtn = sender as ImageButton;
        GridViewRow grdRow = (GridViewRow)imgbtn.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdRow.FindControl("hdf_ID")).Value);
        hdfid.Value = ID.ToString();

        DataTable dt = DataAccess.GetData("select * from [ecom_Color_master] where [ColorMaster_id]=" + hdfid.Value + " ");
        if (dt.Rows.Count > 0)
        {
            txtcol.Text = dt.Rows[0]["Color_name"].ToString();
            bindcategory();
            drdcategory.SelectedValue= dt.Rows[0]["CategoryID"].ToString();
            Button2.Text = "Update";
        }     

    }

    protected void Delete(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtn = sender as ImageButton;
        GridViewRow grdRow = (GridViewRow)imgbtn.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdRow.FindControl("hdf_ID")).Value);
        hdfid.Value = ID.ToString();

        SqlCommand cmd = new SqlCommand("Delete from [ecom_Color_master] where ColorMaster_id = " + hdfid.Value + "");
        DataAccess.InsertExecuteNonQuery(cmd);
        binddata();
        CustPager.Reload();
        divMsg.Visible = true;
        lblmsg.Text = "Record Delete Sucessfully";
        ClearTextbox();
    }

    protected void CustPager_PageChanged(object sender, CustomPageChangeArgs e)
    {
        grideViewCatogry.PageSize = e.CurrentPageSize;
        grideViewCatogry.PageIndex = e.CurrentPageNumber - 1;
        binddata();
        CustPager.Reload();
    }


    private void ClearTextbox()
    {
        txtcol.Text = string.Empty;
        drdcategory.ClearSelection();
        hdfid.Value = string.Empty;
    }
}