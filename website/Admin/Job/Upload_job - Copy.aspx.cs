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

public partial class Admin_Career : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["ID"] != null)
            {
                hdfUserID.Value = Session["ID"].ToString();
                BindIndustries();

                BindExp();
                if (Request.QueryString["PID"] != null)
                {
                    hdfID.Value = Convert.ToString(Request.QueryString["PID"]);
                    Bind_Job();

                }
                BindCompany();

            }


        }

    }

    private void BindCompany()
    {
        drdCom.Items.Clear();
        ListItem item1 = new ListItem();
        item1.Value = "";
        item1.Text = "--Select Company--";
        drdCom.Items.Add(item1);
        DataTable dt = DataAccess.GetData("Select * from UserDetails where UserTypeID='2'");/*and*/
        if (dt.Rows.Count > 0 && dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["ID"].ToString();
                item.Text = dr["CompanyName"].ToString() + " , " + dr["Name"].ToString();
                drdCom.Items.Add(item);
            }
        }
    }

    private void BindExp()
    {
        drdExpri.Items.Clear();
        ListItem item1 = new ListItem();
        item1.Value = "0";
        item1.Text = "--Select Experience--";
        drdExpri.Items.Add(item1);
        DataTable dt = DataAccess.GetData("Select * from EsperienceMST");
        if (dt.Rows.Count > 0 && dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["ID"].ToString();
                item.Text = dr["Experience"].ToString();
                drdExpri.Items.Add(item);

            }
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
                drdJobTYpe.Items.Add(item);
            }
        }
    }
    public void Bind_Job()
    {

        DataTable dt = DataAccess.GetData("select * from [Job_Master] where [job_Id] =" + hdfID.Value + "");
        if (dt.Rows.Count > 0 && dt != null)
        {
            txtjobtitle.Text = dt.Rows[0]["job_Title"].ToString();
            hdfImage.Value = dt.Rows[0]["job_Image"].ToString();
            txtJobDesc.Text = dt.Rows[0]["job_Desc"].ToString();
            txtQualification.Text = dt.Rows[0]["job_Qulalification"].ToString();
            txtjobsOpenDate.Text = Convert.ToDateTime(dt.Rows[0]["jobopen_Date"]).ToString("dd/MM/yyyy");
            txtjobClosingDate.Text = Convert.ToDateTime(dt.Rows[0]["jobClose_Date"]).ToString("dd/MM/yyyy");
            txtPosition.Text = dt.Rows[0]["Position"].ToString();
            BindExp();
            drdExpri.SelectedItem.Text = dt.Rows[0]["Exp"].ToString();
            drdJobTYpe.SelectedValue = dt.Rows[0]["JobType"].ToString();
            btnSubmit.Text = "Update";
        }


    }

    private void Clr()
    {
        drdJobTYpe.ClearSelection();
        txtjobtitle.Text = string.Empty;
        txtJobDesc.Text = string.Empty;
        txtQualification.Text = string.Empty;
        txtjobsOpenDate.Text = string.Empty;
        txtjobClosingDate.Text = string.Empty;
        txtJobFees.Text = string.Empty;
        txtJobWeblink.Text = string.Empty;
        hdfImage.Value = string.Empty;
        hdfID.Value = string.Empty;
        txtPosition.Text = string.Empty;
        drdExpri.ClearSelection();
        btnSubmit.Text = "submit";

    }
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

                    targetPath = Server.MapPath(@"~\Job_Image\") + fluPorUpload.FileName;
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
            SqlCommand cmd = new SqlCommand("INSERT INTO [Job_Master]([job_Title],[job_Image],[job_Desc],[job_Qulalification],[jobopen_Date],[jobClose_Date],[job_Fees],[job_weblink],[CreatedOn],[Exp],[Position],[JobType],[JobCategory],[UserID]) VALUES(@job_Title,@job_Image,@job_Desc,@job_Qulalification,@jobopen_Date,@jobClose_Date,@job_Fees,@job_weblink,@CreatedOn,@Exp,@Position,@JobType,@JobCategory,@UserID)");
            cmd.Parameters.AddWithValue("@job_Title", txtjobtitle.Text);
            cmd.Parameters.AddWithValue("@job_Image", hdfImage.Value);
            cmd.Parameters.AddWithValue("@job_Desc", txtJobDesc.Text);
            cmd.Parameters.AddWithValue("@job_Qulalification", txtQualification.Text);
            cmd.Parameters.AddWithValue("@jobopen_Date", Utilities.GetDate(txtjobsOpenDate.Text));
            cmd.Parameters.AddWithValue("@jobClose_Date", Utilities.GetDate(txtjobClosingDate.Text));
            cmd.Parameters.AddWithValue("@job_Fees", txtJobFees.Text);
            cmd.Parameters.AddWithValue("@job_weblink", txtJobWeblink.Text);
            cmd.Parameters.AddWithValue("@Exp", drdExpri.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Position", txtPosition.Text);
            cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
            cmd.Parameters.AddWithValue("@JobType", drdJobTYpe.SelectedValue);
            cmd.Parameters.AddWithValue("@JobCategory", "company");
            cmd.Parameters.AddWithValue("@UserID", hdfUserID.Value);
            DataAccess.InsertExecuteNonQuery(cmd);

            divMsg.Visible = true;

            lblmsg.Text = "Job Details Stored Successfuuly";
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [Job_Master] SET [job_Title]=@job_Title,[job_Image]=@job_Image,[job_Desc]=@job_Desc,[job_Qulalification]=@job_Qulalification,[jobopen_Date]=@jobopen_Date,[jobClose_Date]=@jobClose_Date,[job_Fees]=@job_Fees,[job_weblink]=@job_weblink,[JobType]=@JobType  WHERE job_Id = " + hdfID.Value + " ");
            cmd.Parameters.AddWithValue("@job_Title", txtjobtitle.Text);
            cmd.Parameters.AddWithValue("@job_Image", hdfImage.Value);
            cmd.Parameters.AddWithValue("@job_Desc", txtJobDesc.Text);
            cmd.Parameters.AddWithValue("@job_Qulalification", txtQualification.Text);
            cmd.Parameters.AddWithValue("@jobopen_Date", Utilities.GetDate(txtjobsOpenDate.Text));
            cmd.Parameters.AddWithValue("@jobClose_Date", Utilities.GetDate(txtjobClosingDate.Text));
            cmd.Parameters.AddWithValue("@job_Fees", txtJobFees.Text);
            cmd.Parameters.AddWithValue("@job_weblink", txtJobWeblink.Text);
            cmd.Parameters.AddWithValue("@Exp", drdExpri.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Position", txtPosition.Text);
            cmd.Parameters.AddWithValue("@JobType", drdJobTYpe.SelectedValue);
            DataAccess.InsertExecuteNonQuery(cmd);

            divMsg.Visible = true;

            lblmsg.Text = "Job Details Update Successfuuly";
        }

        Clr();
    }
}