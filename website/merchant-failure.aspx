<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="merchant-failure.aspx.cs" Inherits="MerchantFailure" %>

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
                            <img src="upload/oopsImg.jpg" alt="" />
                            <h3 class="error404-title"><asp:Label ID="lblResponseMessage" runat="server"> </asp:Label></h3>
                            <h5 class="error404-title" id="errMsg" runat="server" visible="false">Transaction Status:   <asp:Label ID="lblTransactionStatus" runat="server"> </asp:Label> </h5>
                             <h5>Reference No :  <asp:Label ID="lblAgRef" runat="server"> </asp:Label></h5>
                            <a class="button button-normal grey_light full-false medium square animate-false anim-type-ghost hover-fill" href="default.aspx" target="_self"><span class="txt">Goto homepage</span></a>
                        </div>
                    </div>
                </div>
</asp:Content>

