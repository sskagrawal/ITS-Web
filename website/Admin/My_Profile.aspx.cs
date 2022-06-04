using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;

public partial class myProfile : System.Web.UI.Page
{
   

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["sridd"] != null)
            {
                string convertKey = (string)(Session["sridd"]);

                hdfUserID.Value = convertKey;

                BindDetail();
            }
            else
            {
                Response.Redirect("~/Admin/Login.aspx");
            }
            
        }
      
        }
   
    private void BindDetail()
    {
        //if (hdfId.Value != string.Empty)
        //{


        DataTable dt = DataAccess.GetData("select * from UserDetails where ID=" + hdfUserID.Value + "");
        if (dt.Rows.Count > 0)
        {
            hdfId.Value = dt.Rows[0]["ID"].ToString();
            hdfLogoImg.Value = dt.Rows[0]["User_Image"].ToString();

            txtcampny.Text = dt.Rows[0]["CompanyName"].ToString();
            TxtContact.Text = dt.Rows[0]["MobileNo"].ToString();
            txtOwner.Text = dt.Rows[0]["Name"].ToString();
            TxtEmail.Text = dt.Rows[0]["EmailID"].ToString(); 
                Txtgstcmp.Text = dt.Rows[0]["campanygst_no"].ToString();
            TxtAddress.Text = dt.Rows[0]["Address"].ToString();
            Txtacc.Text = dt.Rows[0]["Account_No"].ToString();


            //ddlCategory.SelectedValue = dt.Rows[0]["CategoryID"].ToString();

            btnSubmit.Text = "Update";

            imgVehicle.ImageUrl = "~/image/" + hdfLogoImg.Value;

        }
       
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        string targetPath = string.Empty;
        if (fuLogoImage.PostedFile != null)
        {
            // Check the extension of image  
            string extension = Path.GetExtension(fuLogoImage.FileName);
            if (extension.ToLower() == ".png" || extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg")
            {
                Stream strm = fuLogoImage.PostedFile.InputStream;
                using (var image = System.Drawing.Image.FromStream(strm))
                {
                    // Print Original Size of file (Height or Width)   
                    // Label1.Text = image.Size.ToString();
                    int newWidth = 140; // New Width of Image in Pixel  
                    int newHeight = 69; // New Height of Image in Pixel  
                    var thumbImg = new Bitmap(newWidth, newHeight);
                    var thumbGraph = Graphics.FromImage(thumbImg);
                    thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
                    thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
                    thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                    var imgRectangle = new Rectangle(0, 0, newWidth, newHeight);
                    thumbGraph.DrawImage(image, imgRectangle);
                    // Save the file  
                    targetPath = Server.MapPath(@"~\image\") + fuLogoImage.FileName;
                    thumbImg.Save(targetPath, image.RawFormat);
                    hdfLogoImg.Value = fuLogoImage.FileName;
                    // Print new Size of file (height or Width)  
                    // Label2.Text = thumbImg.Size.ToString();
                    //Show Image  
                    // Image1.ImageUrl = @"~\SliderImages\" + fupSlider.FileName;
                }
            }

            //  else
            // {
            //     divMsg.Visible = true;
            //  lblmsg.Text = "Please select image png and  jpg upload";
            // }
        }
       
       
       
        {
            SqlCommand cmd = new SqlCommand("update [UserDetails] set [CompanyName]=@CompanyName,[Name]=@Name,[MobileNo]=@MobileNo,[EmailID]=@EmailID,[Address]=@Address,[User_Image]=@User_Image,[campanygst_no]=@campanygst_no,[Account_No]=@Account_No where ID=@ID");
            cmd.Parameters.AddWithValue("@CompanyName", txtcampny.Text);
            cmd.Parameters.AddWithValue("@Name", txtOwner.Text);
            cmd.Parameters.AddWithValue("@MobileNo", TxtContact.Text);
            cmd.Parameters.AddWithValue("@EmailID", TxtEmail.Text);
            cmd.Parameters.AddWithValue("@Address", TxtAddress.Text); 
                cmd.Parameters.AddWithValue("@campanygst_no", Txtgstcmp.Text); 
                cmd.Parameters.AddWithValue("@Account_No", Txtacc.Text);
            cmd.Parameters.AddWithValue("@User_Image", hdfLogoImg.Value);
            cmd.Parameters.AddWithValue("@ID", hdfId.Value);
            DataAccess.InsertExecuteNonQuery(cmd);
            hdfLogoImg.Value = string.Empty;

            divMsg.Visible = true;
            lblmsg.Text = "Successfully Updated";
            Response.Redirect("My_Profile.aspx");
        }
            BindDetail();
    }
}