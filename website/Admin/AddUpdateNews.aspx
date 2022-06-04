<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" ValidateRequest="false" AutoEventWireup="true"
    CodeFile="AddUpdateNews.aspx.cs" Inherits="Admin_AddUpdateNews" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/jquery-te-1.4.0.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdfImage" runat="server" />
    <!--------------------START - Breadcrumbs-------------------->
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">News</a></li>
        <%-- <li class="breadcrumb-item">
  <span>Laptop with retina screen</span></li>--%>
    </ul>
    <!--------------------END - Breadcrumbs-------------------->
    <div class="content-i">
        <div class="content-box">
            <div class="row">
                <div class="col-lg-12">
                    <div class="element-wrapper">
                        <h6 class="element-header">
                            Add Update News</h6>
                        <div class="element-box">
                            <h5 class="form-header">
                                Add Update News</h5>
                                <div class="alert alert-success alert-dismissible fade show" visible="false" runat="server" ID="alert">
 <button aria-label="Close" class="close" data-dismiss="alert" type="button">
 <span aria-hidden="true"> ×</span>
 </button>
     <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
 </div>
                            <%-- <div class="form-desc">Discharge best employed your phase each the of shine. Be met even reason consider logbook redesigns. Never a turned interfaces among asking</div>--%>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-2" for="">
                                    Blog Title</label>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtNewsTitle" class="form-control" placeholder="Enter New Title" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtNewsTitle"
                                        ErrorMessage="Please Enter New Title" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator4" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-2" for="">
                                    Blog Image (Width - 870px, Height - 370px )</label>
                                <div class="col-sm-10">
                                    <asp:FileUpload ID="fluPorUpload" class="form-control" runat="server" />
                                   <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="fluPorUpload"
                                        ErrorMessage="Please Select Image" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender11" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator11" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>--%>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-2" for="">
                                    Blog Description</label>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtNewsDesc" TextMode="MultiLine" Rows="15" Columns="15" Height="500" class="form-control textEditor" placeholder="Enter Description"
                                        runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNewsDesc"
                                        ErrorMessage="Enter Description" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator1" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-2" for="">
                                    Blog Date</label>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtNewsDate" class="form-control" placeholder="Select Date " runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="calNewsDate" runat="server" ClientIDMode="Static" TargetControlID="txtNewsDate"
                                        Format="dd/MM/yyyy"></asp:CalendarExtender>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewsDate"
                                        ErrorMessage="Please Select Date" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator2" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-2" for="">
                                    Meta Description</label>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtMetaDesc" class="form-control" placeholder="Enter Meta Description" runat="server"></asp:TextBox>
                                    
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-2" for="">
                                    Navigatio Url</label>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtUrl" class="form-control" placeholder="Enter Url" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNewsDate"
                                        ErrorMessage="Please Enter Url" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator3" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
                                </div>
                            </div>
                            <asp:HiddenField ID="hdfID" runat="server" />
                            <div class="form-buttons-w">
                                <asp:Button ID="btnSubmit" class="btn btn-primary" runat="server" Text="submit" ValidationGroup="sv"
                                    OnClick="btnSubmit_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
      <script src="../js/jquery-1.10.2.min.js"></script>
<script src="../js/jquery-te-1.4.0.min.js"></script>
   
<script language="javascript" type="text/javascript">  
    $('.textEditor').jqte();
$(".textBox2").jqte({  
     blur: function() {  
         
     }  
});  
</script>
</asp:Content>
