<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Product_List.aspx.cs" Inherits="Admin_Ecommerce_Product_List" %>

<%@ Register Src="~/Controle/ProductList.ascx" TagPrefix="uc1" TagName="ProductList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <uc1:ProductList runat="server" ID="ProductList" />

</asp:Content>

