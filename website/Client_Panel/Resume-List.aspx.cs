using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
public partial class Client_Panel_Resume_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["partyid"] != null)
            {
                hdfUserID.Value = Session["partyid"].ToString();
                bindResumeist();

            }
        }
    }

    public void bindResumeist()
    {       
        DataTable dt = DataAccess.GetData("Select * from [Job_Master] Where [UserID] =" + hdfUserID.Value + " ");
        if (dt.Rows.Count > 0)
        {
            grdView.DataSource = dt;
            grdView.DataBind();
        }
    }

    protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hdfpartyid = (HiddenField)e.Row.FindControl("hdfID");
            Literal ltrCv = (Literal)e.Row.FindControl("ltrCV");

            DataTable dt = DataAccess.GetData("Select * from [CVProfile] Where [UserID]=" + hdfpartyid.Value + " ");
            if (dt.Rows.Count > 0)
            {

                ltrCv.Text = "<a href='../../CV/" + dt.Rows[0]["CvName"].ToString() + "' target='_blank'>download</a>";
                   //<a href = "../../CV/<%#Eval("CvName")%>" target = "_blank" > Download </ a >
            }


        }
    }
}