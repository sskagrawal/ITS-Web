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

public partial class Admin_Advertisement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_Job_grdView();
            CustPager.Reload();

            //if (Request.QueryString["PID"] != null)
            //{
            //    hdfID.Value = Convert.ToString(Request.QueryString["PID"]);
            //    Bind_Job();

            //}

            //if (Session["ttppd"] != null)
            //{
            //    hdfusertypeid.Value = Session["ttppd"].ToString();

            //    if (hdfusertypeid.Value == "4" || hdfusertypeid.Value == "2")
            //    {

           if (Session["sridd"] != null)
            {

                hdfUserId.Value = Session["sridd"].ToString();
            }

        }

    }


    //public void Bind_Job()
    //{

    //    DataTable dt = DataAccess.GetData("select * from [Ads_Master] where [AdvertiseId] =" + hdfID.Value + "");
    //    if (dt.Rows.Count > 0 && dt != null)
    //    {          
    //        txtAdtitle.Text = dt.Rows[0]["AdTitle"].ToString();
    //        txtAdLink.Text = dt.Rows[0]["AdLink"].ToString();
    //        txtjobsOpenDate.Text = Convert.ToDateTime(dt.Rows[0]["Add_Date"]).ToString("dd/MM/yyyy");
    //        txtjobClosingDate.Text = Convert.ToDateTime(dt.Rows[0]["Last_Date"]).ToString("dd/MM/yyyy");     
    //        hdfImage.Value = dt.Rows[0]["Ads_Image"].ToString();
    //        btnSubmit.Text = "Update";
    //    }


    //}

   
    protected void btnSubmit_Click1(object sender, EventArgs e)
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
                    targetPath = Server.MapPath(@"~\AdsImage\") + fluPorUpload.FileName;
                    thumbImg.Save(targetPath, image.RawFormat);
                    hdfImage.Value = fluPorUpload.FileName;

                }
            }
            else
            {

            }
        }
        if (hdfAdId.Value == string.Empty)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [Ads_Master]([AdTitle],[AdLink],[Add_Date],[Last_Date],[Ads_Image],[PartyID],[UserID]) VALUES(@AdTitle,@AdLink,@Add_Date,@Last_Date,@Ads_Image,@PartyID,@UserID)");
            cmd.Parameters.AddWithValue("@AdTitle", txtAdtitle.Text);           
            cmd.Parameters.AddWithValue("@AdLink", txtAdLink.Text);
            cmd.Parameters.AddWithValue("@Add_Date", Utilities.GetDate(txtjobsOpenDate.Text));
            cmd.Parameters.AddWithValue("@Last_Date", Utilities.GetDate(txtjobClosingDate.Text));         
            cmd.Parameters.AddWithValue("@Ads_Image", hdfImage.Value);
            cmd.Parameters.AddWithValue("@PartyID", hdfID.Value);
            cmd.Parameters.AddWithValue("@UserID", hdfUserId.Value);
            DataAccess.InsertExecuteNonQuery(cmd);
            divMsg.Visible = true;
            lblmsg.Text = "Advertisement Details Stored Successfuuly";
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [Ads_Master] SET [AdTitle]=@AdTitle,[AdLink]=@AdLink,[Add_Date]=@Add_Date,[Last_Date]=@Last_Date,[Ads_Image]=@Ads_Image,[PartyID]=@PartyID,[UserID]=@UserID   WHERE [AdvertiseId] = " + hdfAdId.Value + " ");
            cmd.Parameters.AddWithValue("@AdTitle", txtAdtitle.Text);
            cmd.Parameters.AddWithValue("@AdLink", txtAdLink.Text);
            cmd.Parameters.AddWithValue("@Add_Date", Utilities.GetDate(txtjobsOpenDate.Text));
            cmd.Parameters.AddWithValue("@Last_Date", Utilities.GetDate(txtjobClosingDate.Text));
            cmd.Parameters.AddWithValue("@Ads_Image", hdfImage.Value);
            cmd.Parameters.AddWithValue("@PartyID", hdfID.Value);
            cmd.Parameters.AddWithValue("@UserID", hdfUserId.Value);
            DataAccess.InsertExecuteNonQuery(cmd);
            divMsg.Visible = true;
            lblmsg.Text = "Advertisement Details Update Successfuuly";
        }

        Bind_Job_grdView();
        CustPager.Reload();

        Clr();
    }

    private void Clr()
    {
       
        txtAdtitle.Text = string.Empty;
        txtAdLink.Text = string.Empty;
        txtjobsOpenDate.Text = string.Empty;
        txtjobClosingDate.Text = string.Empty;
        hdfImage.Value = string.Empty;
        hdfID.Value = string.Empty;
        hdfUserId.Value = string.Empty;
       // btnSubmit.Text = "submit";

    }

    private void Bind_Job_grdView()
    {
        DataTable dt = DataAccess.GetData("select * from [Ads_Master] ");
        if (dt.Rows.Count > 0 && dt != null)
        {
            grdView.DataSource = dt;
            grdView.DataBind();

            int TotalPage = dt.Rows.Count;
            CustPager.TotalRecords = TotalPage;
            CustPager.TotalPage = TotalPage % grdView.PageSize == 0 ? TotalPage / grdView.PageSize : TotalPage / grdView.PageSize + 1;
        }
    }
    protected void CustPager_PageChanged(object sender, CustomPageChangeArgs e)
    {
        grdView.PageSize = e.CurrentPageSize;
        grdView.PageIndex = e.CurrentPageNumber - 1;
        CustPager.Reload();
        Bind_Job_grdView();
    }
    protected void Edit(object sender, ImageClickEventArgs e)
    {
        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;

        int AdsID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfAdsID")).Value);
        hdfAdId.Value = AdsID.ToString();
        if (btndetails.ID.Equals("imgbtnUpdate"))
        {

            DataTable dt = DataAccess.GetData("Select * from [Ads_Master] Where [AdvertiseId]=" + AdsID + " ");
            if (dt.Rows.Count > 0)
            {
                txtAdtitle.Text = dt.Rows[0]["AdTitle"].ToString();
                txtAdLink.Text = dt.Rows[0]["AdLink"].ToString();
                txtjobsOpenDate.Text = Convert.ToDateTime(dt.Rows[0]["Add_Date"]).ToString("dd/MM/yyyy");
                txtjobClosingDate.Text = Convert.ToDateTime(dt.Rows[0]["Last_Date"]).ToString("dd/MM/yyyy");
                hdfImage.Value = dt.Rows[0]["Ads_Image"].ToString();
                btnSubmit.Text = "Update";
            }        

        }
        else if (btndetails.ID.Equals("imgbtnDelete"))
        {

            SqlCommand cmd = new SqlCommand("DELETE FROM [Ads_Master]  WHERE  [AdvertiseId] =" + AdsID + "");
            DataAccess.InsertExecuteNonQuery(cmd);


        }
        Bind_Job_grdView();
        CustPager.Reload();
    }
}