<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    CodeFile="AddJob.aspx.cs" Inherits="Admin_AddJob" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdfImage" runat="server" />
    <!--------------------START - Breadcrumbs-------------------->
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Job</a></li>
        <%-- <li class="breadcrumb-item">
  <span>Laptop with retina screen</span></li>--%>
    </ul>
    <!--------------------END - Breadcrumbs-------------------->
    <div class="content-i">
        <div class="content-box">
            <div class="row">
                <div class="col-lg-6">
                    <div class="element-wrapper">
                        <h6 class="element-header">
                            Add Update Job</h6>
                        <div class="element-box">
                            <h5 class="form-header">
                                Add Update Job</h5>
                          
                            <div class="alert alert-success alert-dismissible fade show" visible="false" runat="server"
                                id="alert">
                                <button aria-label="Close" class="close" data-dismiss="alert" type="button">
                                    <span aria-hidden="true">×</span>
                                </button>
                                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">
                                    Select Industries</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="drdIndustries" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Select Industries " Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="drdIndustries"
                                        ErrorMessage="Please Select Industries" ForeColor="Red" SetFocusOnError="True"
                                        ValidationGroup="sv" Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender11" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator11" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">
                                    Name
                                </label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtName" class="form-control" placeholder="Enter Name" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                                        ErrorMessage="Please Enter Name" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator1" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">
                                    Mobile No.</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtMob" class="form-control" placeholder="Enter Enter Mobile No."
                                        runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMob"
                                        ErrorMessage="Please Enter Mobile Number" ForeColor="Red" SetFocusOnError="True"
                                        ValidationGroup="sv" Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator2" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">
                                    Upload CV</label>
                                <div class="col-sm-8">
                                    <asp:FileUpload ID="FileUloadCV" runat="server" />
                                    <asp:HiddenField ID="hdfFileUploadCV" runat="server" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="FileUloadCV"
                                        ErrorMessage="Please Select CV" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator3" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
                                </div>
                            </div>
                            <asp:HiddenField ID="hdfID" runat="server" />
                            <div class="form-buttons-w">
                                <asp:Button ID="btnSubmit" class="btn btn-primary" ValidationGroup="sv" runat="server"
                                    Text="submit" OnClick="btnSubmit_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div><script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>
