<%@ Page Title="Portfolio Website Design | ITS Gwalior" MetaDescription="ITS Gwalior is Spicalize in Best Web Design and Digital Marketing Company in Gwalior. and Check Our last Work Portfolio Website Design." MetaKeywords="portfolio website design, web design work, companies web design, india web design, development website." Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="portfolio.aspx.cs" Inherits="work_portfolio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     
    <link rel="canonical" href="https://www.itsgwalior.com/portfolio" />

    <style>
.nz-thumbnail1{
height:400px !important;
background:#999;
background-size: cover;
background-position: top;
-webkit-transition: background-position 4s; /* Safari prior 6.1 */
transition: background-position 4s;
}

.nz-thumbnail1:hover{
background-position: bottom;
}

@media screen and (max-width: 768px) {
        .loop .projects-layout .projects, .nz-recent-projects .projects {
            overflow: hidden;
            max-width: 100%;
            margin-bottom: 0px;
            display: block;
            width: 100% !important;
        }
    }

</style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


     <header class="rich-header page-header version1" data-parallax="true" id="header_4129_0">
                    <div class="parallax-container" id="div_4129_0">&nbsp;</div>
                    <div class="container nz-clearfix">
                        <div class="rh-content">
                            <h1>Port Folio</h1>
                            <div class="rh-separator">&nbsp;</div>
                            <div id="div_4129_1" class="nz-breadcrumbs nz-clearfix"><a href="index.html">Home</a></div>
                        </div>
                    </div>
                    <div id="slider-arrow" data-target="#nz-target" data-from="90" data-offset="90" class="i-separator animate nz-clearfix"><i class="icon-arrow-down10"></i></div>
        </header>

    <div class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page wpb-js-composer js-comp-ver-4.12 vc_responsive ">
    <!-- general wrap start -->
    <div id="gen-wrap">

        <div class="site-overlay">&nbsp;</div>

        <!-- wrap start -->
        <div id="wrap" class="nz-wide">
            <div class="page-content-wrap">
                <div class="shop-layout-wrap medium" id="nz-target">
                    <div class="loop">



                        <div class="container">
                            <section class="content projects-layout medium-standard lazy nz-clearfix">
                                <div class="projects-post projects-post-1 nz-clearfix">


                                 <%--     <p class="woocommerce-result-count">
                                    Showing 1 &ndash; <asp:Label ID="lblObtrecord" runat="server"></asp:Label> of <asp:Label ID="lbltotalrecord" runat="server"></asp:Label> results

                                </p>


                                     <div class="woocommerce-ordering">     
                                   
                                   
                                    <asp:DropDownList ID="drdporttype" runat="server" OnSelectedIndexChanged="drdporttype_SelectedIndexChanged" AutoPostBack="true"> 
                                        <asp:ListItem value="0"> Select</asp:ListItem>
                                        <asp:ListItem value="ecom"> E-commerce</asp:ListItem> 
                                        <asp:ListItem value="edu"> Education</asp:ListItem>
                                        <asp:ListItem value="ind"> Industry</asp:ListItem>
                                        <asp:ListItem value="int"> International</asp:ListItem>
                                        <asp:ListItem value="oth"> Other</asp:ListItem>
                                    </asp:DropDownList>
                                 </div>--%>



                                    <asp:Literal ID="ltrPortFolio" runat="server"></asp:Literal>


                                   <%-- <article data-grid="ninzio_01" class="all repairing restyling post-5853 projects type-projects status-publish has-post-thumbnail hentry projects-category-repairing projects-category-restyling" id="post-5853">

                                        <div class="nz-thumbnail nz-thumbnail1" style="background-image:url('PortfolioImage/img1.png')">
                                         
                                        </div>
                                        <div class="project-details">
                                            <h4 class="project-title">
                                                <a href="#">Max Project Name</a>
                                            </h4>
                                            <div class="projects-category">
                                                <a href="#" rel="tag">Repairing</a>, <a href="#" rel="tag">Restyling</a> </div>
                                        </div>
                                    </article>--%>


                                    <%--<article data-grid="ninzio_01" class="all repairing restyling post-5853 projects type-projects status-publish has-post-thumbnail hentry projects-category-repairing projects-category-restyling" id="post-5853">

                                        <div class="nz-thumbnail nz-thumbnail1" style="background-image:url('PortfolioImage/img2.png')">
                                            <!--bg image-->
                                        </div>
                                        <div class="project-details">
                                            <h4 class="project-title">
                                                <a href="#">Max Project</a>
                                            </h4>
                                            <div class="projects-category">
                                                <a href="#" rel="tag">Repairing</a>, <a href="#" rel="tag">Restyling</a> </div>
                                        </div>
                                    </article>--%>

                                    <%--<article data-grid="ninzio_01" class="all repairing restyling post-5853 projects type-projects status-publish has-post-thumbnail hentry projects-category-repairing projects-category-restyling" id="post-5853">

                                        <div class="nz-thumbnail nz-thumbnail1" style="background-image:url('PortfolioImage/img3.png')">
                                            <!--bg image-->
                                        </div>
                                        <div class="project-details">
                                            <h4 class="project-title">
                                                <a href="#">Max Project</a>
                                            </h4>
                                            <div class="projects-category">
                                                <a href="#" rel="tag">Repairing</a>, <a href="#" rel="tag">Restyling</a> </div>
                                        </div>
                                    </article>--%>





