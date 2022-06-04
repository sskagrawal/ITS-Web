using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Security.Cryptography;
using System.IO;
using System.Text;

public partial class Admin_AddUpdateUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           // BindIndustry();
            BindUserType();
            if (Request.QueryString["UID"] != null)
            {
               
                string BID = Utilities.Decrypt(Request.QueryString["UID"].ToString());
                if (BID != string.Empty)
                {
                    DataTable dt = DataAccess.GetData("Select * from UserDetails where ID="+BID+"");
                    if (dt.Rows.Count > 0 && dt != null)
                    {
                       txtName.Text =dt.Rows[0]["UserName"].ToString();
                       txtPSWD.Text =dt.Rows[0]["PassWord"].ToString();
                       txtMob.Text =dt.Rows[0]["MobileNo"].ToString();
                       txtAddress.Text =dt.Rows[0]["Address"].ToString(); 
                       txtCompanyName.Text  =dt.Rows[0]["CompanyName"].ToString();
                       txtWebsite.Text  =dt.Rows[0]["Website"].ToString(); 
                       txtName.Text  =dt.Rows[0]["Name"].ToString();
                       //drdIndustry.SelectedValue  =dt.Rows[0]["Industry"].ToString();
                       drdUserType.SelectedValue =dt.Rows[0]["UserTypeID"].ToString();
                       txtEmailID.Text = dt.Rows[0]["EmailID"].ToString();
                       rbtGendar.SelectedValue = dt.Rows[0]["Gendar"].ToString();
                    }

                }
            }
        }
    }
    //private string Decrypt(string cipherText)
    //{
    //    string EncryptionKey = "MAKV2SPBNI99212";
    //    byte[] cipherBytes = Convert.FromBase64String(cipherText);
    //    using (Aes encryptor = Aes.Create())
    //    {
    //        Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
    //        encryptor.Key = pdb.GetBytes(32);
    //        encryptor.IV = pdb.GetBytes(16);
    //        using (MemoryStream ms = new MemoryStream())
    //        {
    //            using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
    //            {
    //                cs.Write(cipherBytes, 0, cipherBytes.Length);
    //                cs.Close();
    //            }
    //            cipherText = Encoding.Unicode.GetString(ms.ToArray());
    //        }
    //    }
    //    return cipherText;
    //}

    private void BindUserType()
    {
        DataTable dt = DataAccess.GetData("Select * from UserType where ID !='1' order by UserTypeName");
        if (dt.Rows.Count > 0 && dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem Item = new ListItem();
                Item.Value = dr["ID"].ToString();
                Item.Text = dr["UserTypeName"].ToString();
                drdUserType.Items.Add(Item);
            }
        }
    }

    //private void BindIndustry()
    //{
    //    DataTable dt = DataAccess.GetData("Select * from Industry_Mst order by Industry");
    //    if (dt.Rows.Count > 0 && dt != null)
    //    {
    //        foreach (DataRow dr in dt.Rows)
    //        {
    //            ListItem Item = new ListItem();
    //            Item.Value = dr["ID"].ToString();
    //            Item.Text = dr["Industry"].ToString();
    //            drdIndustry.Items.Add(Item);
    //        }
    //    }
    //}
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (hdfID.Value == string.Empty)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [UserDetails]([UserName],[PassWord],[MobileNo],[Address],[CompanyName],[Website],[Name],[InActive],[UserTypeID],[EmailID],[Createon],[Gendar]) VALUES(@UserName,@PassWord,@MobileNo,@Address,@CompanyName,@Website,@Name,@InActive,@UserTypeID,@EmailID,@Createon,@Gendar)");
            cmd.Parameters.AddWithValue("@UserName", txtName.Text);
            cmd.Parameters.AddWithValue("@PassWord", txtPSWD.Text);
            cmd.Parameters.AddWithValue("@MobileNo", txtMob.Text);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@CompanyName", txtCompanyName.Text);
            cmd.Parameters.AddWithValue("@Website", txtWebsite.Text);
            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            cmd.Parameters.AddWithValue("@InActive", "True");
            //cmd.Parameters.AddWithValue("@Industry", drdIndustry.SelectedValue);
            cmd.Parameters.AddWithValue("@UserTypeID", drdUserType.SelectedValue);
            cmd.Parameters.AddWithValue("@EmailID", txtEmailID.Text);
            cmd.Parameters.AddWithValue("@Createon", DateTime.Now);
            cmd.Parameters.AddWithValue("@Gendar",rbtGendar.SelectedValue);
            DataAccess.InsertExecuteNonQuery(cmd);

            alert.Visible = true;
            lblMsg.Text = "Record Saved Successfully";
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [UserDetails] SET [UserName] = @UserName,[PassWord] = @PassWord,[MobileNo] = @MobileNo,[Address] = @Address,[CompanyName] = @CompanyName,[Website] = @Website,[Name] = @Name,[UserTypeID] = @UserTypeID,[EmailID] = @EmailID,[Gendar]=@Gendar WHERE ID=" + hdfID.Value + "");
            cmd.Parameters.AddWithValue("@UserName", txtName.Text);
            cmd.Parameters.AddWithValue("@PassWord", txtPSWD.Text);
            cmd.Parameters.AddWithValue("@MobileNo", txtMob.Text);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@CompanyName", txtCompanyName.Text);
            cmd.Parameters.AddWithValue("@Website", txtWebsite.Text);
            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            //cmd.Parameters.AddWithValue("@Industry", drdIndustry.SelectedValue);
            cmd.Parameters.AddWithValue("@UserTypeID", drdUserType.SelectedValue);
            cmd.Parameters.AddWithValue("@EmailID", txtEmailID.Text);
            cmd.Parameters.AddWithValue("@Gendar",rbtGendar.SelectedValue);
            DataAccess.InsertExecuteNonQuery(cmd);

            alert.Visible = true;
            lblMsg.Text = "Record Update Successfully";

        }
        CLR();
    }

    private void CLR()
    {
        rbtGendar.ClearSelection();
        txtAddress.Text = string.Empty;
        txtCompanyName.Text = string.Empty;
        txtEmailID.Text = string.Empty;
        txtMob.Text = string.Empty;
        txtName.Text = string.Empty;
        txtPSWD.Text = string.Empty;
        txtWebsite.Text = string.Empty;
        hdfID.Value = string.Empty;
        //drdIndustry.ClearSelection();
        drdUserType.ClearSelection();
    }
}