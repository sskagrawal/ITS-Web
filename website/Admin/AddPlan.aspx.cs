using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_AddPoint : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindUserType();
            BindPlan();
        }
    }

    private void BindUserType()
    {
        drdUserType.Items.Clear();
        ListItem item1 = new ListItem();
        item1.Value = "";
        item1.Text = "--Select Plan--";
        drdUserType.Items.Add(item1);
        DataTable dt = DataAccess.GetData("Select * from UserType where ID NOT IN (1,4,5) ");
        if (dt.Rows.Count > 0 && dt != null)
        {
            ListItem item = new ListItem();
            item.Text = "--Select--";
            item.Value = "0";
            foreach (DataRow dr in dt.Rows)
            {
                ListItem Item1 = new ListItem();
                Item1.Value = dr["ID"].ToString();
                Item1.Text = dr["UserTypeName"].ToString();
                drdUserType.Items.Add(Item1);
            }
        }
    }

    private void BindPlan()
    {
        DataTable dt = DataAccess.GetData("Select * from View_PlanMst");
        if (dt.Rows.Count > 0 && dt != null)
        {
            grdView.DataSource = dt;
            grdView.DataBind();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (hdfID.Value == string.Empty)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [PlanMaster] ([PlanName],[UserType],[PlanPoint],[PlanAmount],[CreateOn]) VALUES(@PlanName,@UserType,@PlanPoint,@PlanAmount,@CreateOn)");
            cmd.Parameters.AddWithValue("@PlanName", txtPlanName.Text);
            cmd.Parameters.AddWithValue("@PlanPoint", txtPoint.Text);
            cmd.Parameters.AddWithValue("@PlanAmount", txtAmount.Text);
            cmd.Parameters.AddWithValue("@CreateOn", DateTime.Now);
            cmd.Parameters.AddWithValue("@UserType",drdUserType.SelectedValue);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Your record saved successfully";
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [PlanMaster] SET [PlanName] = @PlanName,[PlanPoint] = @PlanPoint,[PlanAmount] = @PlanAmount,[UserType]=@UserType WHERE ID='" + hdfID.Value + "'");
            cmd.Parameters.AddWithValue("@PlanName", txtPlanName.Text);
            cmd.Parameters.AddWithValue("@PlanPoint", txtPoint.Text);
            cmd.Parameters.AddWithValue("@PlanAmount", txtAmount.Text);
            cmd.Parameters.AddWithValue("@UserType", drdUserType.SelectedValue);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Your record update successfully";
        }
        Clr();
        BindPlan();
    }

    private void Clr()
    {
        txtAmount.Text = string.Empty;
        txtPlanName.Text = string.Empty;
        txtPoint.Text = string.Empty;
        hdfID.Value = string.Empty;
        btnSubmit.Text = "Submit";
    }
    protected void Edit(object sender, ImageClickEventArgs e)
    {
        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;

        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfID")).Value);
        hdfID.Value = Convert.ToString(ID);
        if (btndetails.ID.Equals("imgbtnUpdate"))
        {
            //Response.Redirect("~/Admin/Upload_job.aspx?PID=" + ID);
            DataTable dt = DataAccess.GetData("select * FROM [PlanMaster]  WHERE  [ID] =" + ID + "");
            if (dt.Rows.Count > 0 && dt != null)
            {
                txtAmount.Text = dt.Rows[0]["PlanAmount"].ToString();
                txtPlanName.Text = dt.Rows[0]["PlanName"].ToString();
                txtPoint.Text = dt.Rows[0]["PlanPoint"].ToString();
                btnSubmit.Text = "Update";
            }

        }
        else if (btndetails.ID.Equals("imgbtnDelete"))
        {

            SqlCommand cmd = new SqlCommand("DELETE FROM [PlanMaster]  WHERE  [ID] =" + ID + "");
            DataAccess.InsertExecuteNonQuery(cmd);


        }
        BindPlan();
        
    }
}