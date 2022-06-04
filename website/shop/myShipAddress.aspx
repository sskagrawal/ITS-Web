<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="myShipAddress.aspx.cs" Inherits="shop_myShipAddress" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hdfPartyId" runat="server" />
    <asp:HiddenField ID="hdfShipAddrId" runat="server" />
    <asp:HiddenField ID="hdfEmail" runat="server" />
     <header class="rich-header page-header version1" data-parallax="true" id="header_23d9_0">
                    <div class="parallax-container" id="div_23d9_0">&nbsp;</div>
                    <div class="container nz-clearfix">

                        <div class="rh-content">
                            <h1>Shipping Address</h1>
                            <div class="rh-separator">&nbsp;</div>
                            <div id="div_23d9_1" class="nz-breadcrumbs nz-clearfix"><a href="../default.aspx"  property="v:title">Home</a><span class="current">Shopping cart</span></div>
                        </div>

                    </div>
                    <div id="slider-arrow" data-target="#nz-content" data-from="90" data-offset="90" class="i-separator animate nz-clearfix"></div>
                </header>
    <div id="nz-content" class="content nz-clearfix padding-false">
                    <div class="container page-full-width">
                        <!-- post start -->
                        <div id="post-2052" class="post-2052 page type-page status-publish hentry">
                            <section class="page-content nz-clearfix">
                                <div class="nz-section horizontal autoheight-false animate-false full-width-false " data-animation-speed="35000" data-parallax="false" id="div_ff88_2">
                                    <div class="container">
                                        <div class="nz-row">
                                            <%if (dtShipAddr != null && dtShipAddr.Rows.Count > 0)
                                                {
                                                    foreach(System.Data.DataRow dr in dtShipAddr.Rows)
                                                    {%>
                                            <div class="col vc_col-sm-4 col4  element-animate-false valign-top" data-effect="none" data-align="left">
                                                <div class="col-inner">
                                                    <h3 id="h3_ff88_4" class="vc_custom_heading ninzio-latter-spacing">Shipping Address</h3>
                                                    <div class="sep-wrap element-animate element-animate-false left nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_ff88_9">&nbsp;</div>
                                                    </div>
                                                    <ul class="nz-i-list square">
                                                        <li>
                                                            <%--<div><span class="icon icon-checkmark" id="span_ff88_8"></span></div>--%>
                                                            <div><%=dr["name"].ToString()  %></div>
                                                        </li>
                                                        <li>
                                                            <%--<div><span class="icon icon-checkmark" id="span_ff88_9"></span></div>--%>
                                                            <div><%=dr["mobNo"].ToString()  %></div>
                                                        </li>
                                                        <li>
                                                            <%--<div><span class="icon icon-checkmark" id="span_ff88_10"></span></div>--%>
                                                            <div><%=dr["pincode"].ToString()  %>&nbsp;&nbsp;<%=dr["address"].ToString()  %></div>
                                                        </li>
                                                        <li>
                                                            <%--<div><span class="icon icon-checkmark" id="span_ff88_11"></span></div>--%>
                                                            <div><%=dr["cityname"].ToString()  %>&nbsp;&nbsp;<%=dr["statename"].ToString()  %></div>
                                                        </li>
                                                        <li><a style="text-align:right;font-weight:bold" href="#">Select this address</a></li>
                                                    </ul>


                                                </div>

                                            </div>
                                                    <%}
                                                } %>
                                               
                                            
                                            <div class="col vc_col-sm-12 col12  element-animate-false valign-top" data-effect="none" data-align="left">
                                                <div class="col-inner">
                                                    <h3 id="h3_ff88_1" class="vc_custom_heading ninzio-latter-spacing">Deliver to</h3>
                                                    <div class="sep-wrap element-animate element-animate-false left nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_ff88_4">&nbsp;</div>
                                                    </div>
                                                    <div class="nz-column-text nz-clearfix  element-animate-false" data-effect="none" data-effect-speed="50">
                                                        <div class="col-inner" >
                                                    <div role="form" class="wpcf7" id="wpcf7-f4283-p4325-o1" lang="en-US" dir="ltr">
                                                        <div class="screen-reader-response"></div>
                                                        <div id="contact-form" action="#">
                                                            <div class="col col4" data-margin="true"><span class="wpcf7-form-control-wrap your-name">
                                                                <input id="txtName" type="text" runat="server" value="" size="40" class="wpcf7-form-control wpcf7-text" aria-invalid="false" placeholder="Name" /></span></div>
                                                              <div class="col col4" data-margin="true"><span class="wpcf7-form-control-wrap your-email">
                                                                <input id="txtMob" type="text" runat="server" value="" size="40" class="wpcf7-form-control wpcf7-text wpcf7-email wpcf7-validates-as-email" aria-invalid="false" placeholder="Mobile No." /></span></div>
                                                            <div class="col col4" data-margin="true"><span class="wpcf7-form-control-wrap your-subject">
                                                                <%--<input name="subject" id="subject" type="text" value="" size="40" class="wpcf7-form-control wpcf7-text" aria-invalid="false" placeholder="State" />--%>
                                                            <asp:DropDownList ID="ddlState" runat="server" CssClass="wpcf7-form-control wpcf7-text">

                                                            </asp:DropDownList>
                                                                                                     </span></div>
                                                            <div class="col col4" data-margin="true"><span class="wpcf7-form-control-wrap your-email">
                                                                <input id="txtCity" type="text" runat="server" value="" size="40" class="wpcf7-form-control wpcf7-text wpcf7-email wpcf7-validates-as-email" aria-invalid="false" placeholder="City" /></span></div>
                                                            <div class="col col4" data-margin="true"><span class="wpcf7-form-control-wrap your-name">
                                                                <input id="txtAddr" type="text" value="" runat="server" size="40" class="wpcf7-form-control wpcf7-text" aria-invalid="false" placeholder="Address" /></span></div>
                                                            
                                                            
                                                            <div class="col col4" data-margin="true"><span class="wpcf7-form-control-wrap your-name">
                                                                <input id="txtPincode" type="text" value="" runat="server" size="40" class="wpcf7-form-control wpcf7-text" aria-invalid="false" placeholder="PinCode" /></span></div>
                                                             <div class="col col4" data-margin="true"><span class="wpcf7-form-control-wrap your-name">
                                                                <asp:CheckBox ID="chkDefAddr" runat="server" />Make it default </span></div>
                                                          
                                                            
                                                            <div class="col col12">
                                                                                                         <asp:Button ID="btnUpdCont" runat="server" Text="Update & Continue" OnClick="btnUpdCont_Click" />
                                                                                                         <asp:Button ID="btnCont" runat="server" Text="Continue" OnClick="btnCont_Click" />
                                                                <%--<input type="submit" value="Update & Continue"  id="submit_contact">
                                                                <input type="submit" value="Continue">--%>
                                    
                                                                <div id="msg" class="message"></div>
                                                            </div>
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

</asp:Content>

