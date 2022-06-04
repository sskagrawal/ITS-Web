using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Admin_Master_Add_Keyword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindCategory();
            //bindJobSubCategory();

            BindGridKeyword();
            //bindJobCategorySearch();
            CustPager.Reload();
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

    protected void btnAddKeyword_Click(object sender, EventArgs e)
    {
        if (hdfkywrd_id.Value == string.Empty)
        {
            SqlCommand cmd = new SqlCommand("Insert into [Keyword_Master] ([Keyword],[JobCat_Id]) Values(@Keyword,@JobCat_Id) ");
            cmd.Parameters.AddWithValue("@Keyword", txtKeyword.Text);
            cmd.Parameters.AddWithValue("@JobCat_Id", ddlCategory.SelectedValue);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Keyword added Successfully ";

        }

        else
        {
            SqlCommand cmd = new SqlCommand("Update Keyword_Master SET [Keyword]=@Keyword,[JobCat_Id]=@JobCat_Id Where [Keyword_Id]=" + hdfkywrd_id.Value+"  ");
            cmd.Parameters.AddWithValue("@Keyword", txtKeyword.Text);
            cmd.Parameters.AddWithValue("@JobCat_Id", ddlCategory.SelectedValue);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Keyword updated Successfully ";

        }

        BindGridKeyword();
        CustPager.Reload();
        Clr();
    }


    protected void Edit(object sender, ImageClickEventArgs e)
    {

        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfkeywrd_id")).Value);

        hdfkywrd_id.Value = Convert.ToString(ID);

        if (btndetails.ID.Equals("imgbtnUpdate"))
        {

            DataTable dt = DataAccess.GetData("select * from [Keyword_Master]  WHERE  [Keyword_Id] =" + ID + "");
            if (dt.Rows.Count > 0 && dt != null)
            {
                txtKeyword.Text = dt.Rows[0]["Keyword"].ToString();
                bindCategory();
                ddlCategory.SelectedValue = dt.Rows[0]["JobCat_Id"].ToString();            

                btnAddKeyword.Text = "Update";


            }
        }
        else if (btndetails.ID.Equals("imgbtnDelete"))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM [Keyword_Master]  WHERE  [Keyword_Id] =" + ID + "");
            DataAccess.InsertExecuteNonQuery(cmd);
        }
        BindGridKeyword();
        CustPager.Reload();

    }
    private void Clr()
    {
        ddlCategory.ClearSelection();
      
        txtKeyword.Text = string.Empty;
        hdfkywrd_id.Value = string.Empty;
        btnAddKeyword.Text = "Submit";
    }

    public void BindGridKeyword()
    {

        //string Query = string.Empty;
        //Query = "select  * from View_Skill_Master";
        //string whereConcatenator = " WHERE ";

        //if (ddlCategorySearch.SelectedValue != "0")
        //{
        //    Query += whereConcatenator;
        //    Query += "Industry='" + ddlCategorySearch.SelectedItem.Text.Trim() + "'";
        //    whereConcatenator = " and ";
        //}


        //if (ddlSubCategorySearch.SelectedValue != "0")
        //{
        //    Query += whereConcatenator;
        //    Query += "JobSubCateName='" + ddlSubCategorySearch.SelectedItem.Text.Trim() + "'";
        //    whereConcatenator = " and ";
        //}


        //if (txtSkillNameSearch.Text != string.Empty)
        //{
        //    Query += whereConcatenator;
        //    Query += "Skill_Name='" + txtSkillNameSearch.Text.Trim() + "'";
        //    whereConcatenator = " and ";
        //}


        //Query += " order by [Skill_id] desc ";
        //DataTable dt = DataAccess.GetData(Query);

          DataTable dt = DataAccess.GetData("Select * from [View_Keyword] order by [Keyword_Id] desc");


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
        BindGridKeyword();
        CustPager.Reload();
       
    }
}