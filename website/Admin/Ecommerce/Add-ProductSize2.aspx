<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Add-ProductSize2.aspx.cs" Inherits="Admin_Ecommerce_Add_ProductSize2" %>

<%@ Register Src="~/Controle/ProductSize.ascx" TagPrefix="uc1" TagName="ProductSize" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:ProductSize runat="server" ID="ProductSize" />
</asp:Content>

