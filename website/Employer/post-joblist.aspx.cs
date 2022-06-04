using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class PostJobList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["sridd"] != null)
            {
                hdfUserID.Value = Session["sridd"].ToString();
                Bind_Job_grdView();
            }
            else
            {
                Response.Redirect("~/default.aspx");
            }
        }
    }
    private void Bind_Job_grdView()
    {
        DataTable dt = DataAccess.GetData("select * from [Job_Master] where UserID="+hdfUserID.Value+"");
        if (dt.Rows.Count > 0 && dt != null)
        {
            grdView.DataSource = dt;
            grdView.DataBind();
        }
    }
    protected void Edit_click(object sender, EventArgs e)    
    {
        //ImageButton btndetails = sender as ImageButton;
        LinkButton btndetails = sender as LinkButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;

        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfID")).Value);

        if (btndetails.ID.Equals("lnkEdit"))
        {
            Response.Redirect("~/job-post.aspx?PID=" + ID);

        }






        //else if (btndetails.ID.Equals("imgbtnDelete"))
        //{

        //    SqlCommand cmd = new SqlCommand("DELETE FROM [Job_Master]  WHERE  [job_Id] =" + ID + "");
        //    DataAccess.InsertExecuteNonQuery(cmd);


        //}
        Bind_Job_grdView();
    }
}