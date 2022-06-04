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

public partial class Admin_Slider : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_Slider();
        }

    }

    public void Bind_Slider()
    {

        DataTable dt = DataAccess.GetData("select * from [SliderMaster]  order by [Sort] asc");
        if (dt.Rows.Count > 0 && dt != null)
        {
            grdView.DataSource = dt;
            grdView.DataBind();
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        string targetPath = string.Empty;
        if (fluSlideUpload.PostedFile != null)
        {
            // Check the extension of image  
            string extension = Path.GetExtension(fluSlideUpload.FileName);
            if (extension.ToLower() == ".png" || extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg")
            {
                Stream strm = fluSlideUpload.PostedFile.InputStream;
                using (var image = System.Drawing.Image.FromStream(strm))
                {

                    int newWidth = 1920; // New Width of Image in Pixel  
                    int newHeight = 1080; // New Height of Image in Pixel  
                    var thumbImg = new Bitmap(newWidth, newHeight);
                    var thumbGraph = Graphics.FromImage(thumbImg);
                    thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
                    thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
                    thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                    var imgRectangle = new Rectangle(0, 0, newWidth, newHeight);
                    thumbGraph.DrawImage(image, imgRectangle);
                    // Save the file  
                    targetPath = Server.MapPath(@"~\SliderImage\") + fluSlideUpload.FileName;
                    thumbImg.Save(targetPath, image.RawFormat);
                    hdfImage.Value = fluSlideUpload.FileName;

                }
            }
else if(extension.ToLower() == ".gif" || extension.ToLower() == ".webp" || extension.ToLower() == ".wbmp")
{
	if (File.Exists(Server.MapPath("../SliderImage/" + hdfImage.Value)))
                {
                    File.Delete(Server.MapPath("../SliderImage/" + hdfImage.Value));
                }

                fluSlideUpload.SaveAs(Server.MapPath("../SliderImage/" + fluSlideUpload.FileName));
                hdfImage.Value = fluSlideUpload.FileName;
}
            else
            {

            }
        }
        if (hdfID.Value == string.Empty)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [SliderMaster]([SliderTitle],[Slider_SubTitle],[SliderImg],[CreatedOn],[Sort],[Alt_Name]) VALUES(@SliderTitle,@Slider_SubTitle,@SliderImg,@CreatedOn,@Sort,@Alt_Name)");

            cmd.Parameters.AddWithValue("@SliderTitle", txtSliderTitle.Text);
            cmd.Parameters.AddWithValue("@Slider_SubTitle", txtSliderSubTitle.Text);
            cmd.Parameters.AddWithValue("@SliderImg", hdfImage.Value);
            cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
            cmd.Parameters.AddWithValue("@Sort", txtSort.Text);
            cmd.Parameters.AddWithValue("@Alt_Name", txtAlt_Name.Text);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Record Saved Successfully";


        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [SliderMaster] SET [SliderTitle]=@SliderTitle,[Slider_SubTitle]=@Slider_SubTitle,[SliderImg]=@SliderImg,[Sort]=@Sort, [Alt_Name]=@Alt_Name WHERE [SliderId]=" + hdfID.Value + "");
            cmd.Parameters.AddWithValue("@SliderTitle", txtSliderTitle.Text);
            cmd.Parameters.AddWithValue("@Slider_SubTitle", txtSliderSubTitle.Text);
            cmd.Parameters.AddWithValue("@SliderImg", hdfImage.Value);
            cmd.Parameters.AddWithValue("@Sort", txtSort.Text);
            cmd.Parameters.AddWithValue("@Alt_Name", txtAlt_Name.Text);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Record Update Successfully";


        }
        Bind_Slider();
        Clr();
    }

    private void Clr()
    {
        txtSort.Text = string.Empty;
        txtSliderTitle.Text = string.Empty;
        txtSliderSubTitle.Text = string.Empty;
        txtAlt_Name.Text = string.Empty;
        hdfImage.Value = string.Empty;
        hdfID.Value = string.Empty;
        Button1.Text = "submit";
    }


    protected void Edit(object sender, EventArgs e)
    {

        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;
        HiddenField hdfSliderimg = ((HiddenField)grdView.FindControl("hdfSliderImage"));
        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfID")).Value);
        hdfID.Value = Convert.ToString(ID);

        if (btndetails.ID.Equals("imgbtnUpdate"))
        {

            DataTable dt = DataAccess.GetData("select * FROM [SliderMaster]  WHERE  [SliderId] =" + ID + "");
            if (dt.Rows.Count > 0 && dt != null)
            {
                txtSort.Text = dt.Rows[0]["Sort"].ToString();
                txtSliderTitle.Text = dt.Rows[0]["SliderTitle"].ToString();
                txtSliderSubTitle.Text = dt.Rows[0]["Slider_SubTitle"].ToString();
                txtAlt_Name.Text = dt.Rows[0]["Alt_Name"].ToString();
                hdfImage.Value = dt.Rows[0]["SliderImg"].ToString();
                Button1.Text = "Update";
            }

        }
        else if (btndetails.ID.Equals("imgbtnDelete"))
        {          
            
            SqlCommand cmd = new SqlCommand("DELETE FROM [SliderMaster]  WHERE  [SliderId] =" + ID + "");
            DataAccess.InsertExecuteNonQuery(cmd);

            if (File.Exists(Server.MapPath("../SliderImage/" + hdfSliderimg.Value)))
            {
                File.Delete(Server.MapPath("../SliderImage/" + hdfSliderimg.Value));
            }

            Bind_Slider();

        }


    }




}