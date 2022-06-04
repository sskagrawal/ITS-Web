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
            SqlCommand cmd = new SqlCommand("INSERT INTO [EsperienceMST]([Experience],[CreateOn]) VALUES(@Experience,@CreateOn)");
            cmd.Parameters.AddWithValue("@Experience", txtExper.Text);
            //cmd.Parameters.AddWithValue("@Description",txtDes.Text);
            cmd.Parameters.AddWithValue("@CreateOn", DateTime.Now);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Record Saved Successfully";
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [EsperienceMST]  SET [Experience] = @Experience WHERE ID=" + hdfID.Value + "");
            cmd.Parameters.AddWithValue("@Experience", txtExper.Text);
            //cmd.Parameters.AddWithValue("@Description", txtDes.Text);
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

            DataTable dt = DataAccess.GetData("select * from [EsperienceMST]  WHERE  ID =" + ID + "");
            if (dt.Rows.Count > 0 && dt != null)
            {
                //txtDes.Text = dt.Rows[0]["Description"].ToString();
                txtExper.Text = dt.Rows[0]["Experience"].ToString();              
                btnAddArea.Text = "Update";

              
            }
        }
        else if (btndetails.ID.Equals("imgbtnDelete"))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM [EsperienceMST]  WHERE  ID =" + ID + "");
            DataAccess.InsertExecuteNonQuery(cmd);
        }
        BindGrid();

    }
    private void Clr()
    {

        //txtDes.Text = string.Empty;
        txtExper.Text = string.Empty;
        hdfID.Value = string.Empty;
        btnAddArea.Text = "Submit";
    }
    public void BindGrid()
    {

        DataTable dt = DataAccess.GetData("Select * from EsperienceMST order by Experience");
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