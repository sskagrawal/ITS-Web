<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RenewService.aspx.cs" Inherits="Client_Panel_RenewService" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <asp:HiddenField ID="hdfUserID" runat="server"></asp:HiddenField>
    <!-- wrap start -->
        <div id="wrap" class="nz-wide">

            
            <header class="header desk version1 page-title-section-version1 one-page-side stuck-true stuck-boxed-false top-false full-width-true sl-true search-true cart-true sidebar-toggle-true iversion-light effect-fill hover-effect-fill megamenu-hover-effect-underline subeffect-ghost fixed-true fiversion-dark wiversion-light">

                <div class="header-content">

                    <div class="header-body">
                        <div class="container nz-clearfix">

                            <div class="logo logo-desk">
                                <a href="index.html" title="Montserrat">
                                    <img class="normal-logo" id="img_12a7_1" src="upload/logo%402.png" alt="Montserrat">
                                    <img class="fixed-logo" id="img_12a7_2" src="upload/logo_black%402.png" alt="Montserrat">
                                </a>
                            </div>

                            <div class="site-sidebar-toggle"></div>                    
                                                        
                        </div>
                    </div>

                </div>
            </header>
            <div class="page-content-wrap">


            <header class="rich-header page-header version1" data-parallax="true" id="header_12a7_0">
                <div class="parallax-container" id="div_12a7_0">&nbsp;</div>
                <div class="container nz-clearfix">

                    <div class="rh-content">
                        <h1 >Renew Services</h1>
                        <div class="rh-separator">&nbsp;</div>
                        <div id="div_12a7_1" class="nz-breadcrumbs nz-clearfix"><a href="index.html"  property="v:title">Home</a><span class="current">RENEW SERVICES</span></div>
                    </div>

                </div>
                <div id="slider-arrow" data-target="#nz-content" data-from="90" data-offset="90" class="i-separator animate nz-clearfix"></div>
            </header>

            <!-- content start -->
            <div id="nz-content" class='content nz-clearfix padding-false'>
                <div class='container page-full-width'>
                    <!-- post start -->
                    <div id="post-3166" class="post-3166 page type-page status-publish hentry">
                        <section class="page-content nz-clearfix">
                            



                            <div class="nz-section horizontal autoheight-false animate-false full-width-false " data-animation-speed="35000" data-parallax="false" id="div_12a7_3">
                                <div class="container">
                                    <div class="nz-row">
                                        <div class="col vc_col-sm-12 vc_col-lg-3 vc_col-md-2 vc_col-xs-12 col12  element-animate-false valign-top"  data-effect="none" data-align="center" data-margin="false">
                                            <div class="col-inner" ></div>
                                        </div>


                                        <div class="col vc_col-sm-12 vc_col-lg-6 vc_col-md-8 vc_col-xs-12 col12  element-animate-false valign-top"  data-effect="none" data-align="left" data-margin="false">
                                            <div class="col-inner" >
                                                <h3 id="h3_12a7_0" class="vc_custom_heading ninzio-latter-spacing">Renew Services</h3>
                                                <div class="sep-wrap element-animate element-animate-false center nz-clearfix" data-effect="none">
                                                    <div class="nz-separator solid" id="div_12a7_4">&nbsp;</div>
                                                </div>
                                               <%-- <div  class="nz-column-text nz-clearfix no-padding element-animate-false" data-effect="none" data-effect-speed="50">

                                                    <p id="p_12a7_0"><span id="span_12a7_0">Capitalise on low hanging fruit to identify a ballpark value added activity to beta test. Override the digital divide with additional clickthroughs.</span></p>

                                                </div>--%>
                                            </div>
                                        </div>


                                        <div class="col vc_col-sm-12 vc_col-lg-3 vc_col-md-2 vc_col-xs-12 col12  element-animate-false valign-top"  data-effect="none" data-align="left" data-margin="false">
                                            <div class="col-inner" ></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="nz-section horizontal autoheight-false animate-false full-width-false " data-animation-speed="35000" data-parallax="false" id="div_12a7_5">
                                <div class="container">
                                    <div class="nz-row">

                                        <div class="col vc_col-sm-12 col12  element-animate-false valign-top"  data-effect="none" data-align="left">
                                            <div class="col-inner" >


                                                <div class="table-responsive" style="overflow:auto;">
                        <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px"
                            EmptyDataText="Result Not Found" Width="100%" CssClass="table table-hover table-bordered table-condensed"
                            PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="true">
                          
                            
                              <Columns>
                                <asp:TemplateField HeaderText="SNo." HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate> 
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                    <%-- <asp:TemplateField HeaderText="Party_name" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Party_name")%>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>

                                   <asp:TemplateField HeaderText="Voucer No" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("VoucerNo")%>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                   <asp:TemplateField HeaderText="Category" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("CategoryName")%>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Service Type" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("SubCategoryN")%>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Product/Service" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("DomainName")%>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <%--  <asp:BoundField DataField="Party_name" HeaderText="Party_name" />--%>
                                  <%-- <asp:BoundField DataField="VoucerNo" HeaderText="VoucerNo" />       --%>                           
                                 <%--  <asp:BoundField DataField="CategoryName" HeaderText="Category" />--%>
                                 <%--  <asp:BoundField DataField="SubCategoryN" HeaderText="Service Type" />--%>
                                   <%-- <asp:BoundField DataField="DomainName" HeaderText="Product/Service" />--%>
                                  

                                  <asp:TemplateField HeaderText="Purchase Date" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("PurCahseDate","{0:dd/MM/yyyy}")%>
                                    </ItemTemplate>
                                </asp:TemplateField>



                                   <asp:TemplateField HeaderText="Renew Date" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("ReNewdate","{0:dd/MM/yyyy}")%>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                   <asp:TemplateField HeaderText="Days Untill Expiry" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                                           
                                        <asp:Label ID="lblExpiryDate" runat="server" Text='<%#getExpiryDays(Eval("SerID").ToString(),Eval("ReNewdate").ToString()) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                              <%--  <asp:TemplateField HeaderText="InvoiceNo" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("VoucherNo")%>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>

                               <%-- <asp:TemplateField HeaderText="Party Detail" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <strong>Party Name : </strong><%#Eval("Party_name")%><br />
                                        <strong>Address : </strong><%#Eval("address")%><br />
                                        <strong>Email : </strong> <%#Eval("Email")%>
                                       
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                             
                           
                              <%--    <asp:TemplateField HeaderText="Total Amount" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Total_Amount")%>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>


                               <%-- <asp:TemplateField HeaderText="Deposit Amount" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("DepositAmt")%>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>


                               <%-- <asp:TemplateField HeaderText="Due Amount" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <asp:Label ID="lblDueAmt" runat="server" Text='<%#Eval("DueAmt")%>'></asp:Label>
                                        
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                              
                             <%--   <asp:TemplateField HeaderText="Status" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <asp:Literal ID="ltrStatus" runat="server"></asp:Literal>
                                    </ItemTemplate>
                                </asp:TemplateField>

                             --%>

                                  <%--  <asp:TemplateField HeaderText="Payment" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <ItemTemplate> 
                                                                    <asp:HiddenField ID="hdfPartyID" Value='<%#Eval("PartyID")%>' runat="server" />
                                                                    <asp:HiddenField ID="hdfVCID" Value='<%#Eval("VoucherMasterID")%>' runat="server" />
                                                           
                                                              
                                                                </ItemTemplate>
                                                            </asp:TemplateField>--%>


                             


                             
                            </Columns>
                        </asp:GridView>
                       <%-- <div style="text-align: center">
                            <uc1:PagingControl ID="CustPager" OnPageChanged="CustPager_PageChanged" runat="server" />
                          
                        </div>--%>
                    </div>

                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <%--<div class="nz-section horizontal autoheight-false animate-false full-width-false " data-animation-speed="35000" data-parallax="false" id="div_12a7_9">
                                <div class="container">
                                    <div class="nz-row">
                                        <div class="col vc_col-sm-12 vc_col-lg-3 vc_col-md-2 vc_col-xs-12 col12  element-animate-false valign-top"  data-effect="none" data-align="center" data-margin="false">
                                            <div class="col-inner" ></div>
                                        </div>
                                        <div class="col vc_col-sm-12 vc_col-lg-6 vc_col-md-8 vc_col-xs-12 col12  element-animate-false valign-top"  data-effect="none" data-align="left" data-margin="false">
                                            <div class="col-inner" >
                                                <h3 id="h3_12a7_1" class="vc_custom_heading ninzio-latter-spacing">TESTIMONIALS</h3>
                                                <div class="sep-wrap element-animate element-animate-false center nz-clearfix" data-effect="none">
                                                    <div class="nz-separator solid" id="div_12a7_10">&nbsp;</div>
                                                </div>
                                                <div  class="nz-column-text nz-clearfix no-padding element-animate-false" data-effect="none" data-effect-speed="50">

                                                    <p id="p_12a7_1"><span id="span_12a7_13">Capitalise on low hanging fruit to identify a ballpark value added activity to beta test. Override the digital divide with additional clickthroughs.</span></p>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col vc_col-sm-12 vc_col-lg-3 vc_col-md-2 vc_col-xs-12 col12  element-animate-false valign-top"  data-effect="none" data-align="left" data-margin="false">
                                            <div class="col-inner" ></div>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                            <%--<div class="nz-section horizontal autoheight-false animate-false full-width-false " data-animation-speed="35000" data-parallax="false" id="div_12a7_11">
                                <div class="container">
                                    <div class="nz-row">
                                        <div class="col vc_col-sm-12 col12  element-animate-false valign-top"  data-effect="none" data-align="left">
                                            <div class="col-inner" >
                                                <div id="nz-testimonials-1" data-autoplay="true" data-columns="3" class="none nz-testimonials lazy">
                                                    <div class="testimonial">
                                                        <div class="test-wrap nz-clearfix"><img src="upload/testimonials1.png" alt="Michael Smart">
                                                            <div class="text">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincid unt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper.
                                                            </div>
                                                            <div class="test-data"><span class="name">Michael Smart</span><span class="title">Repairing Manager</span></div>
                                                        </div>
                                                    </div>
                                                    <div class="testimonial">
                                                        <div class="test-wrap nz-clearfix"><img src="upload/testimonials2.png" alt="Alexander Brown">
                                                            <div class="text">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincid unt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper.</div>
                                                            <div class="test-data"><span class="name">Alexander Brown</span><span class="title">Repairing Manager</span></div>
                                                        </div>
                                                    </div>
                                                    <div class="testimonial">
                                                        <div class="test-wrap nz-clearfix"><img src="upload/testimonials3.png" alt="Barbara Mcdoe">
                                                            <div class="text">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincid unt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper.</div>
                                                            <div class="test-data"><span class="name">Barbara Mcdoe</span><span class="title">Web Designer</span></div>
                                                        </div>
                                                    </div>
                                                    <div class="testimonial">
                                                        <div class="test-wrap nz-clearfix"><img src="upload/testimonials4.png" alt="Ani Mcdoe">
                                                            <div class="text">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincid unt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper.</div>
                                                            <div class="test-data"><span class="name">Ani Mcdoe</span><span class="title">Web Designer</span></div>
                                                        </div>
                                                    </div>
                                                    <div class="testimonial">
                                                        <div class="test-wrap nz-clearfix"><img src="upload/testimonials5.png" alt="Ina Mcdoe">
                                                            <div class="text">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincid unt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper.</div>
                                                            <div class="test-data"><span class="name">Ina Mcdoe</span><span class="title">Web Developer</span></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                            <%--<div class="nz-section horizontal autoheight-false animate-false full-width-true " data-animation-speed="35000" data-parallax="false" >
                                <div class="nz-row">
                                    <div class="col vc_col-sm-12 col12  element-animate-false valign-top"  data-effect="none" data-align="left" data-margin="false">
                                        <div class="col-inner" >
                                            <div id="nz-tagline-1"  class="nz-tagline">
                                                <div class="container nz-clearfix"><span id="span_12a7_14" class="tagline-icon icon-bulb"></span><span class="tagline-title">Welcome To The Best Modern Website Studio You Ever Seen</span><a class="button button-normal white square icon-true full-false medium animate-false anim-type-ghost hover-fill" href="http://ninzio.com/"><span class="txt">Purchase now</span><span class="btn-icon icon-cart"></span></a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
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

