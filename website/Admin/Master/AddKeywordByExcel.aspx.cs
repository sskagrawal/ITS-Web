
using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Admin_Master_AddKeywordByExcel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindCategory();
            BindGridKeyword();        
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



    int count = 0;
    protected void btnUploadData_Click(object sender, EventArgs e)
    {
        try
        {

            string path = Path.GetFileName(fuFile.FileName);
            path = path.Replace(" ", "");
            if (File.Exists(Server.MapPath("~/KeywordExcelFile/" + path)))
            {
                File.Delete(Server.MapPath("~/KeywordExcelFile/" + path));
            }
            fuFile.SaveAs(Server.MapPath("~/KeywordExcelFile/") + path);
            String ExcelPath = Server.MapPath("~/KeywordExcelFile/") + path;
            OleDbConnection mycon = new OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0; Data Source = " + ExcelPath + "; Extended Properties=Excel 8.0; Persist Security Info = False");
            mycon.Open();
            OleDbCommand cmd = new OleDbCommand("select * from [Sheet1$]", mycon);
            OleDbDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                SaveData(dr[0].ToString());
            }
            mycon.Dispose();
            ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "getSaveMsg('" + count + " Records are Successfully Added');", true);

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "getErrorMsg('" + ex.Message + "');", true);
        }
    }
    private void SaveData(string Keyword)


    {
        try
        {
            SqlCommand cmd = new SqlCommand("Insert into [Keyword_Master] ([Keyword],[JobCat_Id]) Values(@Keyword,@JobCat_Id) ");
            cmd.Parameters.AddWithValue("@Keyword ", Keyword);
            cmd.Parameters.AddWithValue("@JobCat_Id", ddlCategory.SelectedValue);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Keyword added Successfully ";





        }
        catch (Exception ex)
        {

            ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "getErrorMsg('" + ex.Message + "');", true);
        }
        BindGridKeyword();
    }

    private void Clr()
    {
        ddlCategory.ClearSelection();    
        hdfkywrd_id.Value = string.Empty;     
    }

    public void BindGridKeyword()
    {


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