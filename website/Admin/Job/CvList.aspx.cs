using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Job_CvList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindGridView();
        }
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindGridView();
    }

    private void BindGridView()
    {

        string Query = string.Empty;
        Query = "Select * from [CVProfile]";

        string whereConcatenator = "WHERE ";


        if (drdSearch.SelectedValue == "Name")
        {
            Query += whereConcatenator;
            Query += "Name like'" + txtSearchValue.Text + "%'";
            whereConcatenator = "and ";
        }


        if (drdSearch.SelectedValue == "MobileNo")
        {
            Query += whereConcatenator;
            Query += "MobileNo like'" + txtSearchValue.Text + "%'";
            whereConcatenator = "and ";
        }

        //else if (drdSearch.SelectedValue == "CompanyName")
        //{
        //    Query += whereConcatenator;
        //    Query += "CompanyName like'" + txtSearchValue.Text + "%'";
        //    whereConcatenator = "and ";
        //}




        if (txtApplydate.Text != string.Empty)
        {
            Query += whereConcatenator;
            Query += "cast(CrearteOn as date)='" + Convert.ToDateTime(txtApplydate.Text) + "'";
            whereConcatenator = " and ";
        }

        //if (txtClosedate.Text != string.Empty)
        //{
        //    Query += whereConcatenator;
        //    Query += "cast(jobClose_Date as date)='" + Convert.ToDateTime(txtClosedate.Text) + "'";
        //    whereConcatenator = " and ";
        //}
     
        Query += "order by [CVID] desc ";
        DataTable dt = DataAccess.GetData(Query);

        //  DataTable dt = DataAccess.GetData("Select * from [CVProfile] order by [CVID] desc");
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
        //bindBranchList();
        BindGridView();
        CustPager.Reload();
        
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

    protected void img_Edit_Click(object sender, ImageClickEventArgs e)
    {

        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdRow = (GridViewRow)btndetails.NamingContainer;

        string j_id = (((HiddenField)(grdRow.FindControl("hdf_Edit"))).Value).ToString();
        string BrachID = Convert.ToString(j_id);
        string IDD = HttpUtility.UrlEncode(Encrypt(BrachID));
        string page = "Resume";
        Response.Redirect("~/Admin/User/AddUpdateUser.aspx?UID=" + IDD);
        Response.Redirect("~/Admin/User/AddUpdateUser.aspx?PAGE=" + page);

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


  
}