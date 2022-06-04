using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;
public partial class Blog_Blogs : System.Web.UI.Page
{

   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            bindBlogList();
        }
    }

    public void bindBlogList()
    {
        DataTable dt = DataAccess.GetData("Select * from [News_Master] Order by [CreatedOn] desc ");
        if (dt.Rows.Count > 0)
        {

            foreach (DataRow row in dt.Rows)
            {

                ltrblog.Text +="<article data-grid='ninzio_01' class='post-195 post type-post status-publish format-standard has-post-thumbnail sticky hentry category-design tag-design tag-eva tag-external tag-free tag-logo tag-repairing tag-shopping tag-smart' id='post-195'>";
                ltrblog.Text += "<div class='nz-thumbnail'>";
                ltrblog.Text += "<div class='post-category'>";
                //ltrblog.Text += "<ul class='post-categories'>";
                //ltrblog.Text += "<li><a href='#' rel='category tag'>Design</a></li>"; 
                //ltrblog.Text += "</ul>";
                ltrblog.Text += "</div><img width ='640' height='520' src='../News_Image/"+ row["News_Image"].ToString() + "' class='attachment-Montserrat-Ninzio-Half size-Montserrat-Ninzio-Half wp-post-image' alt='" + row["News_Title"].ToString() + "' />";
                ltrblog.Text += "<div class='ninzio-overlay'>";
                ltrblog.Text += "<a class='nz-overlay-before' title='View details' href='../News_Image/" + row["News_Image"].ToString() + "'></a></div></div>";
                ltrblog.Text += "<div class='post-body'>";
                ltrblog.Text += "<div class='post-body-in'>";
               // ltrblog.Text += "<span class='sticky-ind'></span>";
                ltrblog.Text += "<h3 class='post-title'>";
                ltrblog.Text += "<a href='" + GenerateURL(row["News_Title"].ToString(), Convert.ToInt32(row["News_Id"].ToString())) + "' title='" + row["News_Title"].ToString() + "' rel='bookmark'>" + row["News_Title"].ToString() + "</a></h3>";
                ltrblog.Text += "<div class='post-date-full'>" + Convert.ToDateTime(row["News_Date"]).ToString("dd MMM yyyy") + "</div>";



                                              
                // string t2 = row["News_Desc"].ToString();
                //int headingLength1 = t2.Length;
                //if (headingLength1 >100)
                //{
                //    string str2 = t2.Substring(0, 85);
                //    ltrblog.Text += "<div class='post-excerpt'>" + str2 + ",..</div>";
                //}

                //else
                //{

                //    ltrblog.Text += "<div class='post-excerpt'>" + row["News_Desc"].ToString() + ",..</div>";
                //}


                ltrblog.Text += "<a class='post-more' href='"+ GenerateURL(row["News_Title"].ToString(), Convert.ToInt32(row["News_Id"].ToString())) + "'>Read more<span class='screen-reader-text'>"+ row["News_Title"].ToString() + "</span></a>";
                ltrblog.Text += "</div></div></article>";
            }

        }
      

    }
    public static string GenerateURL(string title, int Id)
    {
        string strTitle = title.Trim();
        strTitle = strTitle.ToLower();
        strTitle = strTitle.Replace("c#", "C-Sharp");
        strTitle = strTitle.Replace(" ", "-");
        strTitle = strTitle.Trim();
        strTitle = strTitle.Trim('-');
        strTitle = "/Blogs/" + strTitle + "-" + Id.ToString() + ".aspx";

        return strTitle;
    }
}