<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Upload_job.aspx.cs" Inherits="Admin_Career" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


   <asp:HiddenField ID="hdfImage" runat="server" />
    


  <!--------------------START - Breadcrumbs-------------------->
  <ul class="breadcrumb">
  <li class="breadcrumb-item"><a href="#">Home</a></li>
  <li class="breadcrumb-item"><a href="#">Job Post</a></li>
 <%-- <li class="breadcrumb-item">
  <span>Laptop with retina screen</span></li>--%>
  </ul>
  <!--------------------END - Breadcrumbs-------------------->
  <div class="content-i">
  <div class="content-box">
  <div class="row">
  
  <div class="col-lg-8">
  <div class="element-wrapper">
  <h6 class="element-header">Jobs Post</h6>
  <div class="element-box">

  <h5 class="form-header">Jobs Post</h5>
 <%-- <div class="form-desc">Discharge best employed your phase each the of shine. Be met even reason consider logbook redesigns. Never a turned interfaces among asking</div>--%>
 <div class="form-group row">
 <div class="col-md-12">

  <div class="alert alert-success alert-dismissable" id="divMsg" runat="server" visible="false">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                        &times;</button>&nbsp;
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                </div>
</div>



  <label class="col-form-label col-sm-4" for="">Job Title</label>
  <div class="col-sm-8">
       <asp:TextBox ID="txtjobtitle" class="form-control" placeholder="Enter Job Title" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtjobtitle"
                                        ErrorMessage="Please Enter Job Title" ForeColor="Red" SetFocusOnError="True" ValidationGroup="svv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator3" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
  </div>

  </div>
  <div class="form-group row"><label class="col-form-label col-sm-4" for="">Job Type</label>
  <div class="col-sm-8">
      <asp:DropDownList ID="drdJobTYpe" CssClass="form-control" runat="server">
      <asp:ListItem Text="Select Job Type" Value="0"></asp:ListItem>
      </asp:DropDownList>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="drdJobTYpe"
                                        ErrorMessage="Please Select Job" ForeColor="Red" SetFocusOnError="True" ValidationGroup="svv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator1" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
  </div>
  </div>

    <div class="form-group row"><label class="col-form-label col-sm-4" for="">No. Of Position </label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtPosition" class="form-control" placeholder="Enter No. Position " runat="server"></asp:TextBox>
   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPosition"
                                        ErrorMessage="Please Enter No. Of Position " ForeColor="Red" SetFocusOnError="True" ValidationGroup="svv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator2" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
  </div>
  </div>
    <div class="form-group row"><label class="col-form-label col-sm-4" for="">Experience </label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtExp" class="form-control" placeholder="Enter Job  Experience" runat="server"></asp:TextBox>
  </div>
  </div>


    <div class="form-group row" style="display:none;">
  <label class="col-form-label col-sm-4" for="">Job Image</label>
  <div class="col-sm-8">
      <asp:FileUpload ID="fluPorUpload" class="form-control" runat="server" />
       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="fluPorUpload"
                                        ErrorMessage="Please Select Job Image" ForeColor="Red" SetFocusOnError="True" ValidationGroup="svv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator4" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
  </div>
  </div>


  <div class="form-group row"><label class="col-form-label col-sm-4" for="">job Opening Date</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtjobsOpenDate" class="form-control" placeholder="Enter Opening Date" runat="server"></asp:TextBox>
         <asp:CalendarExtender ID="caljobopenDate" runat="server" ClientIDMode="Static" TargetControlID="txtjobsOpenDate" Format="dd/MM/yyyy"></asp:CalendarExtender>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtjobsOpenDate"
                                        ErrorMessage="Please Select Opening Date" ForeColor="Red" SetFocusOnError="True" ValidationGroup="svv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator5" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
  </div>
  </div>


    <div class="form-group row"><label class="col-form-label col-sm-4" for="">job Closing Date</label> 
  <div class="col-sm-8">
      <asp:TextBox ID="txtjobClosingDate" class="form-control" placeholder="Enter Closing Date" runat="server"></asp:TextBox>
         <asp:CalendarExtender ID="caljobclosingDate" runat="server" ClientIDMode="Static" TargetControlID="txtjobClosingDate" Format="dd/MM/yyyy"></asp:CalendarExtender>
   <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtjobClosingDate"
                                        ErrorMessage="Please Select Closing Date" ForeColor="Red" SetFocusOnError="True" ValidationGroup="svv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender6" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator6" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
  </div>
  </div>
  <div class="form-group row"><label class="col-form-label col-sm-4" for="">Job  Description</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtJobDesc" TextMode="MultiLine" class="form-control" placeholder="Enter Job  Description" runat="server"></asp:TextBox>
  </div>
  </div>
<div class="form-group row"><label class="col-form-label col-sm-4" for="">Qualification</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtQualification" TextMode="MultiLine" class="form-control" placeholder="Enter Portfolio Sub Title" runat="server"></asp:TextBox>
  </div>
  </div>
   <div class="form-group row" style="display:none;"><label class="col-form-label col-sm-4" for="">Job Fees</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtJobFees" class="form-control" placeholder="Enter Fees " runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtJobFees"
                                        ErrorMessage="Please Enter Job Fees" ForeColor="Red" SetFocusOnError="True" ValidationGroup="svv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender7" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator7" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
  </div>
  </div>

    <div class="form-group row" style="display:none;"><label class="col-form-label col-sm-4" for="">Job WebLink</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtJobWeblink" class="form-control" placeholder="Enter Official Web Link" runat="server"></asp:TextBox>
  </div>
  </div>





     
  
     <asp:HiddenField ID="hdfID" runat="server" />

  <div class="form-buttons-w"><asp:Button ID="btnSubmit"  class="btn btn-primary"  
          runat="server" Text="submit"  
          onclick="btnSubmit_Click1"  />
  </div>
  
  </div>
  </div></div>
  </div>
  
</div></div>



</asp:Content>

