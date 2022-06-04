<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="p-success.aspx.cs" Inherits="PSuccess" %>

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
                            <h3 class="error404-title"><%=orderStatus %> - <%=succMsg %></h3>
                            <h4 class="error404-title">Please Note down Refrence No for Future Use  </h4>
                             <h4>Refrence No : <%=TrackId %></h4>
                            <a class="button button-normal grey_light full-false medium square animate-false anim-type-ghost hover-fill" href="default.aspx" target="_self"><span class="txt">Goto homepage</span></a>
                        </div>
                    </div>
                </div>
</asp:Content>

