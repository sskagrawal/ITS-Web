using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Admin_User_SetUserPoistion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {


            if (Request.QueryString["jsid"] != null)
            {
                hdfJobsekerId.Value = Request.QueryString["jsid"].ToString();

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
            DataTable dt = DataAccess.GetData("Select [JobSeekerOrderPosition],[PartyID],[PositionFromDate],[PositionToDate] from [PartyMaster] where [JobSeekerOrderPosition]='" + list.Value + "'");
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["PartyID"].ToString() == hdfJobsekerId.Value)
                {
                    list.Selected = true;
                }
                if (dt.Rows[0]["PartyID"].ToString() != hdfJobsekerId.Value)
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
        if (hdfJobsekerId.Value != null)
        {
            SqlCommand cmd = new SqlCommand("Update [PartyMaster] Set [JobSeekerOrderPosition]=@JobSeekerOrderPosition,[PositionFromDate]=@PositionFromDate ,[PositionToDate]=@PositionToDate Where [PartyID] =" + hdfJobsekerId.Value + " ");
            cmd.Parameters.AddWithValue("@JobSeekerOrderPosition", rblPosition.SelectedValue);

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
            lblMSG.Text = "Job Seeker Postion Set Successfully!";
            clearField();


            

}

    }

    public void clearField()
    {
        txtPositionFromDate.Text = string.Empty;
        txtToDate.Text = string.Empty;
    }
}