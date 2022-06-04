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

public partial class BranchList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindBranchList(); CustPager.Reload();
            bindPartyType();
        }
    }
    public void bindPartyType()
    {
        drdUserType.Items.Clear();
        ListItem item1 = new ListItem();
        item1.Value = "0";
        item1.Text = "--Select--";
        drdUserType.Items.Add(item1);


        DataTable dt = DataAccess.GetData("select * from [UserType] where ID IN (4,2,3,7) "); //where CompanyID=" + hdfCompnyID.Value + "
        if (dt != null && dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["ID"].ToString();
                item.Text = dr["UserTypeName"].ToString();
                drdUserType.Items.Add(item);
            }

        }
    }
    private void bindBranchList()
    {
        string Query = string.Empty;
        Query = "select * from [View_Party] ";
        string whereConcatenator =  " WHERE ";

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
        if ( drdUserType.SelectedValue != "0")
        {
            Query += whereConcatenator;
            Query += "Party_Type ='" + drdUserType.SelectedValue + "'";
            whereConcatenator = " and ";
        }

        //if (drdSeacrchTP.SelectedValue != "")
        //{
        Query += whereConcatenator;
        Query += "Party_Type='7'";
        //    Query += whereConcatenator;
        //    Query += "ProductName like '" + txtSerch.Text.Trim() + "%'";
        //    //Query += "convert(varchar,[NewsDate],103)='" + txtSerch.Text.Trim() + "'";
        //    whereConcatenator = "and ";
        //}
        Query += "order by Createon desc";

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
        int partyid = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfPartyId")).Value);
        // HiddenField hdfStatus = (HiddenField)grdView.FindControl("hdfStatus");

        if (btndetails.ID.Equals("imgbtnUpdate"))
        {
            Response.Redirect("~/Admin/User/User_Add.aspx?PID="+ partyid);
            //string PartyID = Convert.ToString(partyid);
            //string IDD = HttpUtility.UrlEncode(Encrypt(PartyID));

            //Response.Redirect(string.Format("~/Admin/User/User_Add.aspx?PID={0}", IDD));
        }
        else if (btndetails.ID.Equals("imgbtnDelete"))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM [PartyMaster]  WHERE  PartyID ="+ partyid + " " );
            DataAccess.InsertExecuteNonQuery(cmd);
        }


        else
        { }
        //else if (btndetails.ID.Equals("imgbtnStatus"))
        //{
        //    if (hdfStatus.Value == "True")
        //    {
        //        SqlCommand cmd = new SqlCommand("UPDATE [UserDetails] SET [InActive] ='False' WHERE ID=" + ID + "");
        //        DataAccess.InsertExecuteNonQuery(cmd);
        //    }
        //    else
        //    {
        //        SqlCommand cmd = new SqlCommand("UPDATE [UserDetails] SET [InActive] ='True' WHERE ID=" + ID + "");
        //        DataAccess.InsertExecuteNonQuery(cmd);
        //    }
        //}
        bindBranchList(); CustPager.Reload();

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
        bindBranchList(); CustPager.Reload();
    }
    protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        DataRowView drview = e.Row.DataItem as DataRowView;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hdfprtyId = (HiddenField)e.Row.FindControl("hdfPartyId");
            Literal ltrPhoto = (Literal)e.Row.FindControl("ltrPhoto");
            DataTable dt = DataAccess.GetData("Select  [Document_Name],[Upload_File] from [PartyDocument_Master] Where [PartyID]="+ hdfprtyId.Value+ " and [Document_Name]='Profile Photo' ");
            if (dt.Rows.Count > 0)
            {
                ltrPhoto.Text += "<img src='../../ClientContractDoc/" + dt.Rows[0]["Upload_File"].ToString() + "' class='img-thumbnail' alt='ad banner' style='width: 100px' />";
            }

            else
            {
                ltrPhoto.Text += "<img src='../../ClientContractDoc/dummy.png' class='img-thumbnail' alt='ad banner' style='width: 100px' />";

            }           
        }
    }
}