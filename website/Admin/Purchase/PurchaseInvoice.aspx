<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="PurchaseInvoice.aspx.cs" Inherits="Admin_Purchase_PurchaseInvoice" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <asp:HiddenField ID="hdfPartyID" runat="server" />
    <asp:HiddenField ID="hdfPurchaseID" runat="server" />
    <asp:HiddenField ID="hdfPurInvNo" runat="server" />
  
   
   
    <asp:HiddenField ID="hdfVDID" runat="server" /> 
    <asp:HiddenField ID="hdfCount" runat="server" />
    <!--------------------
                START - Breadcrumbs
                -------------------->
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Purchase Invoice</a></li>
     
    </ul>
    <!--------------------
                END - Breadcrumbs
                -------------------->
    <div class="content-panel-toggler"><i class="os-icon os-icon-grid-squares-22"></i><span>Sidebar</span></div>
    <div class="content-i">
        <div class="content-box">
            <div class="row">
                <div class="col-sm-12">
                    <div class="element-wrapper">
                        <div class="element-box">
                            <h5 class="form-header">Purchase Invoice</h5>
                          
                            <div id="alert" runat="server" visible="false" class="alert alert-success" style="padding: 10px;">
                                <asp:Label ID="lblMSG" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="">Select Party</label>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <asp:DropDownList ID="drdParty" CssClass="form-control" runat="server" OnSelectedIndexChanged="drdParty_SelectedIndexChanged" AutoPostBack="true">
                                                    <asp:ListItem Text="--Select Party--" Value="0"></asp:ListItem>
                                                </asp:DropDownList>


                                                
                                                  <asp:RequiredFieldValidator ID="rfvParty" InitialValue="0" runat="server" ControlToValidate="drdParty"
                                            ErrorMessage="Select Party" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                        
                                             <asp:ValidatorCalloutExtender ID="VCE_Party" 
                                            runat="server" Enabled="True" TargetControlID="rfvParty" WarningIconImageUrl="../img/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 


                                            </div>
                                         
                                        </div>
                                 
                                    </div>




                                     <div class="form-group">
                                        <label for="">Select Company</label>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <asp:DropDownList ID="ddlCompany" CssClass="form-control" runat="server" OnSelectedIndexChanged="drdParty_SelectedIndexChanged" AutoPostBack="true">
                                                    <asp:ListItem Text="--Select Company--" Value="0"></asp:ListItem>
                                                </asp:DropDownList>

                                                  <asp:RequiredFieldValidator ID="rfvCompany" InitialValue="0" runat="server" ControlToValidate="ddlCompany"
                                            ErrorMessage="Select Company" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                        
                                             <asp:ValidatorCalloutExtender ID="VCE_Company" 
                                            runat="server" Enabled="True" TargetControlID="rfvCompany" WarningIconImageUrl="../img/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 



                                            </div>



                                         
                                        </div>
                                 
                                    </div>


                                    <div class="form-group">

                                          <div class="row">

                                                 <div class="col-sm-6">

                                                       <label for="">Purchase Invoice No.</label>
                                                 
                                                     <asp:TextBox ID="txtInvoice" class="form-control" placeholder="Enter Invoice No." runat="server"></asp:TextBox>

                                                     </div>

                                                <div class="col-sm-6">

                                                    <label for="">Invoice Date</label>
                                        <asp:TextBox ID="txtInvoiceDate" class="form-control" placeholder="Select Receive Date" runat="server"></asp:TextBox>
                                        
                                                    <asp:CalendarExtender ID="caljobopenDate" runat="server" ClientIDMode="Static" TargetControlID="txtInvoiceDate" Format="dd-MM-yyyy"></asp:CalendarExtender>
                                        
                                                    <asp:RequiredFieldValidator ID="rfvInvoicedate" runat="server" ControlToValidate="txtInvoiceDate"
                                            ErrorMessage="Please Select Date" ForeColor="Red" SetFocusOnError="True" ValidationGroup="svv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="VCEInvoiceDate" runat="server" Enabled="True"
                                            TargetControlID="rfvInvoicedate" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>

                                                    </div>


                                              </div>
                                        <br />

                                          <div class="row">

                                                 <div class="col-sm-6">                                                  
                                                <label for="">Paid Amount</label>
                                                <asp:TextBox ID="txtPaidAmt"  class="form-control" placeholder="Paid Amount" runat="server"></asp:TextBox>                                                                                        

                                                 </div>

                                                <div class="col-sm-6">    
                                                     <label for="">Purchase Voucher </label>
                                                      
                                                       <asp:FileUpload ID="fuInvoiceFile" runat="server" />
                                                    <asp:HiddenField ID="hdfInvoiceFile" runat="server" />

                                                    </div>

                                              </div>

                                      
                                  
                                    </div>


                                 
                                </div>



                                <div class="col-sm-6">
                                    <div class="element-box" style="background: #F2F4F8;">
                                        <h5 class="form-header">Party Details</h5>

                                        <div class="table-responsive">
                                            <table class="table table-lightborder">
                                                <tbody>
                                                    <tr>
                                                        <td>Name :-</td>
                                                        <td>
                                                            <asp:Label ID="lblPartyN" runat="server" Text=""></asp:Label>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>MobileNo.:-</td>
                                                        <td>
                                                            <asp:Label ID="lblPmob" runat="server" Text=""></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Email-ID:-</td>
                                                        <td>
                                                            <asp:Label ID="lblEmailID" runat="server" Text=""></asp:Label>
                                                        </td>
                                                    </tr>

                                                     <tr>
                                                        <td>Address:-</td>
                                                        <td>
                                                            <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
                                                        </td>
                                                    </tr>


                                                 
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>


                                    <div class="col-sm-12">


                                             <div class="form-group">
                                        <label for="">Purchase Description</label>
                                      <asp:TextBox ID="txtDescription" TextMode="MultiLine" class="form-control" placeholder="Purchase description" runat="server"></asp:TextBox>
                                    </div>

                                        </div>
                                <%--  <div class="col-sm-5">
                                      </div>--%>
                                
                                  <div class="col-sm-4">
      <div class="form-buttons-w1">
  
  <asp:Button ID="btnSubmit"  OnClick="btnSubmit_Click"  class="btn btn-primary"  ValidationGroup="sv" runat="server" Text="Submit" />

      
  </div>  
  </div>



                            </div>

                            



                            


                        </div>
                    </div>
                </div>
            </div>


            


                 </div>
                    </div>





       
    <script type="text/javascript" src="../../js/jquery-1.12.4.js"></script>


</asp:Content>

