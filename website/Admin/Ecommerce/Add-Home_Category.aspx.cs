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
public partial class Admin_Ecommerce_Add_Home_Category : System.Web.UI.Page
{
    public string Cattotal = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            Bind_SequenceNo();
            binddata();
            CustPager.Reload();
            //binddata2();            
            countcategory();
          
        }

    }
    public void Bind_SequenceNo()
    {

        DataTable dt = DataAccess.GetData("Select MAx(Homeproduct_cat_id) as 'Seqno' from [ecom_Home_product_category] ");

        if (dt.Rows.Count > 0 && dt != null)
        {
            txtseq.Text = dt.Rows[0]["Seqno"].ToString();

        }
    }
    public void countcategory()
    {
        Cattotal = DataAccess.GetSingleValue("select count (Homeproduct_cat_id) from [ecom_Home_product_category] ");
        {
            Label1.Text = Cattotal;
        }

    }
    //public void Bind_Edit()
    //{
    //    DataTable dt = DataAccess.GetData("select * from [ecom_Home_product_category] where [Homeproduct_cat_id]=" + hdfid.Value + " ");
    //    if (dt.Rows.Count > 0)
    //    {
    //        txtcat.Text = dt.Rows[0]["Product_cat_name"].ToString();
    //        txtseq.Text = dt.Rows[0]["Sequence_no"].ToString();
    //    }
    //}

    public void binddata()
    {
        DataTable dt = DataAccess.GetData("select * from [ecom_Home_product_category]");
        if (dt.Rows.Count > 0)
        {
            grideViewCatogry.DataSource = dt;
            grideViewCatogry.DataBind();
            int TotalPage = dt.Rows.Count;
            CustPager.TotalRecords = TotalPage;
            CustPager.TotalPage = TotalPage % grideViewCatogry.PageSize == 0 ? TotalPage / grideViewCatogry.PageSize : TotalPage / grideViewCatogry.PageSize + 1;
        }

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (hdfid.Value == string.Empty)
            {
                SqlCommand cmd = new SqlCommand("Insert into [ecom_Home_product_category]([Product_cat_name],[Sequence_no],[Created_on]) values (@Product_cat_name ,@Sequence_no,@Created_on)");
                cmd.Parameters.AddWithValue("@Product_cat_name", txtcat.Text);
                cmd.Parameters.AddWithValue("@Sequence_no", txtseq.Text);
                cmd.Parameters.AddWithValue("@Created_on", DateTime.Now);

                DataAccess.InsertExecuteNonQuery(cmd);
                binddata();
                CustPager.Reload();
                // Bind_Edit();
                divMsg.Visible = true;
                lblmsg.Text = "Upload File Successfully";
            }
            else
            {
                SqlCommand cmd = new SqlCommand("UPDATE [ecom_Home_product_category] SET  [Product_cat_name] = @Product_cat_name,[Sequence_no] = @Sequence_no  WHERE Homeproduct_cat_id=" + hdfid.Value + "");
                cmd.Parameters.AddWithValue("@Product_cat_name", txtcat.Text);
                cmd.Parameters.AddWithValue("@Sequence_no", txtseq.Text);
                cmd.Parameters.AddWithValue("@Created_on", DateTime.Now);
                DataAccess.InsertExecuteNonQuery(cmd);
                divMsg.Visible = true;
                lblmsg.Text = "Record update Sucessfully";
                binddata();
                CustPager.Reload();
            }
        }
        catch (Exception ex)
        {
            divMsg.Visible = true;
            lblmsg.Text = "Some Error Occured, Pls Try Again." + ex.Message;
        }

        clearField();
    }

    public void clearField()
    {

        txtcat.Text = string.Empty;
            txtseq.Text = string.Empty;
    }

    protected void imgbtnEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtn = sender as ImageButton;
        GridViewRow grdRow = (GridViewRow)imgbtn.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdRow.FindControl("hdf_ID")).Value);
        hdfid.Value = ID.ToString();

        DataTable dt = DataAccess.GetData("select * from [ecom_Home_product_category] where [Homeproduct_cat_id]=" + hdfid.Value + " ");
        if (dt.Rows.Count > 0)
        {
            txtcat.Text = dt.Rows[0]["Product_cat_name"].ToString();
            txtseq.Text = dt.Rows[0]["Sequence_no"].ToString();
        }

        //  Response.Redirect("Home_productcat.aspx?NID=" + ID);

    }

    protected void Delete(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtn = sender as ImageButton;
        GridViewRow grdRow = (GridViewRow)imgbtn.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdRow.FindControl("hdf_ID")).Value);
        hdfid.Value = ID.ToString();

        SqlCommand cmd = new SqlCommand("Delete from [ecom_Home_product_category] where Homeproduct_cat_id = " + hdfid.Value + "");
        DataAccess.InsertExecuteNonQuery(cmd);
        binddata();
        CustPager.Reload();
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

    protected void btnReset_Click(object sender, EventArgs e)
    {
        clearField();
    }
}