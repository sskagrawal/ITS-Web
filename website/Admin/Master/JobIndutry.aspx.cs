using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Security.Cryptography;
using System.IO;

public partial class Admin_JobType : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
        }

    }
  
    protected void Button1_Click(object sender, EventArgs e)
    {


        if (hdfID.Value == string.Empty)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [Industry_Mst]([Industry],[Description],[CreateOn]) VALUES(@Industry,@Description,@CreateOn)");
            cmd.Parameters.AddWithValue("@Industry", txtIndustry.Text);
            cmd.Parameters.AddWithValue("@Description",txtDes.Text);
            cmd.Parameters.AddWithValue("@CreateOn",DateTime.Now);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Record Saved Successfully";
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [Industry_Mst]  SET [Industry] = @Industry,[Description] = @Description WHERE ID=" + hdfID.Value + "");
            cmd.Parameters.AddWithValue("@Industry", txtIndustry.Text);
            cmd.Parameters.AddWithValue("@Description", txtDes.Text);
            cmd.Parameters.AddWithValue("@CreateOn", DateTime.Now);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Record Update Successfully";
        }
       
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
        Clr();
        BindGrid();

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

            DataTable dt = DataAccess.GetData("select * from [Industry_Mst]  WHERE  ID =" + ID + "");
            if (dt.Rows.Count > 0 && dt != null)
            {
                txtDes.Text = dt.Rows[0]["Description"].ToString();
                txtIndustry.Text = dt.Rows[0]["Industry"].ToString();              
                btnAddArea.Text = "Update";

              
            }
        }
        else if (btndetails.ID.Equals("imgbtnDelete"))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM [Industry_Mst]  WHERE  ID =" + ID + "");
            DataAccess.InsertExecuteNonQuery(cmd);
        }
        BindGrid();

    }
    private void Clr()
    {

        txtDes.Text = string.Empty;
        txtIndustry.Text = string.Empty;
        hdfID.Value = string.Empty;
        btnAddArea.Text = "Submit";
    }
    public void BindGrid()
    {

        DataTable dt = DataAccess.GetData("Select * from Industry_Mst");
        if (dt.Rows.Count > 0 && dt != null)
        {
            grdView.DataSource = dt;
            grdView.DataBind();
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindGrid();
    }
}