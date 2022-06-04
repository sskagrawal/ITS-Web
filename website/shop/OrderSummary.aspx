<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OrderSummary.aspx.cs" Inherits="shop_OrderSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hdfBuyerId" runat="server" />
    <asp:HiddenField ID="hdfOrderId" runat="server" />
    <header class="rich-header page-header version1" data-parallax="true" id="header_23d9_0">
                    <div class="parallax-container" id="div_23d9_0">&nbsp;</div>
                    <div class="container nz-clearfix">

                        <div class="rh-content">
                            <h1>Order Summary</h1>
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
                                            <div id="OrderSumm" runat="server">
                                            <div class="col vc_col-sm-6 col6  element-animate-false valign-top" data-effect="none" data-align="left">
                                                <div class="col-inner">
                                                    <h3 id="h3_ff88_4" class="vc_custom_heading ninzio-latter-spacing">Shipping Address</h3>
                                                    <div class="sep-wrap element-animate element-animate-false left nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_ff88_9">&nbsp;</div>
                                                    </div>
                                                    <ul class="nz-i-list square">
                                                        <li>
                                                            <%--<div><span class="icon icon-checkmark" id="span_ff88_8"></span></div>--%>
                                                            <div>
                                                                <asp:Label ID="lblName" runat="server"></asp:Label></div>
                                                        </li>
                                                        <li>
                                                            <%--<div><span class="icon icon-checkmark" id="span_ff88_9"></span></div>--%>
                                                            <div>
                                                                <asp:Label ID="lblMob" runat="server"></asp:Label></div>
                                                        </li>
                                                        <li>
                                                            <%--<div><span class="icon icon-checkmark" id="span_ff88_10"></span></div>--%>
                                                            <div>
                                                                <asp:Label ID="lblPincode" runat="server"></asp:Label>&nbsp;&nbsp;<asp:Label ID="lblAddr" runat="server" ></asp:Label></div>
                                                        </li>
                                                        <li>
                                                            <%--<div><span class="icon icon-checkmark" id="span_ff88_11"></span></div>--%>
                                                            <div><asp:Label ID="lblCity" runat="server"></asp:Label>&nbsp;&nbsp;<asp:Label ID="lblState" runat="server"></asp:Label></div>
                                                        </li>
                                                        
                                                    </ul>


                                                </div>

                                            </div>
                                             <div class="col vc_col-sm-6 col6  element-animate-false valign-top" data-effect="none" data-align="left">
                                                <div class="col-inner">
                                                    <h3 id="h3_ff88_4" class="vc_custom_heading ninzio-latter-spacing">Amount</h3>
                                                       <div class="sep-wrap element-animate element-animate-false left nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_ff88_9">&nbsp;</div>
                                                    </div>
                                                     <div class="col vc_col-sm-8 col8  element-animate-false valign-top" data-effect="none" data-align="left">
                                                          <div class="col-inner">
                                                              Sub Total:
                                                              </div>
                                                        </div>
                                                    <div class="col vc_col-sm-4 col4  element-animate-false valign-top" data-effect="none" data-align="left">
                                                           <div class="col-inner">
                                                               <asp:Label ID="lblSubTot" runat="server" Text="Label"></asp:Label>
                                                               </div>
                                                        </div>
                                                    <div class="col vc_col-sm-8 col8  element-animate-false valign-top" data-effect="none" data-align="left">
                                                          <div class="col-inner">
                                                              Shippng Charge:
                                                              </div>
                                                        </div>
                                                    <div class="col vc_col-sm-4 col4  element-animate-false valign-top" data-effect="none" data-align="left">
                                                           <div class="col-inner">
                                                               <asp:Label ID="lblShip" runat="server" Text="Label"></asp:Label>
                                                               </div>
                                                        </div>
                                                    <div class="col vc_col-sm-8 col8  element-animate-false valign-top" data-effect="none" data-align="left">
                                                          <div class="col-inner">
                                                              Total:
                                                              </div>
                                                        </div>
                                                    <div class="col vc_col-sm-4 col4  element-animate-false valign-top" data-effect="none" data-align="left">
                                                           <div class="col-inner">
                                                               <asp:Label ID="lblTotal" runat="server" Text="Label"></asp:Label>
                                                               </div>
                                                        </div>
                                                    </div>
                                                 </div>
                                              <div class="col vc_col-sm-8 col8  element-animate-false valign-top" data-effect="none" data-align="left">
                                                <div class="col-inner">
                                                    <h3 id="h3_ff88_4" class="vc_custom_heading ninzio-latter-spacing">Selected Item(s)</h3>
                                                       <div class="sep-wrap element-animate element-animate-false left nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_ff88_9">&nbsp;</div>
                                                    </div>
                                                    <asp:GridView CssClass="nz-table" ID="dtLstCart" runat="server" AutoGenerateColumns="false" EmptyDataText="Result Not Found"
                                    Width="100%" GridLines="None" ShowHeader="true" >
                                    <Columns>
                                         <asp:TemplateField HeaderText="Color">
                                         <ItemTemplate>
                                             <img width="90" height="90" src='<%#Eval("selectedImg","../Product_image/{0}")%>' style="border:1px solid grey;padding:2px;" class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image" alt=""  />
                                                                      
                                                                     
                                             </ItemTemplate>
                                             </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product Detail">
                                         <ItemTemplate>
                                               <p><strong>
                                                   <asp:Label ID="lblProductName" runat="server" Text='<%#Eval("PrdName")%>'></asp:Label>
                                                 </strong><br />
                                                   Size : <%#Eval("prdSize")%>
                                               </p>
                                             </ItemTemplate>
                                            </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quantity">
                                            <ItemTemplate>
                                                  
                                                                        <div class="cart" method="post" enctype='multipart/form-data'>

                                                    <div class="quantity">
                                                        <%#Eval("Qnt")%>
                                                        
                                                    </div>

                                                  
                                                

                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Price">
                                            <ItemTemplate>
                                                <span class="woocommerce-Price-currencySymbol"> &#x20b9; </span> 
                                                                         
                                                       <asp:Label ID="lblSellingPrice" runat="server" Text='<%#Eval("UnitPrice")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Shipping Charge">
                                            <ItemTemplate>
                                                <asp:Label ID="lblShipCharge" runat="server" Text='<%#Eval("ShipCharge")%>'></asp:Label>
                                                </ItemTemplate>
                                              </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Total">
                                            <ItemTemplate>
                                                <span class="woocommerce-Price-currencySymbol"> &#x20b9; </span> 
                                                                        <asp:Label ID="lblSubTotal" runat="server" Text='<%#Eval("PrdPriceTotal")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                      <%--  <asp:TemplateField HeaderText="Delete">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" CssClass="color_dark" runat="server" OnClick="LinkButton1_Click" class="cart__remove"> <span><i class="fa fa-times"></i></span></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        </Columns>
                                                             </asp:GridView>
                                                     </div>
                                                 </div>
                                              <div class="col vc_col-sm-4 col4  element-animate-false valign-top" data-effect="none" data-align="left">
                                                <div class="col-inner">
                                                    <h3 id="h3_ff88_4" class="vc_custom_heading ninzio-latter-spacing">Payment Mode</h3>
                                                       <div class="sep-wrap element-animate element-animate-false left nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_ff88_9">&nbsp;</div>
                                                    </div>
                                                     <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                                        <asp:ListItem>Cash On Delivery</asp:ListItem>
                                                        <asp:ListItem>Online</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:Button ID="btnSumit" runat="server" Text="Place Order" OnClick="btnSumit_Click" />
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
</asp:Content>

