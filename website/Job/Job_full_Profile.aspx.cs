using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
using System.Text;

public partial class Job_Job_full_Profile : System.Web.UI.Page
{
    public DataTable dt;
    public DataTable dt2;
    public string str1 = string.Empty;
    public string jobSkills = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Request.QueryString.Get("id") != null)
            {
                hdfjobid.Value = Convert.ToString(Request.QueryString.Get("id"));
                Bind_SingleJob();
                bind_CounterView();
            }
            
        }
    }

    public void bind_CounterView()
    {

        DataTable dtcount = DataAccess.GetData("Select [View_Counter] from [View_FindJob] Where[job_Id]=" + hdfjobid.Value + " ");
        if (dtcount.Rows.Count > 0)
        {
            lblCounter.Text = dtcount.Rows[0]["View_Counter"].ToString();
        }
    }



    public void Bind_SingleJob()
    {
        dt = DataAccess.GetData("select * from [View_FindJob] Where JobCategory !='JobSheeker' and [job_Id]=" + hdfjobid.Value + " and Exp IS NOT NULL and MimiSalery IS NOT NULL and job_Qulalification IS NOT NULL order by [CreatedOn] desc ");
       if(dt.Rows.Count>0)
        {
            this.Page.Title = dt.Rows[0]["job_Title"].ToString();
            

            string jobDesc = dt.Rows[0]["job_Desc"].ToString();
            int headingLength1 = jobDesc.Length;
            if (headingLength1 > 150)
            {
                string str1 = jobDesc.Substring(0, 150);
                jobDesc = str1 + "  ..... ";

            }
            
                lblDesc.Text = jobDesc;

            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("<script type=\"application/ld+json\">");
            sb.AppendFormat("{{");
            sb.AppendFormat("\"@context\"" + ":" + "\"https://schema.org\"");
            sb.AppendFormat(",");
            sb.AppendFormat("\"@type\"" + ":" + "\"JobPosting\"");
            sb.AppendFormat(",");
            sb.AppendFormat("\"title\"" + ":" + "\"" + dt.Rows[0]["job_Title"].ToString() + "\"");
            sb.AppendFormat(",");
            sb.AppendFormat("\"description\"" + ":" + "\"" + jobDesc + "\"");
            sb.AppendFormat(",");
            sb.AppendFormat("\"hiringOrganization\"" + ":" + "{{");
            sb.AppendFormat("\"@type\"" + ":" + "\"Organization\"");
            sb.AppendFormat(",");
            sb.AppendFormat("\"@name\"" + ":" + "\""+ dt.Rows[0]["Contact_person_name"].ToString() + "\"");
            sb.AppendFormat(",");
            sb.AppendFormat("\"@sameAs\"" + ":" + "\""+ HttpContext.Current.Request.Url.AbsoluteUri + "\"");

            sb.AppendFormat("}},");
            sb.AppendFormat("\"industry\"" + ":" + "\""+ dt.Rows[0]["Industry"].ToString() + "\"");
            sb.AppendFormat(",");
            sb.AppendFormat("\"employmentType\"" + ":" + "\""+ dt.Rows[0]["JobType"].ToString() + "\"");
            sb.AppendFormat(",");
            sb.AppendFormat("\"datePosted\"" + ":" + "\""+ dt.Rows[0]["jobopen_Date"].ToString() + "\"");
            sb.AppendFormat(",");
            sb.AppendFormat("\"jobLocation\"" + ":" + "{{");

            sb.AppendFormat("\"@type\"" + ":" + "\"Place\"");
            sb.AppendFormat(",");
            sb.AppendFormat("\"address\"" + ":" + "{{");
            sb.AppendFormat("\"@type\"" + ":" + "\"PostalAddress\"");
            sb.AppendFormat(",");
            sb.AppendFormat("\"addressLocality\"" + ":" + "\""+ dt.Rows[0]["CityID"].ToString() + "\"");
            sb.AppendFormat("}}");
            sb.AppendFormat("}},");
            sb.AppendFormat("\"baseSalary\"" + ":" + "{{");
            sb.AppendFormat("\"@type\"" + ":" + "\"MonetaryAmount\"");
            sb.AppendFormat(",");
            sb.AppendFormat("\"currency\"" + ":" + "\"INR\"");
            sb.AppendFormat(",");
            sb.AppendFormat("\"value\"" + ":" + "{{");
            sb.AppendFormat("\"@type\"" + ":" + "\"QuantitativeValue\"");
            sb.AppendFormat(",");
            sb.AppendFormat("\"minValue\"" + ":" + "\""+ dt.Rows[0]["MimiSalery"].ToString() + "\"");
            sb.AppendFormat(",");
            //sb.AppendFormat("\"maxValue\"" + ":" + "\"8000\"");
           // sb.AppendFormat(",");
            sb.AppendFormat("\"unitText\"" + ":" + "\""+ dt.Rows[0]["Time_Unit"].ToString() + "\"");
            sb.AppendFormat("}}");
            sb.AppendFormat("}},");

            DataTable dt3 = BindJobSkill(dt.Rows[0]["job_Id"].ToString());

            if (dt3 != null && dt3.Rows.Count > 0)
            {
                string tmp = "";
                 for (int k = 0; k < dt3.Rows.Count; k = k + 1)
                {
                    jobSkills +=tmp+ dt3.Rows[k]["Skill_Name"].ToString();

                    tmp = ",";


                    
 


                              }
 
                        }

            sb.AppendFormat("\"skills\"" + ":" + "\""+jobSkills+"\"");
            sb.AppendFormat(",");
            sb.AppendFormat("\"qualifications\"" + ":" + "\""+ dt.Rows[0]["job_Qulalification"].ToString() + "\"");
            sb.AppendFormat(",");
            sb.AppendFormat("\"experienceRequirements\"" + ":" + "\""+ dt.Rows[0]["Exp"].ToString() + "\"");
            //sb.AppendFormat("}}");

            sb.AppendFormat("}}");
            sb.AppendFormat("</script>");
            Page.Header.Controls.Add(new LiteralControl(sb.ToString()));

            //this.Page.MetaDescription = jobDesc;

            hdfPostedOn.Value = dt.Rows[0]["jobopen_Date"].ToString();

      if (hdfPostedOn.Value != string.Empty)
        {
            DateTime dthdfOpDate = Convert.ToDateTime(hdfPostedOn.Value);
            DateTime dtcurrentD = DateTime.Now;
            TimeSpan t = dtcurrentD - dthdfOpDate;
            double CurDay = t.TotalDays;
            int var = Convert.ToInt32(CurDay);
            string DayAgo = string.Empty;
            if (var < 7)
            {
                DayAgo = Convert.ToString(var + " Day(s) ago");
            }
            else if (var >= 7 && var < 30)
            {
                int noWeek = var / 7;
                int noday = var % 7;
                if (noday > 0)
                {
                    DayAgo = noWeek + " Week and " + noday + " Day(s) ago";
                }
                else
                {
                    DayAgo = noWeek + " Week ago";//Convert.ToString(var+" Days");
                }
            }
            else if (var >= 30)
            {
                int noWeek = var / 30;
                int noday = var % 30;
                if (noday > 0)
                {
                    if (noday >= 7)
                    {
                        int noWeek1 = noday / 7;
                        int noday1 = noday % 7;
                        if (noday1 > 0)
                        {
                            DayAgo = noWeek + " Month, " + noWeek1 + " Week and " + noday1 + " Day(s) ago";
                        }
                        else
                        {
                            DayAgo = noWeek1 + " Week ago";//Convert.ToString(var+" Days");
                        }
                    }
                    else
                    {
                        DayAgo = noWeek + " Month and " + noday + " Day(s) ago";
                    }
                }
                else
                {
                    DayAgo = noWeek + " Month ago";//Convert.ToString(var+" Days");
                }
            }
            lblPostDay.Text = DayAgo;
        }




        }
    }


    public DataTable BindJobSkill(string job_Id)
    {

        DataTable dtskill = DataAccess.GetData("Select distinct [Skill_Name] from [View_Post_Job_Skill] Where [job_Id]=" + job_Id + " ");
        return dtskill;

    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //string t = prtId;
        Response.Redirect(GenerateURL(hdfJTtle.Value, Convert.ToInt32(hdfjobid.Value)));
    }

    public static string GenerateURL(string title, int Id)
    {
        string strTitle = title.Trim();
        strTitle = strTitle.ToLower();
        strTitle = strTitle.Replace("c#", "C-Sharp");
        strTitle = strTitle.Replace(" ", "-");
        strTitle = strTitle.Trim();
        strTitle = strTitle.Trim('-');
        strTitle = "/Job/" + strTitle + "-" + Id.ToString() + ".aspx";

        return strTitle;
    }


}