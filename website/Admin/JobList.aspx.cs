using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Upload_Job_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_Job_grdView();
        }
    }

    private void Bind_Job_grdView()
    {
        string Query = string.Empty;
        Query = "select * from [View_CVProfile] ";
        string whereConcatenator = " WHERE ";

       
        if (txtFromdate.Text != string.Empty)
        {
            Query += whereConcatenator;
            Query += " cast(CrearteOn as date) >='" + txtFromdate.Text.Trim() + "'";
            whereConcatenator = "and ";
        }
        if (txtTodate.Text != string.Empty)
        {
            Query += whereConcatenator;
            Query += "cast(CrearteOn as date) <='" + txtTodate.Text.Trim() + "'";
            whereConcatenator = "and ";
        }
        if (drdSeacrchTP.SelectedValue == "1")
        {
            Query += whereConcatenator;
            Query += "Name like '" + txtSearchValue.Text.Trim() + "%'";
            whereConcatenator = "and ";
        }
        if (drdSeacrchTP.SelectedValue == "2")
        {
            Query += whereConcatenator;
            Query += "MobileNo ='" + txtSearchValue.Text.Trim() + "%'";
            whereConcatenator = "and ";
        }

        Query += "order by CrearteOn desc";
       // DataTable dt = DataAccess.GetData("select * from [CVProfile]");
        DataTable dt = DataAccess.GetData(Query);
        if (dt.Rows.Count > 0 && dt != null)
        {
            grdView.DataSource = dt;
            grdView.DataBind();
        }
    }

    protected void Edit(object sender, ImageClickEventArgs e)
    {
        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;

        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfID")).Value);

        if (btndetails.ID.Equals("imgbtnUpdate"))
        {
            Response.Redirect("~/Admin/Upload_job.aspx?PID=" + ID);

        }

        else if (btndetails.ID.Equals("imgbtnDelete"))
        {

            SqlCommand cmd = new SqlCommand("DELETE FROM [CVProfile]  WHERE  [CVID] =" + ID + "");
            DataAccess.InsertExecuteNonQuery(cmd);


        }
        Bind_Job_grdView();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Bind_Job_grdView();
    }
}