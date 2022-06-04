<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddMenu.aspx.cs" Inherits="AddMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdfUserTopeID" runat="server" />
    <asp:HiddenField ID="hdfMenuID" runat="server" />
    <asp:HiddenField ID="hdfID" runat="server" />
    <asp:HiddenField ID="hdfBranchID" runat="server" />
    <!--------------------START - Breadcrumbs-------------------->
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Add Menu</a></li>

    </ul>
    <!--------------------END - Breadcrumbs-------------------->
    <div class="content-i">
        <div class="content-box">
            <div class="row">

                <div class="col-lg-6">
                    <div class="element-wrapper">
                        <h6 class="element-header">Add Update Add Menu</h6>
                        <div class="element-box">

                            <h5 class="form-header">Add Update Add Menu</h5>
                            <div class="col-md-12">
                                <div class="">
                                    <div class="alert alert-success alert-dismissible fade show" visible="false" runat="server" id="alert" style="padding: 10px;">
                                        <button aria-label="Close" class="close" data-dismiss="alert" type="button">
                                            <span aria-hidden="true">×</span>
                                        </button>
                                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Menu Type</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="drdMenuType" class="form-control" runat="server"
                                        OnSelectedIndexChanged="drdMenuType_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Text="Select Menu Type" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Parent Menu" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Sub Menu" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Parent Menu</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="drdMenu" class="form-control" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Menu Name</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtMenuName" class="form-control" placeholder="Enter Menu Name" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Menu Url</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtUrl" class="form-control" placeholder="Enter Menu Url" runat="server"></asp:TextBox>
                                </div>
                            </div>
    <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">ICon</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtIcon" class="form-control" placeholder="Enter Icon" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Sort Order</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtSortOrder" class="form-control" placeholder="Enter Sort Order" runat="server"></asp:TextBox>
                                </div>
                            </div>


                            <div class="form-buttons-w">
                                <asp:Button ID="btnUserName" class="btn btn-primary" runat="server" Text="submit"
                                    OnClick="btnUserName_Click" />
                            </div>


                        </div>


                    </div>
                </div>
            </div>

        </div>
    </div>
    <script type="text/javascript">
        function HideLabel() {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=alert.ClientID %>").style.display = "none";
         }, seconds * 1000);
     };
    </script>
<script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

