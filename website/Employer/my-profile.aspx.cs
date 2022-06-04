using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class MyProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["sridd"] != null)
            {
                hdfUserID.Value=Session["sridd"].ToString();
                //BindOrganization();
                DataTable dt = DataAccess.GetData("Select * from UserDetails where ID=" + hdfUserID.Value+ "");
                if (dt.Rows.Count > 0 && dt != null)
                {
                    txtName.Text=dt.Rows[0]["UserName"].ToString();
                    //txtPswd.Text=dt.Rows[0]["PassWord"].ToString();
                    //=dt.Rows[0]["Createon", DateTime.Now);
                    txtEmail.Text = dt.Rows[0]["EmailID"].ToString();
                    txtMob.Text=dt.Rows[0]["MobileNo"].ToString();
                    txtAddress.Text=dt.Rows[0]["Address"].ToString();
                    txtCompany.Text = dt.Rows[0]["CompanyName"].ToString();
                    txtWebsite.Text=dt.Rows[0]["Website"].ToString();
                    txtName.Text = dt.Rows[0]["Name"].ToString();
                    txtPost.Text = dt.Rows[0]["Post"].ToString();
                    rbtGendar.SelectedValue = dt.Rows[0]["Gendar"].ToString();
                }
            }
            else
            {
                Response.Redirect("~/default.aspx");
            }
        }
    }

    //private void BindOrganization()
    //{
    //    DataTable dt = DataAccess.GetData("Select * from Industry_Mst order by Industry");
    //    if (dt.Rows.Count > 0 && dt != null)
    //    {
    //        foreach (DataRow dr in dt.Rows)
    //        {
    //            ListItem item = new ListItem();
    //            item.Value = dr["ID"].ToString();
    //            item.Text = dr["Industry"].ToString();
    //            drdIndustry.Items.Add(item);
    //        }
    //    }
    //}
    protected void lbtnSubmit_Click(object sender, EventArgs e)
    {
        //if(hdfUserID.Value == string.Empty)
        //{

        SqlCommand cmd = new SqlCommand("UPDATE [UserDetails] SET [UserName] = @UserName,[Createon] = @Createon,[MobileNo] = @MobileNo,[Address] = @Address,[CompanyName] = @CompanyName,[Website] = @Website,[Name] = @Name,[EmailID]=@EmailID,[Post]=@Post,[Gendar]=@Gendar WHERE ID=" + hdfUserID.Value + "");
         cmd.Parameters.AddWithValue("@UserName",txtName.Text);
         //cmd.Parameters.AddWithValue("@PassWord",txtPswd.Text);
         cmd.Parameters.AddWithValue("@Createon",DateTime.Now);
         cmd.Parameters.AddWithValue("@MobileNo",txtMob.Text);
         cmd.Parameters.AddWithValue("@Address",txtAddress.Text);
         cmd.Parameters.AddWithValue("@CompanyName",txtCompany.Text);
         cmd.Parameters.AddWithValue("@Website",txtWebsite.Text);
         cmd.Parameters.AddWithValue("@EmailID", txtEmail.Text);
         cmd.Parameters.AddWithValue("@Name",txtName.Text);
         cmd.Parameters.AddWithValue("@Gendar", rbtGendar.SelectedValue);
         cmd.Parameters.AddWithValue("@Post", txtPost.Text);
        // cmd.Parameters.AddWithValue("@Industry", drdIndustry.SelectedValue);
        DataAccess.InsertExecuteNonQuery(cmd);
        alert.Visible = true;
        lblMSG.Text = "Your Profile Updated Successfully";
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
        //}
    
    }
}