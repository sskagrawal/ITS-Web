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
using System.Web.Services;

public partial class Job_EmpFullProfile : System.Web.UI.Page
{
    public DataTable dt;
    public DataTable dt2;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Request.QueryString["pId"] != null)
            {
                hdfpid.Value = Convert.ToString(Request.QueryString["pId"]);
                Bind_EmployeeProfile();              

            }

            BindJobListbyCity();
            BindJobByRoll();
            BindJobByIndustry();
            BindJobBySkill();

        }
    }  
    public void Bind_EmployeeProfile()
    {
        dt = DataAccess.GetData("Select * from [View_PartyMaster_new] where [PartyID]=" + hdfpid.Value + " and UserTypeID =3 ");
        this.Page.Title = dt.Rows[0]["job_Title"].ToString();

        StringBuilder sb = new StringBuilder();
        sb.AppendFormat("<script type=\"application/ld+json\">");
        sb.AppendFormat("{{");
        sb.AppendFormat("\"@context\"" + ":" + "\"https://schema.org\"");
        sb.AppendFormat(",");
        sb.AppendFormat("\"@type\"" + ":" + "\"Person\"");
        sb.AppendFormat(",");
        sb.AppendFormat("\"name\"" + ":" + "\"" + dt.Rows[0]["Contact_person_name"].ToString() + "\"");
        sb.AppendFormat(",");
        sb.AppendFormat("\"@sameAs\"" + ":" + "\"" + HttpContext.Current.Request.Url.AbsoluteUri + "\"");
        sb.AppendFormat(",");
        sb.AppendFormat("\"jobTitle\"" + ":" + "\"" + dt.Rows[0]["job_Title"].ToString() + "\"");
       
        sb.AppendFormat("}}");
        sb.AppendFormat("</script>");
        Page.Header.Controls.Add(new LiteralControl(sb.ToString()));

    }

    public DataTable bind_ProfilePhoto(string PartyId)
    {

        DataTable dtphoto = DataAccess.GetData("Select * from [PartyDocument_Master] Where [PartyID]=" + PartyId + " and Document_Name='Profile Photo' ");
        return dtphoto;

    }


    public DataTable BindJobSkill(string PartyId)
    {

        DataTable dtskill = DataAccess.GetData("Select top 4 [Skill_Name] from [View_Post_Job_Skill] Where [PartyID]=" + PartyId + " ");
        return dtskill;

    }

    public DataTable BindProjectFile(string PartyId)
    {

        DataTable dtpf = DataAccess.GetData("Select * from [Party_Project_Master]  Where [PartyID]=" + PartyId + " ");
        return dtpf;

    }

    public DataTable BindKeyword(string PartyId)
    {

        DataTable dtky = DataAccess.GetData("Select [Keyword] from [View_Job_Keyword_Master]  Where [PartyID]=" + PartyId + " ");
        return dtky;

    }


    public void BindJobListbyCity()
    {

        DataTable dtcity = DataAccess.GetData("Select Distinct [City] from [View_PartyMaster_new] Where Party_Type='3' ");
        if (dtcity.Rows.Count > 0)
        {

            foreach (DataRow row in dtcity.Rows)
            {
                ltrCityName.Text += "<a href='" + row["City"].ToString() + "' title='jobs in " + row["City"].ToString() + "'>" + row["City"].ToString() + "</a>";

            }
        }
    }

    public void BindJobByRoll()
    {

        DataTable dtrl = DataAccess.GetData("Select Distinct [JobSubCateName] from [View_PartyMaster_new] Where Party_Type='3' ");
        if (dtrl.Rows.Count > 0)
        {

            foreach (DataRow row in dtrl.Rows)
            {
                ltrRoll.Text += "<a href='" + row["JobSubCateName"].ToString() + "' title='" + row["JobSubCateName"].ToString() + " jobs in gwalior'>" + row["JobSubCateName"].ToString() + "</a>";

            }
        }

    }

    public void BindJobByIndustry()
    {

        DataTable dtind = DataAccess.GetData("Select Distinct [Comp_Category] from [View_PartyMaster_new] Where Party_Type='3' ");
        if (dtind.Rows.Count > 0)
        {

            foreach (DataRow row in dtind.Rows)
            {
                ltrJobByIndustry.Text += "<a href='" + row["Comp_Category"].ToString() + "' title='" + row["Comp_Category"].ToString() + " jobs in gwalior'>" + row["Comp_Category"].ToString() + "</a>";

            }
        }

    }

    //ltrjobbyskill

    public void BindJobBySkill()
    {

        DataTable dtsk = DataAccess.GetData("Select distinct  [Skill_Name] from [View_Post_Job_Skill] where PartyID is not NULL ");
        if (dtsk.Rows.Count > 0)
        {           

            if (dtsk.Rows.Count > 8)
            {
                for (int i = 0; i < 8; i = i + 1)
                {

                    ltrjobbyskill.Text += "<a href='" + dtsk.Rows[i]["Skill_Name"].ToString() + "' title='" + dtsk.Rows[i]["Skill_Name"].ToString() + " jobs in gwalior'>" + dtsk.Rows[i]["Skill_Name"].ToString() + "</a>";

                }
                if (dtsk.Rows.Count > 16)
                {
                    for (int i = 8; i < 16; i = i + 1)
                    {

                        ltrjobbyskill1.Text += "<a href='" + dtsk.Rows[i]["Skill_Name"].ToString() + "' title='" + dtsk.Rows[i]["Skill_Name"].ToString() + " jobs in gwalior'>" + dtsk.Rows[i]["Skill_Name"].ToString() + "</a>";

                    }
                    if (dtsk.Rows.Count > 24)
                    {
                        for (int i = 16; i < 24; i = i + 1)
                        {

                            ltrjobbyskill2.Text += "<a href='" + dtsk.Rows[i]["Skill_Name"].ToString() + "' title='" + dtsk.Rows[i]["Skill_Name"].ToString() + " jobs in gwalior'>" + dtsk.Rows[i]["Skill_Name"].ToString() + "</a>";

                        }
                    }
                    else
                    {
                        for (int i = 16; i < dtsk.Rows.Count; i = i + 1)
                        {

                            ltrjobbyskill.Text += "<a href='" + dtsk.Rows[i]["Skill_Name"].ToString() + "' title='" + dtsk.Rows[i]["Skill_Name"].ToString() + " jobs in gwalior'>" + dtsk.Rows[i]["Skill_Name"].ToString() + "</a>";

                        }
                    }
                }
                else
                {
                    for (int i = 8; i < dtsk.Rows.Count; i = i + 1)
                    {

                        ltrjobbyskill.Text += "<a href='" + dtsk.Rows[i]["Skill_Name"].ToString() + "' title='" + dtsk.Rows[i]["Skill_Name"].ToString() + " jobs in gwalior'>" + dtsk.Rows[i]["Skill_Name"].ToString() + "</a>";

                    }
                }



            }
            else

            {
                for (int i = 0; i < dtsk.Rows.Count; i = i + 1)
                {

                    ltrjobbyskill.Text += "<a href='" + dtsk.Rows[i]["Skill_Name"].ToString() + "' title='" + dtsk.Rows[i]["Skill_Name"].ToString() + " jobs in gwalior'>" + dtsk.Rows[i]["Skill_Name"].ToString() + "</a>";

                }
            }

        }

        

     }

    [WebMethod]
    public static void SaveCalltoAction(string mno,string prtid)
    {
        SqlCommand cmd = new SqlCommand("INSERT INTO [HireEmployeeCalltoAction]([PartyId],[MobileNo],[AddedOn]values(@PartyId,@MobileNo,@AddedOn))");
        cmd.Parameters.AddWithValue("@PartyId",prtid);
        cmd.Parameters.AddWithValue("@MobileNo",mno);
        cmd.Parameters.AddWithValue("@AddedOn",DateTime.Now);
        DataAccess.InsertExecuteNonQuery(cmd);
    }
}