<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddUpdateProduct.aspx.cs" Inherits="Client_Panel_AddUpdateProduct" %>

<%@ Register Src="~/Controle/Product.ascx" TagPrefix="uc1" TagName="Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:Product runat="server" id="Product" />


</asp:Content>

