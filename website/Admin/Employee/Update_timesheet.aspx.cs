using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Employee_Update_timesheet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            if (Request.QueryString["EID"] != null)
            {

                Hdf_eid.Value = Request.QueryString["EID"].ToString();

                BindField();



            }

        }
    }


    public void BindField()
    {


        DataTable dt = DataAccess.GetData("select * from TimeSheet where Emp_id=" + Hdf_eid.Value + "");

        if (dt.Rows.Count > 0)
        {
            TxtEntryDate.Text = dt.Rows[0]["Entry_date"].ToString();
            TxtEntryTime.Text = dt.Rows[0]["Entry_time"].ToString();
            txtWorkDescription.Text = dt.Rows[0]["Work_description"].ToString();
            TxtExitDate.Text = dt.Rows[0]["Exit_date"].ToString();
            TxtExitTime.Text = dt.Rows[0]["Exit_time"].ToString();





        }


    }


    protected void update_Click(object sender, EventArgs e)
    {



        SqlCommand cmd = new SqlCommand("update[TimeSheet] set[Entry_date]=@Entry_date,[Entry_time]=@Entry_time,[Work_description]=@Work_description,[Exit_date]=@Exit_date,[Exit_time]=@Exit_time where Emp_id=" + Hdf_eid.Value + "");

        cmd.Parameters.AddWithValue("@Entry_date", TxtEntryDate.Text);
        cmd.Parameters.AddWithValue("@Entry_time", TxtEntryTime.Text);
        cmd.Parameters.AddWithValue("@Work_description", txtWorkDescription.Text);
        cmd.Parameters.AddWithValue("@Exit_date", TxtExitDate.Text);
        cmd.Parameters.AddWithValue("@Exit_time", TxtEntryDate.Text);

        DataAccess.InsertExecuteNonQuery(cmd);


      



    }

}