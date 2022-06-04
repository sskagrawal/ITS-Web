using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Job_hire_employees : System.Web.UI.Page
{
    public DataTable dt;
    public DataTable dt2;
    public string prtId = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["sridd"] != null)
            {
                hdfUserID.Value = Session["sridd"].ToString();
            }
            bindJobSheekarCvList();
            //BindIndustry();
            //BindExperience();
            //BindQualification();

        }
    }

    public void bindJobSheekarCvList()
    {

        dt = DataAccess.GetData("Select * from [View_PartyMaster_new] where job_Title !='' and [UserTypeID] =3 order by [JobSeekerOrderPosition] asc ");

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

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //string t = prtId;
        Response.Redirect(GenerateURL(hdfJTtle.Value, Convert.ToInt32(hdfpartyid.Value)));
    }
    public static string GenerateURL(string title, int Id)
    {
        string strTitle = title.Trim();
        strTitle = strTitle.ToLower();
        strTitle = strTitle.Replace("c#", "C-Sharp");
        strTitle = strTitle.Replace(" ", "-");
        strTitle = strTitle.Trim();
        strTitle = strTitle.Trim('-');
        strTitle = "/Jobseeker/" + strTitle + "-" + Id.ToString() + ".aspx";

        return strTitle;
    }

    
}