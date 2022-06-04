using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_User_UserRole : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bindUserRole();
        }

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (hdfID.Value == string.Empty)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [User_Role] ([User_Role],[Created_On]) VALUES(@User_Role,@Created_On)");
            cmd.Parameters.AddWithValue("@User_Role", txtUserRole.Text);
            cmd.Parameters.AddWithValue("@Created_On", DateTime.Now);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "record save successfully";
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [User_Role] SET [User_Role] = @User_Role WHERE User_Role_ID='" + hdfID.Value + "' ");
            cmd.Parameters.AddWithValue("@User_Role", txtUserRole.Text);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "record updated successfully";
        }
        hdfID.Value = string.Empty;
        txtUserRole.Text = string.Empty;
        bindUserRole();
    }

    private void bindUserRole()
    {
        DataTable dt = DataAccess.GetData("select * from User_Role");
        if (dt.Rows.Count > 0 && dt != null)
        {
            grdView.DataSource = dt;
            grdView.DataBind();
        }
    }

    protected void Edit(object sender, ImageClickEventArgs e)
    {
        //LinkButton btndetails = sender as LinkButton;
        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfID")).Value);
        hdfID.Value = Convert.ToString(ID);
        if (btndetails.ID.Equals("imgbtnUpdate"))
        {
            DataTable dt = DataAccess.GetData("select * from User_Role where User_Role_ID =" + ID + "");
            if(dt.Rows.Count>0 && dt != null)
            {
                txtUserRole.Text = dt.Rows[0]["User_Role"].ToString();
            }
        }
        else if (btndetails.ID.Equals("imgbtnDelete"))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM [User_Role]  WHERE  User_Role_ID =" + ID + "");
            DataAccess.InsertExecuteNonQuery(cmd);
        }
        bindUserRole();
    }
}