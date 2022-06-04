using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;


public partial class Client_Panel_HireEmployee : System.Web.UI.Page
{
    public DataTable dt;
    public DataTable dt2;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind_Client_JobProfile();         

        }
    }

    public void bind_Client_JobProfile()
    {
        string sqlQr = string.Empty;
        if(Request.QueryString["jid"] !=null)
        {

            sqlQr = "Select * from [View_ProposalParty] Where [Party_Type]='3' and job_Id="+ Request.QueryString["jid"].ToString() + "  ";
        }
        else
        {
            sqlQr = "Select * from [PartyMaster] Where [Party_Type]='3' ";
        }
        dt = DataAccess.GetData(sqlQr);
        lblPrfCount.Text = dt.Rows.Count.ToString();
        if (dt.Rows.Count>0)
       {
           
        }
        
    }


    public DataTable bind_ProfilePhoto(string PartyId)
    {

        DataTable dtphoto = DataAccess.GetData("Select * from [PartyDocument_Master] Where [PartyID]="+ PartyId + " and Document_Name='Profile Photo' ");
        return dtphoto;

    }



    public DataTable BindJobSkill(string PartyId)
    {

        DataTable dtskill = DataAccess.GetData("Select top 4 [Skill_Name] from [View_Post_Job_Skill] Where [PartyID]=" + PartyId + " ");
        return dtskill;

    }

    
}