using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
public partial class Client_Panel_Post_Job_List : System.Web.UI.Page
{

    public DataTable dt;
    public DataTable dt2;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind_PostJob_List();
        }
    }

    public void bind_PostJob_List()
    {

        dt = DataAccess.GetData("Select * from [View_FindJob] Where JobCategory !='JobSheeker' and [Exp] IS NOT NULL and [MimiSalery] IS NOT NULL and [job_Qulalification]IS NOT NULL order by CreatedOn desc ");
        if (dt.Rows.Count > 0)
        {
            
        }

    }  

    public DataTable BindJobSkill(string job_Id)
    {
        DataTable dtskill = DataAccess.GetData("Select top 4 [Skill_Name] from [View_Post_Job_Skill] Where [job_Id]=" + job_Id + " ");
        return dtskill;

    }
}