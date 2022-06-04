using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_adminjb_set_job_order : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {


            if (Request.QueryString["jid"]!= null)
            {
                hdfJobId.Value = Request.QueryString["jid"].ToString();

                setpostionOrder();
            }

        }
    }

    public void setpostionOrder()
    {

        string strpost = string.Empty;     

        foreach (ListItem list in rblPosition.Items)
        {          
            string strjoborder = string.Empty;
            DataTable dt = DataAccess.GetData("Select [OrderPosition],[job_Id],[PositionFromDate],[PositionToDate] from [Job_Master] where OrderPosition='" + list.Value + "'");
            if (dt.Rows.Count > 0)
            {
                if(dt.Rows[0]["job_Id"].ToString()==hdfJobId.Value)
                {
                    list.Selected = true;
                }
                if (dt.Rows[0]["job_Id"].ToString() != hdfJobId.Value)
                {
                    list.Enabled = false;
                }

                if (dt.Rows[0]["PositionFromDate"].ToString() != string.Empty)
                {
                    txtPositionFromDate.Text = Convert.ToDateTime(dt.Rows[0]["PositionFromDate"]).ToString("dd-MM-yyyy");
                }


                if (dt.Rows[0]["PositionToDate"].ToString() != string.Empty)
                {
                    txtToDate.Text = Convert.ToDateTime(dt.Rows[0]["PositionToDate"]).ToString("dd-MM-yyyy");
                }

            }
        }





    }
 

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (hdfJobId.Value != null)
        {
            SqlCommand cmd = new SqlCommand("Update [Job_Master] Set [OrderPosition]=@OrderPosition,[PositionFromDate]=@PositionFromDate ,[PositionToDate]=@PositionToDate Where [job_Id] =" + hdfJobId.Value + " ");
            cmd.Parameters.AddWithValue("@OrderPosition", rblPosition.SelectedValue);

            if (txtPositionFromDate.Text != string.Empty)
            {
                cmd.Parameters.AddWithValue("@PositionFromDate", txtPositionFromDate.Text.ToDateFormat());
            }

            else
            {             
                cmd.Parameters.AddWithValue("@PositionFromDate", DBNull.Value);
            }

            if (txtToDate.Text != string.Empty)
            {

                cmd.Parameters.AddWithValue("@PositionToDate", txtToDate.Text.ToDateFormat());
            }

            else
            {

                cmd.Parameters.AddWithValue("@PositionToDate", DBNull.Value);

            }
          
        
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMSG.Text = "Job Postion Set Successfully!";
            clearField();
        }

        }

    public void clearField()
    {
        txtPositionFromDate.Text = string.Empty;
        txtToDate.Text = string.Empty;
    }

 
}