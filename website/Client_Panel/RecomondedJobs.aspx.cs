using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Client_Panel_RecomondedJobs : System.Web.UI.Page
{
    public DataTable dt;
    public DataTable dt2;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["partyid"] != null)
            {
                hdfUserID.Value = Session["partyid"].ToString();
                bind_PostJob_List();

            }

            else
            {
                Response.Redirect("~/default.aspx");
            }
            
        }
    }
    public void bind_PostJob_List()
    {
        string partySkill = string.Empty;
        DataTable dtSkills = DataAccess.GetData("select * from [Post_JobSkill] where [PartyID]=" + hdfUserID.Value + "");
        if(dtSkills.Rows.Count>0)
        {
            string comC = string.Empty;
            foreach(DataRow dr in dtSkills.Rows)
            {
                partySkill += comC+ dr["Skill_id"].ToString();
                comC = ",";
            }
        }
        string jobId = string.Empty;
        if(partySkill !=string.Empty)
        {
            DataTable dtJobs = DataAccess.GetData("select * from [Post_JobSkill] where [Skill_id] in (" + partySkill + ") and job_Id is not NULL ");
            if(dtJobs.Rows.Count>0)
            {
                string cmCnt = string.Empty;
                foreach(DataRow dr in dtJobs.Rows)
                {
                    jobId += cmCnt + dr["job_Id"].ToString();
                    cmCnt = ",";
                }
            }
        }
        if(jobId!=string.Empty)
        {
            dt = DataAccess.GetData("Select * from [View_FindJob] Where job_Id in ("+jobId+") order by CreatedOn desc ");
            if (dt.Rows.Count > 0)
            {

            }
        }
        

    }

    public DataTable BindJobSkill(string job_Id)
    {
        DataTable dtskill = DataAccess.GetData("Select distinct [Skill_Name] from [View_Post_Job_Skill] Where [job_Id]=" + job_Id + " ");
        return dtskill;

    }
}