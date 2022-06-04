using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing.Drawing2D;
using System.Drawing;
using System.IO;
using System.Data;

public partial class Admin_AddUpdateNews : System.Web.UI.Page
{
protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            txtNewsDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            if (Request.QueryString["PID"] != null)
            {
                hdfID.Value = Convert.ToString(Request.QueryString["PID"]);
                Bind_news();
            }

            

        }

    }


public void Bind_news()
{

    DataTable dt = DataAccess.GetData("select * from [News_Master] where [News_Id] =" + hdfID.Value + "");
    if (dt.Rows.Count > 0 && dt != null)
    {
        txtNewsTitle.Text = dt.Rows[0]["News_Title"].ToString();
           hdfImage.Value = dt.Rows[0]["News_Image"].ToString();
        txtNewsDesc.Text = dt.Rows[0]["News_Desc"].ToString();
        txtUrl.Text = dt.Rows[0]["News_Url"].ToString();  
            if(dt.Rows[0]["News_Date"].ToString()!=string.Empty)
            {
                txtNewsDate.Text = Convert.ToDateTime(dt.Rows[0]["News_Date"]).ToString("dd/MM/yyyy");
            }
        
            txtMetaDesc.Text= dt.Rows[0]["MetaDesc"].ToString();
            btnSubmit.Text = "Update";
    }



}







    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string targetPath = string.Empty;
        if (fluPorUpload.PostedFile != null)
        {
            // Check the extension of image  
            string extension = Path.GetExtension(fluPorUpload.FileName);
            if (extension.ToLower() == ".png" || extension.ToLower() == ".jpg")
            {
                Stream strm = fluPorUpload.PostedFile.InputStream;
                using (var image = System.Drawing.Image.FromStream(strm))
                {
                   
                    int newWidth = 870; // New Width of Image in Pixel  
                    int newHeight = 570; // New Height of Image in Pixel  
                    var thumbImg = new Bitmap(newWidth, newHeight);
                    var thumbGraph = Graphics.FromImage(thumbImg);
                    thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
                    thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
                    thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                    var imgRectangle = new Rectangle(0, 0, newWidth, newHeight);
                    thumbGraph.DrawImage(image, imgRectangle);
                    // Save the file  
                    targetPath = Server.MapPath(@"~\News_Image\") + fluPorUpload.FileName;
                    thumbImg.Save(targetPath, image.RawFormat);
                    hdfImage.Value = fluPorUpload.FileName;
                   
                }
            }
            else
            {
                
            }
        }
        if (hdfID.Value == string.Empty)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [News_Master]([News_Title] ,[News_Image],[News_Desc] ,[News_Date],[CreatedOn],[News_Url],[MetaDesc]) VALUES(@News_Title,@News_Image ,@News_Desc ,@News_Date ,@CreatedOn,@News_Url,@MetaDesc)");
            cmd.Parameters.AddWithValue("@News_Title", txtNewsTitle.Text);
            cmd.Parameters.AddWithValue("@News_Image", hdfImage.Value);
            cmd.Parameters.AddWithValue("@News_Desc", txtNewsDesc.Text);
            cmd.Parameters.AddWithValue("@News_Url", txtUrl.Text);
            if(txtNewsDate.Text!=string.Empty)
            {
                cmd.Parameters.AddWithValue("@News_Date", Utilities.GetDate(txtNewsDate.Text));
            }
            else
            {
                cmd.Parameters.AddWithValue("@News_Date", Utilities.GetDate(DateTime.Now.ToString("dd/MM/yyyy")));
            }
            
            cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
            cmd.Parameters.AddWithValue("@MetaDesc", txtMetaDesc.Text);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Record Saved Successfully";
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [News_Master] SET [News_Title]=@News_Title ,[News_Image]=@News_Image,[News_Desc]=@News_Desc ,[News_Date]= @News_Date,[News_Url]=@News_Url,[MetaDesc]=@MetaDesc WHERE News_Id = " + hdfID.Value + " ");
            cmd.Parameters.AddWithValue("@News_Title", txtNewsTitle.Text);
            cmd.Parameters.AddWithValue("@News_Image", hdfImage.Value);
            cmd.Parameters.AddWithValue("@News_Desc", txtNewsDesc.Text);
            cmd.Parameters.AddWithValue("@News_Url", txtUrl.Text);
            if (txtNewsDate.Text != string.Empty)
            {
                cmd.Parameters.AddWithValue("@News_Date", Utilities.GetDate(txtNewsDate.Text));
            }
            else
            {
                cmd.Parameters.AddWithValue("@News_Date", Utilities.GetDate(DateTime.Now.ToString("dd/MM/yyyy")));
            }
            cmd.Parameters.AddWithValue("@MetaDesc", txtMetaDesc.Text);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Record Update Successfully";
        }

        Clr();
    }

    private void Clr()
    {
        txtUrl.Text = string.Empty;
        txtNewsTitle.Text = string.Empty;
        txtNewsDesc.Text = string.Empty;  
        txtNewsDate.Text = string.Empty;  
        hdfImage.Value = string.Empty;
        hdfID.Value=string.Empty;
        btnSubmit.Text = "submit";
        txtMetaDesc.Text = string.Empty;
    }
}
