using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
public partial class Client_Panel_job_apply_now : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["jid"] != null)
            {
                hdfjobid.Value = Request.QueryString["jid"].ToString();
                BindCompanyDetail();
            }  
         }
    }

    public void BindCompanyDetail()
    {

        DataTable dt = DataAccess.GetData("select * from View_FindJob where [job_Id]=" + hdfjobid.Value + "");
        if (dt.Rows.Count > 0)
        {

            ltrApplyJob.Text += "<div class='project-head'>";
            ltrApplyJob.Text += "<div class='project-title'>";
            ltrApplyJob.Text += "<h5>Company Name :"+ dt.Rows[0]["CompanyName"].ToString() + "</h5>";
            ltrApplyJob.Text += "</div></div>";


            ltrApplyJob.Text+="<div class='project-info' style='padding-top:0px!important;'>";
            ltrApplyJob.Text += "<div class='row align-items-center'>";
            ltrApplyJob.Text += "<div class='col-sm-12'>";
            ltrApplyJob.Text += "<div class='row'>";
            ltrApplyJob.Text += "<div class='col-12'>";
            ltrApplyJob.Text += "<table class='table'>";


            ltrApplyJob.Text += "<tr><td><span style='color:#000000;'> Contact Info Name:</span> </td>";
            ltrApplyJob.Text += "<td><span class='text-primary'>"+ dt.Rows[0]["Name"].ToString() + "</span></td></tr>";

            ltrApplyJob.Text += "<tr><td><span style = 'color:#000000;'>Mobile:</span></td>";
            ltrApplyJob.Text += "<td><span class='text-primary'>"+ dt.Rows[0]["MobileNo"].ToString() + "</span></td></tr>";


            ltrApplyJob.Text += "<tr><td><span style = 'color:#000000;' > Email ID:</span>  </td>";
            ltrApplyJob.Text += "<td><span class='text-primary'>"+ dt.Rows[0]["EmailID"].ToString() + "</span></td></tr>";

            ltrApplyJob.Text += "<tr><td><span style = 'color:#000000;' > Website:</span>  </td> ";

            if (dt.Rows[0]["Website"].ToString() != string.Empty)
            {
                ltrApplyJob.Text += "<td><span class='text-primary'>" + dt.Rows[0]["Website"].ToString() + "</span></td></tr>";
            }

            else
            {
                ltrApplyJob.Text += "<td><span class='text-primary'>Under Construction</span></td></tr>";
            }

            ltrApplyJob.Text += "<tr><td><span style = 'color:#000000;' > Address:</span>  </td>";
            ltrApplyJob.Text += "<td><span class='text-primary'>"+ dt.Rows[0]["Address"].ToString() + "</span></td></tr> </table></div>";            
                            

            ltrApplyJob.Text += "<div class='text-right'><a href = ''  class='nav-link text-primary'>Back</a></div></div></div></div></div>";
            
         
            hdfUserID.Value = dt.Rows[0]["UserID"].ToString();


            if (Session["partyid"] != null)
            {
                hdfUserID.Value = Session["partyid"].ToString();

                SqlCommand cmd = new SqlCommand("INSERT INTO [JobApply] ([RequestID],[UserID],[JobID],[CreateOn]) VALUES(@RequestID,@UserID,@JobID,@CreateOn) select SCOPE_IDENTITY();");
                cmd.Parameters.AddWithValue("@RequestID", hdfUserID.Value);//Job apple user ID
                cmd.Parameters.AddWithValue("@UserID", hdfUserID.Value);//job Post ID for Employee
                cmd.Parameters.AddWithValue("@JobID", hdfjobid.Value);//Job ID
                cmd.Parameters.AddWithValue("@CreateOn", DateTime.Now);
                string var = DataAccess.InsertExecuteScalar(cmd);
             
                alert.Visible = true;
                lblMSG.Text = "You are successfully Applied for the post of <strong>" + dt.Rows[0]["job_Title"].ToString() + "</strong>";
                hdfjobid.Value = string.Empty;
                hdfUserID.Value = string.Empty;
                hdfUserID.Value = string.Empty;
            }

        }

       

    }

    }
