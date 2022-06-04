

<%@ Page Title="contact us | ITS Gwalior : Ph N. 898902410" MetaDescription="best web design company in gwalior, bhind, murena, dabra, lahar, porsa, bammore, dholpur, agra, datia, jhansi, madhya pradesh, india" MetaKeywords="best web design company in gwalior, bhind, murena, dabra, lahar, porsa, bammore, dholpur, agra, datia, jhansi, madhya pradesh, india" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contact-us.aspx.cs" Inherits="ContactUs" enableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <link rel="canonical" href="https://wwww.itsgwalior.com/contact-us" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

                <header class="rich-header page-header version1" data-parallax="true" id="header_5c14_0">
                    <div class="parallax-container" id="div_5c14_0">&nbsp;</div>
                    <div class="container nz-clearfix">

                        <div class="rh-content">
                            <h1 >Contact Us</h1>
                            <div class="rh-separator">&nbsp;</div>
                            <div id="div_5c14_1" class="nz-breadcrumbs nz-clearfix"><a href="default.aspx"  property="v:title">Home</a><span class="current">Contact Us</span></div>
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
                                <div style="padding-top: unset;"class="nz-section horizontal autoheight-false animate-false full-width-false " data-animation-speed="35000" data-parallax="false" id="div_5c14_2">
                                        <div class="nz-row">
                                            <div class="col vc_col-sm-12 col12  element-animate-false valign-top"  data-effect="none" data-align="left" data-margin="false">
                                                <div class="col-inner" >
                                                     <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3579.021178710842!2d78.22750491435076!3d26.228501383427062!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3976c168383db379%3A0x600631e9c9d21d4!2sITS+GWALIOR!5e0!3m2!1sen!2sin!4v1457253269449" width="100%" height="550" frameborder="0" style="border:0" allowfullscreen></iframe>
                                             

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                 <div class="nz-section vertical autoheight-false animate-true full-width-false " data-img-width="479" data-img-height="602" data-animation-speed="35000" data-parallax="false" id="div_6127_17">
                                    <div class="container">
                                        <div class="nz-row">
                                            <div class="col vc_col-sm-12 vc_col-lg-8 vc_col-md-8 vc_col-xs-12 col12  element-animate-false valign-top"  data-effect="none" data-align="left">
                                                <div class="col-inner" >
                                                    <h2 id="h2_5c14_0" class="vc_custom_heading ninzio-latter-spacing">CONTACT US</h2>
                                                    <div class="sep-wrap element-animate element-animate-false left nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_5c14_4">&nbsp;</div>
                                                    </div>
                                                    <p id="p_5c14_0" class="vc_custom_heading">Our Support Team Usually Answers During 24 Hours.

                                                        <br />
                                                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                                                    </p>
                                                    <div class='gap nz-clearfix' id="div_5c14_5">&nbsp;</div>
                                                    <div role="form" class="wpcf7" id="wpcf7-f6-p3172-o1" lang="en-US" dir="ltr">
                                                        <div class="screen-reader-response"></div>
                                                     

                                                            <p><span class="wpcf7-form-control-wrap your-name">
                                                      <asp:TextBox ID="txtName" class="wpcf7-form-control wpcf7-text wpcf7-validates-as-required"  placeholder="Your Name"  runat="server"></asp:TextBox>
                                                           
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtName"
                                            ErrorMessage="Please Enter Name" ForeColor="Red" SetFocusOnError="True" 
                                            Display="None">*</asp:RequiredFieldValidator>
                                        
                                             <asp:ValidatorCalloutExtender ID="RequiredFieldValidator3_ValidatorCalloutExtender" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
                                                          
                                                          
                                                          
                                                               <%-- <input name="name" id="name" type="text" value="" size="40" class="wpcf7-form-control wpcf7-text wpcf7-validates-as-required" aria-required="true" aria-invalid="false" placeholder="Your Name" />--%>
                                                                </span> </p>
                                                                <p><span class="wpcf7-form-control-wrap your-name">
                                                              <asp:TextBox ID="txtMobile" class="wpcf7-form-control wpcf7-text wpcf7-validates-as-required"  placeholder="Your Mobile Number"  runat="server"></asp:TextBox>
                                                             
                                             <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile"
                                             Display="None" ErrorMessage="Enter Mobile " ForeColor="Red"
                                             SetFocusOnError="True">*</asp:RequiredFieldValidator>

                                             <asp:ValidatorCalloutExtender ID="ValCalMobile"
                                               runat="server" Enabled="True" TargetControlID="rfvMobile" WarningIconImageUrl="img/wrning.gif">
                                               </asp:ValidatorCalloutExtender>

                                   
                                   
                                 



                                                              
                                                                </span> </p>
                                                            <p><span class="wpcf7-form-control-wrap your-email">
                                                              
                                                               <asp:TextBox ID="txtEmail" class="wpcf7-form-control wpcf7-text wpcf7-validates-as-required wpcf7-validates-as-email"  placeholder="Your Email-ID" runat="server"></asp:TextBox>
                                                           
                                                               </span> </p>
                                                            <p><span class="wpcf7-form-control-wrap your-subject">
                                                             
                                                                  <asp:TextBox ID="txtSubject" class="wpcf7-form-control wpcf7-text"  placeholder="Subject" runat="server"></asp:TextBox>
                                                           
                                                                </span> </p>
                                                            <p><span class="wpcf7-form-control-wrap your-message">
                                                             
                                                               <asp:TextBox ID="txtMeage" TextMode="MultiLine" class="wpcf7-form-control wpcf7-text"  placeholder="Your Message" runat="server"></asp:TextBox>
                                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMeage"
                                            ErrorMessage="Please Enter Message" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                        
                                             <asp:ValidatorCalloutExtender ID="RequiredFieldValidator1_ValidatorCalloutExtender" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>   
         
                                                               </span> </p>


                                                       
                                                          <div class="row">

                                                           
                                                              


                                                                   <div class="col col6" data-margin="true">

                                                                       <div  class="nz-column-text nz-clearfix" data-effect="none" data-effect-speed="50" style="color:white; font-size:20px;padding-top:4px;">  Please Answer this question:     2 + 3 =
                                                                    </div>

                                                                  </div>

                                                                  <div class="col col2" data-margin="true" style="margin-left:-40px;">
                                                                    <asp:TextBox ID="txtAns" Height="33" runat="server"></asp:TextBox>

                                                                   
                                                               <asp:RequiredFieldValidator ID="rfvCaptcha" runat="server" ControlToValidate="txtAns"
                                            ErrorMessage="Please fill Answer " ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                        
                                             <asp:ValidatorCalloutExtender ID="VCECaptcha" 
                                            runat="server" Enabled="True" TargetControlID="rfvCaptcha" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>   

                                                                     


                                                                </div>

                                                            

                                                          </div>
                                                            
                                                             
                                                          



                                                            <p>    
                                                                <%--<asp:Button ID="btnSubmit" CssClass="vc_btn-primary" OnClick="btnSubmit_Click"  ValidationGroup="sv" runat  ="server" Text="Send Message" />--%>
                                                                

                                                                <asp:LinkButton ID="lnkbtnSubmit" CssClass="button button-ghost blue full-false medium square icon-true animate-false anim-type-ghost hover-side element-animate-false" OnClick="lnkbtnSubmit_Click" runat="server">Send Message</asp:LinkButton>

                                                                 </p>
                                                       
                                                    </div>
                                                </div>
                                            </div>
                                             <div class="col vc_col-sm-12 vc_col-lg-4 vc_col-md-4 vc_col-xs-12 col12  element-animate-false valign-top"  data-effect="none" data-align="left">
                                                <div class="col-inner" >
                                                    <h2 id="h2_5c14_1" class="vc_custom_heading ninzio-latter-spacing">Head Office Gwalior</h2>
                                                    <div class="sep-wrap element-animate element-animate-false left nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_5c14_6">&nbsp;</div>
                                                    </div>
                                                    <div  class="nz-column-text nz-clearfix  element-animate-false" data-effect="none" data-effect-speed="50" > 
      <p style="color:white;">G2 karuna Enclave, Patel Nagar, City Center Gwalior, Madhya Pradesh 474011 </p> 
	  
	
                                                    
                                                    <h2 id="h2_5c14_2" class="vc_custom_heading ninzio-latter-spacing">Email</h2>
                                                    <div class="sep-wrap element-animate element-animate-false left nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_5c14_9">&nbsp;</div>
                                                    </div>
                                                    <div  class="nz-column-text nz-clearfix  element-animate-false" data-effect="none" data-effect-speed="50" style="color:white;"><a href="mailto:its.gwl15@gmail.com" style="color:white;">its.gwl15@gmail.com</a>, <a href="mailto:info@itsgwalior.com" style="color:white;">info@itsgwalior.com</a>
                                                      
                                                       </div>
                                                    <br>
                                                    <h2 id="h2_5c14_3" class="vc_custom_heading ninzio-latter-spacing">Sales and Whatsapp no.</h2>
                                                    <div class="sep-wrap element-animate element-animate-false left nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_5c14_13">&nbsp;</div>
                                                    </div>
                                                    <div  class="nz-column-text nz-clearfix  element-animate-false" data-effect="none" data-effect-speed="50" style="color:white;"><a href="tel:8989024130" style="color:white;">+91 89890-24130</a> , <a href="tel:9131722185" style="color:white;">9131722185 </a>
                                                        <br />
                                                        <div class='gap nz-clearfix' id="div_5c14_14">&nbsp;</div>
                                                       </div>
                                                    <br>
                                                     <h2 id="h2_5c14_3" class="vc_custom_heading ninzio-latter-spacing">Support</h2>
                                                    <div class="sep-wrap element-animate element-animate-false left nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_5c14_13">&nbsp;</div>
                                                    </div>

                                                    <div  class="nz-column-text nz-clearfix  element-animate-false" data-effect="none" data-effect-speed="50" style="color:white;"><a href="tel:8770168831" style="color:white;">+91 8770168831</a>
                                                        
                                                        <br/>
                                                    <div class='gap nz-clearfix' id="div_5c14_12">&nbsp;</div>
                                        <div class="nz-sl social-links nz-clearfix left">
                                            <a class="icon-facebook" href="https://www.facebook.com/itssolutiongwalior" target="_blank"></a>
                                              <a class="icon-youtube" href="https://www.youtube.com/channel/UCx6ndetuHvV60qLpa2N8qVw" target="_blank"></a>
                                            <a class="icon-twitter" href="https://twitter.com/ItsGwalior/" target="_blank"></a>
                                             <a class="icon-googleplus" href="https://its-gwalior.business.site/" target="_blank"></a>
                                            <%-- <a class="icon-Justdial" href="https://www.justdial.com/gwalior/Muki-Technologies-Pvt-Ltd-Morar/9999PX751-X751-140216122641-H8J5_BZDET" target="_blank"></a>--%>
                                          
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
                                <div class="nz-section horizontal autoheight-false animate-false full-width-true " data-animation-speed="35000" data-parallax="false" >
                                    <div class="nz-row">
                                        <div class="col vc_col-sm-12 col12  element-animate-false valign-top"  data-effect="none" data-align="left" data-margin="false">
                                            <div class="col-inner" >
                                                <div id="nz-tagline-1"  class="nz-tagline">
                                                    <div class="container nz-clearfix"><span id="span_df14_16" class="tagline-icon icon-envelope"></span><span class="tagline-title">"Digital Marketing Service provider company in Gwalior"</span><a class="button button-normal white square icon-true full-false medium animate-false anim-type-ghost hover-fill" href="It-services/digital-marketing-in-gwalior.aspx"><span class="txt">View More</span><span class="btn-icon icon-book"></span></a></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        
        
                           
                        </div>
                        <!-- post end -->
                    </div>
              
                <!-- content end -->

</asp:Content>

