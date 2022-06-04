using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
public partial class Client_Panel_Post_Job : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["partyid"]!= null)
            {
                hdfUserID.Value = Session["partyid"].ToString();

                BindExp();
                BindQualification();
                BindState();
                BindJobType();
              //  Bind_Field();

            }

            else
            {

                Response.Redirect("~/Default.aspx");

            }

        }
    }


    private void BindExp()
    {
        DataTable dt = DataAccess.GetData("Select * from EsperienceMST");
        if (dt.Rows.Count > 0 && dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Text = dr["Experience"].ToString();
                item.Value = dr["ID"].ToString();
                drdExp.Items.Add(item);
            }
        }
    }


    private void BindQualification()
    {
        DataTable dt = DataAccess.GetData("Select * from Qalification");
        if (dt.Rows.Count > 0 && dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Text = dr["Qualification"].ToString();
                item.Value = dr["ID"].ToString();
                drdQualification.Items.Add(item);
            }
        }
    }


    private void BindState()
    {
        DataTable dt = DataAccess.GetData("Select * from [StateMaster] where Country_Id='101'");
        if (dt.Rows.Count > 0 && dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Text = dr["State_Name"].ToString();
                item.Value = dr["State_Id"].ToString();
                drdState.Items.Add(item);
            }
        }
    }

    protected void drdState_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindCity();
    }

    private void BindCity()
    {
        DataTable dt = DataAccess.GetData("Select * from [Mst_City_Master] where State_Id=" + drdState.SelectedValue + "");
        if (dt.Rows.Count > 0 && dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Text = dr["City_Name"].ToString();
                item.Value = dr["City_Id"].ToString();
                drdCity.Items.Add(item);
            }
        }
    }

    private void BindJobType()
    {
        DataTable dt = DataAccess.GetData("Select * from jobType order by JobType");
        if (dt.Rows.Count > 0 && dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["ID"].ToString();
                item.Text = dr["jobType"].ToString();
                drdJobType.Items.Add(item);
            }
        }

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        //string checkJobPRo = string.Empty;
        //try
        //{
        //    checkJobPRo = DataAccess.GetSingleValue("select UserID from Job_Master where UserID='" + hdfUserID.Value + "'");
        //}
        //catch { }
        //if (checkJobPRo == string.Empty)
        //{
            SqlCommand cmd = new SqlCommand("INSERT INTO [Job_Master]([job_Title],[job_Desc],[job_Qulalification],[Exp],[JobType],[JobCategory],[CreatedOn],[UserID],[Salary],[OtherEducation],[StateID],[CityID]) VALUES(@job_Title,@job_Desc,@job_Qulalification,@Exp,@JobType,@JobCategory,@CreatedOn,@UserID,@Salary,@OtherEducation,@StateID,@CityID)");
            cmd.Parameters.AddWithValue("@job_Title", txtJobTitle.Text);
            cmd.Parameters.AddWithValue("@job_Desc", txtDes.Text);
            cmd.Parameters.AddWithValue("@job_Qulalification", drdQualification.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Exp", drdExp.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@JobType", drdJobType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@JobCategory", "JobSheeker");
            cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
            cmd.Parameters.AddWithValue("@UserID", hdfUserID.Value);
            cmd.Parameters.AddWithValue("@Salary", txtSalary.Text);         
            cmd.Parameters.AddWithValue("@OtherEducation", txtEducation.Text);
            cmd.Parameters.AddWithValue("@StateID", drdState.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CityID", drdCity.SelectedItem.Text);         
           
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMSG.Text = "Your Job Profile Save Successfully";
       // }
        //else
        //{
        //    SqlCommand cmd = new SqlCommand("UPDATE [Job_Master] SET [job_Desc] = @job_Desc,[Exp] = @Exp,[job_Qulalification]=@job_Qulalification,[JobType] = @JobType,[Salary] = @Salary,[OtherEducation]=@OtherEducation,[StateID]=@StateID,[CityID]=@CityID WHERE [UserID] =" + hdfUserID.Value + "");
        //    cmd.Parameters.AddWithValue("@job_Title",txtJobTitle.Text);
        //    cmd.Parameters.AddWithValue("@job_Desc", txtDes.Text);
        //    cmd.Parameters.AddWithValue("@job_Qulalification", drdQualification.SelectedItem.Text);
        //    cmd.Parameters.AddWithValue("@Exp", drdExp.SelectedValue);
        //    cmd.Parameters.AddWithValue("@JobType", drdJobType.SelectedItem.Text);        
        //    cmd.Parameters.AddWithValue("@Salary", txtSalary.Text);        
        //    cmd.Parameters.AddWithValue("@OtherEducation", txtEducation.Text);
        //    cmd.Parameters.AddWithValue("@StateID", drdState.SelectedItem.Text);
        //    cmd.Parameters.AddWithValue("@CityID", drdCity.SelectedItem.Text);
        //    DataAccess.InsertExecuteNonQuery(cmd);
        //    alert.Visible = true;
        //    lblMSG.Text = "Your Job Profile Updated Successfully";
        //}

        ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
        if (hdfUserID.Value != string.Empty)
        {
            if (!fileUpCV.HasFile)
            {
                Response.Write("No file Selected"); return;
            }
            else
            {
                string filename = Path.GetFileName(fileUpCV.PostedFile.FileName);
                hdfCV.Value = Path.GetFileName(fileUpCV.PostedFile.FileName);
                string extension = Path.GetExtension(filename);
                string contentType = fileUpCV.PostedFile.ContentType;
                HttpPostedFile file = fileUpCV.PostedFile;
                byte[] document = new byte[file.ContentLength];
                file.InputStream.Read(document, 0, file.ContentLength);

                //Validations  
                if ((extension == ".pdf") || (extension == ".doc") || (extension == ".docx") || (extension == ".xls"))//extension  
                {
                    if (file.ContentLength <= 31457280)//size  
                    {
                        fileUpCV.SaveAs(Server.MapPath("~/CV/" + fileUpCV.FileName));

                    }
                    else
                    { Response.Write("Inavlid File size"); return; }
                }
                else
                {
                    Response.Write("Inavlid File"); return;
                }
            }
            string CheckCV = string.Empty;
            try
            {
                CheckCV = DataAccess.GetSingleValue("select CvName from CVProfile where UserID='" + hdfUserID.Value + "'");
            }
            catch { }

            if (CheckCV == string.Empty)
            {
                SqlCommand cmdCV = new SqlCommand("INSERT INTO [CVProfile]([CvName],[Name],[MobileNo],[CrearteOn],[UserID]) VALUES(@CvName,@Name,@MobileNo,@CrearteOn,@UserID)");
                cmdCV.Parameters.AddWithValue("@CvName", hdfCV.Value);
                cmdCV.Parameters.AddWithValue("@Name", hdfUserName.Value);
                cmdCV.Parameters.AddWithValue("@MobileNo", hdfUserMob.Value);
                cmdCV.Parameters.AddWithValue("@CrearteOn", DateTime.Now);            
                cmdCV.Parameters.AddWithValue("@UserID", hdfUserID.Value);
                DataAccess.InsertExecuteNonQuery(cmdCV);
            }
            else
            {
                SqlCommand cmdCV = new SqlCommand("UPDATE [CVProfile] SET [CvName] = @CvName,[Name]=@Name,[MobileNo]=@MobileNo WHERE [UserID] =" + hdfUserID.Value + "");
                cmdCV.Parameters.AddWithValue("@CvName", hdfCV.Value);
                cmdCV.Parameters.AddWithValue("@Name", hdfUserName.Value);
                cmdCV.Parameters.AddWithValue("@MobileNo", hdfUserMob.Value);
                DataAccess.InsertExecuteNonQuery(cmdCV);
            }
        }

   
        clr();

    }

    

    private void clr()
    {
        hdfCV.Value = string.Empty;
        txtDes.Text = string.Empty;
        txtEducation.Text = string.Empty;     
        txtJobTitle.Text = string.Empty;     
        drdQualification.ClearSelection();
        txtSalary.Text = string.Empty;
        drdJobType.ClearSelection();
      
    }
}