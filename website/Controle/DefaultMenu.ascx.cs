using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Controle_DefaultMenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindCategory();
    }
    private void BindCategory()
    {
        DataTable dt = DataAccess.GetData("select * from [ecom_CategoryMaster] where [Is_active]=1");
        if(dt.Rows.Count>0)
        {
            ltrlShopMenuDesk.Text = "<ul class='sub-menu'>";
            ltrlMobShop.Text = "<ul class='sub-menu'>";
            foreach (DataRow dr in dt.Rows)
            {
                ltrlShopMenuDesk.Text += " <li class='menu-item menu-item-has-children' data-mm='false' data-mmc='2'><a href='" + Page.ResolveUrl("~/shop/Product-List.aspx?CId=" + Convert.ToString(dr["CategoryID"].ToString())) + "'><span class='mi'></span><span class='txt'>" + dr["CategoryName"].ToString()+"</span><span class='di icon-arrow-right9'></span></a>";
                ltrlMobShop.Text += " <li class='menu-item menu-item-has-children' data-mm='false' data-mmc='2'><a href='" + Page.ResolveUrl("~/shop/Product-List.aspx?CId=" + Convert.ToString(dr["CategoryID"].ToString())) + "'><span class='mi'></span><span class='txt'>" + dr["CategoryName"].ToString() + "</span><span class='di icon-arrow-right9'></span></a>";
                //ltrlShopMenuDesk.Text += "<ul class='sub-menu'>";
                BindSubCategory(dr["CategoryID"].ToString());
                ltrlShopMenuDesk.Text += "</li>";
                ltrlMobShop.Text += "</li>";
            }
            ltrlShopMenuDesk.Text += "</ul>";
            ltrlMobShop.Text += "</ul>";
        }
    }
    private void BindSubCategory(string catId)
    {
        DataTable dt = DataAccess.GetData("select * from [ecom_SubCategoryMaster] where [CategoryID]="+catId+" and [Is_active]=1");
        if (dt.Rows.Count > 0)
        {
            ltrlShopMenuDesk.Text += "<ul class='sub-menu'>";
            ltrlMobShop.Text += "<ul class='sub-menu'>";
            foreach (DataRow dr in dt.Rows)
            {
                ltrlShopMenuDesk.Text += " <li class='menu-item' data-mm='false' data-mmc='2'><a href='" + Page.ResolveUrl("~/shop/Product-List.aspx?CId=" + Convert.ToString(dr["CategoryID"].ToString()) + "SCId="+ Convert.ToString(dr["SubCategoryID"].ToString()))+"'><span class='mi'></span><span class='txt'>" + dr["SubCategoryName"].ToString()+"</span><span class='di icon-arrow-right9'></span></a>";
                ltrlMobShop.Text += " <li class='menu-item' data-mm='false' data-mmc='2'><a href='" + Page.ResolveUrl("~/shop/Product-List.aspx?CId=" + Convert.ToString(dr["CategoryID"].ToString()) + "SCId=" + Convert.ToString(dr["SubCategoryID"].ToString())) + "'><span class='mi'></span><span class='txt'>" + dr["SubCategoryName"].ToString() + "</span><span class='di icon-arrow-right9'></span></a>";
                ltrlShopMenuDesk.Text += "</li>";
                ltrlMobShop.Text += "</li>";

            }
            ltrlShopMenuDesk.Text += "</ul>";
            ltrlMobShop.Text += "</ul>";
        }
    }
}