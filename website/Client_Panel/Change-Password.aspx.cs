using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Client_Panel_Change_Password : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
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
    }

    protected void btnSubmit_Click(object sender, EventArgs e) 
    {
        
        DataTable dt = DataAccess.GetData("Select * from UserDetails where PassWord='" + txtoldPsw.Text + "' and ID=" + hdfID.Value + "");
        if (dt.Rows.Count > 0 && dt != null)
        {
            SqlCommand cmd = new SqlCommand("UPDATE [UserDetails] SET [PassWord] ='" + txtnewpsw.Text + "' WHERE PassWord='" + txtoldPsw.Text + "'  and ID='" + hdfID.Value + "'");
            DataAccess.InsertExecuteNonQuery(cmd);
           // alert.Visible = true;
            lblMessage.Text = "Your password changed successfully";
        }
        else
        {
            //  alert.Visible = true;
            lblMessage.Text = "Please enter a valid password ";

        }
      //  txtCNPSWD.Text = string.Empty;
        txtnewpsw.Text = string.Empty;
        txtoldPsw.Text = string.Empty;
    }
}
