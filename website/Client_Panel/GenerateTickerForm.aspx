<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GenerateTickerForm.aspx.cs" Inherits="Client_Panel_GenerateTickerForm" enableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:HiddenField ID="hdfUserID" runat="server" />
    
    <asp:HiddenField ID="hdfTicketID" runat="server" />
    <asp:Label ID="lblticketNo" runat="server" Text=""></asp:Label>

    <div class="page-content-wrap">


                <header class="rich-header page-header version1" data-parallax="true" id="header_5c14_0">
                    <div class="parallax-container" id="div_5c14_0">&nbsp;</div>
                    <div class="container nz-clearfix">

                        <div class="rh-content">
                            <h1 >Generate Ticket</h1>
                            <div class="rh-separator">&nbsp;</div>
                            <div id="div_5c14_1" class="nz-breadcrumbs nz-clearfix"><a href="index.html"  property="v:title">Home</a><span class="current">Generate Ticket</span></div>
                        </div>

                    </div>
                    <div id="slider-arrow" data-target="#nz-content" data-from="90" data-offset="90" class="i-separator animate nz-clearfix"></div>
                </header>



                <!-- content start -->
                <div id="nz-content" class='content nz-clearfix padding-false'>
                    <div class='container page-full-width'>
                        <!-- post start -->
                        <div id="post-3172" class="post-3172 page type-page status-publish hentry">
                            <section class="page-content nz-clearfix">
                              <%--  <div class="nz-section horizontal autoheight-false animate-false full-width-false " data-animation-speed="35000" data-parallax="false" id="div_5c14_2">
                                    <div class="container">
                                        <div class="nz-row">
                                            <div class="col vc_col-sm-12 col12  element-animate-false valign-top"  data-effect="none" data-align="left" data-margin="false">
                                                <div class="col-inner" >
                                                    <div class="map" id="gmap-1" data-animate="false" data-x="53.339381" data-y="-6.260405" data-type="terrain" data-zoom="16" data-marker="upload/marker.png" ></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>--%>
                                <div class="nz-section horizontal autoheight-false animate-false full-width-false " data-animation-speed="35000" data-parallax="false" id="div_5c14_3">
                                    <div class="container">
                                        <div class="nz-row">
                                            <div class="col vc_col-sm-12 vc_col-lg-8 vc_col-md-8 vc_col-xs-12 col12  element-animate-false valign-top"  data-effect="none" data-align="left">
                                                <div class="col-inner" >
                                                    <h2 id="h2_5c14_0" class="vc_custom_heading ninzio-latter-spacing">Generate Ticket</h2>
                                                    <div class="sep-wrap element-animate element-animate-false left nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_5c14_4">&nbsp;</div>
                                                    </div>
                                                    <p id="p_5c14_0" class="vc_custom_heading">Our Support Team Usually alswers During 24 Hours.</p>
                                                    <div class='gap nz-clearfix' id="div_5c14_5">&nbsp;</div>
                                                    <div role="form" class="wpcf7" id="wpcf7-f6-p3172-o1" lang="en-US" dir="ltr">
                                                        <div class="screen-reader-response"></div>
                                                        <form id="contact-form" action="#">



                                                            <div class="alert alert-success alert-dismissible fade show" visible="false" runat="server" ID="alert">
 <button aria-label="Close" class="close" data-dismiss="alert" type="button">
 <span aria-hidden="true"> ×</span>
 </button>
     <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
 </div>



                                                            <p><span class="wpcf7-form-control-wrap your-name">

                                                                 <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Your Name"></asp:TextBox>
                                                              <%--  <input name="name" id="name" type="text" value="" size="40" class="wpcf7-form-control wpcf7-text wpcf7-validates-as-required" aria-required="true" aria-invalid="false" placeholder="Your Name" />--%>


                                                               </span> </p>
                                                            <p><span class="wpcf7-form-control-wrap your-email">


                                                               <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Your email"></asp:TextBox>


                                                               </span> </p>




                                                            <p><span class="wpcf7-form-control-wrap your-subject">

                                                                   <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Subject"></asp:TextBox>



                                                               </span> </p>


                                                             <p><span class="wpcf7-form-control-wrap your-subject">
                                                                   <asp:DropDownList ID="drdDepartment" runat="server">
                                                                       <asp:ListItem Selected="True" Value="-1">Select Department</asp:ListItem>
                                                                       <asp:ListItem Value="Technical">Technical</asp:ListItem>
                                                                        <asp:ListItem Value="Sales">Sales</asp:ListItem>
                                                                        <asp:ListItem Value="Billing">Billing</asp:ListItem>
                                                                        <asp:ListItem Value="Abuse">Abuse</asp:ListItem>

                                                                   </asp:DropDownList>
                                                                  <%-- <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Subject"></asp:TextBox>--%>



                                                               </span> </p>


                                                             <p><span class="wpcf7-form-control-wrap your-subject">
                                                                   <asp:DropDownList ID="drdRelatedService" runat="server">


                                                                   </asp:DropDownList>
                                                                  <%-- <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Subject"></asp:TextBox>--%>



                                                               </span> </p>





                                                            <p><span class="wpcf7-form-control-wrap your-message">


                                                                   <asp:TextBox ID="txtMessage" TextMode="MultiLine" runat="server" CssClass="form-control" placeholder="Subject"></asp:TextBox>

                                                               <%-- <textarea name="comment" id="comment"  cols="40" rows="10" class="wpcf7-form-control wpcf7-textarea" aria-invalid="false" placeholder="Your Message"></textarea>--%>



                                                               </span> </p>




                                                             <p><span class="wpcf7-form-control-wrap your-message">

                                                               <asp:Label ID="Label1" runat="server" Text="Attachment"></asp:Label><br />
                                                             <%--      <asp:TextBox ID="TextBox1" TextMode="MultiLine" runat="server" CssClass="form-control" placeholder="Subject"></asp:TextBox>--%>

                                                            <asp:FileUpload ID="fuFile" runat="server" />
                                                                   <asp:HiddenField ID="hdfFile" runat="server" />


                                                               </span> </p>



                                                            <p>                                
                                                                <%--<input type="submit" value="Send MEssage"  id="submit_contact">--%>

                                                             <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" runat="server" Text="Submit" />

                                                                <div id="msg" class="message"></div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                          
                                            <div class="col vc_col-sm-12 vc_col-lg-4 vc_col-md-4 vc_col-xs-12 col12  element-animate-false valign-top"  data-effect="none" data-align="left">
                                                <div class="col-inner"><br /><br />
                                                    <h2 id="h2_5c14_1" class="vc_custom_heading ninzio-latter-spacing">Head Office Gwalior</h2>
                                                    <div class="sep-wrap element-animate element-animate-false left nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_5c14_6">&nbsp;</div>
                                                    </div>
                                                    <div  class="nz-column-text nz-clearfix  element-animate-false" data-effect="none" data-effect-speed="50" > 
      <p> 15-D, Parsadi Pura behind of M.E.S. Power house Cantonment area, Near 6 &amp; 7 no. chauraha Morar-474006, Gwalior (M.P.) India<br><i>Phone:</i> <span class="phone_no">0751-2462230, 2466182</span> </p> 
	  
	  
	 <%--  <h2 id="h2_5c14_1" class="vc_custom_heading ninzio-latter-spacing">Branch Office Surat </h2>
                                                    <div class="sep-wrap element-animate element-animate-false left nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_5c14_6">&nbsp;</div>
                                                    </div>
                                                    <div  class="nz-column-text nz-clearfix  element-animate-false" data-effect="none" data-effect-speed="50" > 
      <p style="color:white;">E-2109 Central Bazzar Oppo. Varachha Police station Surat(Gujrat)India <br><i>Phone:</i> <span class="phone_no">+91 9131722185, 79990719264</span></p> 
			</div>--%>
                                                    
                                                    <h2 id="h2_5c14_2" class="vc_custom_heading ninzio-latter-spacing">Email</h2>
                                                    <div class="sep-wrap element-animate element-animate-false left nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_5c14_9">&nbsp;</div>
                                                    </div>
                                                    <div  class="nz-column-text nz-clearfix  element-animate-false" data-effect="none" data-effect-speed="50">its.gwl15@gmail.com, info@itsgwalior.com,  
                                                      
                                                       </div>
                                                    <br>
                                                    <h2 id="h2_5c14_3" class="vc_custom_heading ninzio-latter-spacing">Sales and Whatsapp no.</h2>
                                                    <div class="sep-wrap element-animate element-animate-false left nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_5c14_13">&nbsp;</div>
                                                    </div>
                                                    <div  class="nz-column-text nz-clearfix  element-animate-false" data-effect="none" data-effect-speed="50">+91 89890-24130, 9131722185 
                                                        <br />
                                                        <div class='gap nz-clearfix' id="div_5c14_14">&nbsp;</div>
                                                       </div>
                                                    <br>
                                                     <h2 id="h2_5c14_3" class="vc_custom_heading ninzio-latter-spacing">Support</h2>
                                                    <div class="sep-wrap element-animate element-animate-false left nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_5c14_13">&nbsp;</div>
                                                    </div>
                                                    <div  class="nz-column-text nz-clearfix  element-animate-false" data-effect="none" data-effect-speed="50">+91 8770168831, 7512462230
                                                        <br/>
                                                    <div class='gap nz-clearfix' id="div_5c14_12">&nbsp;</div>
                                        <div class="nz-sl social-links nz-clearfix left">
                                            <a class="icon-facebook" href="https://www.facebook.com/pages/ITS-solution/478527018830412?ref=bookmarks" target="_blank"></a>
                                              <a class="icon-linkedin" href="https://www.linkedin.com/start/view-full-profile?_ed=0_lbhUlY2COMGrZSS2UaiT__Gs41Ww6Haw7kYUqdbvJxhEcRqGDTFUZBRVbL4HnJy_&trk=ndir_viewmore/" target="_blank"></a>
                                            <a class="icon-twitter" href="https://twitter.com/ItsGwalior/" target="_blank"></a>
                                            <a class="icon-googleplus" href="https://plus.google.com/s/itsgwalior/top/" target="_blank"></a>
                                          
                                        </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="nz-section horizontal autoheight-false animate-false full-width-true " data-animation-speed="35000" data-parallax="false" >
                                    <div class="nz-row">
                                        <div class="col vc_col-sm-12 col12  element-animate-false valign-top"  data-effect="none" data-align="left" data-margin="false">
                                            <div class="col-inner" >
                                                <div id="nz-tagline-1"  class="nz-tagline">
                                                    <div class="container nz-clearfix"><span id="span_5c14_0" class="tagline-icon icon-bulb"></span><span class="tagline-title">Welcome To The Best Modern Website Studio You Ever Seen</span><a class="button button-normal white square icon-true full-false medium animate-false anim-type-ghost hover-fill" href="http://ninzio.com/"><span class="txt">Purchase now</span><span class="btn-icon icon-cart"></span></a></div>
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

</asp:Content>

