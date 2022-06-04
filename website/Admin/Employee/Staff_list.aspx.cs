using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;

using System.Data.SqlClient;

using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Admin_Employee_Staff_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindgrideView();
            CustPager.Reload();
        }
    }
      

    public void BindgrideView()
    {

        string Query = string.Empty;
        Query = "select  * from [UserDetails] ";
        string whereConcatenator = "WHERE ";


        if (Drdactivesearch.SelectedValue != "-1")
        {
            Query += whereConcatenator;          
            Query += "Is_active='" + Drdactivesearch.SelectedValue.Trim() + "'";
            whereConcatenator = " and ";
        }

        if (ddlPartysearch.SelectedValue == "UserName")
        {
            Query += whereConcatenator;
            Query += "UserName like '" + txtsearch.Text + "%' ";
            whereConcatenator = " and ";
        }

        else if (ddlPartysearch.SelectedValue == "MobileNo")
        {
            Query += whereConcatenator;
            Query += "MobileNo ='" + txtsearch.Text + "' ";
            whereConcatenator = " and ";
        }

        if (Drdactivesearch.SelectedValue != "-1")
        {

            Query += whereConcatenator;
            Query += "Is_active =" + Drdactivesearch.SelectedValue + " ";
            whereConcatenator = " and ";

        }


        Query += whereConcatenator + "[UserTypeID]=7 ";

        DataTable dt = DataAccess.GetData(Query);

        if (dt.Rows.Count > 0)
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
        BindgrideView();
        CustPager.Reload();        
        
    }

    //private void BindgrideView()
    //{
    //    DataTable dt = DataAccess.GetData("select * from UserDetails where UserTypeID IN (7) ");
    //    if (dt.Rows.Count > 0 && dt != null)
    //    {
    //        grdView.DataSource = dt;
    //        grdView.DataBind();

    //        int TotalPage = dt.Rows.Count;
    //        CustPager.TotalRecords = TotalPage;
    //        CustPager.TotalPage = TotalPage % grdView.PageSize == 0 ? TotalPage / grdView.PageSize : TotalPage / grdView.PageSize + 1;

    //    }

    //    else
    //    {

         
    //            dt.Rows.Add(dt.NewRow());
    //            grdView.DataSource = dt;
    //            grdView.DataBind();
    //            int TotalColumns = grdView.Rows[0].Cells.Count;
    //            grdView.Rows[0].Cells.Clear();
    //            grdView.Rows[0].Cells.Add(new TableCell());
    //            grdView.Rows[0].Cells[0].ColumnSpan = TotalColumns;
    //            grdView.Rows[0].Cells[0].Text = "No records Found";

          

    //    }
    //}

    protected void Edit(object sender, ImageClickEventArgs e)
    {
        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;

        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfID")).Value);


        if (btndetails.ID.Equals("imgbtnDelete"))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM [UserDetails]  WHERE  ID =" + ID + "");
            DataAccess.InsertExecuteNonQuery(cmd);
        }




        BindgrideView();
        
    }

    protected void imgbtnActive_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtnEdit = sender as ImageButton;
        GridViewRow grdRow = (GridViewRow)imgbtnEdit.NamingContainer;
        string ID = (((HiddenField)(grdRow.FindControl("hdfID"))).Value).ToString();
        HiddenField hdfIsActive = (HiddenField)grdRow.FindControl("hdfIsActive");
        if (hdfIsActive.Value == "True")
        {
            SqlCommand cmd = new SqlCommand("UPDATE [UserDetails] SET [Is_active] =0 WHERE ID=" + ID + " ");
            DataAccess.InsertExecuteNonQuery(cmd);
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [UserDetails] SET [Is_active] =1 WHERE ID=" + ID + " ");
            DataAccess.InsertExecuteNonQuery(cmd);
        }
        BindgrideView();
        

    }

    protected void grideViewCatogry_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        HiddenField hdfpartyid = (HiddenField)e.Row.FindControl("hdfID");
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            ImageButton imgbtnActive = (ImageButton)e.Row.FindControl("imgbtnActive");

      
            HiddenField hdfIsActive = (HiddenField)e.Row.FindControl("hdfIsActive");
            if (hdfIsActive.Value == "True")
            {
                imgbtnActive.ToolTip = "Active";
                imgbtnActive.ImageUrl = "~/image/icon_enable.png";
              

            }
            else
            {
                imgbtnActive.ToolTip = "Dactive";
                imgbtnActive.ImageUrl = "~/image/icon_disable.png";
              

            }
            
        }
    }

    protected void btnbtnSave_Click(object sender, EventArgs e)
    {
        BindgrideView();
    }

    protected void Drdactivesearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindgrideView();
    }
}