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

public partial class Admin_SubSlider : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_SubSlider();
        }

    }

    public void Bind_SubSlider()
    {

        DataTable dt = DataAccess.GetData("select * from [SubSliderMaster]  order by Sort asc");
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
                    targetPath = Server.MapPath(@"~\SubSliderImage\") + fluSlideUpload.FileName;
                    thumbImg.Save(targetPath, image.RawFormat);
                    hdfImage.Value = fluSlideUpload.FileName;

                }
            }


            else if (extension.ToLower() == ".gif" || extension.ToLower() == ".webp" || extension.ToLower() == ".wbmp")
            {
                if (File.Exists(Server.MapPath("../SubSliderImage/" + hdfImage.Value)))
                {
                    File.Delete(Server.MapPath("../SubSliderImage/" + hdfImage.Value));
                }

                fluSlideUpload.SaveAs(Server.MapPath("../SubSliderImage/" + fluSlideUpload.FileName));
                hdfImage.Value = fluSlideUpload.FileName;
            }



            else
            {

            }
        }
        if (hdfID.Value == string.Empty)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [SubSliderMaster]([Title],[WebUrl],[SubSliderImage],[CreatedOn],[Sort],[AltName]) VALUES(@Title,@WebUrl,@SubSliderImage,@CreatedOn,@Sort,@AltName)");
            cmd.Parameters.AddWithValue("@Title", txtSubSliderTitle.Text);
            cmd.Parameters.AddWithValue("@WebUrl", txtWebUrl.Text);
            cmd.Parameters.AddWithValue("@SubSliderImage", hdfImage.Value);
            cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
            cmd.Parameters.AddWithValue("@Sort", txtSortNo.Text);
            cmd.Parameters.AddWithValue("@AltName", txtAltName.Text);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Record Saved Successfully";

        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [SubSliderMaster] SET [Title]=@Title,[WebUrl]=@WebUrl,[SubSliderImage]=@SubSliderImage,[Sort]=@Sort  WHERE [SubSliderId]=" + hdfID.Value + "");
            cmd.Parameters.AddWithValue("@Title", txtSubSliderTitle.Text);
            cmd.Parameters.AddWithValue("@WebUrl", txtWebUrl.Text);
            cmd.Parameters.AddWithValue("@SubSliderImage", hdfImage.Value);
            cmd.Parameters.AddWithValue("@Sort", txtSortNo.Text);
            cmd.Parameters.AddWithValue("@AltName", txtAltName.Text);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Record Update Successfully";

        }
        //     Bind_SubSlider();
        Clr();
        Bind_SubSlider();
    }

    private void Clr()
    {
        txtSortNo.Text = string.Empty;
        txtSubSliderTitle.Text = string.Empty;
        txtAltName.Text = string.Empty;
        txtWebUrl.Text = string.Empty;
        hdfImage.Value = string.Empty;
        hdfID.Value = string.Empty;
        Button1.Text = "submit";
    }


    protected void Edit(object sender, EventArgs e)
    {

        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;

        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfID")).Value);
        hdfID.Value = Convert.ToString(ID);

        if (btndetails.ID.Equals("imgbtnUpdate"))
        {

            DataTable dt = DataAccess.GetData("select * FROM [SubSliderMaster]  WHERE  [SubSliderId] =" + ID + "");
            if (dt.Rows.Count > 0 && dt != null)
            {
                txtSubSliderTitle.Text = dt.Rows[0]["Title"].ToString();
                txtAltName.Text = dt.Rows[0]["AltName"].ToString();
                txtWebUrl.Text = dt.Rows[0]["WebUrl"].ToString();
                hdfImage.Value = dt.Rows[0]["SubSliderImage"].ToString();
                txtSortNo.Text = dt.Rows[0]["Sort"].ToString();
                Button1.Text = "Update";


            }

        }
        else if (btndetails.ID.Equals("imgbtnDelete"))
        {

            SqlCommand cmd = new SqlCommand("DELETE FROM [SubSliderMaster]  WHERE  [SubSliderId] =" + ID + "");
            DataAccess.InsertExecuteNonQuery(cmd);
            //     Bind_SubSlider();

        }

        Bind_SubSlider();
    }



}