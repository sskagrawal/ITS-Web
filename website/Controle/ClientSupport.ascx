<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ClientSupport.ascx.cs" Inherits="Controle_ClientSupport" %>

<header class="header mob-header cart-true nz-clearfix">
    <div class="mob-header-top nz-clearfix">
        <div class="container">
            <div class="logo logo-mob">
                <a href="#" title="Its Gwalior">
                    <img id="img_658f_0" runat="server" src="~/upload/logo 9.png" alt="Its Gwalior" style="margin-top: 10px; width: 200px;">
                </a>
            </div>
            <span class="mob-menu-toggle"></span>
          
        </div>
    </div>
    <div class="mob-header-content nz-clearfix">

        <div class="container">

            <nav class="mob-menu nz-clearfix">
                <ul class="menu">
                 
                    <li class="menu-item current-menu-item current_page_item menu-item-home menu-item-has-children di" data-mm="false" data-mmc="2"><a href="#"><span class="mi"></span><span class="txt">Job</span><span class="di icon-arrow-right9"></span></a>
                       <%-- <ul class="sub-menu">
                            <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/Job/find-job.aspx"><span class="mi"></span><span class="txt">Find Job</span><span class="di icon-arrow-right9"></span></a></li>
                          

                        </ul>--%>
                    </li>
                    <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/latest-news.aspx"><span class="mi"></span><span class="txt">News & Events</span><span class="di icon-arrow-right9"></span></a></li>
                    <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/Jobseeker/job-profile.aspx"><span class="mi"></span><span class="txt">Job Profile</span></a></li>
                    <li class="menu-item" data-mm="false" data-mmc="2"><a href="../Client_Panel/Client-Profile.aspx"><span class="mi"></span><span class="txt">My Profile</span><span class="di icon-arrow-right9"></span></a>
                        <ul class="sub-menu">
                            <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/Job/find-job.aspx"><span class="mi"></span><span class="txt">Find Job</span><span class="di icon-arrow-right9"></span></a></li>
                            <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/Job/find-resumes.aspx"><span class="mi"></span><span class="txt">Find Resumes</span><span class="di icon-arrow-right9"></span></a></li>
                             <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/logout.aspx"><span class="mi"></span><span class="txt">Log Out</span><span class="di icon-arrow-right9"></span></a></li>
                        </ul>
                    </li>
                    
                </ul>
            </nav>




        </div>
    </div>
</header>
<header class="header desk version1 page-title-section-version1 one-page-side stuck-true stuck-boxed-false top-false full-width-true sl-true search-true cart-true sidebar-toggle-true iversion-light effect-fill hover-effect-fill megamenu-hover-effect-underline subeffect-ghost fixed-true fiversion-dark wiversion-light">

    <div class="header-content">

        <div class="header-body">
            <div class="container nz-clearfix">

                <div class="logo logo-desk">
                    <a href="index.html" title="Its Gwalior">
                        <img class="normal-logo" id="img_658f_1" runat="server" src="~/upload/logo 9.png" style="width: 200px; margin-top: 10px" alt="web design company">
                        <img class="fixed-logo" id="img_658f_2" runat="server" src="~/upload/logo.png" style="width: 200px; margin-top: -30px;" alt="web development company">
                    </a>
                </div>

               

                <nav class="header-menu desk-menu nz-clearfix">
                    <ul class="menu">
                      
                       <%-- <li class="menu-item  menu-item-home menu-item-has-children" data-mm="false" data-mmc="2"><a href="#"><span class="mi"></span><span class="txt">Job</span><span class="di icon-arrow-right9"></span></a>
                            <ul class="sub-menu">
                                <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/Job/find-job.aspx"><span class="mi"></span><span class="txt">Find Job</span><span class="di icon-arrow-right9"></span></a></li>
                           
                            </ul>
                        </li>--%>


                        <li class="menu-item  menu-item-home menu-item-has-children" data-mm="false" data-mmc="2"><a href="../Client_Panel/Service-List.aspx"><span class="mi"></span><span class="txt">Service List</span><span class="di icon-arrow-right9"></span></a>
                           <%-- <ul class="sub-menu">
                                <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/Admin/Sale/SaleVoucherList.aspx"><span class="mi"></span><span class="txt"> Sale Invoice List</span><span class="di icon-arrow-right9"></span></a></li>
                           
                            </ul>--%>
                        </li>


                         <li class="menu-item  menu-item-home menu-item-has-children" data-mm="false" data-mmc="2"><a href="../Client_Panel/RenewService.aspx"><span class="mi"></span><span class="txt">Renew Service</span><span class="di icon-arrow-right9"></span></a>
                            <%--<ul class="sub-menu">
                                <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/Admin/Sale/RenewList.aspx"><span class="mi"></span><span class="txt">Renew List</span><span class="di icon-arrow-right9"></span></a></li>
                           
                            </ul>--%>
                        </li>


                        <li class="menu-item  menu-item-home menu-item-has-children" data-mm="false" data-mmc="2"><a href="../Client_Panel/Billing-List.aspx"><span class="mi"></span><span class="txt">Billing</span><span class="di icon-arrow-right9"></span></a>
                          <%--  <ul class="sub-menu">
                                <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/Job/find-job.aspx"><span class="mi"></span><span class="txt">Find Job</span><span class="di icon-arrow-right9"></span></a></li>
                           
                            </ul>--%>
                        </li>



                        <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/Client_Panel/GenerateTickerForm.aspx"><span class="mi"></span><span class="txt">Support</span><span class="di icon-arrow-right9"></span></a></li>
                      <%--  <li class="menu-item  menu-item-home menu-item-has-children" data-mm="false" data-mmc="2"><a href="../Jobseeker/job-profile.aspx"><span class="mi"></span><span class="txt">Job Profile</span></a></li>--%>
                        <li class="menu-item  menu-item-home menu-item-has-children" data-mm="false" data-mmc="2"><a href="#"><span class="mi"></span><span class="txt">My Profile</span><span class="di icon-arrow-right9"></span></a>
                            <ul class="sub-menu">
                                <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="../Client_Panel/Client-Profile.aspx"><span class="mi"></span><span class="txt">My Profile</span><span class="di icon-arrow-right9"></span></a></li>
                                <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/Client_Panel/Change-Password.aspx"><span class="mi"></span><span class="txt">Change Password</span><span class="di icon-arrow-right9"></span></a></li>
                                <li class="menu-item" data-mm="false" data-mmc="2"><a runat="server" href="~/logout.aspx"><span class="mi"></span><span class="txt">Log Out</span><span class="di icon-arrow-right9"></span></a></li>
                            </ul>
                        </li>

                    </ul>
                </nav>
            </div>
        </div>

    </div>
</header>

