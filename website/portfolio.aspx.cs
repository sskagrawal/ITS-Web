using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Drawing2D;
using System.Drawing;
using System.IO;


public partial class work_portfolio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           BindPortfolio();
        }
    }

    public void BindPortfolio()
    {


      //  ltrPortFolio.Text = string.Empty;
        string query = "select * from [Portfolio]";
        //if (drdporttype.SelectedValue != "0")
        //{
        //    query += "where [PortfolioType]= '" + drdporttype.SelectedValue + " '";
        //}
        DataTable dt = DataAccess.GetData(query);
        if (dt.Rows.Count > 0)
        {

           // lblObtrecord.Text = dt.Rows.Count.ToString();

            for (int i = 0; i < dt.Rows.Count; i = i + 1)
            {

                ltrPortFolio.Text += "<article data-grid='ninzio_01' class='all repairing restyling post-5853 projects type-projects status-publish has-post-thumbnail hentry projects-category-repairing projects-category-restyling' id='post-5853'>";
                ltrPortFolio.Text += "<div class='nz-thumbnail nz-thumbnail1' style='background-image:url(PortfolioImage/"+dt.Rows[i]["portfolioImage"].ToString()+")'></div>";

                ltrPortFolio.Text += "<div class='project-details'><h4 class='project-title'><a href='#'>"+dt.Rows[i]["PortfolioTitle"].ToString()+"</a></h4><div class='projects-category'><a href='#'rel='tag'>"+dt.Rows[i]["PortfolioSubTitle"].ToString()+"</a></div></div></article>";

               // ltrPortFolio.Text += "<li class='post-2790 product type-product status-publish has-post-thumbnail product_cat-carbon-paper product_tag-cutting-mat product_tag-envelope product_tag-fax-paper first instock purchasable product-type-simple'><a href=' " + dt.Rows[i]["PortfolioLink"].ToString() + "' class='woocommerce-LoopProduct-link'> <div class='nz-thumbnail'> <img src='PortfolioImage/" + dt.Rows[i]["portfolioImage"].ToString() + "' class='attachment-shop_catalog size-shop_catalog wp-post-image' alt='" + dt.Rows[i]["AltName"].ToString() + "' title='product2' /> </div> <div class='product-details'> <h3>" + dt.Rows[i]["PortfolioTitle"].ToString() + " </h3>'</div></a></li>";

            }



        }
      //  string totCount = DataAccess.GetSingleValue(" select count(ID) as total FROM [Portfolio]");
     //   lbltotalrecord.Text = totCount;

    }

    //protected void drdporttype_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //   BindPortfolio();
    //}
}