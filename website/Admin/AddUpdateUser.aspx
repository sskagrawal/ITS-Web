<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddUpdateUser.aspx.cs" Inherits="Admin_AddUpdateUser" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hdfImage" runat="server" />
    


  <!--------------------START - Breadcrumbs-------------------->
  <ul class="breadcrumb">
  <li class="breadcrumb-item"><a href="#">Home</a></li>
  <li class="breadcrumb-item"><a href="#">User</a></li>
 <%-- <li class="breadcrumb-item">
  <span>Laptop with retina screen</span></li>--%>
  </ul>
  <!--------------------END - Breadcrumbs-------------------->
  <div class="content-i">
  <div class="content-box">
  <div class="row">
  
  <div class="col-lg-6">
  <div class="element-wrapper">
  <h6 class="element-header">Add Update User</h6>
  <div class="element-box">

  <h5 class="form-header">Add Update User</h5>
 <%-- <div class="form-desc">Discharge best employed your phase each the of shine. Be met even reason consider logbook redesigns. Never a turned interfaces among asking</div>--%>
   <div class="alert alert-success alert-dismissible fade show" visible="false" runat="server" ID="alert">
 <button aria-label="Close" class="close" data-dismiss="alert" type="button">
 <span aria-hidden="true"> ×</span>
 </button>
     <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
 </div>
 <div class="form-group row">

  <label class="col-form-label col-sm-4" for="">User Type</label>
  <div class="col-sm-8">
   
      <asp:DropDownList ID="drdUserType" CssClass="form-control" runat="server">
      <asp:ListItem Text="Select User Type " Value="0"></asp:ListItem> 
      </asp:DropDownList>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="drdUserType"
                                        ErrorMessage="Please Select User Type" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator4" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
  </div>

  </div> 
  <div class="form-group row">

  <label class="col-form-label col-sm-4" for="">Name </label>
  <div class="col-sm-8">
       <asp:TextBox ID="txtName" class="form-control" placeholder="Enter Name" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                                        ErrorMessage="Please Enter Name" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="Required1" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator4" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
  </div>

  </div>

  <div class="form-group row"><label class="col-form-label col-sm-4" for="">Mobile No.</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtMob" class="form-control" placeholder="Enter  Mobile No." runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMob"
                                        ErrorMessage="Please Enter Mobile" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="Required2" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator2" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
  </div>
  </div>

  <div class="form-group row"><label class="col-form-label col-sm-4" for="">Email ID</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtEmailID" class="form-control" placeholder="Enter Email ID" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmailID"
                                        ErrorMessage="Please Enter Email-ID" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="Required3" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator3" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
  </div>
  </div>

    <div class="form-group row"><label class="col-form-label col-sm-4" for="">Gendar</label>
  <div class="col-sm-8">
      <asp:RadioButtonList ID="rbtGendar" runat="server" RepeatDirection="Horizontal">
      <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
      </asp:RadioButtonList>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="rbtGendar"
                                        ErrorMessage="Please Select Gendar" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="Required4" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator5" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
     
  </div>
  </div>

  <div class="form-group row"><label class="col-form-label col-sm-4" for="">Password</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtPSWD"  class="form-control" placeholder="Enter Password" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPSWD"
                                        ErrorMessage="Please Enter Password" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="Required7" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator6" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
  </div>
  </div>
<%--   <div class="form-group row">

  <label class="col-form-label col-sm-4" for="">Industry</label>
  <div class="col-sm-8">
   
      <asp:DropDownList ID="drdIndustry" CssClass="form-control" runat="server">
      <asp:ListItem Text="Select Industry " Value="0"></asp:ListItem> 
      </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="drdIndustry"
                                        ErrorMessage="Please Enter Password" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="Required5" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator7" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
  </div>

  </div>--%>
  
       
      <div class="form-group row"><label class="col-form-label col-sm-4" for="">Company Name</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtCompanyName" class="form-control" placeholder="Enter  Company Name" runat="server"></asp:TextBox>

  </div>
  </div>   
      <div class="form-group row"><label class="col-form-label col-sm-4" for="">Website</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtWebsite" class="form-control" placeholder="Enter Website Url" runat="server"></asp:TextBox>
  </div>
  </div>       
  <div class="form-group row"><label class="col-form-label col-sm-4" for="">Address</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtAddress" TextMode="MultiLine" class="form-control" placeholder="Enter  Address" runat="server"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtAddress"
                                        ErrorMessage="Please Enter Address" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="Required8" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator8" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
  </div>
  </div>
     <asp:HiddenField ID="hdfID" runat="server" />

  <div class="form-buttons-w">
  <asp:Button ID="btnSubmit"  class="btn btn-primary"   ValidationGroup="sv"
          runat="server" Text="submit" onclick="btnSubmit_Click" />
  </div>
  
  </div>
  </div></div>
  </div>
  
</div></div>

</asp:Content>

