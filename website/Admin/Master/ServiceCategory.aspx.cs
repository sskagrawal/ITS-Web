using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Master_ServiceCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindGridView();
        }
    }

    protected void btnAddArea_Click(object sender, EventArgs e)
    {
        if (hdfID.Value == string.Empty)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [Category] ([CategoryName],[Discription],[CreateOn],[Gst]) VALUES(@CategoryName,@Discription,@CreateOn,@Gst)");
            cmd.Parameters.AddWithValue("@CategoryName", txtCategory.Text);
            cmd.Parameters.AddWithValue("@Discription", txtDes.Text);
            cmd.Parameters.AddWithValue("@CreateOn", DateTime.Now);
            cmd.Parameters.AddWithValue("@Gst",txtGST.Text);
            DataAccess.InsertExecuteNonQuery(cmd);
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [Category] SET [CategoryName] = @CategoryName,[Discription] = @Discription,[Gst]=@Gst WHERE [CatID]='" + hdfID.Value + "'");
            cmd.Parameters.AddWithValue("@CategoryName", txtCategory.Text);
            cmd.Parameters.AddWithValue("@Discription", txtDes.Text);
            cmd.Parameters.AddWithValue("@Gst", txtGST.Text);
            DataAccess.InsertExecuteNonQuery(cmd);
        }
        hdfID.Value = string.Empty;
        txtCategory.Text = string.Empty;
        txtDes.Text = string.Empty;
        txtGST.Text = string.Empty;
        btnAddArea.Text = "Submit";
        BindGridView();
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

            DataTable dt = DataAccess.GetData("select * from [Category]  WHERE  CatID =" + ID + "");
            if (dt.Rows.Count > 0 && dt != null)
            {
                txtDes.Text = dt.Rows[0]["Discription"].ToString();
                txtCategory.Text = dt.Rows[0]["CategoryName"].ToString();
                txtGST.Text = dt.Rows[0]["Gst"].ToString();
                btnAddArea.Text = "Update";


            }
        }
        else if (btndetails.ID.Equals("imgbtnDelete"))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM [Category]  WHERE  CatID =" + ID + "");
            DataAccess.InsertExecuteNonQuery(cmd);
        }
        BindGridView();

    }
    private void BindGridView()
    {
        DataTable dt = DataAccess.GetData("Select * from Category");
        if (dt.Rows.Count > 0 && dt != null)
        {
            grdView.DataSource = dt;
            grdView.DataBind();
        }
    }
}