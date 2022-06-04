<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="shop_Cart" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

  <style type="text/css">
        .contact-page-area .contact-area .btn-send
        {
            background:#33ad42;
        }

        @media(max-width:767px){

            tbody tr:first-child{
                display: none;
            }
            tbody tr{
                display: flex;
                flex-direction: column;
                text-align: center;
            }
            tbody tr td:nth-child(3) {
                display: flex;
                justify-content: center;
            }

            tbody tr td:nth-child(2) {
                display: flex;
                justify-content: center;
            }
        }

        @media only screen and (min-width:768px) and (max-width:992px){
            .col-inner {
                margin-left: -4rem;
            }
        }
        
    </style>
    <script type="text/javascript"> 
   

    function UpdateQnt(PrdID,offrPrc,offrPerc,prdSz,slPrc,mrpPrc, obj) { 

        var el = $(obj);
        numericInput1(el, PrdID,offrPrc,offrPerc,prdSz,slPrc,mrpPrc);

    }
    function UpdateQnt1(PrdID,offrPrc,offrPerc,prdSz,slPrc,mrpPrc, obj) {

        var el = $(obj);
        numericInputKewDown(el, PrdID,offrPrc,offrPerc,prdSz,slPrc,mrpPrc);

    }

    function numericInput1(el, prdid,offrPrc,offrPerc,prdSz,slPrc,mrpPrc) {

        var element = el;
        var input = $(element).find('input');


        var value = parseInt($("#" + prdid + "_Quantity").val());
        if (value == 25) {
            $(this).css({ cursor: "default" });
            e.preventDefault();
            e.stopPropagation();
        }
        else {
            $("#" + prdid + "_Quantity").val(value + 1);
         //   alert($("#" + prdid + "_Quantity").val());

            SetQnt(prdid, $("#" + prdid + "_Quantity").val(),offrPrc,offrPerc,prdSz,slPrc,mrpPrc);
        }
    }
    function numericInputKewDown(el, prdid,offrPrc,offrPerc,prdSz,slPrc,mrpPrc) {

        var element = el;
        var input = $(element).find('input');


        var value = parseInt($("#" + prdid + "_Quantity").val());
        if (value <= 0) {
            $(this).css({ cursor: "default" });
            e.preventDefault();
            e.stopPropagation();
        }
        else {
            $("#" + prdid + "_Quantity").val(value - 1);
            SetQnt(prdid, $("#" + prdid + "_Quantity").val(),offrPrc,offrPerc,prdSz,slPrc,mrpPrc);
        }
    }
    function SetQnt(PrdID, qnt,offrPrc,offrPerc,prdSz,slPrc,mrpPrc) {
      
        $.ajax({
            type: "POST",
            url: "" + baseURL + "WebMethods/AutoComplete.asmx/UpdateItemQnt",
            data: "{'PrdID':'" + PrdID + "','Qnt':'" + qnt + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function () {
                //alert("hi");
                //ShopCartItem();
                ShowAddToCart(PrdID, qnt,offrPrc,offrPerc,prdSz,slPrc,mrpPrc)
                //FillShopCart();
               
            },
            error: function () {
                alert("There is problem to call server method");
            }
        });


        return false;
    }

 
