using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlCommand ccdd11 = new SqlCommand("select ID from UserDetails where MobileNo=@MobileNo");
        ccdd11.Parameters.AddWithValue("@MobileNo", txtUser.Text);
        DataTable dt = DataAccess.GetData(ccdd11);
        if (dt.Rows.Count > 0)
        {
            SqlCommand cotq1 = new SqlCommand("select * from [UserDetails] where ID=@ID and PassWord=@User_Pswd and [InActive]=@InActive");
            cotq1.Parameters.AddWithValue("@User_Pswd", txtPSWD.Text);
            cotq1.Parameters.AddWithValue("@InActive", "1");
            cotq1.Parameters.AddWithValue("@ID", dt.Rows[0]["ID"].ToString());
            DataTable dtDtll = DataAccess.GetData(cotq1);
            if (dtDtll.Rows.Count > 0 && dtDtll != null)
            {
                string UserTp = string.Empty;
                Session["ttppd"] = dtDtll.Rows[0]["UserTypeID"].ToString();
                Session["sridd"] = dtDtll.Rows[0]["ID"].ToString();

                Session["partyid"] = dtDtll.Rows[0]["PartyID"].ToString();

                // Session["ttppd"] = dtDtll.Rows[0]["UserTypeID"].ToString();

                UserTp = dtDtll.Rows[0]["UserTypeID"].ToString();
                if (UserTp == "1")//|| UserTp == "4"
                {
                    // Session["UserRoleID"] = dt.Rows[0]["UserRoleID"].ToString();
                    //Session["ID"] = dt.Rows[0]["ID"].ToString();
                    Response.Redirect("~/Admin/Default.aspx");//
                }
                else if (UserTp == "4")
                {
                    //Session["UserRoleID"] = dt.Rows[0]["UserRoleID"].ToString();
                    Session["ID"] = dtDtll.Rows[0]["ID"].ToString();
                    Session["srv"] = "web";
                    if (Session["urrr"] != null)
                    {
                        Response.Redirect(Session["urrr"].ToString());
                    }
                    else
                    {
                        Response.Redirect("~/Client_Panel/Client_profile_big.aspx");
                    }
                    //}
                }
                else if (UserTp == "2")
                {
                    Session["srv"] = "job";
                    if (Session["urrr"]!=null)
                    {
                        Response.Redirect(Session["urrr"].ToString());
                    }
                    else
                    {
                        Response.Redirect("~/Client_Panel/Client_profile_big.aspx");
                    }
                    

                }
                else if (UserTp == "3")
                {
                    Session["srv"] = "job";
                    if (Session["urrr"] != null)
                    {
                        Response.Redirect(Session["urrr"].ToString());
                    }
                    else
                    {
                        Response.Redirect("~/Client_Panel/Client_profile_big.aspx");
                    }

                }
                else
                {

                }
            }
        }
      
    }
}