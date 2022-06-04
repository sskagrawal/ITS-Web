using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

public partial class Admin_AddUserPlan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindUserPlan();
            BindPlan();
            BindUsar();
        }
    }

    private void BindUserPlan()
    {
        DataTable dt = DataAccess.GetData("select * from View_UserPlanDetails");
        if (dt.Rows.Count > 0 && dt != null)
        {
            grdView.DataSource = dt;
            grdView.DataBind();
            int TotalPage = dt.Rows.Count;
            CustPager.TotalRecords = TotalPage;
            CustPager.TotalPage = TotalPage % grdView.PageSize == 0 ? TotalPage / grdView.PageSize : TotalPage / grdView.PageSize + 1;
        }
    }
     protected void CustPager_PageChanged(object sender, CustomPageChangeArgs e)
    {
        grdView.PageSize = e.CurrentPageSize;
        grdView.PageIndex = e.CurrentPageNumber - 1;
        //bindBranchList();
        CustPager.Reload();
        BindUserPlan();
    }

    private void BindUsar()
    {
        drdUser.Items.Clear();
        ListItem item = new ListItem();
        item.Value = "0";
        item.Text = "--Select--";
        drdUser.Items.Add(item);
        DataTable dt = DataAccess.GetData("Select * from UserDetails where UserTypeID != 1");
        if (dt.Rows.Count > 0 && dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem Item1 = new ListItem();
                Item1.Value = dr["ID"].ToString();
                Item1.Text = dr["Name"].ToString();
                drdUser.Items.Add(Item1);
            }
        }
    }

    private void BindPlan()
    {
        drdPlan.Items.Clear();
        ListItem item = new ListItem();
        item.Value = "0";
        item.Text = "--Select--";
        drdPlan.Items.Add(item);
        DataTable dt = DataAccess.GetData("Select * from PlanMaster");
        if (dt.Rows.Count > 0 && dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem Item1 = new ListItem();
                Item1.Value = dr["ID"].ToString();
                Item1.Text = dr["PlanName"].ToString();
                drdPlan.Items.Add(Item1);
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    { 
        DateTime ActiveDate = new DateTime();
        if (txtActvDate.Text != string.Empty)
        {
            ActiveDate = DateTime.ParseExact(txtActvDate.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
        }
         DateTime ExpDate = new DateTime();
        if (txtActvDate.Text != string.Empty)
        {
            ExpDate = DateTime.ParseExact(txtExpiry.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
        }
        if (hdfID.Value == string.Empty)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [UserPlanDetaile]([PlanID],[UserID],[PlanPoint],[PlanActiveDate],[PlanExpDate],[CreateOn],[PlanAmount]) VALUES(@PlanID,@UserID,@PlanPoint,@PlanActiveDate,@PlanExpDate,@CreateOn,@PlanAmount)");
            cmd.Parameters.AddWithValue("@PlanID", drdPlan.SelectedValue);
            cmd.Parameters.AddWithValue("@UserID", drdUser.SelectedValue);
            cmd.Parameters.AddWithValue("@PlanPoint", txtPoint.Text);
            cmd.Parameters.AddWithValue("@PlanAmount", txtAmount.Text);
            cmd.Parameters.AddWithValue("@PlanActiveDate", ActiveDate);
            cmd.Parameters.AddWithValue("@PlanExpDate", ExpDate);
            cmd.Parameters.AddWithValue("@CreateOn", DateTime.Now);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Record Saved Successfully";

            //SqlCommand cmdH = new SqlCommand("INSERT INTO [UserPlanHistory] ([UserID],[TotalPoint],[RemaingPoint],[CreateOn]) VALUES(@UserID,@TotalPoint,@RemaingPoint,@CreateOn)");
            //cmdH.Parameters.AddWithValue("@UserID",drdUser.SelectedValue);
            //cmdH.Parameters.AddWithValue("@TotalPoint",txtPoint.Text);
            //cmdH.Parameters.AddWithValue("@RemaingPoint",txtPoint.Text);
            //cmdH.Parameters.AddWithValue("@CreateOn",DateTime.Now);
            //DataAccess.InsertExecuteNonQuery(cmdH);
        }
        else
        {
            //string UserHpID = string.Empty;
            //try
            //{
            //     UserHpID = DataAccess.GetSingleValue("select ID from UserPlanHistory where UserID="+hdfID.Value+" order by CreateOn DESC");
            //}
            //catch { }
            //if (UserHpID != string.Empty)
            //{
            //    SqlCommand cmdH = new SqlCommand("UPDATE [UserPlanHistory] SET [TotalPoint] = @TotalPoint,[RemaingPoint] = @RemaingPoint WHERE UserID="+hdfID.Value+"");
            //    cmdH.Parameters.AddWithValue("@UserID", drdUser.SelectedValue);
            //    cmdH.Parameters.AddWithValue("@TotalPoint", txtPoint.Text);
            //    cmdH.Parameters.AddWithValue("@RemaingPoint", txtPoint.Text);
            //    DataAccess.InsertExecuteNonQuery(cmdH);
            //}

            SqlCommand cmd = new SqlCommand("UPDATE [UserPlanDetaile] SET [PlanID] = @PlanID,[UserID] = @UserID,[PlanPoint] = @PlanPoint,[PlanAmount] = @PlanAmount,[PlanActiveDate] = @PlanActiveDate,[PlanExpDate] = @PlanExpDate WHERE ID="+hdfID.Value+"");
            cmd.Parameters.AddWithValue("@PlanID", drdPlan.SelectedValue);
            cmd.Parameters.AddWithValue("@UserID", drdUser.SelectedValue);
            cmd.Parameters.AddWithValue("@PlanPoint", txtPoint.Text);
            cmd.Parameters.AddWithValue("@PlanAmount", txtAmount.Text);
            cmd.Parameters.AddWithValue("@PlanActiveDate", ActiveDate);
            cmd.Parameters.AddWithValue("@PlanExpDate", ExpDate);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Record Update Successfully";
        }
        BindUserPlan();
        Clr();
    }

    private void Clr()
    {
        txtActvDate.Text = string.Empty;
        txtAmount.Text = string.Empty;
        txtExpiry.Text = string.Empty;
        txtPoint.Text = string.Empty;
        hdfID.Value = string.Empty;
        drdPlan.ClearSelection();
        drdUser.ClearSelection();
    }
    protected void drdPlan_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable dt = DataAccess.GetData("Select * from PlanMaster where ID='"+drdPlan.SelectedValue+"'");
        if (dt.Rows.Count > 0 && dt != null)
        {
            txtAmount.Text = dt.Rows[0]["PlanAmount"].ToString();
            txtPoint.Text = dt.Rows[0]["PlanPoint"].ToString();
        }
    }
    protected void Edit(object sender, ImageClickEventArgs e)
    {
        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;

        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfID")).Value);
        HiddenField hdfStatus = (HiddenField)grdView.FindControl("hdfStatus");

        if (btndetails.ID.Equals("imgbtnUpdate"))
        {
            hdfID.Value = Convert.ToString(ID);
            //Response.Redirect("~/Admin/Upload_job.aspx?PID=" + ID);
            DataTable dt = DataAccess.GetData("Select * from UserPlanDetaile");
            if (dt.Rows.Count > 0 && dt != null)
            {
                txtActvDate.Text = Convert.ToDateTime(dt.Rows[0]["PlanActiveDate"]).ToString("dd/MM/yyyy");//dt.Rows[0][""].ToString();
                txtAmount.Text = dt.Rows[0]["PlanAmount"].ToString();
                txtExpiry.Text = Convert.ToDateTime(dt.Rows[0]["PlanExpDate"]).ToString("dd/MM/yyyy");//dt.Rows[0][""].ToString();
                txtPoint.Text = dt.Rows[0]["PlanPoint"].ToString();
                BindPlan();
                drdPlan.SelectedValue = dt.Rows[0]["PlanID"].ToString();
                BindUsar();
                drdUser.SelectedValue = dt.Rows[0]["UserID"].ToString();
            }
        }
        else if (btndetails.ID.Equals("imgbtnDelete"))
        {

            SqlCommand cmd = new SqlCommand("DELETE FROM [UserPlanDetaile]  WHERE  [ID] =" + ID + "");
            DataAccess.InsertExecuteNonQuery(cmd);


        }
        else if (btndetails.ID.Equals("imgbtnStatus"))
        {
            if (hdfStatus.Value == "True")
            {
                SqlCommand cmd = new SqlCommand("UPDATE [UserPlanDetaile] SET [Inactive] ='False' WHERE ID=" + ID + "");
                DataAccess.InsertExecuteNonQuery(cmd);
            }
            else
            {
                SqlCommand cmd = new SqlCommand("UPDATE [UserPlanDetaile] SET [Inactive] ='True' WHERE ID=" + ID + "");
                DataAccess.InsertExecuteNonQuery(cmd);
            }
        }
        BindUserPlan();
        CustPager.Reload();
    }
    protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        DataRowView drview = e.Row.DataItem as DataRowView;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hdfStatus = (HiddenField)e.Row.FindControl("hdfStatus");
            Literal ltrStatus = (Literal)e.Row.FindControl("ltrStatus");


            if (hdfStatus.Value == "True")
            {
                ltrStatus.Text = "<div class='status-pill yellow' data-title='Active' data-toggle='tooltip' data-original-title='' title='' style='background-color:#00FF01;'></div>";
            }
            else if (hdfStatus.Value == "False")
            {
                ltrStatus.Text = "<div class='status-pill yellow' data-title='Inactive' data-toggle='tooltip' data-original-title='' title=''  style='background-color:#FF0000;'></div>";
            }
        }
    }
}