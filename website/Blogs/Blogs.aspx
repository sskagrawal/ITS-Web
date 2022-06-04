<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Blogs.aspx.cs" Inherits="Blog_Blogs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <header class="rich-header page-header version1" data-parallax="true" id="header_53cb_0">
                    <div class="parallax-container" id="div_53cb_0">&nbsp;</div>
                    <div class="container nz-clearfix">
                        <div class="rh-content">
                            <h1 >ITS  Blog</h1>
                            <div class="rh-separator">&nbsp;</div>
                            <div id="div_53cb_1" class="nz-breadcrumbs nz-clearfix"><a href="index.html">Home</a></div>
                        </div>
                    </div>
                    <div id="slider-arrow" data-target="#nz-target" data-from="90" data-offset="90" class="i-separator animate nz-clearfix"><i class="icon-arrow-down10"></i></div>
                </header>
                <div class="blog-layout-wrap medium sidebar-false" id="nz-target">

                    <div id="loop" class="loop">
                        <div class="container nz-clearfix">

                            <section class="content lazy blog-layout nz-clearfix">
                                <div class="blog-post blog-post-1 nz-clearfix">

                           <asp:Literal id="ltrblog" runat="server"></asp:Literal>


                                    <%--<article data-grid="ninzio_01" class="post-195 post type-post status-publish format-standard has-post-thumbnail sticky hentry category-design tag-design tag-eva tag-external tag-free tag-logo tag-repairing tag-shopping tag-smart" id="post-195">
                                        <div class="nz-thumbnail">
                                            <div class="post-category">
                                                <ul class="post-categories">
                                                    <li><a href="#" rel="category tag">Design</a></li>
                                                </ul>
                                            </div><img width="640" height="520" src="../upload/blog1-640x520.jpg" class="attachment-Montserrat-Ninzio-Half size-Montserrat-Ninzio-Half wp-post-image" alt="blog1" />
                                            <div class="ninzio-overlay">
                                                <a class="nz-overlay-before" title="View details" href="#"></a>
                                            </div>
                                        </div>
                                        <div class="post-body">
                                            <div class="post-body-in">
                                                <span class="sticky-ind"></span>
                                                <h3 class="post-title">
                                        <a href="#" title="Read more about Welcome to Responsive Retina-Ready WP Theme" rel="bookmark">
                                            Welcome to Responsive Retina-Ready WP Theme                     </a>
                                    </h3>
                                                <div class="post-date-full">8 Sep 2015</div>
                                                <div class="post-excerpt">Who can forget the GIFs of the ‘90s, or the more up-to-date focus on flat design? Recently, we’ve seen a surge in popularity of responsive web design, as more and [...]</div>
                                                <a class="post-more" href="#">Read more<span class="screen-reader-text"> Welcome to Responsive Retina-Ready WP Theme</span></a>
                                            </div>
                                        </div>

                                    </article>--%>




                                    <%--<article data-grid="ninzio_01" class="post-194 post type-post status-publish format-aside has-post-thumbnail hentry category-marketing tag-design tag-eva tag-external tag-logo tag-marketing tag-ninzio-style tag-painting tag-smart post_format-post-format-aside" id="post-194">
                                        <div class="nz-thumbnail">
                                            <div class="post-category">
                                                <ul class="post-categories">
                                                    <li><a href="#" rel="category tag">Marketing</a></li>
                                                </ul>
                                            </div><img width="640" height="520" src="../upload/blog2-640x520.jpg" class="attachment-Montserrat-Ninzio-Half size-Montserrat-Ninzio-Half wp-post-image" alt="blog2" />
                                            <div class="ninzio-overlay">
                                                <a class="nz-overlay-before" title="View details" href="#"></a>
                                            </div>
                                        </div>
                                        <div class="post-body">
                                            <div class="post-body-in">
                                                <h3 class="post-title">
                                        <a href="#" title="Read more about WordPress Responsive Transportation" rel="bookmark">
                                            WordPress Responsive Transportation                     </a>
                                    </h3>
                                                <div class="post-date-full">3 Sep 2015</div>
                                                <div class="post-excerpt">Here at Cerasis, we think it’s important that our clients and customers understand that transportation reverse logistics (or reverse logistics in general for that [...]</div>
                                                <a class="post-more" href="#">Read more<span class="screen-reader-text"> WordPress Responsive Transportation</span></a>
                                            </div>
                                        </div>

                                    </article>--%>

                                    

                                    

                                 
                                </div>
                            </section>
                            <nav class=ninzio-navigation>
                                <ul class='page-numbers'>
                                    <li><span class='page-numbers current'>1</span></li>
                                    <li><a class='page-numbers' href='#'>2</a></li>
                                    <li><a class="next page-numbers" href="#"><span class="icon icon-arrow-right8"></span></a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>

                </div>


</asp:Content>

