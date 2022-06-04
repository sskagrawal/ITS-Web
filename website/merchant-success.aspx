<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="merchant-success.aspx.cs" Inherits="MerchantSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <header class="rich-header page-header version1" data-parallax="true" id="header_6127_0" style="height:2px !important">
                
                </header>
  <div id="nz-content" class="content nz-clearfix padding-true">
                    <div class="container">
                        <div class="error404-wrap">
                            <%--<div class="error404-big">
                            
                            </div>--%>
                            <img src="upload/OkImg.jpg" alt="" />
                            <h3 class="error404-title">
                                <asp:Label ID="lblTransactionStatus" runat="server" Text=""></asp:Label> - 
                                <asp:Label ID="lblResponseMessage" runat="server" Text=""></asp:Label>
                               </h3>
                            <h4 class="error404-title">Please Note down Refrence No for Future Use  </h4>
                             <h4>Refrence No : <asp:Label ID="lblAgRef" runat="server" Text=""></asp:Label></h4>
                            <a class="button button-normal grey_light full-false medium square animate-false anim-type-ghost hover-fill" href="default.aspx" target="_self"><span class="txt">Goto homepage</span></a>
                        </div>
                    </div>
                </div>
</asp:Content>