</script>
    




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <header class="rich-header page-header version1" data-parallax="true" id="header_23d9_0">
                    <div class="parallax-container" id="div_23d9_0">&nbsp;</div>
                    <div class="container nz-clearfix">

                        <div class="rh-content">
                            <h1>Shopping cart</h1>
                            <div class="rh-separator">&nbsp;</div>
                            <div id="div_23d9_1" class="nz-breadcrumbs nz-clearfix"><a href="../default.aspx"  property="v:title">Home</a><span class="current">Shopping cart</span></div>
                        </div>

                    </div>
                    <div id="slider-arrow" data-target="#nz-content" data-from="90" data-offset="90" class="i-separator animate nz-clearfix"></div>
                </header>


                <!-- content start -->
                <div id="nz-content" class='content nz-clearfix padding-false'>
                    <div class='container page-full-width'>
                        <!-- post start -->
                        <div id="post-2089" class="post-2089 page type-page status-publish hentry">
                            <section class="page-content nz-clearfix">
                                <%--<div class="nz-section horizontal autoheight-false animate-false full-width-false " data-animation-speed="35000" data-parallax="false" id="div_23d9_2">
                                    <div class="container">
                                        <div class="nz-row">
                                            <div class="col vc_col-sm-12 col12  element-animate-false valign-top"  data-effect="none" data-align="left">
                                                <div class="col-inner" >
                                                    <h3 id="h3_23d9_0" class="vc_custom_heading ninzio-latter-spacing">PRICING TABLES</h3>
                                                    <div class="sep-wrap element-animate element-animate-false center nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_23d9_3">&nbsp;</div>
                                                    </div>
                                                    <div id="div_23d9_4" class="nz-column-text nz-clearfix no-padding element-animate-false" data-effect="none" data-effect-speed="50">
                                                        
                                                        <p id="p_23d9_0"><span id="span_23d9_0">Pricing tables can be used to show your pricing plans. You can change the number of columns, highlight some plan and add animation to pricing tables.</span></p>
                                                        <p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>--%>
                                <%--<div class="nz-section horizontal autoheight-false animate-false full-width-false " data-animation-speed="35000" data-parallax="false" id="div_23d9_5">
                                    <div class="container">
                                        <div class="nz-row">
                                            <div class="col vc_col-sm-12 col12  element-animate-false valign-top"  data-effect="none" data-align="left">
                                                <div class="col-inner" >
                                                    <div id="nz-pricing-table-1" class="nz-pricing-table nz-clearfix animate-none" data-animate="false" data-columns="4">
                                                        <div id="nz-column-1" class="element-animate column highlight-false">
                                                            <div class="column-inner">
                                                                <div class="title">Starter Plan</div>
                                                                <div class="pricing">
                                                                    <div class="price"><span class="currency">$</span>29</div>
                                                                    <div class="tariff">tariff/m</div>
                                                                </div>
                                                                <div class="c-body">
                                                                    <div class="c-row">5 Websites</div>
                                                                    <div class="c-row">2GB Storage</div>
                                                                    <div class="c-row">Unlimited Users</div>
                                                                    <div class="c-row">Domain Name Inclided</div>
                                                                    <div class="c-row">200BG Email</div>
                                                                </div>
                                                                <div class="c-foot"><a href="#" class="animate-false medium button square button-ghost hover-fill grey_light">More Details</a></div>
                                                            </div>
                                                        </div>
                                                        <div id="nz-column-2" class="element-animate column highlight-false">
                                                            <div class="column-inner">
                                                                <div class="title">Beginner Plan</div>
                                                                <div class="pricing">
                                                                    <div class="price"><span class="currency">$</span>39</div>
                                                                    <div class="tariff">tariff/m</div>
                                                                </div>
                                                                <div class="c-body">
                                                                    <div class="c-row">5 Websites</div>
                                                                    <div class="c-row">2GB Storage</div>
                                                                    <div class="c-row">Unlimited Users</div>
                                                                    <div class="c-row">Domain Name Inclided</div>
                                                                    <div class="c-row">200BG Email</div>
                                                                </div>
                                                                <div class="c-foot"><a href="#" class="animate-false medium button square button-ghost hover-fill grey_light">More Details</a></div>
                                                            </div>
                                                        </div>
                                                        <div id="nz-column-3" class="element-animate column highlight-true">
                                                            <div class="column-inner">
                                                                <div class="title">Professional Plan</div>
                                                                <div class="pricing">
                                                                    <div class="price"><span class="currency">$</span>59</div>
                                                                    <div class="tariff">tariff/m</div>
                                                                </div>
                                                                <div class="c-body">
                                                                    <div class="c-row">5 Websites</div>
                                                                    <div class="c-row">2GB Storage</div>
                                                                    <div class="c-row">Unlimited Users</div>
                                                                    <div class="c-row">Domain Name Inclided</div>
                                                                    <div class="c-row">200BG Email</div>
                                                                </div>
                                                                <div class="c-foot"><a href="#" class="animate-false medium button square button-ghost hover-fill grey_light">More Details</a></div>
                                                            </div>
                                                        </div>
                                                        <div id="nz-column-4" class="element-animate column highlight-false">
                                                            <div class="column-inner">
                                                                <div class="title">Expert Plan</div>
                                                                <div class="pricing">
                                                                    <div class="price"><span class="currency">$</span>79</div>
                                                                    <div class="tariff">tariff/m</div>
                                                                </div>
                                                                <div class="c-body">
                                                                    <div class="c-row">5 Websites</div>
                                                                    <div class="c-row">2GB Storage</div>
                                                                    <div class="c-row">Unlimited Users</div>
                                                                    <div class="c-row">Domain Name Inclided</div>
                                                                    <div class="c-row">200BG Email</div>
                                                                </div>
                                                                <div class="c-foot"><a href="#" class="animate-false medium button square button-ghost hover-fill grey_light">More Details</a></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>--%>
                                <%--<div class="nz-section horizontal autoheight-false animate-false full-width-false " data-animation-speed="35000" data-parallax="false" id="div_23d9_6">
                                    <div class="container">
                                        <div class="nz-row">
                                            <div class="col vc_col-sm-12 col12  element-animate-false valign-top"  data-effect="none" data-align="left">
                                                <div class="col-inner" >
                                                    <div id="nz-pricing-table-2" class="nz-pricing-table nz-clearfix animate-scale" data-animate="true" data-columns="3">
                                                        <div id="nz-column-5" class="element-animate column highlight-false">
                                                            <div class="column-inner">
                                                                <div class="title">Beginner Plan</div>
                                                                <div class="pricing">
                                                                    <div class="price"><span class="currency">$</span>39</div>
                                                                    <div class="tariff">tariff/m</div>
                                                                </div>
                                                                <div class="c-body">
                                                                    <div class="c-row">5 Websites</div>
                                                                    <div class="c-row">2GB Storage</div>
                                                                    <div class="c-row">Unlimited Users</div>
                                                                    <div class="c-row">Domain Name Inclided</div>
                                                                    <div class="c-row">200BG Email</div>
                                                                </div>
                                                                <div class="c-foot"><a href="#" class="animate-false medium button square button-ghost hover-fill grey_light">More Details</a></div>
                                                            </div>
                                                        </div>
                                                        <div id="nz-column-6" class="element-animate column highlight-true">
                                                            <div class="column-inner">
                                                                <div class="title">Professional Plan</div>
                                                                <div class="pricing">
                                                                    <div class="price"><span class="currency">$</span>59</div>
                                                                    <div class="tariff">tariff/m</div>
                                                                </div>
                                                                <div class="c-body">
                                                                    <div class="c-row">5 Websites</div>
                                                                    <div class="c-row">2GB Storage</div>
                                                                    <div class="c-row">Unlimited Users</div>
                                                                    <div class="c-row">Domain Name Inclided</div>
                                                                    <div class="c-row">200BG Email</div>
                                                                </div>
                                                                <div class="c-foot"><a href="#" class="animate-false medium button square button-ghost hover-fill grey_light">More Details</a></div>
                                                            </div>
                                                        </div>
                                                        <div id="nz-column-7" class="element-animate column highlight-false">
                                                            <div class="column-inner">
                                                                <div class="title">Expert Plan</div>
                                                                <div class="pricing">
                                                                    <div class="price"><span class="currency">$</span>€79</div>
                                                                    <div class="tariff">tariff/m</div>
                                                                </div>
                                                                <div class="c-body">
                                                                    <div class="c-row">5 Websites</div>
                                                                    <div class="c-row">2GB Storage</div>
                                                                    <div class="c-row">Unlimited Users</div>
                                                                    <div class="c-row">Domain Name Inclided</div>
                                                                    <div class="c-row">200BG Email</div>
                                                                </div>
                                                                <div class="c-foot"><a href="#" class="animate-false medium button square button-ghost hover-fill grey_light">More Details</a></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>--%>
                                <%--<div class="nz-section horizontal autoheight-false animate-false full-width-false " data-animation-speed="35000" data-parallax="false" id="div_23d9_7">
                                    <div class="container">
                                        <div class="nz-row">
                                            <div class="col vc_col-sm-12 col12  element-animate-false valign-top"  data-effect="none" data-align="left">
                                                <div class="col-inner" >
                                                    <div id="nz-pricing-table-3" class="nz-pricing-table nz-clearfix animate-none" data-animate="false" data-columns="4">
                                                        <div id="nz-column-8" class="element-animate column highlight-false">
                                                            <div class="column-inner">
                                                                <div class="title">Starter Plan</div>
                                                                <div class="pricing">
                                                                    <div class="price"><span class="currency">$</span>29</div>
                                                                    <div class="tariff">tariff/m</div>
                                                                </div>
                                                                <div class="c-body">
                                                                    <div class="c-row">5 Websites</div>
                                                                    <div class="c-row">2GB Storage</div>
                                                                    <div class="c-row">Unlimited Users</div>
                                                                    <div class="c-row">Domain Name Inclided</div>
                                                                    <div class="c-row">200BG Email</div>
                                                                </div>
                                                                <div class="c-foot"><a href="#" class="animate-false medium button square button-ghost hover-fill grey_light">More Details</a></div>
                                                            </div>
                                                        </div>
                                                        <div id="nz-column-9" class="element-animate column highlight-false">
                                                            <div class="column-inner">
                                                                <div class="title">Beginner Plan</div>
                                                                <div class="pricing">
                                                                    <div class="price"><span class="currency">$</span>39</div>
                                                                    <div class="tariff">tariff/m</div>
                                                                </div>
                                                                <div class="c-body">
                                                                    <div class="c-row">5 Websites</div>
                                                                    <div class="c-row">2GB Storage</div>
                                                                    <div class="c-row">Unlimited Users</div>
                                                                    <div class="c-row">Domain Name Inclided</div>
                                                                    <div class="c-row">200BG Email</div>
                                                                </div>
                                                                <div class="c-foot"><a href="#" class="animate-false medium button square button-ghost hover-fill grey_light">More Details</a></div>
                                                            </div>
                                                        </div>
                                                        <div id="nz-column-10" class="element-animate column highlight-false">
                                                            <div class="column-inner">
                                                                <div class="title">Professional Plan</div>
                                                                <div class="pricing">
                                                                    <div class="price"><span class="currency">$</span>59</div>
                                                                    <div class="tariff">tariff/m</div>
                                                                </div>
                                                                <div class="c-body">
                                                                    <div class="c-row">5 Websites</div>
                                                                    <div class="c-row">2GB Storage</div>
                                                                    <div class="c-row">Unlimited Users</div>
                                                                    <div class="c-row">Domain Name Inclided</div>
                                                                    <div class="c-row">200BG Email</div>
                                                                </div>
                                                                <div class="c-foot"><a href="#" class="animate-false medium button square button-ghost hover-fill grey_light">More Details</a></div>
                                                            </div>
                                                        </div>
                                                        <div id="nz-column-11" class="element-animate column highlight-false">
                                                            <div class="column-inner">
                                                                <div class="title">Expert Plan</div>
                                                                <div class="pricing">
                                                                    <div class="price"><span class="currency">$</span>79</div>
                                                                    <div class="tariff">tariff/m</div>
                                                                </div>
                                                                <div class="c-body">
                                                                    <div class="c-row">5 Websites</div>
                                                                    <div class="c-row">2GB Storage</div>
                                                                    <div class="c-row">Unlimited Users</div>
                                                                    <div class="c-row">Domain Name Inclided</div>
                                                                    <div class="c-row">200BG Email</div>
                                                                </div>
                                                                <div class="c-foot"><a href="#" class="animate-false medium button square button-ghost hover-fill grey_light">More Details</a></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>--%>
                                <div class="nz-section horizontal autoheight-false animate-false full-width-false " data-animation-speed="35000" data-parallax="false" id="div_23d9_8">
                                    <div class="container">
                                        <div class="nz-row">
                                            <div class="col vc_col-sm-12 col12  element-animate-false valign-top"  data-effect="none" data-align="left">
                                                <div class="col-inner" >
                                                    <h3 id="h3_23d9_1" class="vc_custom_heading ninzio-latter-spacing">Your Order List</h3>
                                                    <div class="sep-wrap element-animate element-animate-false center nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_23d9_9">&nbsp;</div>
                                                    </div>
                                               <%--     <div id="div_23d9_10" class="nz-column-text nz-clearfix no-padding element-animate-false" data-effect="none" data-effect-speed="50">
                                                        
                                                        <p id="p_23d9_1"><span id="span_23d9_1">Ordinary tables can be used to show some information in tables. You can change color, number of rows and columns, merge columns or rows together and much more.</span></p>
                                                        <p>
                                                    </div>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="nz-section horizontal autoheight-false animate-false full-width-false " data-animation-speed="35000" data-parallax="false" id="div_23d9_11">
                                    <div class="container">
                                        <div class="nz-row">
                                                 <div class="col vc_col-sm-12 col12  element-animate-false valign-top"  data-effect="none" data-align="left">

                                                   
                                                   <%--   <div class="col-inner" >--%>
                                                    <div  class="nz-column-text nz-clearfix  element-animate-false" data-effect="none" data-effect-speed="50">
                                                         <asp:GridView CssClass="nz-table" ID="dtLstCart" runat="server" AutoGenerateColumns="false" EmptyDataText="Result Not Found"
                                    Width="100%" GridLines="None" ShowHeader="true" >
                                    <Columns>
                                         <asp:TemplateField HeaderText="Color">
                                         <ItemTemplate>
                                             <img width="90" height="90" src='<%#Eval("prdColor","../Product_image/{0}")%>' style="border:1px solid grey;padding:2px;" class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image" alt=""  />
                                                                      
                                                                       <asp:HiddenField ID="hdfProductId" runat="server" Value='<%#Eval("Prd_ID")%>' />
                                              <asp:HiddenField ID="hdfPrdQnt" runat="server" Value='<%#Eval("Qnt")%>' />
                                              <asp:HiddenField ID="hdfSelImg" runat="server" Value='<%#Eval("prdColor")%>' />
                                              <asp:HiddenField ID="hdfPrdSize" runat="server" Value='<%#Eval("prdSize")%>' />
                                             </ItemTemplate>
                                             </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product Detail">
                                         <ItemTemplate>
                                               <p><strong>
                                                   <asp:Label ID="lblProductName" runat="server" Text='<%#Eval("Prd_Name")%>'></asp:Label>
                                                 </strong><br />
                                                   Size : <%#Eval("prdSize")%>
                                               </p>
                                             </ItemTemplate>
                                            </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quantity">
                                            <ItemTemplate>
                                                  
                                                                        <div class="cart" method="post" enctype='multipart/form-data'>

                                                    <div class="quantity">
                                                        <input type="number" step="1" min="1" max="94" name="quantity" value='<%#Eval("Qnt")%>' onchange="updQnt(this,<%# Eval("Prd_ID") %>)" title="Qty" class="input-text qty text" size="4" pattern="[0-9]*" inputmode="numeric" />
                                                    </div>

                                                  
                                                

                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Price">
                                            <ItemTemplate>
                                                <span class="woocommerce-Price-currencySymbol"> &#x20b9; </span> 
                                                                          <asp:HiddenField ID="hdfOffrPrice" runat="server" Value='<%#Eval("offrPrice")%>' />
                                                       <asp:HiddenField ID="hdfOffrPercnt" runat="server" Value='<%#Eval("offrPrcntg")%>' />
                                                       <asp:HiddenField ID="hdfMrpPrc" runat="server" Value='<%#Eval("MrpPrice")%>' />
                                                       <asp:Label ID="lblSellingPrice" runat="server" Text='<%#Eval("SellingPrice")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Shipping Charge">
                                            <ItemTemplate>
                                                <asp:Label ID="lblShipCharge" runat="server" Text='<%#Eval("DelCharge")%>'></asp:Label>
                                                </ItemTemplate>
                                              </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Total">
                                            <ItemTemplate>
                                                <span class="woocommerce-Price-currencySymbol"> &#x20b9; </span> 
                                                                        <asp:Label ID="lblSubTotal" runat="server" Text='<%#getSubTotal(Eval("Qnt"), Eval("SellingPrice"), Eval("offrPrice"), Eval("DelCharge"))%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" CssClass="color_dark" runat="server" OnClick="LinkButton1_Click" class="cart__remove"> <span><i class="fa fa-times"></i></span></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        </Columns>
                                                             </asp:GridView>
                                                        
                                                        <%--<table class="nz-table" id="table_23d9_1" style="width:100%; border:1px solid #000000;" >

                                                  
                                                            <thead id="thead_23d9_1">
                                                                <tr>
                                                                    <th>Product Image</th>                                                               
                                                                 
                                                                     <th>Quantity</th>
                                                                     <th>Price </th>
                                                                     <th>Total</th>
                                                                     <th>Delete</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                    </td>
                                                                    




                                                                                   


                                                                    <td>
                                                                      </td>
                                                                      <td>    
                                                                      </td>
                                                                    <td>
                                                                    </td>

                                                                    
                                                                    <td>
                                                                        
                                                                     </td>
                                                                 
                                                                </tr>
                                                               
                                                             
                                                            </tbody>
                                                        </table>--%>
                                                        <p>
                                                    </div>
                                          <%--      </div>--%>
                                                     
                                                     
                                                       </div>


                                              <div class="col vc_col-sm-8 col8  element-animate-false valign-top"  data-effect="none" data-align="left">
                                                
                                            </div>
                                            <div class="col vc_col-sm-4 col4  element-animate-false valign-top"  data-effect="none" data-align="left">
                                                
                                                
                                                 
                                                
                                                <div class="col-inner" >

                                                       <h3 id="h3_23d9_2" class="vc_custom_heading ninzio-latter-spacing">The total amount of</h3>



                                                    <div  class="nz-column-text nz-clearfix  element-animate-false" data-effect="none" data-effect-speed="50">
                                                        <table class="nz-table" id="table_23d9_0" style="width:100%" >
                                                            <thead id="thead_23d9_0">
                                                                <tr>
                                                                    <th><span style="color:#000;" > Subtotal </span></th>    <td>    <span class="woocommerce-Price-currencySymbol"> &#x20b9; </span> <asp:Label ID="lblSubTotal" runat="server"></asp:Label></td>
                                                                   
                                                                </tr>

                                                                  <tr>
                                                                       <th><span style="color:#000;" >Shipping</span> </th>  <td>    <span class="woocommerce-Price-currencySymbol"> &#x20b9; </span>
                                                                             <asp:Label ID="lblShipping" runat="server" Text="0"></asp:Label>
                                            <asp:HiddenField ID="hdfShippingChrg" runat="server" Value="0" /></td>
                                                                 
                                                                   </tr>
                                                                  <tr>
                                                                         <th><span style="color:#000;" >Total</span> </th>  <td> <span class="woocommerce-Price-currencySymbol"> &#x20b9; </span>
                                                                              <asp:Label ID="lblGrandTotal" runat="server"></asp:Label>
                                            <asp:HiddenField ID="hdfGrndTot" runat="server" /></td>


                                                                  </tr>

                                                                <tr>

                                                                    <th colspan="2" style="text-align:center">
                                                                         <asp:Button ID="btnCheckout" runat="server" CssClass="single_add_to_cart_button button alt" OnClick="btnCheckout_Click" Text="Proceeed to Checkout" ValidationGroup="vgSubmit" />
                                                                            <%--<asp:button id="Button3"  class="single_add_to_cart_button button alt" runat="server" text="Go to Checkout" />--%></th>


                                                                </tr>


                                                            </thead>
                                                            
                                                        </table>
                                                        <p>
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

    <script type="text/javascript">
        function updQnt(lnk,pId)
        {
           
            var qnt = lnk.value;
            $.ajax({
                type: "POST",
                url: "" + baseURL + "WebMethod/AutoComplete.asmx/UpdateItemQnt",
                data: "{'PrdID':'" + pId + "','Qnt':'" + qnt + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    //alert("hi");
                    //ShopCartItem();
                    //ShowAddToCart(PrdID, qnt, offrPrc, offrPerc, prdSz, slPrc, mrpPrc)
                    FillShopCart();
                    var gv = document.getElementById("<%= dtLstCart.ClientID%>");  
                    var rows = gv.getElementsByTagName("tr");
                    var sbTot = 0;
            for (var i = 0; i < rows.length; i++) {
                //totalRowCount++;
                if (rows[i].getElementsByTagName("td").length > 0) {
                    //rowCount++;
                    var gridrow = gv.rows[i];
                    var obtToal = gridrow.cells[3].getElementsByTagName("span")[1];
                    var pTot = gridrow.cells[5].getElementsByTagName("span")[0].innerHTML;
                    var ttot = parseInt(obtToal.innerHTML) * qnt;
                    //alert(obtToal.innerHTML);
                    gridrow.cells[5].getElementsByTagName("span")[1].innerHTML = ttot;
                    sbTot = parseInt(ttot) + parseInt(sbTot);

                    
                }

            }

            document.getElementById('<%= lblSubTotal.ClientID %>').innerHTML = sbTot;
                    //document.getElementById('').value = sbTot;
                    document.getElementById('<%=lblGrandTotal.ClientID %>').innerHTML = parseInt(sbTot) + parseInt(document.getElementById('<%=hdfShippingChrg.ClientID %>').value) ;
                    document.getElementById('<%=hdfGrndTot.ClientID %>').value = document.getElementById('<%=lblGrandTotal.ClientID %>').innerHTML;
                },
                error: function () {
                    alert("There is problem to call server method");
                }
            });


            return false;
            
           
        }
    </script>

</asp:Content>

