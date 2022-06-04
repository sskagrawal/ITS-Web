using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing.Drawing2D;
using System.Drawing;
using System.IO;
using System.Data;

public partial class LatestNews : System.Web.UI.Page
{
       protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

          // BindPortFolio();
            BindLatestNews();
        
        }
    }


    public void BindLatestNews()
    {

        DataTable dt = DataAccess.GetData("Select * from [News_Master] order by CreatedOn DESC");

        if (dt.Rows.Count > 0)
        {

            for (int i = 0; i < dt.Rows.Count; i = i + 1)
            {

                ltrLatestNews.Text += "<article data-grid='ninzio_01' class='post-194 post type-post status-publish format-aside has-post-thumbnail hentry category-marketing tag-design tag-eva tag-external tag-logo tag-marketing tag-ninzio-style tag-painting tag-smart post_format-post-format-aside' id='post-194'><div class='post-date-custom'>  <span>" + Convert.ToDateTime(dt.Rows[i]["News_Date"]).ToString("dd") + "   </span><span>" + Convert.ToDateTime(dt.Rows[i]["News_Date"]).ToString("MMM") + "</span>  </div><div class='nz-thumbnail'><div class='post-category'></div> <img width='870' height='370' src='News_Image/" + dt.Rows[i]["News_Image"].ToString() + "' class='attachment-Montserrat-Ninzio-Whole size-Montserrat-Ninzio-Whole wp-post-image' alt= " + dt.Rows[i]["News_Title"].ToString() + "  />  <div class='post-body'><div class='post-body-in'><div class='kkHead nz-clearfix'><h1> " + dt.Rows[i]["News_Title"].ToString() + " </h1> <div class='post-excerpt' style='    font-size: 14px; margin-bottom: 22px;  line-height: 25px;  font-family: Open Sans;    font-style: normal;'>" + dt.Rows[i]["News_Desc"].ToString() + "<br/> <a href=" + dt.Rows[i]["News_Url"].ToString() + ">" + dt.Rows[i]["News_Url"].ToString() + "</a></div> </div></div></div></article>";
            }
        }


    }
}
