using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Configuration;
using Amity.ERP_Utilities;
public partial class Controle_CourseEnquiryControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["Course"]!= null)
            {
                hdfCourse.Value = Request.QueryString["Course"].ToString();
                bindCourse();
            }         
          
        }
    }


    public void bindCourse()
    {
        ddlCourse.SelectedValue = hdfCourse.Value;
      
    }


    protected void lbtnSubmit_Click(object sender, EventArgs e)
    {
       
            SqlCommand cmd = new SqlCommand("Insert into [CourseEnquiry_Master]([CourseName],[ApplicantStatus],[FullName],[MobileNo],[EmailId],[CityName],[TrainingMode],[CreatedOn],[EnqFrom],[CourseTerm]) Values (@CourseName,@ApplicantStatus,@FullName,@MobileNo,@EmailId,@CityName,@TrainingMode ,@CreatedOn,@EnqFrom,@CourseTerm) ");
            cmd.Parameters.AddWithValue("@CourseName", ddlCourse.SelectedValue);
            cmd.Parameters.AddWithValue("@ApplicantStatus", ddlAppStatus.SelectedValue);
            cmd.Parameters.AddWithValue("@FullName", txtName.Text);
            cmd.Parameters.AddWithValue("@MobileNo", txtMobNo.Text);
            cmd.Parameters.AddWithValue("@EmailId", txtEmailID.Text);
            cmd.Parameters.AddWithValue("@CityName", txtCity.Text);
            cmd.Parameters.AddWithValue("@TrainingMode", ddlCouseMode.SelectedValue);
            cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);

        if (hdfCourse.Value != string.Empty)
        {
            cmd.Parameters.AddWithValue("@EnqFrom", "enquiry form");
        }

        else

        {
            cmd.Parameters.AddWithValue("@EnqFrom", "Pop form");

        }

        cmd.Parameters.AddWithValue("@CourseTerm", ddlCourseTerm.SelectedValue);

       


         DataAccess.InsertExecuteNonQuery(cmd);

         Response.Redirect("~/thanaksform.aspx");

      

    }

    public void SendMessage()
    {
        try
        {
            string _EmailBody = " ";
            _EmailBody += "<table style ='width:60%; border:1px solid black'>";
            _EmailBody += " <tr style = 'border:1px solid black'>";
            _EmailBody += "<th  colspan='2' style = 'border:1px solid black'><h2>Course Enquiry from ITS Gwalior Website</h2></th>";
            _EmailBody += "</tr>";

            if (hdfCourse.Value != null && hdfCourse.Value!=string.Empty)
            {
                _EmailBody += "</tr>";
                _EmailBody += "<tr style = 'border:1px solid black'>";
                _EmailBody += "<td style = 'border:1px solid black'>Course Name </td>";
                _EmailBody += "<td style = 'border:1px solid black'>" + hdfCourse.Value + "</td>";
                _EmailBody += "</tr>";
            }
            else
            {

                _EmailBody += "</tr>";
                _EmailBody += "<tr style = 'border:1px solid black'>";
                _EmailBody += "<td style = 'border:1px solid black'>Course Name </td>";
                _EmailBody += "<td style = 'border:1px solid black'>" + ddlCourse.SelectedValue + "</td>";
                _EmailBody += "</tr>";
            }

            _EmailBody += " <tr style = 'border:1px solid black'>";
            _EmailBody += "<td style = 'border:1px solid black'>Applicant Status</th>";
            _EmailBody += "<td style = 'border:1px solid black'>" + ddlAppStatus.SelectedValue + "</th>";
            _EmailBody += "</tr>";

            _EmailBody += " <tr style = 'border:1px solid black'>";
            _EmailBody += "<td style = 'border:1px solid black'> Full Name</th>";
            _EmailBody += "<td style = 'border:1px solid black'>" + txtName.Text + "</th>";
            _EmailBody += "</tr>";

            _EmailBody += "<tr style = 'border:1px solid black'>";
            _EmailBody += "<td style = 'border:1px solid black'> E-mail </td>";
            _EmailBody += "<td style = 'border:1px solid black'>" + txtEmailID.Text + "</td >";
            _EmailBody += "</tr>";
            _EmailBody += "<tr style = 'border:1px solid black'>";
            _EmailBody += "<td style = 'border:1px solid black'>Mobile </td>";
            _EmailBody += "<td style = 'border:1px solid black'>" + txtMobNo.Text + "</td>";
            _EmailBody += "</tr>";

            _EmailBody += "</tr>";
            _EmailBody += "<tr style = 'border:1px solid black'>";
            _EmailBody += "<td style = 'border:1px solid black'>City </td>";
            _EmailBody += "<td style = 'border:1px solid black'>" + txtCity.Text + "</td>";
            _EmailBody += "</tr>";        

            _EmailBody += "</tr>";
            _EmailBody += "<tr style = 'border:1px solid black'>";
            _EmailBody += "<td style = 'border:1px solid black'>Training Apply Mode </td>";
            _EmailBody += "<td style = 'border:1px solid black'>" + ddlCouseMode.SelectedValue + "</td>";
            _EmailBody += "</tr>";


            _EmailBody += "</tr>";
            _EmailBody += "<tr style = 'border:1px solid black'>";
            _EmailBody += "<td style = 'border:1px solid black'>Course Terms</td>";
            _EmailBody += "<td style = 'border:1px solid black'>" + ddlCourseTerm.SelectedValue + "</td>";
            _EmailBody += "</tr>";



            _EmailBody += "</table>";
            string from = ConfigurationManager.AppSettings["MailUsername"].ToString();
            string To = ConfigurationManager.AppSettings["AdminMailID"].ToString();
            string subject = "Course Enquiry from ITS Gwalior Website";         
            SendMail.SendWebEmail(from, To, subject, _EmailBody);           

            ClrFun();
        }
        catch (Exception ex)
        {
            alert.Visible = true;
            lblMSG.Text = "Some Error Occured,Pleaser try later " + ex.Message;
        }
       
    }
    private void ClrFun()
    {
        txtEmailID.Text = string.Empty;
        txtMobNo.Text = string.Empty;
        txtName.Text = string.Empty;
        txtCity.Text = string.Empty;      
        ddlCouseMode.ClearSelection();
        ddlAppStatus.ClearSelection();
        ddlCourse.ClearSelection();
        ddlCourseTerm.ClearSelection();
        hdfCourse.Value = string.Empty;
    }


   

}