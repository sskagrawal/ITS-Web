<%@ Page Title="Latest News and Events | Offers Available | ITS Gwalior" MetaKeywords="offers in website design company, offers in software company, offers in it companies," MetaDescription="ITS Gwalior Provide Best Offers in Web design and digital marketing. view offers in Latest news and Events." Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="latest-news.aspx.cs" Inherits="LatestNews" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="Controle/Newregistration.ascx" TagName="Newregistration" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="canonical" href="https://www.itsgwalior.com/latest-news" />
<style type="text/css">
.kkHead
{
    color:Black;
    padding:50px;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <header class="rich-header page-header version1" data-parallax="true" id="header_d901_0">
                    <div class="parallax-container" id="div_d901_0">&nbsp;</div>

                    <div class="container nz-clearfix">
                        <div class="rh-content">

                            <h1 >News & Events</h1>

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


                                      <%--  <article data-grid="ninzio_01" class="post-194 post type-post status-publish format-aside has-post-thumbnail hentry category-marketing tag-design tag-eva tag-external tag-logo tag-marketing tag-ninzio-style tag-painting tag-smart post_format-post-format-aside" id="post-194">
                                            <div class="post-date-custom">
                                            
                                            <span>23</span>
                                            
                                            <span>Sep</span>                          

                                            
                                            </div>
                                            <span class="post-format-status format-standard"></span>
                                            <div class="nz-thumbnail">
                                                <div class="post-category">
                                                    <ul class="post-categories">
                                                        <li><a href="#" rel="category tag">Design</a></li>
                                                    </ul>
                                                </div><img width="870" height="570" src="upload/blog5-870x570.jpg" class="attachment-Montserrat-Ninzio-Whole size-Montserrat-Ninzio-Whole wp-post-image" alt="blog1"  />
                                                <div class="ninzio-overlay">
                                                    <a class="nz-overlay-before" title="View details" href="#"></a>
                                                </div>
                                            </div>
                                            <div class="post-body">
                                                <div class="post-body-in">
                                      <div class="format-wrapper nz-clearfix">
                                                    <h3 class="post-title">
                                        <a href="#" title="Read more about Welcome to Responsive Retina-Ready WP Theme" rel="bookmark">
                                            Welcome to Responsive Retina-Ready WP Theme                     </a>
                                    </h3>
                                                    <div class="postmeta">

                                                        <span class="post-comments">
                                                                            <a href="#">Comments 1</a>                                                   </span>

                                                        <div class="post-author">montserrat@admin</div>

                                                        <div class="post-category"><a href="#" rel="category tag">Design</a></div>
                                                    </div>
                                                    <div class="post-excerpt" style="    font-size: 14px; margin-bottom: 22px;  line-height: 25px;  font-family: Open Sans;    font-style: normal;">Who can forget the GIFs of the ‘90s, or the more up-to-date focus on flat design? Recently, we’ve seen a surge in popularity of responsive web design, as more and more sites join the drive to become ‘mobile ready’ which is now even more important in the wake of Google’s Mobile Friendly update. [...]</div>
                                                    <a class="post-more" href="#">Read more<span class="screen-reader-text"> Welcome to Responsive Retina-Ready WP Theme</span></a>
                                                </div>
                                            </div>
                                            </div>

                                        </article>--%>
                                      <%--
                                       <article data-grid="ninzio_01" class="post-194 post type-post status-publish format-aside has-post-thumbnail hentry category-marketing tag-design tag-eva tag-external tag-logo tag-marketing tag-ninzio-style tag-painting tag-smart post_format-post-format-aside" id="post-194">
                                            <div class="post-date-custom"><span>27</span><span>Aug</span></div>
                                            <span class="post-format-status format-audio"></span>
                                            <div class="post-audio media">
                                                <div class='post-audio-embed'>
                                                    <iframe width="100%" height="450" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/219642550&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>
                                                </div>
                                            </div>
                                            <div class="post-body">
                                                <div class="post-body-in">
                                      <div class="format-wrapper nz-clearfix">
                                                    <h3 class="post-title">
                                        <a href="#" title="Read more about Welcome to Responsive Retina-Ready WP Theme" rel="bookmark">
                                            Welcome to Responsive Retina-Ready WP Theme                     </a>
                                    </h3>
                                                    <div class="postmeta">

                                                        <span class="post-comments">
                                                                            <a href="#">Comments 1</a>                                                   </span>

                                                        <div class="post-author">montserrat@admin</div>

                                                        <div class="post-category"><a href="#" rel="category tag">Design</a></div>
                                                    </div>
                                                    <div class="post-excerpt" style="    font-size: 14px; margin-bottom: 22px;  line-height: 25px;  font-family: Open Sans;    font-style: normal;">Who can forget the GIFs of the ‘90s, or the more up-to-date focus on flat design? Recently, we’ve seen a surge in popularity of responsive web design, as more and more sites join the drive to become ‘mobile ready’ which is now even more important in the wake of Google’s Mobile Friendly update. [...]</div>
                                                    <a class="post-more" href="#">Read more<span class="screen-reader-text"> Welcome to Responsive Retina-Ready WP Theme</span></a>
                                                </div>
                                            </div>
                                            </div>

                                        </article>--%>
                                      <%--<article data-grid="ninzio_01" class="post-194 post type-post status-publish format-aside has-post-thumbnail hentry category-marketing tag-design tag-eva tag-external tag-logo tag-marketing tag-ninzio-style tag-painting tag-smart post_format-post-format-aside" id="post-194">
                                            <div class="post-date-custom"><span>26</span><span>Aug</span></div>
                                            <span class="post-format-status format-video"></span>
                                            <div class="post-video media">
                                                <div class='post-video-embed'>
                                                    <div class='flex-mod'>
                                                        <iframe width="560" height="315" src="https://www.youtube.com/embed/M5dnZKrUpdA" frameborder="0" allowfullscreen></iframe>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="post-body">
                                                <div class="post-body-in">
                                      <div class="format-wrapper nz-clearfix">
                                                    <h3 class="post-title">
                                        <a href="#" title="Read more about Welcome to Responsive Retina-Ready WP Theme" rel="bookmark">
                                            Welcome to Responsive Retina-Ready WP Theme                     </a>
                                    </h3>
                                                    <div class="postmeta">

                                                        <span class="post-comments">
                                                                            <a href="#">Comments 1</a>                                                   </span>

                                                        <div class="post-author">montserrat@admin</div>

                                                        <div class="post-category"><a href="#" rel="category tag">Design</a></div>
                                                    </div>
                                                    <div class="post-excerpt" style="    font-size: 14px; margin-bottom: 22px;  line-height: 25px;  font-family: Open Sans;    font-style: normal;">Who can forget the GIFs of the ‘90s, or the more up-to-date focus on flat design? Recently, we’ve seen a surge in popularity of responsive web design, as more and more sites join the drive to become ‘mobile ready’ which is now even more important in the wake of Google’s Mobile Friendly update. [...]</div>
                                                    <a class="post-more" href="#">Read more<span class="screen-reader-text"> Welcome to Responsive Retina-Ready WP Theme</span></a>
                                                </div>
                                            </div>
                                            </div>

                                        </article>
--%>                            
                                      <%-- <article data-grid="ninzio_01" class="post-194 post type-post status-publish format-aside has-post-thumbnail hentry category-marketing tag-design tag-eva tag-external tag-logo tag-marketing tag-ninzio-style tag-painting tag-smart post_format-post-format-aside" id="post-194">
                                            <div class="post-date-custom"><span>22</span><span>Aug</span></div>
                                            <span class="post-format-status format-chat"></span>
                                            <div class="nz-thumbnail">
                                                <div class="post-category">
                                                    <ul class="post-categories">
                                                        <li><a href="#" rel="category tag">Marketing</a></li>
                                                    </ul>
                                                </div><img width="870" height="570" src="upload/blog8-870x570.jpg" class="attachment-Montserrat-Ninzio-Whole size-Montserrat-Ninzio-Whole wp-post-image" alt="blog8"  />
                                                <div class="ninzio-overlay">
                                                    <a class="nz-overlay-before" title="View details" href="#"></a>
                                                </div>
                                            </div>
                                            <div class="post-body">
                                                <div class="post-body-in">
                                      <div class="format-wrapper nz-clearfix">
                                                    <h3 class="post-title">
                                        <a href="#" title="Read more about Welcome to Responsive Retina-Ready WP Theme" rel="bookmark">
                                            Welcome to Responsive Retina-Ready WP Theme                     </a>
                                    </h3>
                                                    <div class="postmeta">

                                                        <span class="post-comments">
                                                                            <a href="#">Comments 1</a>                                                   </span>

                                                        <div class="post-author">montserrat@admin</div>

                                                        <div class="post-category"><a href="#" rel="category tag">Design</a></div>
                                                    </div>
                                                    <div class="post-excerpt" style="    font-size: 14px; margin-bottom: 22px;  line-height: 25px;  font-family: Open Sans;    font-style: normal;">Who can forget the GIFs of the ‘90s, or the more up-to-date focus on flat design? Recently, we’ve seen a surge in popularity of responsive web design, as more and more sites join the drive to become ‘mobile ready’ which is now even more important in the wake of Google’s Mobile Friendly update. [...]</div>
                                                    <a class="post-more" href="#">Read more<span class="screen-reader-text"> Welcome to Responsive Retina-Ready WP Theme</span></a>
                                                </div>
                                            </div>
                                            </div>

                                        </article>--%>
                                      <%--  <article data-grid="ninzio_01" class="post-194 post type-post status-publish format-aside has-post-thumbnail hentry category-marketing tag-design tag-eva tag-external tag-logo tag-marketing tag-ninzio-style tag-painting tag-smart post_format-post-format-aside" id="post-194">
                                            <div class="post-date-custom"><span>24</span><span>Mar</span></div>
                                            <span class="post-format-status format-gallery"></span>
                                            <div class="post-gallery media">
                                                <div class="post-category">
                                                    <ul class="post-categories">
                                                        <li><a href="#" rel="category tag">Styling</a></li>
                                                    </ul>
                                                </div>
                                                <ul class="slides">
                                                    <li>
                                                        <div class="nz-thumbnail"><img width="870" height="570" src="upload/blog6-870x570.jpg" class="attachment-Montserrat-Ninzio-Whole size-Montserrat-Ninzio-Whole wp-post-image" alt="blog6"  />
                                                            <div class="ninzio-overlay">
                                                                <a class="nz-overlay-before portfolio-link" title="View details" href="#"></a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="nz-thumbnail"><img src="upload/blog2-870x570.jpg" alt="Welcome to Ninzio Painting and Repairing">
                                                            <div class="ninzio-overlay">
                                                                <a class="nz-overlay-before portfolio-link" title="View details" href="#"></a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="nz-thumbnail"><img src="upload/blog8-870x570.jpg" alt="Welcome to Ninzio Painting and Repairing">
                                                            <div class="ninzio-overlay">
                                                                <a class="nz-overlay-before portfolio-link" title="View details" href="#"></a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="nz-thumbnail"><img src="upload/blog7-870x570.jpg" alt="Welcome to Ninzio Painting and Repairing">
                                                            <div class="ninzio-overlay">
                                                                <a class="nz-overlay-before portfolio-link" title="View details" href="#"></a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="nz-thumbnail"><img src="upload/blog5-870x570.jpg" alt="Welcome to Ninzio Painting and Repairing">
                                                            <div class="ninzio-overlay">
                                                                <a class="nz-overlay-before portfolio-link" title="View details" href="#"></a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                              <div class="post-body">
                                                <div class="post-body-in">
                                      <div class="format-wrapper nz-clearfix">
                                                    <h3 class="post-title">
                                        <a href="#" title="Read more about Welcome to Responsive Retina-Ready WP Theme" rel="bookmark">
                                            Welcome to Responsive Retina-Ready WP Theme                     </a>
                                    </h3>
                                                    <div class="postmeta">

                                                        <span class="post-comments">
                                                                            <a href="#">Comments 1</a>                                                   </span>

                                                        <div class="post-author">montserrat@admin</div>

                                                        <div class="post-category"><a href="#" rel="category tag">Design</a></div>
                                                    </div>
                                                    <div class="post-excerpt" style="    font-size: 14px; margin-bottom: 22px;  line-height: 25px;  font-family: Open Sans;    font-style: normal;">Who can forget the GIFs of the ‘90s, or the more up-to-date focus on flat design? Recently, we’ve seen a surge in popularity of responsive web design, as more and more sites join the drive to become ‘mobile ready’ which is now even more important in the wake of Google’s Mobile Friendly update. [...]</div>
                                                    <a class="post-more" href="#">Read more<span class="screen-reader-text"> Welcome to Responsive Retina-Ready WP Theme</span></a>
                                                </div>
                                            </div>
                                            </div>

                                        </article>--%>                                      
                                      <%--  <article data-grid="ninzio_01" class="post-194 post type-post status-publish format-aside has-post-thumbnail hentry category-marketing tag-design tag-eva tag-external tag-logo tag-marketing tag-ninzio-style tag-painting tag-smart post_format-post-format-aside" id="post-194">
                                            <div class="post-date-custom"><span>31</span><span>Mar</span></div>
                                            <span class="post-format-status format-audio"></span>
                                            <div class="post-audio media">
                                                
                                                <audio class="wp-audio-shortcode" id="audio-3227-1" preload="none"  controls="controls">
                                                    <source type="audio/mpeg" src="upload/vincent230a.mp3?_=1" />
                                                    <source type="audio/ogg" src="upload/vincent230a.ogg?_=1" /><a href="upload/vincent.mp3">http://ninzio.com/montserrat/wp-content/uploads/vincent.mp3</a></audio>
                                            </div>
                                             <div class="post-body">
                                                <div class="post-body-in">
                                      <div class="format-wrapper nz-clearfix">
                                                    <h3 class="post-title">
                                        <a href="#" title="Read more about Welcome to Responsive Retina-Ready WP Theme" rel="bookmark">
                                            Welcome to Responsive Retina-Ready WP Theme                     </a>
                                    </h3>
                                                    <div class="postmeta">

                                                        <span class="post-comments">
                                                                            <a href="#">Comments 1</a>                                                   </span>

                                                        <div class="post-author">montserrat@admin</div>

                                                        <div class="post-category"><a href="#" rel="category tag">Design</a></div>
                                                    </div>
                                                    <div class="post-excerpt" style="    font-size: 14px; margin-bottom: 22px;  line-height: 25px;  font-family: Open Sans;    font-style: normal;">Who can forget the GIFs of the ‘90s, or the more up-to-date focus on flat design? Recently, we’ve seen a surge in popularity of responsive web design, as more and more sites join the drive to become ‘mobile ready’ which is now even more important in the wake of Google’s Mobile Friendly update. [...]</div>
                                                    <a class="post-more" href="#">Read more<span class="screen-reader-text"> Welcome to Responsive Retina-Ready WP Theme</span></a>
                                                </div>
                                            </div>
                                            </div>
                                        </article>--%>
                                      <%--  <article data-grid="ninzio_01" class="post-194 post type-post status-publish format-aside has-post-thumbnail hentry category-marketing tag-design tag-eva tag-external tag-logo tag-marketing tag-ninzio-style tag-painting tag-smart post_format-post-format-aside" id="post-194">
                                            <div class="post-date-custom"><span>31</span><span>Mar</span></div>
                                            <span class="post-format-status format-video"></span>
                                            <div class="post-video media">
                                                <div id="div_f795_2" class="wp-video">
                                                    
                                                    <video class="wp-video-shortcode" id="video-3223-1" width="640" height="360" poster="upload/blog11.jpg" preload="metadata" controls="controls">
                                                        <source type="video/mp4" src="upload/video230a.mp4?_=1" />
                                                        <source type="video/webm" src="upload/video230a.webm?_=1" />
                                                        <source type="video/ogg" src="upload/video230a.ogv?_=1" /><a href="upload/video.mp4">http://ninzio.com/montserrat/wp-content/uploads/video.mp4</a></video>
                                                </div>
                                            </div>
                                             <div class="post-body">
                                                <div class="post-body-in">
                                      <div class="format-wrapper nz-clearfix">
                                                    <h3 class="post-title">
                                        <a href="#" title="Read more about Welcome to Responsive Retina-Ready WP Theme" rel="bookmark">
                                            Welcome to Responsive Retina-Ready WP Theme                     </a>
                                    </h3>
                                                    <div class="postmeta">

                                                        <span class="post-comments">
                                                                            <a href="#">Comments 1</a>                                                   </span>

                                                        <div class="post-author">montserrat@admin</div>

                                                        <div class="post-category"><a href="#" rel="category tag">Design</a></div>
                                                    </div>
                                                    <div class="post-excerpt" style="    font-size: 14px; margin-bottom: 22px;  line-height: 25px;  font-family: Open Sans;    font-style: normal;">Who can forget the GIFs of the ‘90s, or the more up-to-date focus on flat design? Recently, we’ve seen a surge in popularity of responsive web design, as more and more sites join the drive to become ‘mobile ready’ which is now even more important in the wake of Google’s Mobile Friendly update. [...]</div>
                                                    <a class="post-more" href="#">Read more<span class="screen-reader-text"> Welcome to Responsive Retina-Ready WP Theme</span></a>
                                                </div>
                                            </div>
                                            </div>
                                        </article>--%>
                                      <%-- <article data-grid="ninzio_01" class="post-194 post type-post status-publish format-aside has-post-thumbnail hentry category-marketing tag-design tag-eva tag-external tag-logo tag-marketing tag-ninzio-style tag-painting tag-smart post_format-post-format-aside" id="post-194">
                                            <div class="post-date-custom"><span>31</span><span>Mar</span></div>
                                            <span class="post-format-status format-standard"></span>
                                            <div class="nz-thumbnail">
                                                <div class="post-category">
                                                    <ul class="post-categories">
                                                        <li><a href="#" rel="category tag">General</a></li>
                                                        <li><a href="#" rel="category tag">Painting</a></li>
                                                    </ul>
                                                </div><img width="870" height="570" src="upload/blog12-870x570.jpg" class="attachment-Montserrat-Ninzio-Whole size-Montserrat-Ninzio-Whole wp-post-image" alt="blog12" />
                                                <div class="ninzio-overlay">
                                                    <a class="nz-overlay-before" title="View details" href="#"></a>
                                                </div>
                                            </div>
                                           <div class="post-body">
                                                <div class="post-body-in">
                                      <div class="format-wrapper nz-clearfix">
                                                    <h3 class="post-title">
                                        <a href="#" title="Read more about Welcome to Responsive Retina-Ready WP Theme" rel="bookmark">
                                            Welcome to Responsive Retina-Ready WP Theme                     </a>
                                    </h3>
                                                    <div class="postmeta">

                                                        <span class="post-comments">
                                                                            <a href="#">Comments 1</a>                                                   </span>

                                                        <div class="post-author">montserrat@admin</div>

                                                        <div class="post-category"><a href="#" rel="category tag">Design</a></div>
                                                    </div>
                                                    <div class="post-excerpt" style="    font-size: 14px; margin-bottom: 22px;  line-height: 25px;  font-family: Open Sans;    font-style: normal;">Who can forget the GIFs of the ‘90s, or the more up-to-date focus on flat design? Recently, we’ve seen a surge in popularity of responsive web design, as more and more sites join the drive to become ‘mobile ready’ which is now even more important in the wake of Google’s Mobile Friendly update. [...]</div>
                                                    <a class="post-more" href="#">Read more<span class="screen-reader-text"> Welcome to Responsive Retina-Ready WP Theme</span></a>
                                                </div>
                                            </div>
                                            </div>

                                        </article>--%>

                                    </div>
                                </section>









                            </section>
                            <aside class="sidebar">

                               <uc1:Newregistration ID="Newregistration1" runat="server" />


                          
                                </aside>
                          

                        </div>
                    </div>

                </div>



</asp:Content>

