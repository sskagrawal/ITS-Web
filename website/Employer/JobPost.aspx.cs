using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;

public partial class MyProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["sridd"] != null)
            {
                hdfUserID.Value = Session["sridd"].ToString();
                BindJobType();
                BindQalification();
                BindExperince();
                BindJobIndustry();
                BindState();
                //BindCity();
                if (Request.QueryString["PID"] != null)
                {
                    hdfPostID.Value = Request.QueryString["PID"].ToString();
                    DataTable dt = DataAccess.GetData("Select * from Job_Master where job_Id=" + hdfPostID.Value + "");
                    if (dt.Rows.Count > 0 && dt != null)
                    {
                        //txtJobTitle.Text = dt.Rows[0]["job_Title"].ToString();
                        ////hdfImage.Value = dt.Rows[0]["job_Image"].ToString();
                        //txtDes.Text = dt.Rows[0]["job_Desc"].ToString();
                        ///*txtQul.Text*/
                        //drdQualification.SelectedValue = dt.Rows[0]["job_Qulalification"].ToString();
                        //txtOpeningDAte.Text = Convert.ToDateTime(dt.Rows[0]["jobopen_Date"]).ToString("dd/MM/yyyy");//dt.Rows[0]["jobopen_Date"].ToString();
                        //txtClosingdate.Text = Convert.ToDateTime(dt.Rows[0]["jobClose_Date"]).ToString("dd/MM/yyyy");//dt.Rows[0]["jobClose_Date"].ToString();
                        //                                                                                             /* txtExp.Text*/
                        //drdExp.SelectedValue = dt.Rows[0]["Exp"].ToString();
                        //txtNoPosition.Text = dt.Rows[0]["Position"].ToString();
                        //drdJobType.SelectedItem.Text = dt.Rows[0]["JobType"].ToString();
                        //drdState.SelectedItem.Text = dt.Rows[0]["StateID"].ToString();
                        //BindCity();
                        //drdCity.SelectedItem.Text = dt.Rows[0]["CityID"].ToString();

                        txtJobTitle.Text = dt.Rows[0]["job_Title"].ToString();
                        txtDes.Text = dt.Rows[0]["job_Desc"].ToString();
                        drdQualification.SelectedItem.Text = dt.Rows[0]["job_Qulalification"].ToString();
                        txtOpeningDAte.Text = Convert.ToDateTime(dt.Rows[0]["jobopen_Date"]).ToString("dd/MM/yyyy");
                        txtClosingdate.Text = Convert.ToDateTime(dt.Rows[0]["jobClose_Date"]).ToString("dd/MM/yyyy");
                        drdExp.SelectedItem.Text = dt.Rows[0]["Exp"].ToString();
                        txtNoPosition.Text = dt.Rows[0]["Position"].ToString();
                        drdJobType.SelectedItem.Text = dt.Rows[0]["JobType"].ToString();
                        hdfUserID.Value = dt.Rows[0]["UserID"].ToString();
                        txtMinimum.Text = dt.Rows[0]["MimiSalery"].ToString();
                        txtMaxmum.Text = dt.Rows[0]["MaxiMum"].ToString();
                        drdIndustry.SelectedItem.Text = dt.Rows[0]["Industry"].ToString();
                        drdState.SelectedItem.Text = dt.Rows[0]["StateID"].ToString();
                        BindCity();
                        drdCity.SelectedItem.Text = dt.Rows[0]["CityID"].ToString();
                    }

                }

            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }

    private void BindJobType()
    {
        drdJobType.Items.Clear();
        ListItem item = new ListItem("Select Job Type", "0");
        drdJobType.Items.Add(item);
        DataTable dt = DataAccess.GetData("Select * from JobType order by jobType");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                ListItem item1 = new ListItem(row["JobType"].ToString(), row["ID"].ToString());
                drdJobType.Items.Add(item1);
            }
        }

    }
    private void BindJobIndustry()
    {
        drdIndustry.Items.Clear();
        ListItem item = new ListItem("Select Job Industry", "0");
        drdIndustry.Items.Add(item);
        DataTable dt = DataAccess.GetData("Select * from Industry_Mst order by Industry");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                ListItem item1 = new ListItem(row["Industry"].ToString(), row["ID"].ToString());
                drdIndustry.Items.Add(item1);
            }
        }

    }
    private void BindExperince()
    {
        drdExp.Items.Clear();
        ListItem item = new ListItem("Select Experience", "0");
        drdExp.Items.Add(item);
        DataTable dt = DataAccess.GetData("Select * from EsperienceMST");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                ListItem item1 = new ListItem(row["Experience"].ToString(), row["ID"].ToString());
                drdExp.Items.Add(item1);
            }
        }

    }
    private void BindQalification()
    {
        drdQualification.Items.Clear();
        ListItem item = new ListItem("Select Qualification", "0");
        drdQualification.Items.Add(item);
        DataTable dt = DataAccess.GetData("Select * from Qalification");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                ListItem item1 = new ListItem(row["Qualification"].ToString(), row["ID"].ToString());
                drdQualification.Items.Add(item1);
            }
        }

    }
    private void BindCity()
    {
        drdCity.Items.Clear();
        ListItem item = new ListItem("Select City", "0");
        drdCity.Items.Add(item);
        DataTable dt = DataAccess.GetData("Select * from Mst_City_Master where State_Id='" + drdState.SelectedValue + "'");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                ListItem item1 = new ListItem(row["City_Name"].ToString(), row["City_Id"].ToString());
                drdCity.Items.Add(item1);
            }
        }

    }
    private void BindState()
    {
        drdState.Items.Clear();
        ListItem item = new ListItem("Select State", "0");
        drdState.Items.Add(item);
        DataTable dt = DataAccess.GetData("Select * from StateMaster where Country_Id='101' order by State_Name");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                ListItem item1 = new ListItem(row["State_Name"].ToString(), row["State_Id"].ToString());
                drdState.Items.Add(item1);
            }
        }

    }
    //private void BindOrganization()
    //{
    //    DataTable dt = DataAccess.GetData("Select * from OrgnaizationType");
    //    if (dt.Rows.Count > 0 && dt != null)
    //    {
    //        foreach (DataRow dr in dt.Rows)
    //        {
    //            ListItem item = new ListItem();
    //            item.Value = dr["ID"].ToString();
    //            item.Text = dr["OrganizationName"].ToString();
    //            drdOrganization.Items.Add(item);
    //        }
    //    }
    //}
    protected void lbtnSubmit_Click(object sender, EventArgs e)
    {
        //string targetPath = string.Empty;
        //if (FileUploadLogo.PostedFile != null)
        //{
        //    // Check the extension of image  
        //    string extension = Path.GetExtension(FileUploadLogo.FileName);
        //    if (extension.ToLower() == ".png" || extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg")
        //    {
        //        Stream strm = FileUploadLogo.PostedFile.InputStream;
        //        using (var image = System.Drawing.Image.FromStream(strm))
        //        {

        //            int newWidth =100; // New Width of Image in Pixel  
        //            int newHeight = 80; // New Height of Image in Pixel  
        //            var thumbImg = new Bitmap(newWidth, newHeight);
        //            var thumbGraph = Graphics.FromImage(thumbImg);
        //            thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
        //            thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
        //            thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
        //            var imgRectangle = new Rectangle(0, 0, newWidth, newHeight);
        //            thumbGraph.DrawImage(image, imgRectangle);
        //            // Save the file  

        //            targetPath = Server.MapPath(@"~\Job_Image\") + FileUploadLogo.FileName;
        //            thumbImg.Save(targetPath, image.RawFormat);
        //            hdfImage.Value = FileUploadLogo.FileName;

        //        }
        //    }
        //    else
        //    {

        //    }
        //}
        if (hdfPostID.Value == string.Empty)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [Job_Master]([job_Title],[job_Desc],[job_Qulalification],[jobopen_Date],[jobClose_Date],[job_Fees],[job_weblink],[CreatedOn],[Exp],[Position],[JobType],[JobCategory],[UserID],[MimiSalery],[MaxiMum],[Industry],[StateID],[CityID]) VALUES(@job_Title,@job_Desc,@job_Qulalification,@jobopen_Date,@jobClose_Date,@job_Fees,@job_weblink,@CreatedOn,@Exp,@Position,@JobType,@JobCategory,@UserID,@MimiSalery,@MaxiMum,@Industry,@StateID,@CityID)");
            cmd.Parameters.AddWithValue("@job_Title", txtJobTitle.Text);
            //cmd.Parameters.AddWithValue("@job_Image", hdfImage.Value);
            cmd.Parameters.AddWithValue("@job_Desc", txtDes.Text);
            cmd.Parameters.AddWithValue("@job_Qulalification", drdQualification.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@jobopen_Date", Utilities.GetDate(txtOpeningDAte.Text));
            if (txtClosingdate.Text != string.Empty)
            {
                cmd.Parameters.AddWithValue("@jobClose_Date", Utilities.GetDate(txtClosingdate.Text));
            }
            else
            {
                cmd.Parameters.AddWithValue("@jobClose_Date", " ");
            }
            // cmd.Parameters.AddWithValue("@jobClose_Date", Utilities.GetDate(txtClosingdate.Text));
            cmd.Parameters.AddWithValue("@job_Fees", " ");
            cmd.Parameters.AddWithValue("@job_weblink", " ");
            cmd.Parameters.AddWithValue("@Exp", drdExp.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Position", txtNoPosition.Text);
            cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
            cmd.Parameters.AddWithValue("@JobType", drdJobType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@JobCategory", "Client");
            cmd.Parameters.AddWithValue("@UserID", hdfUserID.Value);
            cmd.Parameters.AddWithValue("@MimiSalery", txtMinimum.Text);
            cmd.Parameters.AddWithValue("@MaxiMum", txtMaxmum.Text);
            cmd.Parameters.AddWithValue("@Industry", drdIndustry.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@StateID", drdState.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CityID", drdCity.SelectedItem.Text);
            DataAccess.InsertExecuteNonQuery(cmd);

            alert.Visible = true;
            lblMSG.Text = "Job Details Stored Successfully";
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [Job_Master] SET [job_Title]=@job_Title,[job_Desc]=@job_Desc,[job_Qulalification]=@job_Qulalification,[jobopen_Date]=@jobopen_Date,[jobClose_Date]=@jobClose_Date,[job_Fees]=@job_Fees,[job_weblink]=@job_weblink,[JobType]=@JobType,[MimiSalery]=@MimiSalery,[MaxiMum]=@MaxiMum,[Industry]=@Industry,[StateID]=@StateID,[CityID]=@CityID  WHERE job_Id = " + hdfPostID.Value + " ");
            cmd.Parameters.AddWithValue("@job_Title", txtJobTitle.Text);
            //cmd.Parameters.AddWithValue("@job_Image", hdfImage.Value);
            cmd.Parameters.AddWithValue("@job_Desc", txtDes.Text);
            cmd.Parameters.AddWithValue("@job_Qulalification", drdQualification.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@jobopen_Date", Utilities.GetDate(txtOpeningDAte.Text));
            cmd.Parameters.AddWithValue("@jobClose_Date", Utilities.GetDate(txtClosingdate.Text));
            cmd.Parameters.AddWithValue("@job_Fees", " ");
            cmd.Parameters.AddWithValue("@job_weblink", " ");
            cmd.Parameters.AddWithValue("@Exp", drdExp.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Position", txtNoPosition.Text);
            cmd.Parameters.AddWithValue("@JobType", drdJobType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@MimiSalery", txtMinimum.Text);
            cmd.Parameters.AddWithValue("@MaxiMum", txtMaxmum.Text);
            cmd.Parameters.AddWithValue("@Industry", drdIndustry.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@StateID", drdState.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CityID", drdCity.SelectedItem.Text);
            DataAccess.InsertExecuteNonQuery(cmd);

            alert.Visible = true;
            lblMSG.Text = "Job Details Update Successfully";
        }

        //alert.Visible = true;
        //lblMSG.Text = "Your Profile Updated Successfully";
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
        Clr();

    }

    private void Clr()
    {
        drdIndustry.ClearSelection();
        hdfPostID.Value = string.Empty;
        txtClosingdate.Text = string.Empty;
        txtDes.Text = string.Empty;
        drdJobType.ClearSelection();
        drdQualification.ClearSelection();
        //txtExp.Text = string.Empty;
        txtJobTitle.Text = string.Empty;
        txtNoPosition.Text = string.Empty;
        txtOpeningDAte.Text = string.Empty;
        drdExp.ClearSelection();
        //txtQul.Text = string.Empty;
        txtMaxmum.Text = string.Empty;
        txtMinimum.Text = string.Empty;
        drdJobType.ClearSelection();
    }
    protected void drdState_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindCity();
    }
}