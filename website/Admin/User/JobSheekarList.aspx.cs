using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.IO;
using System.Web.UI.HtmlControls;

public partial class BranchList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindBranchList();
           
        }
    }
  
    private void bindBranchList()
    {
        string Query = string.Empty;
        Query = "select * from [View_PartyMaster_new] ";
        string whereConcatenator = " WHERE ";

        if (txtFromdate.Text != string.Empty)
        {
            Query += whereConcatenator;
            Query += "  cast(Createon as date) >='" + txtFromdate.Text.Trim() + "'";
            whereConcatenator = " and ";
        }
        if (txtTodate.Text != string.Empty)
        {
            Query += whereConcatenator;
            Query += " cast(Createon as date) <='" + txtTodate.Text.Trim() + "'";
            whereConcatenator = " and ";
        }
        if (drdSeacrchTP.SelectedValue == "1")
        {
            Query += whereConcatenator;
            Query += "Contact_person_name like '" + txtSearchValue.Text.Trim() + "%'";
            whereConcatenator = " and ";
        }
        if (drdSeacrchTP.SelectedValue == "2")
        {
            Query += whereConcatenator;
            Query += "mobile_no ='" + txtSearchValue.Text.Trim() + "'";
            whereConcatenator = " and ";
        }
    
        Query += whereConcatenator;
        Query += "UserTypeID ='3'";
        //    Query += whereConcatenator;
        //    Query += "ProductName like '" + txtSerch.Text.Trim() + "%'";
        //    //Query += "convert(varchar,[NewsDate],103)='" + txtSerch.Text.Trim() + "'";
        //    whereConcatenator = "and ";
        //}
        Query += "order by [JobSeekerOrderPosition] ASC ";

        DataTable dt = DataAccess.GetData(Query);

        //DataTable dt = DataAccess.GetData("Select * from View_Booking order by CreateOn  DESC");
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
        bindBranchList();
        CustPager.Reload();
    }
    protected void Edit(object sender, ImageClickEventArgs e)
    {
        //LinkButton btndetails = sender as LinkButton;
        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfpartyID")).Value);
        HiddenField hdfStatus = (HiddenField)grdView.FindControl("hdfStatus");

        if (btndetails.ID.Equals("imgbtnUpdate"))
        {
         
            string BrachID = Convert.ToString(ID);
            string IDD = HttpUtility.UrlEncode(Encrypt(BrachID));       
            Response.Redirect(string.Format("~/Admin/AddUpdateUser.aspx?UID={0}", IDD));
        }
        else if (btndetails.ID.Equals("imgbtnDelete"))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM [PartyMaster]  WHERE  [PartyID] =" + ID + "");
            DataAccess.InsertExecuteNonQuery(cmd);
        }


        else if (btndetails.ID.Equals("imgbtnStatus"))
        {
            if (hdfStatus.Value == "True")
            {
                SqlCommand cmd = new SqlCommand("UPDATE [PartyMaster] SET [Is_active] ='False' WHERE [PartyID]=" + ID + "");
                DataAccess.InsertExecuteNonQuery(cmd);
            }
            else
            {
                SqlCommand cmd = new SqlCommand("UPDATE [PartyMaster] SET [Is_active] ='True' WHERE [PartyID]=" + ID + "");
                DataAccess.InsertExecuteNonQuery(cmd);
            }
        }


        else if (btndetails.ID.Equals("imgbtnsetorder"))
        {

            Response.Redirect("~/Admin/User/SetJobSeekerPoistion.aspx?jsid=" + ID);

        }
        bindBranchList();

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
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        bindBranchList();
    }
    protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        DataRowView drview = e.Row.DataItem as DataRowView;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hdfStatus = (HiddenField)e.Row.FindControl("hdfStatus");
            Literal ltrStatus = (Literal)e.Row.FindControl("ltrStatus");


            //if (hdfStatus.Value == "True")
            //{
            //    ltrStatus.Text = "<div class='status-pill yellow' data-title='Active' data-toggle='tooltip' data-original-title='' title='' style='background-color:#00FF01;'></div>";
            //}
            //else if (hdfStatus.Value == "False")
            //{
            //    ltrStatus.Text = "<div class='status-pill yellow' data-title='Inactive' data-toggle='tooltip' data-original-title='' title=''  style='background-color:#FF0000;'></div>";
            //}

            Label lblJobSikrOrderId = (Label)e.Row.FindControl("lblJobSikrOrderId");
            HiddenField hdfJobsikrOrderId = (HiddenField)e.Row.FindControl("hdfJobsikrOrderId");

            if (hdfJobsikrOrderId.Value != string.Empty && hdfJobsikrOrderId.Value != "999")
            {
                lblJobSikrOrderId.Visible = true;


            }
            else
            {

                lblJobSikrOrderId.Visible = false;
            }





        }
    }
    public string GetJobDet(object userId)
    {
        string jobDet = string.Empty;
        if (userId.ToString() != string.Empty)
        {
            DataTable dt = DataAccess.GetData("select [job_Title],[job_Desc] from [Job_Master] where [UserID]=" + userId.ToString() + "");
            if (dt.Rows.Count > 0)
            {
                jobDet = dt.Rows[0]["job_Title"].ToString() + "<br>" + dt.Rows[0]["job_Desc"].ToString();
            }
        }
        return jobDet;
    }

    protected void lnkBtnPrintExcel_Click(object sender, EventArgs e)
    {

        grdView.Columns[5].Visible = false;
        grdView.Columns[8].Visible = false;
        grdView.Columns[9].Visible = false;
       // grdView.Columns[10].Visible = false;
       // grdView.Columns[11].Visible = false;

        string attachment = "attachment; filename=JobSeekerList.xls";
        Response.ClearContent();
        Response.AddHeader("content-disposition", attachment);
        Response.ContentType = "application/ms-excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);
        grdView.AllowPaging = false;
        this.bindBranchList();

        grdView.Columns[5].Visible = false;
        grdView.Columns[8].Visible = false;
        grdView.Columns[9].Visible = false;
      //  grdView.Columns[10].Visible = false;
       // grdView.Columns[11].Visible = false;

        // Create a form to contain the grid
        HtmlForm frm = new HtmlForm();
        grdView.GridLines = GridLines.Both;
        grdView.HeaderStyle.Font.Bold = true;
        grdView.RowStyle.Font.Size = 10;
        grdView.Width = 50;
        //grdView.Parent.Controls.Add(frm);
        //frm.Attributes["runat"] = "server";
        //frm.Controls.Add(grdView);
        //frm.RenderControl(htw);

        //GridView1.RenderControl(htw);
        Response.Write(sw.ToString());
        Response.End();
    }
}