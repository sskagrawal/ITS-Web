<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Change-Password.aspx.cs" Inherits="Client_Panel_Change_Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hdfID" runat="server" />
     <!-- wrap start -->
        <div id="wrap" class="nz-wide">    
                       
            
            <div class="page-content-wrap">

                <header class="rich-header page-header version1" data-parallax="true" id="header_0a29_0">
                    <div class="parallax-container" id="div_0a29_0">&nbsp;</div>
                    <div class="container nz-clearfix">

                        <div class="rh-content">
                            <h1>Change Password</h1>
                            <div class="rh-separator">&nbsp;</div>
                            <div id="div_0a29_1" class="nz-breadcrumbs nz-clearfix"><a href="index.html"  property="v:title">Home</a><span class="current">Change Password</span></div>
                        </div>

                    </div>
                    <div id="slider-arrow" data-target="#nz-content" data-from="90" data-offset="90" class="i-separator animate nz-clearfix"></div>
                </header>
                <!-- content start -->
                <div id="nz-content" class='content nz-clearfix padding-false'>
                    <div class='container page-full-width'>
                        <!-- post start -->
                        <div id="post-4325" class="post-4325 page type-page status-publish hentry">
                            <section class="page-content nz-clearfix">
                               
                                <div class="nz-section horizontal autoheight-false animate-false full-width-false " data-animation-speed="35000" data-parallax="false" id="div_0a29_3">
                                    <div class="container">
                                        <div class="nz-row">
                                            <div class="col vc_col-sm-12 vc_col-lg-3 vc_col-md-2 vc_col-xs-12 col12  element-animate-false valign-top"  data-effect="none" data-align="center" data-margin="false">
                                                <div class="col-inner" ></div>
                                            </div>
                                            <div class="col vc_col-sm-12 vc_col-lg-6 vc_col-md-8 vc_col-xs-12 col12  element-animate-false valign-top"  data-effect="none" data-align="left" data-margin="false">
                                                <div class="col-inner" >
                                                    <h3 id="h3_0a29_0" class="vc_custom_heading ninzio-latter-spacing">Change Password</h3>
                                                    <div class="sep-wrap element-animate element-animate-false center nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_0a29_4">&nbsp;</div>
                                                    </div>
                                                 
                                                </div>
                                            </div>
                                            <div class="col vc_col-sm-12 vc_col-lg-3 vc_col-md-2 vc_col-xs-12 col12  element-animate-false valign-top"  data-effect="none" data-align="left" data-margin="false">
                                                <div class="col-inner" ></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="nz-section horizontal autoheight-false animate-false full-width-false " data-animation-speed="35000" data-parallax="false" id="div_0a29_5">
                                    <div class="container">
                                        <div class="nz-row">
                                            <div class="col vc_col-sm-12 col12  element-animate-false valign-top"  data-effect="none" data-align="center">
                                                <div class="col-inner" >
                                                    <div role="form" class="wpcf7" id="wpcf7-f4283-p4325-o1" lang="en-US" dir="ltr">
                                                        <div class="screen-reader-response"></div>
                                                        <div id="contact-form" action="#">

                                                            <div class="col col4" data-margin="true">
                                                                
                                                               <%-- <span class="wpcf7-form-control-wrap your-name">
                                                                <input name="name" id="name" type="text" value="" size="40" class="wpcf7-form-control wpcf7-text" aria-invalid="false" placeholder="Name" />

                                                                </span>--%>
                                                            </div>

                                                            <div class="col col4" data-margin="true">
                                                                <span class="wpcf7-form-control-wrap your-email">
                                                          
                                                                    <asp:TextBox ID="txtoldPsw" CssClass="wpcf7-form-control wpcf7-text wpcf7-email wpcf7-validates-as-email" placeholder="Old Password" runat="server"></asp:TextBox>

                                                              <%--  <input name="mail" id="mail" type="text" value="" size="40" class="wpcf7-form-control wpcf7-text wpcf7-email wpcf7-validates-as-email" aria-invalid="false" placeholder="E-mail" />--%>

                                                                </span>

                                                                 <span class="wpcf7-form-control-wrap your-subject">

                                                                       <asp:TextBox ID="txtnewpsw" TextMode="Password" CssClass="wpcf7-form-control wpcf7-text wpcf7-email wpcf7-validates-as-email" placeholder="New Password" runat="server"></asp:TextBox>

                                                              <%--  <input name="subject" id="subject" type="text" value="" size="40" class="wpcf7-form-control wpcf7-text" aria-invalid="false" placeholder="Subject" />--%>

                                                                </span>



                                                                 <span class="wpcf7-form-control-wrap your-subject">

                                                              <asp:TextBox ID="txtConfirmPsw" TextMode="Password" CssClass="wpcf7-form-control wpcf7-text wpcf7-email wpcf7-validates-as-email" placeholder="Confirm Password" runat="server"></asp:TextBox>

                                                             <%--  <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Style="height: 26px" Text="Button" />--%>


                                                                </span>




                                                            </div>

                                                            <div class="col col4" data-margin="true">
                                                               <%-- <span class="wpcf7-form-control-wrap your-subject">
                                                                <input name="subject" id="subject" type="text" value="" size="40" class="wpcf7-form-control wpcf7-text" aria-invalid="false" placeholder="Subject" />

                                                                </span>--%>
                                                            </div>

                                                          <%--  <div class="col col12" data-margin="true">
                                                                <span class="wpcf7-form-control-wrap your-message">
                                                                 <textarea name="comment" id="comment"  cols="40" rows="10" class="wpcf7-form-control wpcf7-textarea" aria-invalid="false" placeholder="Message"></textarea>

                                                                </span>

                                                            </div>--%>

                                                            <div class="col col12">
                                                               <%-- <input type="submit" value="Send MEssage"  id="submit_contact">--%>

                                                                 <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" runat="server" Text="Submit" />
                                    
                                                                <div id="msg" class="message">

                                                                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </section>
                        </div>
                        <!-- post end -->
                    </div>
                </div>
                <!-- content end -->

               
            </div>
        </div>
        <!-- wrap end -->

</asp:Content>

