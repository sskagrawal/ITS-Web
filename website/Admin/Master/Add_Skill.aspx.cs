using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Security.Cryptography;
using System.IO;
public partial class Admin_Master_Add_Skill : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindCategory();
         //   bindJobSubCategory();
            BindGrid();
        }

    }


    private void bindCategory()
    {
        //Industry_Mst

        ddlCategory.Items.Clear();
        ListItem item = new ListItem("Select Category", "0");
        ddlCategory.Items.Add(item);
        DataTable dt = DataAccess.GetData("Select * from [Industry_Mst] ");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                ListItem item1 = new ListItem(row["Industry"].ToString(), row["ID"].ToString());
                ddlCategory.Items.Add(item1);
            }
        }

    }


    private void bindJobSubCategory()
    {
      

        ddljobSubCategory.Items.Clear();
        ListItem item = new ListItem("Select Job ", "0");
        ddljobSubCategory.Items.Add(item);
        DataTable dt = DataAccess.GetData("Select * from [JobSubCategory] Where [ID]=" + ddlCategory.SelectedValue+" ");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                ListItem item1 = new ListItem(row["JobSubCateName"].ToString(), row["JobSubCat_Id"].ToString());
                ddljobSubCategory.Items.Add(item1);
            }
        }

    }



    protected void Button1_Click(object sender, EventArgs e)
    {


        if (hdfID.Value == string.Empty)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [Skill_Master]([Skill_Name],[ID],[JobSubCat_Id]) VALUES(@Skill_Name,@ID,@JobSubCat_Id)");
            cmd.Parameters.AddWithValue("@Skill_Name", txtskillName.Text);
            cmd.Parameters.AddWithValue("@ID", ddlCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@JobSubCat_Id", ddljobSubCategory.SelectedValue);
            
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Record Saved Successfully";
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [Skill_Master]  SET [Skill_Name] = @Skill_Name,[ID]=@ID,[JobSubCat_Id]=@JobSubCat_Id WHERE [Skill_id]=" + hdfID.Value + "");
            cmd.Parameters.AddWithValue("@Skill_Name", txtskillName.Text);
            cmd.Parameters.AddWithValue("@ID", ddlCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@JobSubCat_Id", ddljobSubCategory.SelectedValue);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Record Update Successfully";
        }

        ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
        Clr();
        BindGrid();

    }
    protected void Edit(object sender, ImageClickEventArgs e)
    {
       
        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfskillid")).Value);

        hdfID.Value = Convert.ToString(ID);
        if (btndetails.ID.Equals("imgbtnUpdate"))
        {

            DataTable dt = DataAccess.GetData("select * from [Skill_Master]  WHERE  [Skill_id] =" + ID + "");
            if (dt.Rows.Count > 0 && dt != null)
            {
                txtskillName.Text = dt.Rows[0]["Skill_Name"].ToString();
                bindCategory();
                ddlCategory.SelectedValue = dt.Rows[0]["ID"].ToString();
                bindJobSubCategory();
                ddljobSubCategory.SelectedValue = dt.Rows[0]["JobSubCat_Id"].ToString();
               
                btnAddArea.Text = "Update";


            }
        }
        else if (btndetails.ID.Equals("imgbtnDelete"))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM [Skill_Master]  WHERE  [Skill_id] =" + ID + "");
            DataAccess.InsertExecuteNonQuery(cmd);
        }
        BindGrid();

    }
    private void Clr()
    {
        ddlCategory.ClearSelection();
        ddljobSubCategory.ClearSelection();
        txtskillName.Text = string.Empty;
        hdfID.Value = string.Empty;
        btnAddArea.Text = "Submit";
    }
    public void BindGrid()
    {

        DataTable dt = DataAccess.GetData("Select * from [View_Skill_Master] order by [Skill_id]");
        if (dt.Rows.Count > 0 && dt != null)
        {
            grdView.DataSource = dt;
            grdView.DataBind();
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindGrid();
    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindJobSubCategory();
    }
}