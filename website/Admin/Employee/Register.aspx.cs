using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        { 
        
        
        }
    }
    protected void btnregister_Click(object sender, EventArgs e)
    {

        SqlCommand cmd = new SqlCommand("insert into [registration] ([Full_name],[Email],[Password],[Gender],[Catagory],[User_type],[Mobile]) values(@Full_name,@Email,@Password,@Gender,@Catagory,@User_type,@Mobile) ");
        cmd.Parameters.AddWithValue("@Full_name", txtFname.Text);
        cmd.Parameters.AddWithValue("@Email", txtemail.Text);
        cmd.Parameters.AddWithValue("@Password", txtpassword.Text);
        cmd.Parameters.AddWithValue("@Mobile",txtmobile.Text);
        cmd.Parameters.AddWithValue("@Gender", rbgender.SelectedValue);
        cmd.Parameters.AddWithValue("@Catagory", ddcatagory.SelectedValue);
        cmd.Parameters.AddWithValue("@User_type", ddutype.SelectedValue);


        DataAccess.InsertExecuteNonQuery(cmd);



        Label2.Text = "inserted";





    }


    protected void Reset_Click(object sender, EventArgs e)
    {


        ClearText();

    }
    public void ClearText()
    {

        txtFname.Text = " ";
        txtemail.Text = " ";
        txtmobile.Text = " ";
        txtpassword.Text = " ";

        rbgender.Items.Clear();
        ddcatagory.Items.Clear();

        ddutype.Items.Clear();
        


    }

  
}