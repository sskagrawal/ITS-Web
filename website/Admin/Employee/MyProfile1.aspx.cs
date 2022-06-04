using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class MyProfile1 : System.Web.UI.Page
{
  

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string convertKey = (string)(Session["ttppd"]);

            hdfupdate.Value = convertKey;

            ViewProfile();
        }

        
    }


    public void ViewProfile()
    {

        DataTable dt = DataAccess.GetData("Select [UserName],[MobileNo],[Address],[CompanyName],[Website],[Name],[InActive],[Industry],[UserTypeID],[EmailID],[Createon],[Gendar],[Post],[PartyID],[UserRoleID] from UserDetails where UserTypeID=" + hdfupdate.Value + "");
        
        if (dt.Rows.Count > 0)
        {
            txtFname.Text = dt.Rows[0]["UserName"].ToString();
            txtfather.Text = dt.Rows[0]["MobileNo"].ToString();
            txtdob.Text = dt.Rows[0]["Address"].ToString();           
            txtMob.Text = dt.Rows[0]["CompanyName"].ToString();
            txtEmail.Text = dt.Rows[0]["Website"].ToString();
            txtPassword.Text = dt.Rows[0]["Name"].ToString();
            txtAddress.Text = dt.Rows[0]["InActive"].ToString();
            txtZipcode.Text = dt.Rows[0]["UserTypeID"].ToString();
            txtdob.Text = dt.Rows[0]["EmailID"].ToString();
            txtMob.Text = dt.Rows[0]["Createon"].ToString();
            txtEmail.Text = dt.Rows[0]["Gendar"].ToString();
            txtPassword.Text = dt.Rows[0]["Industry"].ToString();
            txtAddress.Text = dt.Rows[0]["Post"].ToString();
            txtZipcode.Text = dt.Rows[0]["PartyID"].ToString();
            txtZipcode.Text = dt.Rows[0]["UserRoleID"].ToString();
        }
    }


    protected void Update_Click(object sender, EventArgs e)
    {
        divMsg.Visible = true;

       // int convertKey = Convert.ToInt32(Session["sridd"]);
        SqlCommand cmd = new SqlCommand("update[UserDetails] set[Full_name]=@Full_name,[Father_name]=@Father_name,[Dob]=@Dob,[Mobile]=@Mobile,[Email]=@Email,[Password]=@Password,[Address]=@Address,[Zipcode]=@Zipcode where [UserTypeID]= " + hdfupdate.Value + "");
        cmd.Parameters.AddWithValue("@Full_name", txtFname.Text);
        cmd.Parameters.AddWithValue("@Father_name", txtfather.Text);
        cmd.Parameters.AddWithValue("@Dob", txtdob.Text);
        cmd.Parameters.AddWithValue("@Mobile", txtMob.Text);
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
        cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
        cmd.Parameters.AddWithValue("@Zipcode", txtZipcode.Text);



        DataAccess.InsertExecuteNonQuery(cmd);

        lblmsg.Text = "Record Updated";


    }
     
}