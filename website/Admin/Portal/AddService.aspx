<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddService.aspx.cs" Inherits="Admin_Portal_AddService" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                                <label class="col-form-label col-sm-4" for="">Service Name</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtMenuName" class="form-control" placeholder="Enter Service Name" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Sort Order</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtSortOrder" class="form-control" placeholder="Enter Sort Order" runat="server"></asp:TextBox>
                                </div>
                            </div>

                               <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Service Amount</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtAmt" class="form-control" placeholder="Enter Service Amount" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-buttons-w">
                                <asp:Button ID="btnAddService" class="btn btn-primary" runat="server" Text="submit"
                                    OnClick="btnAddService_Click" />
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

