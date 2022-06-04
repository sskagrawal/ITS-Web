<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddSaleVoucher.aspx.cs" Inherits="Admin_Sale_SaleVouvher" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    
     <script type="text/javascript">   
     
        function CalculatDisc() {
            var disAmt = document.getElementById('<%= txtDis.ClientID %>').value;          
            var TAmt = document.getElementById('<%= txtTotAmt.ClientID %>').value;
            var AdjAmt = document.getElementById('<%= txtAdjust.ClientID %>').value;          
            var gstAmmt = document.getElementById('<%= txtGtAmt.ClientID %>').value = 0.0;
            var dissAmt;
            if (TAmt != "" && AdjAmt != "")
            {
                dissAmt = document.getElementById('<%= txtDis.ClientID %>').value = parseFloat(TAmt) - parseFloat(AdjAmt);
                document.getElementById('<%= txtGrandTAmt.ClientID %>').value = parseFloat(TAmt) - parseFloat(dissAmt) + parseFloat(gstAmmt);
              <%--  document.getElementById('<%= txtGrandTAmt.ClientID %>').value = parseFloat(TAmt) - parseFloat(AdjAmt) + parseFloat(gstAmmt);--%>
            }           

        }
         function calculategst(){
             var chkStatus1 = document.getElementById('<%= chkgst.ClientID %>');
             var AdjAmt = document.getElementById('<%= txtAdjust.ClientID %>').value;
             var gstperc = document.getElementById('<%= Hdfvalue.ClientID %>').value;
             var gstamtt = 0;
             if (chkStatus1.checked) {
                  gstamtt= ((parseFloat(AdjAmt) * parseFloat(gstperc)) / 100).toFixed(2)                 
             }

             else {
                 gstamtt = 0;
             }
             document.getElementById('<%= txtGtAmt.ClientID %>').value = gstamtt;
            document.getElementById('<%= txtGrandTAmt.ClientID %>').value = parseFloat(gstamtt) + parseFloat(AdjAmt);

         }       
         
         </script>

     <style type="text/css">
         .autoCompleteList
		{
             font-size:16px;
			background-color: #F2F4F8 ;
			border: solid 1px black;
			margin: 0px;
			z-index: 100000 ;
		}
		.autoCompleteListItem
		{
			background-color: #F2F4F8 ;
			color: black ;
			z-index: 100000 ;
		}
		.autoCompleteSelectedListItem
		{
			background-color: #B2AEE2 ;
			color: Black ;
			z-index: 100000 ;

		}


       
      #topheading {
             border:2px solid #B2AEE2;
             text-align:center;
             padding:15px;
             border-radius:30px;
             color:#fff;
             background-color:#B2AEE2;
             width:50%;margin:auto;
             font-family:'Satisfy', cursive;
             margin-bottom:20px;            
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <asp:HiddenField ID="hdfPartyID" runat="server" />
     <asp:HiddenField ID="hdfVch" runat="server" />
    <asp:HiddenField ID="hdfoThCHar" runat="server" />
    <asp:HiddenField ID="hdfPartyTpID" runat="server" />
    <asp:HiddenField ID="hdfSaleVID" runat="server" />
    <asp:HiddenField ID="hdfVDID" runat="server" />
    <asp:HiddenField ID="HdflbName" runat="server" />
    <asp:HiddenField ID="Hdflbmobno" runat="server" />
    <asp:HiddenField ID="HdflbEmail" runat="server" />
    <asp:HiddenField ID="HdflbAdd" runat="server" />
    <asp:HiddenField ID="Hdfvalue" runat="server" />
     <asp:HiddenField ID="hdfRandomCode" runat="server" />

    <asp:HiddenField ID="hdfNextRenwdate" runat="server" />
      <asp:HiddenField ID="hdfRatePerUnit" runat="server" />

    <asp:HiddenField ID="hdfvmid" runat="server" />
   
    <!--------------------START - Breadcrumbs-------------------->
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Add Sale Voucher </a></li>
        <%-- <li class="breadcrumb-item">
  <span>Laptop with retina screen</span></li>--%>
    </ul>
    <!--------------------END - Breadcrumbs-------------------->
    <div class="content-i">
        <div class="content-box">
            <div class="row">

                <div class="col-lg-12">
                    <div class="element-wrapper">
                        <h6 class="element-header">Add Sale Voucher </h6>
                        <div class="element-box">




                              <div class="row">
                                <div class="col-sm-6">
                                     <label for="">Select Party</label>
                                    <div class="form-group input-group">
                                       
                                        <asp:TextBox ID="txtParty" class="form-control" placeholder="Party Name" runat="server"></asp:TextBox>
                                         <asp:AutoCompleteExtender ServiceMethod="SearchEmpByName" OnClientItemSelected="OnEmployeeSelected"
                                                            MinimumPrefixLength="1"
                                                            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                                            TargetControlID="txtParty"
                                                            ID="AutoCompleteExtender1" runat="server" FirstRowSelected="false" CompletionListCssClass="autoCompleteList" CompletionListItemCssClass="autoCompleteListItem" CompletionListHighlightedItemCssClass="autoCompleteSelectedListItem">
                                                        </asp:AutoCompleteExtender>

                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtParty"
                                             Display="None" ErrorMessage="Select Party" ForeColor="Red" SetFocusOnError="True"
                                            ValidationGroup="sv">*****</asp:RequiredFieldValidator>

                                           <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender3"
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>

                                   <%--    <asp:Button ID="btnAutoSubmit"   runat="server"  CssClass="btn btn-primary input-group-addon"  OnClick="btnAutoSubmit_Click" style="background-color:#047BF8;color:white;border-radius: 8px"  Text="search" />--%>

                                        <div class="help-block form-text text-muted form-control-feedback"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="">Invoice No.</label>
                                        <asp:Label ID="lblinVoice" runat="server" class="form-control" Text=""></asp:Label>                               

                                        <div class="help-block form-text text-muted form-control-feedback">Invoice No.</div>
                                    </div>
                                    <div class="form-group">
                                        <label for="">Invoice Date</label>
                                        <asp:TextBox ID="txtInvoiceD" class="form-control" placeholder="Select Invoice Date" runat="server"></asp:TextBox>
                                        <asp:CalendarExtender ID="caljobopenDate" runat="server" ClientIDMode="Static" TargetControlID="txtInvoiceD" Format="dd-MM-yyyy"></asp:CalendarExtender>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtInvoiceD"
                                            ErrorMessage="Please Select Date" ForeColor="Red" SetFocusOnError="True" ValidationGroup="svv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" runat="server" Enabled="True"
                                            TargetControlID="RequiredFieldValidator5" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>
                                        <div class="help-block form-text text-muted form-control-feedback">Invoice Date</div>
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
                                                        <td>Mobile No.:-</td>
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
                                                        <td>Address :-</td>
                                                        <td>
                                                            <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <h5 class="form-header">Create Voucher </h5>

                            <div class="alert alert-success alert-dismissible fade show" visible="false" runat="server" id="alert" style="padding:10px">
                                <button aria-label="Close" class="close" data-dismiss="alert" type="button">
                                    <span aria-hidden="true">×</span>
                                </button>
                                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                            </div>


                          
                                <legend><span>Party Basic Details</span></legend>


                                 <div class="row">

                                      <asp:HiddenField ID="hdfClienrServiceId" runat="server" />
                                               <div class="col-sm-6">
                                                <div class="form-group input-group">
                                                     <label for="" class="input-group-addon">Purchase Type</label>
                                                    <asp:DropDownList ID="drdPurTP" CssClass="form-control" runat="server">
                                                        <asp:ListItem Value="0" Text="--Select Purchase Type--"></asp:ListItem>
                                                        <asp:ListItem Value="1" Text="New" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Value="2" Text="Renew"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                         </div>



                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group input-group">
                                           <label for="" class="input-group-addon">Service Name</label>
                                            <asp:DropDownList CssClass="form-control" ID="ddlServiceName" runat="server" OnSelectedIndexChanged="ddlServiceName_SelectedIndexChanged" AutoPostBack="true">
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    </div>

                               
                                                                              

                                </div>


 <!----------kishan-------->
                    <div class="table-responsive">
                        <asp:GridView ID="grdView" runat="server"  Font-Size="12px" AutoGenerateColumns="false" ShowFooter="true" OnRowDataBound="grdView_RowDataBound"
                            EmptyDataText="Result Not Found" Width="100%" CssClass="table table-lightborder table-bordered table-hover"
                            PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false">
                          
                             
                              <Columns>
                                <asp:TemplateField HeaderText="SNo.">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>                                  

                                   <asp:TemplateField HeaderText="Service">

                                                        <ItemTemplate>
                                                            
                                                            <%#Eval("ServiceName") %>

                                                                 <asp:HiddenField ID="hdfClientServiceId" Value='<%#Eval("Service_Id")%>' runat="server" />

                                                        </ItemTemplate>

                                                      <FooterTemplate>
                                                          Total  Amount:-
                                                        </FooterTemplate>
                                        
                                                    </asp:TemplateField>

                                   <asp:TemplateField HeaderText="Price">

                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtAmt" runat="server" Text='<%#Eval("ServicePrice") %>'></asp:TextBox>
                                                        </ItemTemplate>



                                                        


                                                         <FooterTemplate>
                                                              
                                                         <span> <i class="fa fa-inr"></i>  <asp:Label ID="lblPriceP" runat="server" Text=""></asp:Label></span>
                                                        </FooterTemplate>


                                                         <ItemTemplate>
                                                            <asp:TextBox ID="txtAmt" runat="server" Text='<%#Eval("ServicePrice") %>'></asp:TextBox>
                                                        </ItemTemplate>


                                                    </asp:TemplateField>

                                                     <asp:TemplateField HeaderText="Update Price">
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Left" />
                                    <ItemTemplate>
                                       
                                        <asp:ImageButton ID="imgbtnUpdate" runat="server" ImageAlign="Middle" OnClick="Edit"
                                            ToolTip="Update" ImageUrl="../img/icon_edit.gif" />
                                    </ItemTemplate>
                                                         
                                </asp:TemplateField>
                                
                                   
  
                               
                                </Columns>

                        </asp:GridView>
                      
                    </div>



                         <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                             <label for="">Total Service Amount</label>

                                           <asp:TextBox ID="txtTotAmt" onkeyPress="return false;" CssClass="form-control" placeholder="Total Amount" runat="server"></asp:TextBox>
                                            </div>                                          
                                        </div>
                                 

                                 <div class="col-md-3">
                                         <div class="form-group">
                                            <label for="">Adjust Amount</label>

                                            <asp:TextBox ID="txtAdjust" CssClass="form-control" onblur="CalculatDisc()" runat="server"></asp:TextBox>

                                          
                                        </div>
                                    </div>



                              <div class="col-md-3">
                                         <div class="form-group">
                                           <label for="">Total Discount</label>

                                            <asp:TextBox ID="txtDis" CssClass="form-control" onblur="javascript:Calculat();" placeholder="Enter Discount Amount" runat="server"></asp:TextBox>

                                          
                                        </div>
                                    </div>

                         

                              <div class="col-sm-3" >
                                                <div class="form-group" style="margin-top:35px;">   
                                                    <asp:CheckBox ID="chkgst"  runat="server" onclick="calculategst()" style="margin-left:5%;" />&nbsp
                                                 <label for="">Gst charge Enable</label>
                                                
                                               </div>
                                              

                                            </div>

                           



                        </div>


                         <div class="row">

                                 <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label for="">GST Amount</label>
                                                    <asp:TextBox ID="txtGtAmt"  CssClass="form-control" onkeyPress="return false;" placeholder="GST Amount" runat="server"></asp:TextBox>
                                                </div>
                                            </div>



                                <div class="col-md-3">
                                         <div class="form-group">
                                           <label for="">Final Total</label>

                                            <asp:TextBox ID="txtGrandTAmt" CssClass="form-control" onkeyPress="return false;" onblur="javascript:Calculat();" placeholder="Grand Total" runat="server"></asp:TextBox>

                                          
                                        </div>
                                    </div>

                             

                           

                               <div class="col-sm-6" style="margin-top:35px;">
                                                   <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" OnClick="btnSubmit_Click"  Text="Save & goto List"
                                            ValidationGroup="Cat_Update"  />

                                    <asp:Button ID="btnPayment" runat="server" OnClick="btnPayment_Click" CssClass="btn btn-success"   Text="Save & goto Payment"/>


                                        <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-danger" OnClick="btnCancel_Click"  Text="Cancel" />
                                              </div>


                           


                             </div>


                    </div>
                </div>

            </div>
        </div><script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

