<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BlogShow.aspx.cs" Inherits="Blogs_BlogShow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:HiddenField ID="hdfBlogId" runat="server" />
    <header class="rich-header page-header version1" data-parallax="true" id="header_d901_0">
                    <div class="parallax-container" id="div_d901_0">&nbsp;</div>

                    <div class="container nz-clearfix">
                        <div class="rh-content">

                            <h1>Blog</h1>

                            <div class="rh-separator">&nbsp;</div>
                            <div id="div_d901_1" class="nz-breadcrumbs nz-clearfix"><a href="default.aspx"  property="v:title">Home</a><span class="current">News & Events</span></div>
                        </div>
                    </div>
                    <div id="slider-arrow" data-target="#nz-target" data-from="90" data-offset="90" class="i-separator animate nz-clearfix"><i class="icon-arrow-down10"></i></div>
                </header>

                <div class="blog-layout-wrap standard sidebar-true" id="nz-target">

                    <div id="loop" class="loop">
                        <div class="container nz-clearfix">

                            <section class="main-content left">
                                <section class="content lazy blog-layout nz-clearfix">
                                    <div class="blog-post blog-post-1 nz-clearfix">



                <asp:Literal ID="ltrLatestNews" runat="server"></asp:Literal>


                                  

                                    </div>
                                </section>









                            </section>
                            <aside class="sidebar">

                              <aside class='blog-widget-area widget-area'>
                                                                                                                   
                                                                                                                    <div id="categories-4" class="widget widget_categories">
                                                                                                                        <h6 class="widget_title">Blog List</h6>
                                                                                                                        <ul>
                                                                                                                            <asp:Literal ID="ltrlAllBlogs" runat="server"></asp:Literal>
                                                                                                                           
                                                                                                                        </ul>
                                                                                                                    </div>
                                                                                                                    <%--<div id="nz-recent-posts-1" class="widget widget_nz_recent_entries">
                                                                                                                        <h6 class="widget_title">Latest News</h6>
                                                                                                                        <ul>
                                                                                                                            <li class="post-195 post type-post status-publish format-standard has-post-thumbnail sticky hentry category-design tag-design tag-eva tag-external tag-free tag-logo tag-repairing tag-shopping tag-smart">
                                                                                                                                <div class="post-body">
                                                                                                                                    <a class="post-title" href="#">Welcome to Responsive Retina-Ready WP Theme</a>
                                                                                                                                   <!-- <div class="post-date">September 8, 2015</div>-->
                                                                                                                                </div>
                                                                                                                            </li>
                                                                                                                            <li class="post-194 post type-post status-publish format-aside has-post-thumbnail hentry category-marketing tag-design tag-eva tag-external tag-logo tag-marketing tag-ninzio-style tag-painting tag-smart post_format-post-format-aside">
                                                                                                                                <div class="post-body">
                                                                                                                                    <a class="post-title" href="#">WordPress Responsive Transportation</a>
                                                                                                                                   <!-- <div class="post-date">September 3, 2015</div>-->
                                                                                                                                </div>
                                                                                                                            </li>
                                                                                                                            <li class="post-1 post type-post status-publish format-audio has-post-thumbnail hentry category-general tag-custom-code tag-design tag-logo tag-marketing tag-painting tag-repairing tag-shopping tag-smart post_format-post-format-audio">
                                                                                                                                <div class="post-body">
                                                                                                                                    <a class="post-title" href="#">Just another post with A Creative Design And Code</a>
                                                                                                                                  <!--  <div class="post-date">August 27, 2015</div>-->
                                                                                                                                </div>
                                                                                                                            </li>
                                                                                                                            <li class="post-1465 post type-post status-publish format-video has-post-thumbnail hentry category-styling tag-design tag-external tag-free tag-marketing tag-painting tag-repairing tag-shopping post_format-post-format-video">
                                                                                                                                <div class="post-body">
                                                                                                                                    <a class="post-title" href="#">Fundamentals of Theme Development and Design</a>
                                                                                                                                    <!--<div class="post-date">August 26, 2015</div>-->
                                                                                                                                </div>
                                                                                                                            </li>
                                                                                                                            <li class="post-1469 post type-post status-publish format-quote has-post-thumbnail hentry category-design tag-logo tag-marketing tag-painting tag-repairing tag-smart post_format-post-format-quote">
                                                                                                                                <div class="post-body">
                                                                                                                                    <a class="post-title" href="#">Create Unique and Powerful Designs with Ninzio</a>
                                                                                                                                   <!-- <div class="post-date">August 25, 2015</div>-->
                                                                                                                                </div>
                                                                                                                            </li>
                                                                                                                        </ul>
                                                                                                                    </div>--%>
                                                                                                                  
                                                                                                                    
                                                                                                                </aside>
                          
                                </aside>
                          

                        </div>
                    </div>

                </div>



</asp:Content>

