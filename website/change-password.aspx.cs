using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["sridd"] != null)
        {
            hdfID.Value = Session["sridd"].ToString();
        }
        else
        {
            Response.Redirect("~/default.aspx");
        }

    }
    protected void lbtnSend_Click(object sender, EventArgs e)
    {
        DataTable dt = DataAccess.GetData("Select * from UserDetails where PassWord='" + txtOldPSWD.Text + "' and ID=" + hdfID.Value + "");
        if (dt.Rows.Count > 0 && dt != null)
        {
            SqlCommand cmd = new SqlCommand("UPDATE [UserDetails] SET [PassWord] ='" + txtNewPSWD.Text + "' WHERE PassWord='" + txtOldPSWD.Text + "'  and ID='" + hdfID.Value + "'");
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Your password changed successfully";
        }
        else
        {
            alert.Visible = true;
            lblMsg.Text = "Please enter a valid password ";

        }
        txtCNPSWD.Text = string.Empty;
        txtNewPSWD.Text = string.Empty;
        txtOldPSWD.Text = string.Empty;
    }
}