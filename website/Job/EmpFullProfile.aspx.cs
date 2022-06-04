using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
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
            //bind_CounterView();
        }
    }


    public void bind_CounterView()
    {

        //DataTable dtcount = DataAccess.GetData("Select [View_Counter] from [View_FindJob] Where[job_Id]=212 ");
        //if (dtcount.Rows.Count > 0)
        //{
        //    lblCounter.Text = dtcount.Rows[0]["View_Counter"].ToString();
        //}
    }
    public void Bind_EmployeeProfile()
    {


        dt = DataAccess.GetData("Select * from [View_PartyMaster_new] where [PartyID]=" + hdfpid.Value + " and UserTypeID =3 ");


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

}