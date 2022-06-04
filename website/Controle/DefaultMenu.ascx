<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DefaultMenu.ascx.cs" Inherits="Controle_DefaultMenu" %>
   <div class='site-widget-area widget-area'>
            <div class="mob-sidebar-toggle2"></div>
            <div class="custom-scroll-bar">

              <%--  Mobile Menu--%>



                 <div id="tag_cloud-4" class="widget widget_tag_cloud">
                    <h6 class="widget_title">Jobs</h6>
                    <div class="tagcloud">
                        <a runat="server" href="~/Job/find-job.aspx" class='tag-link-108 tag-link-position-1' title='Find Job' id="a_cc3d_0">Find Job</a>
                        <a runat="server" href="~/Jobseeker/hire-employees.aspx" class='tag-link-67 tag-link-position-2' title='Hire Employee' id="a_cc3d_1">Hire Employee</a>
                        <a runat="server" href="~/Job/Register.aspx" class='tag-link-67 tag-link-position-2' title='register' id="a11">Register</a>
                    </div>
                </div>

                <div id="nav_menu-2" class="widget widget_nav_menu">
                    <div class="menu-sidebar-menu-container">
                        <ul id="menu-sidebar-menu" class="menu">
                            <li class="menu-item menu-item-has-children"><a href="../about-us.aspx">About</a>
                               <%-- <ul class="sub-menu">
                                    <li class="menu-item"><a runat="server" href="~/Company/about-us.aspx">Profile</a></li>
                                   <li class="menu-item"><a runat="server" href="~/Company/testimonials.aspx">Testimonials</a></li>
                                    <li class="menu-item"><a runat="server" href="~/Company/client.aspx">Clients</a></li>                   
                                    
                                     <li class="menu-item"><a href="#">Partners</a></li> 
                                    
                                </ul>--%>
                            </li>
                            
                            <li class="News"><a runat="server" href="~/Blogs/Blogs.aspx">Blogs</a></li>
                            <li class="News"><a runat="server" href="~/domain-hosting.aspx">Domain Hosting</a></li>
                             <li class="News"><a runat="server" href="~/website-maintence.aspx">AMC Service</a></li>
                          <%--  <li class="News"><a runat="server" href="~/portfolio.aspx">Work</a></li>--%>
                        </ul>
                    </div>
                </div>
               

             

