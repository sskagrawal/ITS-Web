using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.IO;
using System.Data;

public partial class MenuList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindMenuList();
        }
    }

    private void bindMenuList()
    {
        //string Query = string.Empty;
        //Query = "select * from [View_JobSheetView] ";
        //string whereConcatenator = " WHERE ";

        //if (drdSearchType.SelectedValue == "1")
        //{
        //    Query += whereConcatenator;
        //    Query += "MobNo=" + txtSearch.Text.Trim() + "";
        //    whereConcatenator = "and ";
        //}
        //else if (drdSearchType.SelectedValue == "2")
        //{
        //    Query += whereConcatenator;
        //    Query += "CustomerName like '%" + txtSearch.Text.Trim() + "%'";
        //    whereConcatenator = "and ";
        //}
        //else if (drdSearchType.SelectedValue == "3")
        //{
        //    Query += whereConcatenator;
        //    Query += "DealerName like '%" + txtSearch.Text.Trim() + "%'";
        //    whereConcatenator = "and ";
        //}
        //else if (drdSearchType.SelectedValue == "4")
        //{
        //    Query += whereConcatenator;
        //    Query += "ProductName like '%" + txtSearch.Text.Trim() + "%'";
        //    whereConcatenator = "and ";
        //}
       
        //Query += whereConcatenator;
        //Query += "[BranchID]=" + hdfBranchId.Value + "";
        //// whereConcatenator = " and ";


        //Query += " order by CreateOn desc";
        //DataTable dt = DataAccess.GetData(Query);
        //if (dt.Rows.Count > 0 && dt != null)
        //{ where BranchID=" + hdfBranchId.Value + "
        DataTable dt = DataAccess.GetData("Select * from Mst_Menu_Master");
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

        }
    }
    protected void CustPager_PageChanged(object sender, CustomPageChangeArgs e)
    {
        grdView.PageSize = e.CurrentPageSize;
        grdView.PageIndex = e.CurrentPageNumber - 1;
        bindMenuList();
    }
    protected void Edit(object sender, ImageClickEventArgs e)
    {
        //LinkButton btndetails = sender as LinkButton;
        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfMenuID")).Value);
        HiddenField hdfStatus = (HiddenField)grdView.FindControl("hdfStatus");
        if (btndetails.ID.Equals("imgbtnUpdate"))
        {          
           
            Response.Redirect(string.Format("~/Admin/Master/AddMenu.aspx?MenuID=" + ID));
        }
        else if (btndetails.ID.Equals("imgbtnDelete"))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM [Mst_Menu_Master]  WHERE  MenuID =" + ID + "");
            DataAccess.InsertExecuteNonQuery(cmd);
        }
        else if (btndetails.ID.Equals("imgbtnStatus"))
        {
            //string Status = Convert.ToString(hdfStatus.Value);
            //string JobSheetID = Convert.ToString(ID);
            //string JID = HttpUtility.UrlEncode(Encrypt(JobSheetID));
            //string JobSt = HttpUtility.UrlEncode(Encrypt(Status));            
            //Response.Redirect(string.Format("~/ChangeStatus.aspx?JobSheetID={0}", JID));
        }
        bindMenuList();
        CustPager.Reload();

    }
    private string Encrypt(string clearText)
    {
        string EncryptionKey = "MAKV2SPBNI99212";
        byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(clearBytes, 0, clearBytes.Length);
                    cs.Close();
                }
                clearText = Convert.ToBase64String(ms.ToArray());
            }
        }
        return clearText;
    }
    //protected void btnSearch_Click(object sender, EventArgs e)
    //{
    //    bindMenuList();
    //}
    //public void BindCustmar()
    //{
    //    drdCustomerType.Items.Clear();
    //    ListItem item = new ListItem("Select CustomerType", "");
    //    drdCustomerType.Items.Add(item);
    //    DataTable dt = DataAccess.GetData("Select * from CustomerType ");
    //    if (dt.Rows.Count > 0)
    //    {
    //        foreach (DataRow row in dt.Rows)
    //        {
    //            ListItem item1 = new ListItem(row["CustomerType"].ToString(), row["ID"].ToString());
    //            drdCustomerType.Items.Add(item1);
    //        }
    //    }
    //}
    protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //HiddenField hdfMessage = (HiddenField)e.Row.FindControl("hdfMessage");
            HiddenField hdfStatus = (HiddenField)e.Row.FindControl("hdfStatus");
            HiddenField hdfMenuID = (HiddenField)e.Row.FindControl("hdfMenuID");
            Literal ltrStatus = (Literal)e.Row.FindControl("ltrStatus");
            if (hdfStatus.Value != string.Empty)
            {

                string msg = string.Empty;
                if (hdfStatus.Value == "False")
                {
                    msg = "Menu Deactivat";
                    ltrStatus.Text = "<div class='status-pill red' data-title='" + msg + "' data-toggle='tooltip' data-original-title='' title=''></div>";
                }
                else if (hdfStatus.Value == "True")
                {
                    msg = "Menu Activat";
                    ltrStatus.Text = "<div class='status-pill green' data-title='" + msg + "' data-toggle='tooltip' data-original-title='' title=''></div>";
                }
                
            }
        }
    }
}