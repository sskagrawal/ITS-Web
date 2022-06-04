using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
public partial class Admin_Co_ordinator_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindGrid();       
        CustPager.Reload();
    }



    public void BindGrid()
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

         DataTable dt = DataAccess.GetData("Select * from [PartyMaster] Where [Party_Type] =7 ");


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
    }
    protected void Edit(object sender, ImageClickEventArgs e)
    {

        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfparty_id")).Value);

        //hdfpartyId.Value = Convert.ToString(ID);
        //if (btndetails.ID.Equals("imgbtnUpdate"))
        //{
        //    Response.Redirect("Co-ordinator.aspx?pid=" + hdfpartyId.Value);
           
        //}
        //else
        
        if (btndetails.ID.Equals("imgbtnDelete"))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM [PartyMaster]  WHERE  [PartyID] =" + ID + "");
            DataAccess.InsertExecuteNonQuery(cmd);
        }
        BindGrid();
        CustPager.Reload();

    }

    protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            HiddenField hdfpartyid = (HiddenField)e.Row.FindControl("hdfparty_id");
            Literal ltrPhoto = (Literal)e.Row.FindControl("ltrPhoto");
            DataTable dt = DataAccess.GetData("Select [Upload_File] from [PartyDocument_Master] Where [PartyID]=" + hdfpartyid.Value + "  ");
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["Upload_File"].ToString() != string.Empty)
                {
                    ltrPhoto.Text = "<img src='../ClientContractDoc/" + dt.Rows[0]["Upload_File"].ToString() + "' class='img-thumbnail' height='50px' width='80px' alt='news Image' />";
                }

                else
                {
                    ltrPhoto.Text = "<img src='../ClientContractDoc/dummy-man-570x570.png' class='img-thumbnail' height='50px' width='80px' alt='news Image' />";

                }

            }
            Label lblUserName = (Label)e.Row.FindControl("lblUserName");
            Label lblPassWord = (Label)e.Row.FindControl("lblPassword");
            DataTable dtln = DataAccess.GetData("Select [MobileNo],[PassWord] from [UserDetails] Where [UserTypeID]=7   and  [PartyID]=" + hdfpartyid.Value + "  ");
            if (dtln.Rows.Count > 0)
            {

                lblUserName.Text = dtln.Rows[0]["MobileNo"].ToString();
                lblPassWord.Text = dtln.Rows[0]["PassWord"].ToString();


            }

        }

    }
}