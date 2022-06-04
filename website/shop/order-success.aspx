<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="order-success.aspx.cs" Inherits="shop_order_success" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <header class="rich-header page-header version1" data-parallax="true" style="background-color:#333333;color:#ffffff;">
                    <div class="parallax-container" style="background-image: url(upload/page_header4.jpg); background-repeat: no-repeat; background-position: center center; transform: translateY(0px);">&nbsp;</div>
                    <div class="container nz-clearfix">

                        <div class="rh-content">
                            <h1>Order Status</h1>
                            <div class="rh-separator">&nbsp;</div>
                            <div style="color:#ffffff;background-color:rgba(0,0,0,0.3);" class="nz-breadcrumbs nz-clearfix"><a href="index.html"  property="v:title">Home</a><span class="current">Error 404</span></div>
                        </div>

                    </div>
                    <div id="slider-arrow" data-target="#nz-content" data-from="90" data-offset="90" class="i-separator animate nz-clearfix"><i class="icon-arrow-down10"></i></div>
                </header>
                <div id="nz-content" class="content nz-clearfix padding-true">
                    <div class="container">
                        <div class="error404-wrap" id="succDiv" runat="server">
                            <div class="error404-big" style="color:green;font-size:50px">Congratulation!</div>
                            <h3 class="error404-title">Your order is Successfull</h3>
                            <asp:Literal ID="ltrlMsg" runat="server"></asp:Literal><br />
                            <a class="button button-normal grey_light full-false medium square animate-false anim-type-ghost hover-fill" href="../Default.aspx" target="_self"><span class="txt">Goto homepage</span></a>
                        </div>
                        <div class="error404-wrap" id="errDiv" runat="server">
                            <div class="error404-big" style="color:green;font-size:50px">Oops!</div>
                            <h3 class="error404-title">There is some problem</h3>
                          
                            <a class="button button-normal grey_light full-false medium square animate-false anim-type-ghost hover-fill" href="../Default.aspx" target="_self"><span class="txt">Goto homepage</span></a>
                        </div>
                    </div>
                </div>
</asp:Content>

