<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="set-job-order.aspx.cs" Inherits="Admin_adminjb_set_job_order" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <asp:HiddenField ID="hdfJobId" runat="server" />
    

 <div class="content-i">
                    <div class="content-box">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="element-wrapper">
                                    <h6 class="element-header">
                                        Set Job Position Order</h6>
                                    <div class="element-box">
                                        <div>
                                        <h5 class="form-header">
                                           Set Job Position Order</h5>

                                                 <div class="form-buttons-w text-right">
                                            <a class="mr-2 mb-2 btn btn-primary btn-rounded" href="../Job/Upload_Job_List.aspx"> <i class="fa fa-arrow-left" aria-hidden="true"></i>  Go to Job List</a>
                                                     </div>


                                              <div id="alert" runat="server" visible="false" class="alert alert-success" style="padding: 10px;">
                                <asp:Label ID="lblMSG" runat="server" Text="Label"></asp:Label>
                            </div>

                                               <fieldset class="form-group">
                                            <legend><span>Set Job Position Order</span></legend>
                                       <label>Job Position</label>
                                        <div class="form-group">
                                          
                                        
                                            <asp:RadioButtonList ID="rblPosition" ForeColor="Blue" CellPadding="20" CellSpacing="20" RepeatColumns="10" RepeatDirection="Horizontal"  runat="server">
          <asp:ListItem Value="1">1</asp:ListItem>
          <asp:ListItem Value="2">2</asp:ListItem>
          <asp:ListItem Value="3">3</asp:ListItem>
          <asp:ListItem Value="4">4</asp:ListItem>
          <asp:ListItem Value="5">5</asp:ListItem>
          <asp:ListItem Value="6">6</asp:ListItem>
          <asp:ListItem Value="7">7</asp:ListItem>
          <asp:ListItem Value="8">8</asp:ListItem>
          <asp:ListItem Value="9">9</asp:ListItem>
          <asp:ListItem Value="10">10</asp:ListItem>
          <asp:ListItem Value="11">11</asp:ListItem>
          <asp:ListItem Value="12">12</asp:ListItem>
          <asp:ListItem Value="13">13</asp:ListItem>
          <asp:ListItem Value="14">14</asp:ListItem>
          <asp:ListItem Value="15">15</asp:ListItem>
          <asp:ListItem Value="16">16</asp:ListItem>
          <asp:ListItem Value="17">17</asp:ListItem>
          <asp:ListItem Value="18">18</asp:ListItem>
          <asp:ListItem Value="19">19</asp:ListItem>
          <asp:ListItem Value="20">20</asp:ListItem>


      </asp:RadioButtonList>


                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">
                                                       Position From date</label>
                                                    
                                                    <asp:TextBox ID="txtPositionFromDate" class="form-control" placeholder="Position From date" runat="server"></asp:TextBox>
                                                     
                                        
                                                    <asp:CalendarExtender ID="calPositionFromDate" runat="server" ClientIDMode="Static" TargetControlID="txtPositionFromDate" Format="dd-MM-yyyy"></asp:CalendarExtender>
                                        
                                                    <asp:RequiredFieldValidator ID="rfvInvoicedate" runat="server" ControlToValidate="txtPositionFromDate"
                                            ErrorMessage="Please Select Date" ForeColor="Red" SetFocusOnError="True" ValidationGroup="svv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="VCEInvoiceDate" runat="server" Enabled="True"
                                            TargetControlID="rfvInvoicedate" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>
                                                  

                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">
                                                      Position  To Date</label>
                                                    
                                                     <asp:TextBox ID="txtToDate" class="form-control" placeholder="Positin To Date" runat="server"></asp:TextBox>
                                                   
                                                      <asp:CalendarExtender ID="calPositiinToDate" runat="server" ClientIDMode="Static" TargetControlID="txtToDate" Format="dd-MM-yyyy"></asp:CalendarExtender>
                                        
                                                    <asp:RequiredFieldValidator ID="rfvPoditintoDate" runat="server" ControlToValidate="txtToDate"
                                            ErrorMessage="Please Select Date" ForeColor="Red" SetFocusOnError="True" ValidationGroup="svv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" Enabled="True"
                                            TargetControlID="rfvPoditintoDate" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>


                                            </div>
                                        </div>    
                                            </div>                                 
                                           
                                        </fieldset>

                                        <asp:Table ID="TableContent" runat="server">
                                       </asp:Table>

                                        <div class="form-buttons-w">
                                          <%--  <button class="btn btn-primary" type="submit">
                                                Submit</button>--%>

                                            <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" class="btn btn-primary" runat="server" Text="Submit" />


                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                        
                      
                    </div>
                </div>

      <script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

