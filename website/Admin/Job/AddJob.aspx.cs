using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

public partial class Admin_AddJob : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindIndustries();
        }
    }

    private void BindIndustries()
    {
        DataTable dt = DataAccess.GetData("Select * from JobType");
        if (dt.Rows.Count > 0 && dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Text = dr["jobType"].ToString();
                item.Value = dr["ID"].ToString();
                drdIndustries.Items.Add(item);
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (!FileUloadCV.HasFile)
        {
            
            string filename = Path.GetFileName(FileUloadCV.PostedFile.FileName);
            hdfFileUploadCV.Value = Path.GetFileName(FileUloadCV.PostedFile.FileName);
            string extension = Path.GetExtension(filename);
            string contentType = FileUloadCV.PostedFile.ContentType;
            HttpPostedFile file = FileUloadCV.PostedFile;
            byte[] document = new byte[file.ContentLength];
            file.InputStream.Read(document, 0, file.ContentLength);

            //Validations  
            if ((extension == ".pdf") || (extension == ".doc") || (extension == ".docx") || (extension == ".xls"))//extension  
            {
                if (file.ContentLength <= 31457280)//size  
                {

                    FileUloadCV.SaveAs(Server.MapPath("~/CV/" + FileUloadCV.FileName));                  
                   
                }
                else
                {
                    alert.Visible = true;
                    lblMsg.Text="Inavlid File size"; 
                }
            }
            else
            {
                 alert.Visible = true;
                    lblMsg.Text="Inavlid File";
            }
        }
        if (hdfID.Value == string.Empty)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [CVProfile]([CvName],[Name],[MobileNo],[CrearteOn],[Indrustre]) VALUES(@CvName,@Name,@MobileNo,@CrearteOn,@Indrustre)");
            cmd.Parameters.AddWithValue("@CvName", hdfFileUploadCV.Value);
            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            cmd.Parameters.AddWithValue("@MobileNo", txtMob.Text);
            cmd.Parameters.AddWithValue("@CrearteOn", DateTime.Now);
            cmd.Parameters.AddWithValue("@Indrustre", drdIndustries.SelectedValue);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Your record saved successfully";
           
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [CVProfile] SET [CvName] = @CvName,[Name] = @Name,[MobileNo] = @MobileNo,[Indrustre] =@Indrustre WHERE ID="+hdfID.Value+"");
            cmd.Parameters.AddWithValue("@CvName", hdfFileUploadCV.Value);
            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            cmd.Parameters.AddWithValue("@MobileNo", txtMob.Text);
            cmd.Parameters.AddWithValue("@Indrustre",drdIndustries.SelectedValue);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Your record Update successfully";
            
        }
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
    }
}