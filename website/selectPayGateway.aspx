<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="selectPayGateway.aspx.cs" Inherits="selectPayGateway" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
    <script>
        function btnClick() {
            
            window.open("Default5.aspx", "Google", "width=400,height=700,left=400");
            
        }
       
    </script>
    
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <header class="rich-header page-header version1" data-parallax="true" style="background-color:#333333;color:#ffffff;">
                    <div class="parallax-container" style="background-image: url(upload/page_header4.jpg); background-repeat: no-repeat; background-position: center center; transform: translateY(0px);">&nbsp;</div>
                    <div class="container nz-clearfix">

                        <div class="rh-content">
                            <h1>Select Payment Mode</h1>
                            <div class="rh-separator">&nbsp;</div>
                            <%--<div style="color:#ffffff;background-color:rgba(0,0,0,0.3);" class="nz-breadcrumbs nz-clearfix"><a href="Default.aspx"  property="v:title">Home</a><span class="current">under construction</span></div>--%>
                        </div>

                    </div>
                    <div id="slider-arrow" data-target="#nz-content" data-from="90" data-offset="90" class="i-separator animate nz-clearfix"><i class="icon-arrow-down10"></i></div>
                </header>
               <div id="nz-content" class='content nz-clearfix padding-false'>
                    <div class='container page-full-width'>
                        <!-- post start -->
                        <div id="post-2057" class="post-2057 page type-page status-publish hentry">
                            <section class="page-content nz-clearfix">
                               
                               <!-- <div class="nz-section horizontal autoheight-false animate-false full-width-false " data-animation-speed="35000" data-parallax="false" id="div_6127_18">-->
                                    <div class="container">
                                        <div class="nz-row">
                                            <div class="col vc_col-sm-12 col12  element-animate-false valign-top"  data-effect="none" data-align="left">
                                                <div class="col-inner" >
                                                  <%--  <h3 id="h3_6127_3" class="vc_custom_heading ninzio-latter-spacing" style="margin-top:40px;">E-Commerce Development features</h3>
                                                    <div class="sep-wrap element-animate element-animate-false center nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_6127_19">&nbsp;</div>
                                                    </div>--%>
                                                   
                                                    
                                                    <div class="nz-content-box nz-clearfix version2 left animate-none" data-columns="3" data-animate="false">
                                                        <br />
                                                        <br />
                                                            <div id="nz-box-21" class="  bord_active nz-box element-animate">
                                                            <div class="nz-box-wrap">
                                                              
                                                                <div class="box-data">
                                                                     <div style="width:100%;float:left;padding:20px;border:1px solid #808080">
                                                                    <asp:RadioButton ID="rblRazorPay" runat="server" GroupName="Pay" OnCheckedChanged="rblRazorPay_CheckedChanged" AutoPostBack="true" />
                                                                   <%-- <h3 class="box-title">Razor Pay</h3>--%>
                                                                          <br />
                                                                           <img src="images/Razorpay.png" alt="Razor Pay" height="73px" />
                                                                   </div>
                                                                  
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="nz-box-19" class="  bord_active nz-box element-animate">
                                                            <div class="nz-box-wrap">
                                                               
                                                                <div class="box-data">
                                                                    <div style="width:100%;float:left;padding:20px;border:1px solid #808080">
                                                                    <asp:RadioButton ID="rblPayUMoney" runat="server" GroupName="Pay" OnCheckedChanged="rblPayUMoney_CheckedChanged" AutoPostBack="true"  />
                                                               <br />  <%--   <h3 class="box-title">Pay U Money</h3>--%>
                                                                        <img src="images/payumn.png" alt="Pay U Money" height="73px" />
                                                                    </div>
                                                                  
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="nz-box-20" class="  bord_active nz-box element-animate">
                                                            <div class="nz-box-wrap">
                                                                
                                                                <div class="box-data">
                                                                     <div style="width:100%;float:left;padding:20px;border:1px solid #808080">
                                                                    <asp:RadioButton ID="rblPayPal" runat="server" GroupName="Pay" OnCheckedChanged="rblPayPal_CheckedChanged" AutoPostBack="true" />
                                                                   <%-- <h3 class="box-title">Pay Pal</h3>--%>
                                                                         <br />
                                                                           <img src="images/paypal.png" alt="Pay Pal" height="73px" />
                                                                   </div>
                                                                   
                                                                </div>
                                                            </div>
                                                        </div>
                                                    
                                                        <div style="clear:both"></div>
                                                        <br />
                                                         <div id="nz-box-21" class="  bord_active nz-box element-animate">
                                                            <div class="nz-box-wrap">
                                                              
                                                                <div class="box-data">
                                                                     <div style="width:100%;float:left;padding:20px;border:1px solid #808080">
                                                                 <img src="images/googlepay2.jpeg" alt=""/>
                                                                   </div>
                                                                  
                                                                </div>
                                                            </div>
                                                        </div>
                                                             <div id="nz-box-21" class="  bord_active nz-box element-animate">
                                                            <div class="nz-box-wrap">
                                                              
                                                                <div class="box-data">
                                                                     <div style="width:100%;float:left;padding:20px;border:1px solid #808080">
                                                               <img src="images/qrcode333.jpeg"  alt=""/>
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
                        </div>
                   </div>

    <!-- // Click this button automatically when this page load using javascript -->
<!-- You can hide this button -->
<button id="rzp-button1" hidden>Pay</button>
      <button type="submit" id="rzp-paymentresponse" class="btn btn-primary" hidden>Submit</button>
    <input id="rzp_paymentid" type="hidden" />
    <input id="rzp_orderid" type="hidden" />

</asp:Content>