<%--                                    <article data-grid="ninzio_01" class="all repairing restyling post-5853 projects type-projects status-publish has-post-thumbnail hentry projects-category-repairing projects-category-restyling" id="post-5853">

                                        <div class="nz-thumbnail nz-thumbnail1" style="background-image:url('portfolio_image/img1.png')">
                                            <!--bg image-->
                                        </div>
                                        <div class="project-details">
                                            <h4 class="project-title">
                                                <a href="#">Max Project</a>
                                            </h4>
                                            <div class="projects-category">
                                                <a href="#" rel="tag">Repairing</a>, <a href="#" rel="tag">Restyling</a> </div>
                                        </div>
                                    </article>


                                    <article data-grid="ninzio_01" class="all repairing restyling post-5853 projects type-projects status-publish has-post-thumbnail hentry projects-category-repairing projects-category-restyling" id="post-5853">

                                        <div class="nz-thumbnail nz-thumbnail1" style="background-image:url('portfolio_image/img2.png')">
                                            <!--bg image-->
                                        </div>
                                        <div class="project-details">
                                            <h4 class="project-title">
                                                <a href="#">Max Project</a>
                                            </h4>
                                            <div class="projects-category">
                                                <a href="#" rel="tag">Repairing</a>, <a href="#" rel="tag">Restyling</a> </div>
                                        </div>
                                    </article>

                                    <article data-grid="ninzio_01" class="all repairing restyling post-5853 projects type-projects status-publish has-post-thumbnail hentry projects-category-repairing projects-category-restyling" id="post-5853">

                                        <div class="nz-thumbnail nz-thumbnail1" style="background-image:url('portfolio_image/img3.png')">
                                            <!--bg image-->
                                        </div>
                                        <div class="project-details">
                                            <h4 class="project-title">
                                                <a href="#">Max Project</a>
                                            </h4>
                                            <div class="projects-category">
                                                <a href="#" rel="tag">Repairing</a>, <a href="#" rel="tag">Restyling</a> </div>
                                        </div>
                                    </article>





                                    <article data-grid="ninzio_01" class="all repairing restyling post-5853 projects type-projects status-publish has-post-thumbnail hentry projects-category-repairing projects-category-restyling" id="post-5853">

                                        <div class="nz-thumbnail nz-thumbnail1" style="background-image:url('portfolio_image/img1.png')">
                                            <!--bg image-->
                                        </div>
                                        <div class="project-details">
                                            <h4 class="project-title">
                                                <a href="#">Max Project</a>
                                            </h4>
                                            <div class="projects-category">
                                                <a href="#" rel="tag">Repairing</a>, <a href="#" rel="tag">Restyling</a> </div>
                                        </div>
                                    </article>


                                    <article data-grid="ninzio_01" class="all repairing restyling post-5853 projects type-projects status-publish has-post-thumbnail hentry projects-category-repairing projects-category-restyling" id="post-5853">

                                        <div class="nz-thumbnail nz-thumbnail1" style="background-image:url('portfolio_image/img2.png')">
                                            <!--bg image-->
                                        </div>
                                        <div class="project-details">
                                            <h4 class="project-title">
                                                <a href="#">Max Project</a>
                                            </h4>
                                            <div class="projects-category">
                                                <a href="#" rel="tag">Repairing</a>, <a href="#" rel="tag">Restyling</a> </div>
                                        </div>
                                    </article>

                                    <article data-grid="ninzio_01" class="all repairing restyling post-5853 projects type-projects status-publish has-post-thumbnail hentry projects-category-repairing projects-category-restyling" id="post-5853">

                                        <div class="nz-thumbnail nz-thumbnail1" style="background-image:url('portfolio_image/img3.png')">
                                            <!--bg image-->
                                        </div>
                                        <div class="project-details">
                                            <h4 class="project-title">
                                                <a href="#">Max Project</a>
                                            </h4>
                                            <div class="projects-category">
                                                <a href="#" rel="tag">Repairing</a>, <a href="#" rel="tag">Restyling</a> </div>
                                        </div>
                                    </article>                                               
                                                         --%>        

                                </div>
                            </section>
                        </div>
                        </div>
                    </div>
                </div>
              </div>
            </div>
         </div>

</asp:Content>

