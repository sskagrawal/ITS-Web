using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Timesheet : System.Web.UI.Page
{
    private int dd;
    private int mm;
    private int yyyy;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (Session["sridd"] != null)
            {
                hdfUserId.Value = Session["sridd"].ToString();
                TxtEntryDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                TxtExitDate.Text = DateTime.Now.ToString("dd/MM/yyyy");

                if (Request.QueryString["EID"] != null)
                {

                    Hdf_eid.Value = Request.QueryString["EID"].ToString();

                    BindField();



                }
            }
            else
            {
                Response.Redirect("~/Admin/Login.aspx");
            }

        }



    }
    public void BindField()
    {


        DataTable dt = DataAccess.GetData("select * from TimeSheet where Emp_id=" + Hdf_eid.Value + "");

        if (dt.Rows.Count > 0)
        {
            TxtEntryDate.Text = Convert.ToDateTime(dt.Rows[0]["Entry_date"]).ToString("DD/MM/YYYY");
            TxtEntryTime.Text = dt.Rows[0]["Entry_time"].ToString();
            txtWorkDescription.Text = dt.Rows[0]["Work_description"].ToString();
            TxtExitDate.Text = Convert.ToDateTime(dt.Rows[0]["Exit_date"]).ToString("DD/MM/YYYY");
            TxtExitTime.Text = dt.Rows[0]["Exit_time"].ToString();
            Buttonsubmit.Text = "Update";




        }


    }



    protected void Buttonsubmit_Click(object sender, EventArgs e)
    {

        if (Hdf_eid.Value == string.Empty)
        {


            SqlCommand cmd = new SqlCommand("Insert into [TimeSheet]([Entry_date],[Entry_time],[Work_description],[Exit_date],[Exit_time],[UserID]) values(@Entry_Date,@Entry_time,@Work_description,@Exit_date,@Exit_time,@UserID)");

            if (TxtEntryDate.Text != string.Empty)
            {
                cmd.Parameters.AddWithValue("@Entry_date", Utilities.GetDate(TxtEntryDate.Text));
            }
            else
            {
                cmd.Parameters.AddWithValue("@Entry_date", DBNull.Value);
            }



            if (TxtExitDate.Text != string.Empty)
            {
                cmd.Parameters.AddWithValue("@Exit_date", Utilities.GetDate(TxtExitDate.Text));
            }
            else
            {
                cmd.Parameters.AddWithValue("@Exit_date", DBNull.Value);
            }

           
            cmd.Parameters.AddWithValue("@Entry_time", TxtEntryTime.Text);
            cmd.Parameters.AddWithValue("@Work_description", txtWorkDescription.Text);
           
            cmd.Parameters.AddWithValue("@Exit_time", TxtExitTime.Text);
            cmd.Parameters.AddWithValue("@UserID", hdfUserId.Value);

            DataAccess.InsertExecuteNonQuery(cmd);

        }


        else
        {

            SqlCommand cmd = new SqlCommand("update[TimeSheet] set[Entry_date]=@Entry_date,[Entry_time]=@Entry_time,[Work_description]=@Work_description,[Exit_date]=@Exit_date,[Exit_time]=@Exit_time where Emp_id=" + Hdf_eid.Value + "");

            cmd.Parameters.AddWithValue("@Entry_date", Convert.ToDateTime(TxtEntryDate.Text).ToString("DD/MM/YYYY"));
            cmd.Parameters.AddWithValue("@Entry_time", TxtEntryTime.Text);
            cmd.Parameters.AddWithValue("@Work_description", txtWorkDescription.Text);
            cmd.Parameters.AddWithValue("@Exit_date", Convert.ToDateTime(TxtExitDate.Text).ToString("DD/MM/YYYY"));
            cmd.Parameters.AddWithValue("@Exit_time", TxtEntryDate.Text);

            DataAccess.InsertExecuteNonQuery(cmd);


        }





    }


   
}