<%--                <div id="Div13" class="widget widget_tag_cloud">
                    <h6 class="widget_title">AMC Service</h6>
                    <div class="tagcloud">
                        <a href='#' class='tag-link-108 tag-link-position-1' title='5 topics' id="a1">Online Exam</a>
                        <a href='#' class='tag-link-67 tag-link-position-2' title='13 topics' id="a2">coachings</a>
                       </div>
                </div>--%>
            


            </div>
        </div>
        <div class="site-overlay">&nbsp;</div>
        

        <!-- wrap start -->
        <div id="wrap" class="nz-wide">

            <header class="header mob-header cart-true nz-clearfix">
                <div class="mob-header-top nz-clearfix">
                    <div class="container">
                        <div class="logo logo-mob">
                            <a runat="server" href="~/default.aspx" title="Web design company in Gwalior">
                                <img id="img_280f_0" runat="server" src="~/upload/logo.png"  style="margin-top: 10px; width: 200px;" alt="Web design company in Gwalior">
                            </a>
                        </div>
                        <span class="mob-menu-toggle"></span>
                        <span class="mob-sidebar-toggle"></span>
                    </div>
                </div>
                <div class="mob-header-content nz-clearfix">

                    <div class="container">

                        <nav class="mob-menu nz-clearfix"> 
                            <ul  class="menu">
                                <li class="menu-item current-menu-item current_page_item menu-item-home menu-item-has-children" data-mm="false" data-mmc="2"><a runat="server" href="~/default.aspx"><span class="mi"></span><span class="txt">Home</span><span class="di icon-arrow-right9"></span></a>
                                </li>

                         <%--      Mobile Menu Bar--%>
                             <li class="menu-item menu-item-has-children megamenu2-1" data-mm="true" data-mmc="4"><a runat="server" href="~/it-services-in-gwalior.aspx"><span class="mi"></span><span class="txt">IT-Services</span><span class="di icon-arrow-right9"></span></a>
                                    <ul class="sub-menu">
                                        <li class="menu-item menu-item-has-children" data-mm="false" data-mmc="2"><a runat="server" href="~/It-services/design-company-in-gwalior.aspx"><span class="mi"></span><span class="txt">design</span><span class="di icon-arrow-right9"></span></a>
                                            <ul class="sub-menu">
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/it-services/web-design-company.aspx"><span class="mi"></span><span class="txt">website design</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/it-services/graphics-design.aspx"><span class="mi"></span><span class="txt">Graphic design</span><span class="di icon-arrow-right9"></span></a></li>
												
                                                <%--<li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/it-services/design/psd-design.aspx"><span class="mi"></span><span class="txt">UI-UX Design</span><span class="di icon-arrow-right9"></span></a></li>--%>			
                                                	<li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/it-services/ppt.aspx"><span class="mi"></span><span class="txt">PPT design</span><span class="di icon-arrow-right9"></span></a></li>									
								                    <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/it-services/ux-design-company-in-gwalior-india.aspx"><span class="mi"></span><span class="txt">UI UX Designer</span><span class="di icon-arrow-right9"></span></a></li>	
                                                
                                                
                                                	<%--	<li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/it-services/design/ppt.aspx"><span class="mi"></span><span class="txt">PPT design</span><span class="di icon-arrow-right9"></span></a></li>--%>
                                                  
                                            </ul>
                                            </li>
                                        <li class="menu-item menu-item-has-children" data-mm="false" data-mmc="2"><a runat="server" href="~/it-services/web-development-company-in-gwalior.aspx"><span class="mi"></span><span class="txt">development</span><span class="di icon-arrow-right9"></span></a>
										 <ul class="sub-menu">
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/It-services/website-development-company.aspx"><span class="mi"></span><span class="txt">Website Development</span><span class="di icon-arrow-right9"></span></a></li>
												
												 <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/it-services/mobile-app-development-company.aspx"><span class="mi"></span><span class="txt">Mobile App Development</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/it-services/software-company.aspx"><span class="mi"></span><span class="txt">Software Development</span><span class="di icon-arrow-right9"></span></a></li>
                                             <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/It-services/ecommerce-development.aspx"><span class="mi"></span><span class="txt">E-Commerce Development</span><span class="di icon-arrow-right9"></span></a></li>
                                              <%--<li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/It-services/development/web-portal.aspx"><span class="mi"></span><span class="txt">Apps Development</span><span class="di icon-arrow-right9"></span></a></li>--%>
                                               <%-- <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/It-services/video-agency-in-gwalior.aspx"><span class="mi"></span><span class="txt">Video Development</span><span class="di icon-arrow-right9"></span></a></li>--%>
                                             </ul>
                                            </li>
                                        <li class="menu-item menu-item-has-children" data-mm="false" data-mmc="2"><a runat="server" href="../it-services/digital-marketing-in-gwalior.aspx"><span class="mi"></span><span class="txt">digital marketing </span><span class="di icon-arrow-right9"></span></a>
                                            <ul class="sub-menu">
                                                             <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/digital-marketing/seo-services.aspx"><span class="mi"></span><span class="txt">SEO Services</span><span class="di icon-arrow-right9"></span></a></li>
                                                             <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/digital-marketing/social-media-manager.aspx"><span class="mi"></span><span class="txt">Social Media Manager</span><span class="di icon-arrow-right9"></span></a></li>
                                                             <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/digital-marketing/google-digital-marketing.aspx"><span class="mi"></span><span class="txt">Google Digital Marketing</span><span class="di icon-arrow-right9"></span></a></li>
                                                             <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/digital-marketing/ppc-marketing.aspx"><span class="mi"></span><span class="txt">PPC Marketing</span><span class="di icon-arrow-right9"></span></a></li>
                                                        </ul>
                                                    </li>
                                      <li class="menu-item menu-item-has-children" data-mm="false" data-mmc="2"><a runat="server" href="~/it-services/best-training-institute.aspx"><span class="mi"></span><span class="txt">it courses</span><span class="di icon-arrow-right9"></span></a>
                                                <ul class="sub-menu">
                                                    <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/training/digital-marketing-course.aspx"><span class="mi"></span><span class="txt">Digital Marketing Course</span><span class="di icon-arrow-right9"></span></a></li>
                                                    <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/training/web-design-course.aspx"><span class="mi"></span><span class="txt">Web designing Course</span><span class="di icon-arrow-right9"></span></a></li>
                                                    <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/training/web-development-course"><span class="mi"></span><span class="txt">Web Development Course</span><span class="di icon-arrow-right9"></span></a></li>
                                                    <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/training/graphic-design-course.aspx"><span class="mi"></span><span class="txt">Graphic designing Course</span><span class="di icon-arrow-right9"></span></a></li>
                                                   
                                                </ul>
                                            </li>	 
                                         </ul>
                                       </li>
                                   
                                <li class="menu-item menu-item-has-children" data-mm="false" data-mmc="2"><a runat="server" href="~/portfolio.aspx"><span class="mi"></span><span class="txt">Work</span><span class="di icon-arrow-right9"></span></a></li>
                                  
                                       
                              <%--  <li class="menu-item menu-item-has-children" data-mm="false" data-mmc="2"><a href="#"><span class="mi"></span><span class="txt">Video Production</span><span class="di icon-arrow-right9"></span></a>
                                           
                                                </li>--%>
                                   <li class="menu-item menu-item-has-children megamenu2-1" data-mm="true" data-mmc="4"><a href="#"><span class="mi"></span><span class="txt">Shopping</span><span class="di icon-arrow-right9"></span></a>
                                            <asp:Literal ID="ltrlMobShop" runat="server"></asp:Literal>
                                            <%--<ul class="sub-menu">
                                        <li class="menu-item menu-item-has-children" data-mm="false" data-mmc="2"><a href="#"><span class="mi"></span><span class="txt">Headers</span><span class="di icon-arrow-right9"></span></a>
                                            <ul class="sub-menu">
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="header-version%3dv1.html"><span class="mi"></span><span class="txt">Header Version 1</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="header-version%3dv2.html"><span class="mi"></span><span class="txt">Header Version 2</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="header-version%3dv3.html"><span class="mi"></span><span class="txt">Header Version 3</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="header-version%3dv4.html"><span class="mi"></span><span class="txt">Header Version 4</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="header-version%3dv5.html"><span class="mi"></span><span class="txt">Header Version 5</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="header-version%3dv6.html"><span class="mi"></span><span class="txt">Header Version 6</span><span class="di icon-arrow-right9"></span></a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item menu-item-has-children" data-mm="false" data-mmc="2"><a href="#.html"><span class="mi"></span><span class="txt">Headers</span><span class="di icon-arrow-right9"></span></a>
                                            <ul class="sub-menu">
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="header-version%3dv7.html"><span class="mi"></span><span class="txt">Header Version 7</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="header-version%3dv8.html"><span class="mi"></span><span class="txt">Header Version 8</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="header-version%3dv9.html"><span class="mi"></span><span class="txt">Header Version 9</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="header-version%3dv10.html"><span class="mi"></span><span class="txt">Header Version 10</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="header-version%3dv11.html"><span class="mi"></span><span class="txt">Header Version 11</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="header-version%3dv12.html"><span class="mi"></span><span class="txt">Header Version 12</span><span class="di icon-arrow-right9"></span></a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item menu-item-has-children" data-mm="false" data-mmc="2"><a href="#"><span class="mi"></span><span class="txt">Page Titles</span><span class="di icon-arrow-right9"></span></a>
                                            <ul class="sub-menu">
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="page-title-version-1.html"><span class="mi"></span><span class="txt">Page Title Version 1</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="page-title-version-2.html"><span class="mi"></span><span class="txt">Page Title Version 2</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="page-title-version-3.html"><span class="mi"></span><span class="txt">Page Title Version 3</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="page-title-version-4.html"><span class="mi"></span><span class="txt">Page Title Version 4</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="page-title-version-5.html"><span class="mi"></span><span class="txt">Page Title Version 5</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="page-title-version-6.html"><span class="mi"></span><span class="txt">Page No Title Section</span><span class="di icon-arrow-right9"></span></a></li>
                                            </ul>
                                        </li>
                                    </ul>--%>
                                         </li>
                               
                               <%--  <li class="menu-item menu-item-has-children" data-mm="false" data-mmc="2"><a href="#"><span class="mi"></span><span class="txt">Tech Support</span><span class="di icon-arrow-right9"></span></a>
                                             <ul class="sub-menu">
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/WebSolution/website-maintence.aspx"><span class="mi"></span><span class="txt">Website Maintenance </span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/WebSolution/domain-hosting.aspx"><span class="mi"></span><span class="txt">Domain & hosting </span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="#"><span class="mi"></span><span class="txt">Computer </span><span class="di icon-arrow-right9"></span></a>
                                                   <ul class="sub-menu">
                                                      <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/Services/Support/computer-support.aspx"><span class="mi"></span><span class="txt">Computer Support</span><span class="di icon-arrow-right9"></span></a></li>
                                                        <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/Services/Support/hardware-networking.aspx"><span class="mi"></span><span class="txt">Hardware/Networking</span><span class="di icon-arrow-right9"></span></a></li>
                                                        <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/Services/Support/computer-upgrade.aspx"><span class="mi"></span><span class="txt">Computer Upgrade</span><span class="di icon-arrow-right9"></span></a></li>
                                                        <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/Services/Support/amc-service.aspx"><span class="mi"></span><span class="txt">AMC Services</span><span class="di icon-arrow-right9"></span></a></li>
                                                    </ul>
                                                 </li>
                                             
                                                </ul>
                                                </li>--%>



                                <li class="menu-item menu-item-has-children" data-mm="false" data-mmc="2"><a href="#"><span class="mi"></span><span class="txt">Jobs</span><span class="di icon-arrow-right9"></span></a>
                                             <ul class="sub-menu">
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/Job/find-job.aspx"><span class="mi"></span><span class="txt">Find Job</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/Jobseeker/hire-employees.aspx"><span class="mi"></span><span class="txt">Hire Employee</span><span class="di icon-arrow-right9"></span></a></li>
                                                    <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/Job/Register.aspx"><span class="mi"></span><span class="txt">Register</span><span class="di icon-arrow-right9"></span></a></li>
                                                </ul>
                                                </li>
                                <li class="menu-item menu-item-has-children" data-mm="true" data-mmc="5"><a runat="server" href="~/contact-us.aspx"><span class="mi"></span><span class="txt">Contact</span><span class="di icon-arrow-right9"></span></a>
                                </li>
                            </ul>
                        </nav>
                                <div class="slogan nz-clearfix">
                            <div id="div_280f_0">
                                <div class="nz-bar"><span class="nz-icon none small icon-phone animate-false"></span><span class="header-top-label">Questions?</span> Call us:<a href="tel:8989024130" title="software company contact no.">+91 8989024130</a></div>
                            </div>
                        </div>
                         <a class="top-button" runat="server" href="~/Admin/Login.aspx">Login</a>
  <div class="nz-sl social-links nz-clearfix left">
                           <a rel="nofollow" class="icon-facebook" href="https://www.facebook.com/itssolutiongwalior" title="ITS Gwalior facebook Business Page" target="_blank"></a>
                                <a rel="nofollow" class="icon-instagram" href="https://www.instagram.com/itsgwalior2012/" title="ITS Gwalior Instagram" target="_blank"></a>
                             <a rel="nofollow" class="icon-twitter" href="https://twitter.com/@ItsGwalior" title="ITS Gwalior Twitter" target="_blank"></a>
                            <a rel="nofollow" class="icon-googleplus" href="https://its-gwalior.business.site/" title="ITS Gwalior Business Site" target="_blank"></a>
                        </div> 
                    </div>
                </div>
            </header>
            </div>

            <header class="header desk version2 page-title-section-version1 one-page-side stuck-true top-true full-width-false sl-true search-true cart-true sidebar-toggle-true iversion-light effect-overline hover-effect-fill megamenu-hover-effect-underline subeffect-ghost fixed-true fiversion-dark wiversion-light">

                <div class="header-content">


                    <div class="header-top">
                        <div class="container nz-clearfix">

                            <div class="slogan nz-clearfix">
                                <div id="div_280f_1">
                                    <div class="nz-bar"><span class="nz-icon none small icon-phone animate-false"></span><span class="header-top-label">Questions?</span> Call us : +91 8989024130 </div>
                                </div>
                            </div>

                           <%-- <a class="top-button" data-toggle="modal" data-target="#myModal">Login</a>--%>
                            <a class="top-button" runat="server" href="~/Admin/Login.aspx">Login</a>
                           

                            <nav class="header-top-menu nz-clearfix">
                                <ul id="header-top-menu" class="menu">                                
                                   <%--  <li class="News"><a runat="server" href="~/portfolio.aspx">Work</a></li>--%>
                                    
                                     <li id="menu-item-4553" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-4553"><a href="../website-maintence.aspx"><span class="mi"></span><span class="txt">AMC Service</span></a>
                                      <%--  <ul class="sub-menu">
                                            <li id="menu-item-4564" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-4564"><a href="#"><span class="mi"></span><span class="txt">Online Exam</span></a></li>
                                            <li id="menu-item-4565" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-4565"><a href="#"><span class="mi"></span><span class="txt">coachings</span></a></li>
                                            
                                        </ul>--%>
                                    </li>

                                     <li id="menu-item-4559" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-4553">
                                         
                                         <a href="../domain-hosting.aspx"><span class="mi"></span><span class="txt">Domain Hosting</span></a> </li>

                                   

                                    <li id="menu-item-4555" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-4555"><a runat="server" href="~/Blogs/Blogs.aspx"><span class="mi"></span><span class="txt">Blogs</span></a></li>

                                  
                                   
                                    
                                      <li id="menu-item-4579" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-4579"><a href="../about-us.aspx"><span class="mi"></span><span class="txt">About</span></a>
                                       
                                       <%--  <ul class="sub-menu">
                                            <li id="menu-item-4580" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-4580"><a runat="server" href="~/Company/about-us.aspx"><span class="mi"></span><span class="txt">Profile</span></a></li>

                                            <li id="menu-item-4581" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-4581"><a runat="server" href="~/Company/Testimonials.aspx"><span class="mi"></span><span class="txt">Testimonials</span></a></li>
                                            <li id="menu-item-4582" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-4582"><a runat="server" href="~/Company/client.aspx"><span class="mi"></span><span class="txt">Clients</span></a></li>
                                            <li id="menu-item-4584" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-4584"><a href="#"><span class="mi"></span><span class="txt">Partners</span></a></li>

                                        </ul>--%>

                                    </li>

                                      <li id="menu-item-4554" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-4554"><a href="#"><span class="mi"></span><span class="txt">Job</span></a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-4572" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-4572"><a runat="server" href="~/Job/find-job.aspx"><span class="mi"></span><span class="txt">Find Job</span></a></li>
                                            <li id="menu-item-4573" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-4573"><a runat="server" href="~/Jobseeker/hire-employees.aspx"><span class="mi"></span><span class="txt">Hire Employee</span></a></li>
                                             <li id="menu-item-4574" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-4573"><a runat="server" href="~/Job/Register.aspx"><span class="mi"></span><span class="txt">Register</span></a></li>
                                        </ul>
                                    </li>

                                </ul>
                            </nav>

                        </div>
                    </div>

                    <div class="header-body">
                        <div class="container nz-clearfix">
                            <div class="left-part nz-clearfix">
                                <nav class="header-menu header-menu-1 desk-menu nz-clearfix">
                                     <ul id="header-menu-1" class="menu">
                                          <li class="menu-item current-menu-item current_page_item menu-item-home menu-item-has-children" data-mm="false" data-mmc="2"><a runat="server" href="~/default.aspx"><span class="mi"></span><span class="txt">Home</span><span class="di icon-arrow-right9"></span></a>
                                               
                                            </li>

                                             <%--      Desktop Menu Bar--%>
                                                <li class="menu-item menu-item-has-children megamenu2-1" data-mm="true" data-mmc="4"><a runat="server" href="~/it-services-in-gwalior.aspx"><span class="mi"></span><span class="txt">IT-Services</span><span class="di icon-arrow-right9"></span></a>
                                            <ul class="sub-menu">
                                                <li class="menu-item menu-item-has-children" data-mm="false" data-mmc="2"><a runat="server" href="../it-services/design-company-in-gwalior.aspx"><span class="mi"></span><span class="txt">design</span><span class="di icon-arrow-right9"></span></a>
                                                    <ul class="sub-menu">
                                                        <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/it-services/web-design-company.aspx"><span class="mi"></span><span class="txt">Website Design</span><span class="di icon-arrow-right9"></span></a></li>
                                                        <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/it-services/graphics-design.aspx"><span class="mi"></span><span class="txt">Graphic Design</span><span class="di icon-arrow-right9"></span></a></li>
                                                        <%--<li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/it-services/design/psd-design.aspx"><span class="mi"></span><span class="txt">UI-UX Design</span><span class="di icon-arrow-right9"></span></a></li>--%>
												       <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/it-services/ppt.aspx"><span class="mi"></span><span class="txt">PPT Design</span><span class="di icon-arrow-right9"></span></a></li>
                                                       <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/it-services/ux-design-company-in-gwalior-india.aspx"><span class="mi"></span><span class="txt">UI UX Designer</span><span class="di icon-arrow-right9"></span></a></li>
                                                        
                                                        
                                                    </ul>
                                                    </li>
                                                <li class="menu-item menu-item-has-children" data-mm="false" data-mmc="2"><a runat="server" href="~/it-services/web-development-company-in-gwalior.aspx"><span class="mi"></span><span class="txt">development</span><span class="di icon-arrow-right9"></span></a>
										         <ul class="sub-menu">
                                                        <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/It-services/website-development-company.aspx"><span class="mi"></span><span class="txt">Website Development</span><span class="di icon-arrow-right9"></span></a></li>
												         <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/it-services/mobile-app-development-company.aspx"><span class="mi"></span><span class="txt">Mobile App Development</span><span class="di icon-arrow-right9"></span></a></li>
                                                        <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/It-services/software-company.aspx"><span class="mi"></span><span class="txt">Software Development</span><span class="di icon-arrow-right9"></span></a></li>
                                                       <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/It-services/ecommerce-development.aspx"><span class="mi"></span><span class="txt">E-Commerce Development</span><span class="di icon-arrow-right9"></span></a></li>
                                                      <%--  <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/it-services/video-agency-in-gwalior.aspx"><span class="mi"></span><span class="txt">Video Development</span><span class="di icon-arrow-right9"></span></a></li>--%>
												
                                                    </ul>
                                                </li>
                                                <li class="menu-item menu-item-has-children" data-mm="false" data-mmc="2"><a runat="server" href="../it-services/digital-marketing-in-gwalior.aspx"><span class="mi"></span><span class="txt">Digital Marketing </span><span class="di icon-arrow-right9"></span></a>
                                                              <ul class="sub-menu">
                                                                   <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/digital-marketing/seo-services.aspx"><span class="mi"></span><span class="txt">SEO Services</span><span class="di icon-arrow-right9"></span></a></li>
                                                                   <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/digital-marketing/social-media-manager.aspx"><span class="mi"></span><span class="txt">Social Media Manager</span><span class="di icon-arrow-right9"></span></a></li>
                                                                   <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/digital-marketing/google-digital-marketing.aspx"><span class="mi"></span><span class="txt">Google Digital Marketing</span><span class="di icon-arrow-right9"></span></a></li>
                                                                   <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/digital-marketing/ppc-marketing.aspx"><span class="mi"></span><span class="txt">PPC Marketing</span><span class="di icon-arrow-right9"></span></a></li>
                                                                  
                                                                </ul>
                                                            </li>

                                                 <%--  <li class="menu-item menu-item-has-children" data-mm="false" data-mmc="2"><a runat="server" href="../it-services/best-training-institute.aspx"><span class="mi"></span><span class="txt">training</span><span class="di icon-arrow-right9"></span></a>--%>
                                              <%--  <li class="menu-item menu-item-has-children" data-mm="false" data-mmc="2"><a runat="server" href="../it-services/best-training-institute.aspx"><span class="mi"></span><span class="txt">training</span><span class="di icon-arrow-right9"></span></a>
                                                        <ul class="sub-menu">
                                                            <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/it-services/training/digital-marketing-course.aspx"><span class="mi"></span><span class="txt">Digital Marketing Course</span><span class="di icon-arrow-right9"></span></a></li>
                                                            <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/it-services/training/web-design-course.aspx"><span class="mi"></span><span class="txt">Web Designing Course</span><span class="di icon-arrow-right9"></span></a></li>
                                                            <li class="menu-item" data-mm="false" data-mmc="2"><a  runat="server" href="~/under-construction.aspx"><span class="mi"></span><span class="txt">Web Development Course</span><span class="di icon-arrow-right9"></span></a></li>
                                                            <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/it-services/training/graphic-design-course.aspx"><span class="mi"></span><span class="txt">Graphic Designing Course</span><span class="di icon-arrow-right9"></span></a></li>
                                                        </ul>
                                                    </li>	 --%>

                                                  <li class="menu-item menu-item-has-children" data-mm="false" data-mmc="2"><a runat="server" href="~/it-services/best-training-institute.aspx"><span class="mi"></span><span class="txt">it courses</span><span class="di icon-arrow-right9"></span></a>
                                                <ul class="sub-menu">

                                                     <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/training/digital-marketing-course.aspx"><span class="mi"></span><span class="txt">Digital Marketing Course</span><span class="di icon-arrow-right9"></span></a></li>
                                                    <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/training/web-design-course.aspx"><span class="mi"></span><span class="txt">Web designing Course</span><span class="di icon-arrow-right9"></span></a></li>
                                                    <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/training/web-development-course.aspx"><span class="mi"></span><span class="txt">Web Development Course</span><span class="di icon-arrow-right9"></span></a></li>
                                                    <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/training/graphic-design-course.aspx"><span class="mi"></span><span class="txt">Graphic designing Course</span><span class="di icon-arrow-right9"></span></a></li>


                                                   <%-- <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/it-services/Training/digital-marketing-course.aspx"><span class="mi"></span><span class="txt">Digital Marketing Course</span><span class="di icon-arrow-right9"></span></a></li>
                                                    <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/it-services/Training/web-design-course.aspx"><span class="mi"></span><span class="txt">Web designing Course</span><span class="di icon-arrow-right9"></span></a></li>
                                                    <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/under-construction.aspx"><span class="mi"></span><span class="txt">Web Development Course</span><span class="di icon-arrow-right9"></span></a></li>
                                                    <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/it-services/Training/graphic-design-course.aspx"><span class="mi"></span><span class="txt">Graphic designing Course</span><span class="di icon-arrow-right9"></span></a></li>--%>
                                                   
                                                </ul>
                                            </li>	 


                                          </ul>
                                            <li class="menu-item menu-item-has-children" data-mm="false" data-mmc="2"><a runat="server" href="~/portfolio.aspx"><span class="mi"></span><span class="txt">Work</span><span class="di icon-arrow-right9"></span></a></li>
                                </ul>
                            </nav>
                         </div>
                            <div class="logo-part">
                                <div class="logo logo-desk">
                                    <a runat="server" href="~/Default.aspx" title="ITS GWALIOR">
                                        <img class="normal-logo" id="img_280f_1" runat="server"  src="~/upload/logo 9.png" title="web design company in gwalior" alt="web design company in gwalior"  style="margin-top:15px; width: 200px;">
                                        <img class="fixed-logo" id="img_280f_2" runat="server" src="~/upload/logo.png" title="digital marketing company in gwalior" alt="digital marketing company in gwalior" style="margin-top:-35px; width: 200px;">
                                    </a>
                                </div>
                            </div>
                            <div class="right-part nz-clearfix">
                                <nav class="header-menu header-menu-2 desk-menu nz-clearfix">
                                    <ul id="header-menu-2" class="menu">
                                        <%--<li class="menu-item menu-item-has-children" data-mm="false" data-mmc="2"><a href="#"><span class="mi"></span><span class="txt">Tech Support</span><span class="di icon-arrow-right9"></span></a>
                                             <ul class="sub-menu">
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/WebSolution/website-maintence.aspx"><span class="mi"></span><span class="txt">Website Maintenance </span><span class="di icon-arrow-right9"></span></a></li>
                                             
                                                   <li class="menu-item" data-mm="false" data-mmc="2"><a href="#"><span class="mi"></span><span class="txt">Computer </span><span class="di icon-arrow-right9"></span></a>
                                                       <ul class="sub-menu">
                                                          <li class="menu-item" data-mm="false" data-mmc="2"><a  runat="server" href="~/Services/Support/computer-support.aspx"><span class="mi"></span><span class="txt">Computer Support Onsite/Online</span><span class="di icon-arrow-right9"></span></a></li>
                                                            <li class="menu-item" data-mm="false" data-mmc="2"><a  runat="server" href="~/Services/Support/hardware-networking.aspx"><span class="mi"></span><span class="txt"> Hardware & Networking </span><span class="di icon-arrow-right9"></span></a></li>
                                                            <li class="menu-item" data-mm="false" data-mmc="2"><a  runat="server" href="~/Services/Support/computer-upgrade.aspx"><span class="mi"></span><span class="txt">Computer Upgrade</span><span class="di icon-arrow-right9"></span></a></li>
                                                            <li class="menu-item" data-mm="false" data-mmc="2"><a  runat="server" href="~/Services/Support/amc-service.aspx"><span class="mi"></span><span class="txt">AMC Services</span><span class="di icon-arrow-right9"></span></a></li>
                                                       </ul>
                                                   </li>
                                              
                                               
                                              </ul>
                                         </li>--%>

                                        <li class="menu-item menu-item-has-children megamenu2-1" data-mm="true" data-mmc="4"><a href="#"><span class="mi"></span><span class="txt">Shopping</span><span class="di icon-arrow-right9"></span></a>
                                            <asp:Literal ID="ltrlShopMenuDesk" runat="server"></asp:Literal>
                                            <%--<ul class="sub-menu">
                                        <li class="menu-item menu-item-has-children" data-mm="false" data-mmc="2"><a href="#"><span class="mi"></span><span class="txt">Headers</span><span class="di icon-arrow-right9"></span></a>
                                            <ul class="sub-menu">
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="header-version%3dv1.html"><span class="mi"></span><span class="txt">Header Version 1</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="header-version%3dv2.html"><span class="mi"></span><span class="txt">Header Version 2</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="header-version%3dv3.html"><span class="mi"></span><span class="txt">Header Version 3</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="header-version%3dv4.html"><span class="mi"></span><span class="txt">Header Version 4</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="header-version%3dv5.html"><span class="mi"></span><span class="txt">Header Version 5</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="header-version%3dv6.html"><span class="mi"></span><span class="txt">Header Version 6</span><span class="di icon-arrow-right9"></span></a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item menu-item-has-children" data-mm="false" data-mmc="2"><a href="#.html"><span class="mi"></span><span class="txt">Headers</span><span class="di icon-arrow-right9"></span></a>
                                            <ul class="sub-menu">
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="header-version%3dv7.html"><span class="mi"></span><span class="txt">Header Version 7</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="header-version%3dv8.html"><span class="mi"></span><span class="txt">Header Version 8</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="header-version%3dv9.html"><span class="mi"></span><span class="txt">Header Version 9</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="header-version%3dv10.html"><span class="mi"></span><span class="txt">Header Version 10</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="header-version%3dv11.html"><span class="mi"></span><span class="txt">Header Version 11</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="header-version%3dv12.html"><span class="mi"></span><span class="txt">Header Version 12</span><span class="di icon-arrow-right9"></span></a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item menu-item-has-children" data-mm="false" data-mmc="2"><a href="#"><span class="mi"></span><span class="txt">Page Titles</span><span class="di icon-arrow-right9"></span></a>
                                            <ul class="sub-menu">
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="page-title-version-1.html"><span class="mi"></span><span class="txt">Page Title Version 1</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="page-title-version-2.html"><span class="mi"></span><span class="txt">Page Title Version 2</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="page-title-version-3.html"><span class="mi"></span><span class="txt">Page Title Version 3</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="page-title-version-4.html"><span class="mi"></span><span class="txt">Page Title Version 4</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="page-title-version-5.html"><span class="mi"></span><span class="txt">Page Title Version 5</span><span class="di icon-arrow-right9"></span></a></li>
                                                <li class="menu-item" data-mm="false" data-mmc="2"><a href="page-title-version-6.html"><span class="mi"></span><span class="txt">Page No Title Section</span><span class="di icon-arrow-right9"></span></a></li>
                                            </ul>
                                        </li>
                                    </ul>--%>
                                         </li>
                                                
                                                <li class="menu-item menu-item-has-children" data-mm="false" data-mmc="2"><a href="#"><span class="mi"></span><span class="txt">Jobs</span><span class="di icon-arrow-right9"></span></a>
                                                        <ul class="sub-menu">
                                                                <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/Job/find-job.aspx"><span class="mi"></span><span class="txt">Find Job</span><span class="di icon-arrow-right9"></span></a></li>
                                                                <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/Jobseeker/hire-employees.aspx"><span class="mi"></span><span class="txt">Hire Employee</span><span class="di icon-arrow-right9"></span></a></li>
                                                                 <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/Job/Register.aspx"><span class="mi"></span><span class="txt">Register</span><span class="di icon-arrow-right9"></span></a></li>
                                                        </ul>
                                                </li>
                                                <li class="menu-item menu-item-has-children" data-mm="false" data-mmc="2"><a runat="server" href="~/contact-us.aspx"><span class="mi"></span><span class="txt">Contact</span><span class="di icon-arrow-right9"></span></a>
                                                </li>
                                    </ul>
                                    
                                    
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
         



                              