using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Blogs_BlogShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            // BindPortFolio();
            BindLatestNews();
            BindAllBlogs();
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
    public void BindLatestNews()
    {
        string sqlQury = string.Empty;
        if (Request.QueryString.Get("id") != null)
        {
            if (Request.QueryString.Get("id").ToString() != string.Empty)
            {
                sqlQury = "Select * from [News_Master] where [News_Id]=" + Request.QueryString.Get("id").ToString() + "";
            }
            else
            {
                sqlQury = "Select top 1 * from [News_Master] order by CreatedOn DESC";
            }
        }
        else
        {
            sqlQury = "Select top 1 * from [News_Master] order by CreatedOn DESC";
        }

        DataTable dt = DataAccess.GetData(sqlQury);

        if (dt.Rows.Count > 0)
        {
            hdfBlogId.Value = dt.Rows[0]["News_Id"].ToString();
            for (int i = 0; i < dt.Rows.Count; i = i + 1)
            {

                ltrLatestNews.Text += "<article data-grid='ninzio_01' class='post-194 post type-post status-publish format-aside has-post-thumbnail hentry category-marketing tag-design tag-eva tag-external tag-logo tag-marketing tag-ninzio-style tag-painting tag-smart post_format-post-format-aside' id='post-194'><div class='post-date-custom'>  <span>" + Convert.ToDateTime(dt.Rows[i]["News_Date"]).ToString("dd") + "   </span><span>" + Convert.ToDateTime(dt.Rows[i]["News_Date"]).ToString("MMM") + "</span>  </div><div class='nz-thumbnail'><div class='post-category'></div> <img width='870' height='370' src='../News_Image/" + dt.Rows[i]["News_Image"].ToString() + "' class='attachment-Montserrat-Ninzio-Whole size-Montserrat-Ninzio-Whole wp-post-image' alt= " + dt.Rows[i]["News_Title"].ToString() + "  /> <br> <div class='post-body'><div class='post-body-in'><div class='kkHead nz-clearfix'><h1> " + dt.Rows[i]["News_Title"].ToString() + " </h1> <div class='post-excerpt' style='    font-size: 14px; margin-bottom: 22px;  line-height: 25px;  font-family: Open Sans;    font-style: normal;'>" + dt.Rows[i]["News_Desc"].ToString() + "<br/> <a href=" + dt.Rows[i]["News_Url"].ToString() + ">" + dt.Rows[i]["News_Url"].ToString() + "</a></div> </div></div></div></article>";
            }

            this.Page.Title = dt.Rows[0]["News_Title"].ToString();
            this.Page.MetaDescription = dt.Rows[0]["MetaDesc"].ToString();
        }


    }
    private void BindAllBlogs()
    {
        DataTable dt = DataAccess.GetData("Select * from [News_Master] where [News_Id]!=" + hdfBlogId.Value + " order by CreatedOn DESC");

        if (dt.Rows.Count > 0)
        {

            for (int i = 0; i < dt.Rows.Count; i = i + 1)
            {

                ltrlAllBlogs.Text += "<li class='cat-item cat-item-61'><a href='" + GenerateURL(dt.Rows[i]["News_Title"].ToString(), Convert.ToInt32(dt.Rows[i]["News_Id"].ToString())) + "'>" + dt.Rows[i]["News_Title"].ToString() + "</a></li>";
            }


        }
    }
}