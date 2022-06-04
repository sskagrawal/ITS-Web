using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Admin_Gallery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindgrideView();
            CustPager.Reload();
        }
        
    }

    private void BindgrideView()
    {
        DataTable dt = DataAccess.GetData("select * from Portfolio Order by sort desc");
        if (dt.Rows.Count > 0 && dt != null)
        {
            grdView.DataSource = dt;
            grdView.DataBind();
            int TotalPage = dt.Rows.Count;
            CustPager.TotalRecords = TotalPage;
            CustPager.TotalPage = TotalPage % grdView.PageSize == 0 ? TotalPage / grdView.PageSize : TotalPage / grdView.PageSize + 1;
        }
    }
    protected void CustPager_PageChanged(object sender, CustomPageChangeArgs e)
    {
        grdView.PageSize = e.CurrentPageSize;
        grdView.PageIndex = e.CurrentPageNumber - 1;
        BindgrideView();
        CustPager.Reload();
    }

    protected void Edit(object sender, ImageClickEventArgs e)
    {
        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;

        HiddenField hdfportfolioimg = ((HiddenField)grdView.FindControl("hdfPortfolioimg"));


        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfID")).Value);
       
        if (btndetails.ID.Equals("imgbtnUpdate"))
        {
            Response.Redirect("~/Admin/AddupdatesGallery.aspx?ID=" + ID);
           
        }


        else if (btndetails.ID.Equals("imgbtnDelete"))
        {
          
            SqlCommand cmd = new SqlCommand("DELETE FROM [Portfolio]  WHERE  ID =" + ID + "");
            DataAccess.InsertExecuteNonQuery(cmd);

            if (File.Exists(Server.MapPath("../PortfolioImage/" + hdfportfolioimg.Value)))
            {
                File.Delete(Server.MapPath("../PortfolioImage/" + hdfportfolioimg.Value));
            }

            BindgrideView();
        }
     
      CustPager.Reload();
    }
}