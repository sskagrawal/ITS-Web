using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Master_SubCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCategory();
            bindGridView();
        }
    }

    private void BindCategory()
    {
        drdCategory.Items.Clear();
        ListItem item1 = new ListItem();
        item1.Value = "0";
        item1.Text = "--Select--";
        drdCategory.Items.Add(item1);
        DataTable dt = DataAccess.GetData("select * from Category");
        if (dt.Rows.Count > 0 && dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["CatID"].ToString();
                item.Text = dr["CategoryName"].ToString();
                drdCategory.Items.Add(item);
            }
        }
    }

    protected void btnAddArea_Click(object sender, EventArgs e)
    {
        if (hdfID.Value == string.Empty)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO[dbo].[SubCategory] ([CatID],[SubCategoryN],[CreateOn],[Amount],[RenewAmt],[Dise]) VALUES(@CatID, @SubCategoryN, @CreateOn,@Amount,@RenewAmt,@Dise)");
            cmd.Parameters.AddWithValue("@CatID", drdCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@SubCategoryN", txtSubCategory.Text);
            cmd.Parameters.AddWithValue("@CreateOn", DateTime.Now);
            cmd.Parameters.AddWithValue("@Amount", txtAmt.Text.Trim());
            cmd.Parameters.AddWithValue("@RenewAmt", txtRenAmt.Text); 
            cmd.Parameters.AddWithValue("@Dise", txtDes.Text.Trim());
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Record saved successfully";
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [SubCategory] SET [CatID] = @CatID,[SubCategoryN] = @SubCategoryN,[Amount]=@Amount,[Dise]=@Dise,[RenewAmt]=@RenewAmt WHERE SubCat='" + hdfID.Value + "' ");
            cmd.Parameters.AddWithValue("@CatID", drdCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@SubCategoryN", txtSubCategory.Text);
            cmd.Parameters.AddWithValue("@Amount", txtAmt.Text.Trim());
            cmd.Parameters.AddWithValue("@RenewAmt",txtRenAmt.Text); 
            cmd.Parameters.AddWithValue("@Dise", txtDes.Text.Trim());
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Record update successfully";
        }
        bindGridView();
        Clr();
    }

    private void bindGridView()
    {
        DataTable dt = DataAccess.GetData("Select * from [View_SubCategory]");
        if (dt.Rows.Count > 0 && dt != null)
        {
            grdView.DataSource = dt;
            grdView.DataBind();
        }
    }

    private void Clr()
    {
        drdCategory.ClearSelection();
        txtSubCategory.Text = string.Empty;
        txtRenAmt.Text = string.Empty;
        hdfID.Value = string.Empty;
        txtAmt.Text = string.Empty;
        txtDes.Text = string.Empty;
        btnAddArea.Text = "Submit";
    }
    protected void Edit(object sender, ImageClickEventArgs e)
    {
        //LinkButton btndetails = sender as LinkButton;
        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfbranchID")).Value);

        hdfID.Value = Convert.ToString(ID);
        if (btndetails.ID.Equals("imgbtnUpdate"))
        {

            DataTable dt = DataAccess.GetData("select * from [SubCategory]  WHERE  SubCat =" + ID + "");
            if (dt.Rows.Count > 0 && dt != null)
            {
                BindCategory();
                drdCategory.SelectedValue = dt.Rows[0]["CatID"].ToString();
                txtSubCategory.Text = dt.Rows[0]["SubCategoryN"].ToString();
                txtAmt.Text = dt.Rows[0]["Amount"].ToString();
                txtRenAmt.Text = dt.Rows[0]["RenewAmt"].ToString();
                txtDes.Text = dt.Rows[0]["Dise"].ToString(); 
                btnAddArea.Text = "Update";


            }
        }
        else if (btndetails.ID.Equals("imgbtnDelete"))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM [SubCategory]  WHERE  SubCat =" + ID + "");
            DataAccess.InsertExecuteNonQuery(cmd);
        }
        bindGridView();

    }
}