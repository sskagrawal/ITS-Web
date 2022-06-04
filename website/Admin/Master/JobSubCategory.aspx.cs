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
public partial class Admin_Master_JobSubCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindCategory();
            BindGrid();
           bindJobCategorySearch();
            CustPager.Reload();
        }

    }


    public void bindJobCategorySearch()
    {

        //Industry_Mst

        ddlCategorySearch.Items.Clear();
        ListItem item = new ListItem("Select Category", "0");
        ddlCategorySearch.Items.Add(item);

        DataTable dt = DataAccess.GetData("Select * from [Industry_Mst] ");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                ListItem item1 = new ListItem(row["Industry"].ToString(), row["ID"].ToString());

                ddlCategorySearch.Items.Add(item1);

            }
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



    protected void Button1_Click(object sender, EventArgs e)
    {

        if (hdfID.Value == string.Empty)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [JobSubCategory]([JobSubCateName],[ID]) VALUES(@JobSubCateName,@ID)");
           
            cmd.Parameters.AddWithValue("@JobSubCateName", txtjobSubcatName.Text);
            cmd.Parameters.AddWithValue("@ID", ddlCategory.SelectedValue);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Record Saved Successfully";
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [JobSubCategory]  SET [JobSubCateName] =@JobSubCateName,[ID] = @ID  WHERE [JobSubCat_Id]=" + hdfID.Value + "");
            cmd.Parameters.AddWithValue("@JobSubCateName", txtjobSubcatName.Text);
            cmd.Parameters.AddWithValue("@ID", ddlCategory.SelectedValue);
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
        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfjobsubcatid")).Value);

        hdfID.Value = Convert.ToString(ID);
        if (btndetails.ID.Equals("imgbtnUpdate"))
        {

            DataTable dt = DataAccess.GetData("select * from [JobSubCategory]  WHERE  [JobSubCat_Id] =" + ID + "");
            if (dt.Rows.Count > 0 && dt != null)
            {

                txtjobSubcatName.Text = dt.Rows[0]["JobSubCateName"].ToString();
                ddlCategory.SelectedValue = dt.Rows[0]["ID"].ToString();
               
                btnAddArea.Text = "Update";


            }
        }
        else if (btndetails.ID.Equals("imgbtnDelete"))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM [JobSubCategory]  WHERE  [JobSubCat_Id] =" + ID + "");
            DataAccess.InsertExecuteNonQuery(cmd);
        }
        BindGrid();

    }
    private void Clr()
    {

        ddlCategory.ClearSelection();
        txtjobSubcatName.Text = string.Empty;
        hdfID.Value = string.Empty;
        btnAddArea.Text = "Submit";
    }
    public void BindGrid()
    {
        string Query = string.Empty;
        Query = "select  * from View_JobSubCategoryMaster";
        string whereConcatenator = " WHERE ";

        if (ddlCategorySearch.SelectedValue != "0")
        {
            Query += whereConcatenator;
            Query += "Industry='" + ddlCategorySearch.SelectedItem.Text.Trim() + "'";
            whereConcatenator = " and ";
        }


        if (ddlSubCategorySearch.SelectedValue != "0")
        {
            Query += whereConcatenator;
            Query += "JobSubCateName='" + ddlSubCategorySearch.SelectedItem.Text.Trim() + "'";
            whereConcatenator = " and ";
        }

        Query += " order by [JobSubCat_Id] desc ";
        DataTable dt = DataAccess.GetData(Query);


        //  DataTable dt = DataAccess.GetData("Select * from [View_JobSubCategoryMaster] order by [JobSubCat_Id]");



        if (dt.Rows.Count > 0 && dt != null)
        {
            grdView.DataSource = dt;
            grdView.DataBind();
            int TotalPage = dt.Rows.Count;
            CustPager.TotalRecords = TotalPage;
            CustPager.TotalPage = TotalPage % grdView.PageSize == 0 ? TotalPage / grdView.PageSize : TotalPage / grdView.PageSize + 1;
        }

        else
        {

            dt.Rows.Add(dt.NewRow());
            grdView.DataSource = dt;
            grdView.DataBind();
            int TotalColumns = grdView.Rows[0].Cells.Count;
            grdView.Rows[0].Cells.Clear();
            grdView.Rows[0].Cells.Add(new TableCell());
            grdView.Rows[0].Cells[0].ColumnSpan = TotalColumns;
            grdView.Rows[0].Cells[0].Text = "No records Found";

        }
    }


    protected void CustPager_PageChanged(object sender, CustomPageChangeArgs e)
    {
        grdView.PageSize = e.CurrentPageSize;
        grdView.PageIndex = e.CurrentPageNumber - 1;
        BindGrid();
        CustPager.Reload();
        // CustPager.Reload();
    }


    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        alert.Visible = false;
       // bindJobSubCategory();
    }

    protected void ddlCategorySearch_SelectedIndexChanged(object sender, EventArgs e)
    {

        BindGrid();
        CustPager.Reload();
        bindSubCategorySearch();
    }


    public void bindSubCategorySearch()
    {

        ddlSubCategorySearch.Items.Clear();
        ListItem item = new ListItem("Select Job ", "0");
        ddlSubCategorySearch.Items.Add(item);
        DataTable dt = DataAccess.GetData("Select * from [JobSubCategory] Where [ID]=" + ddlCategorySearch.SelectedValue + " ");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                ListItem item1 = new ListItem(row["JobSubCateName"].ToString(), row["JobSubCat_Id"].ToString());
                ddlSubCategorySearch.Items.Add(item1);
            }
        }

    }




    protected void ddlSubCategorySearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGrid();
        CustPager.Reload();
    }

    protected void btnbtnSearch_Click(object sender, EventArgs e)
    {
        BindGrid();
        CustPager.Reload();
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        ddlCategorySearch.ClearSelection();
        ddlSubCategorySearch.ClearSelection();     
        BindGrid();

    }




}