using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_User_TimesheetList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["sridd"] != null)
            {
                hdfUserId.Value = Session["sridd"].ToString();
                BindGridVIew();
            }
            else
            {
                Response.Redirect("~/Admin/Login.aspx");
            }

        }

    }
    public void BindGridVIew()
    {


        DataTable dt = DataAccess.GetData("Select * from View_StaffTimesheet");

        if (dt.Rows.Count > 0)
        {
            grvEmp.DataSource = dt;
            grvEmp.DataBind();



        }

    }

    protected void edit_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;

        GridViewRow grdRow = (GridViewRow)btn.NamingContainer;

        string emp_id = (((HiddenField)(grdRow.FindControl("hdf_edit"))).Value).ToString();


        Response.Redirect("Timesheet.aspx?EID=" + emp_id);


    }



    protected void delete_Click(object sender, EventArgs e)
    {



        Button btn = sender as Button;

        GridViewRow grdRow = (GridViewRow)btn.NamingContainer;

        string delete_id = (((HiddenField)(grdRow.FindControl("hdf_delete"))).Value).ToString();



        SqlCommand cmd = new SqlCommand("Delete from [TimeSheet] where [Emp_id]=" + delete_id + "");
        DataAccess.InsertExecuteNonQuery(cmd);

        BindGridVIew();
    }
}