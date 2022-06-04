<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="CreateSaleVoucher.aspx.cs" Inherits="Admin_Sale_CreateSaleVoucher" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        
        function OnEmployeeSelected(source, eventArgs)
        {
                document.getElementById("<%= txtParty.ClientID %>").value =eventArgs.get_value();
                document.getElementById("<%= btnAutoSubmit.ClientID %>", "").click();
        }



        function Calculat() {
            var disAmt = document.getElementById('<%= txtDis.ClientID %>').value;
            // var GAmt = document.getElementById('<%= txtGtAmt.ClientID %>').value;
            var TAmt = document.getElementById('<%= txtTotAmt.ClientID %>').value;
            var TChr = document.getElementById('<%= txtToChr.ClientID %>').value;
            var TfDisAmt = 0; //document.getElementById('<%= txtOfDicAmt.ClientID %>').value;
            var totAMChar = 0;
            if (disAmt != 0) {
                TfDisAmt = parseFloat(TAmt) - parseFloat(disAmt);
                document.getElementById('<%= txtOfDicAmt.ClientID %>').value = TfDisAmt;
                if (TChr != 0) {
                    TAmt = parseFloat(TAmt) + parseFloat(TChr);
                }
                totAMChar = parseFloat(TAmt) - parseFloat(disAmt);
                // document.getElementById('<%= txtGtAmt.ClientID %>').value = totAMChar
                document.getElementById('<%= txtGrandTAmt.ClientID %>').value = totAMChar;
            }
            else {
                totAMChar = parseFloat(TAmt) + parseFloat(TChr);                
                document.getElementById('<%= txtGtAmt.ClientID %>').value = totAMChar.toFixed(2);
                document.getElementById('<%= txtOfDicAmt.ClientID %>').value = " ";
            }

        } function CalculatService() {
            
            var TCharge = 0;
            var ServiceAmt = document.getElementById('<%= txtSerAnt.ClientID %>').value;
           // var GstPer = document.getElementById('').value;
           // var GSTAmt = 0; //= document.getElementById('').value;
            //alert(GstPer);
            var chkStatus1 = document.getElementById('<%= Chkservice.ClientID %>');
            if (chkStatus1.checked)
            {
                ServiceAmt = "0";
            }
            if (GstPer != 0)
            {
                GSTAmt = ServiceAmt * GstPer / 100;
                if(GSTAmt != 0)
                {                    
                   // document.getElementById('').value = GSTAmt;
                }

                <%--else
                {
                    alert("else");
                     document.getElementById('<%= txtGstAmt.ClientID %>').value = 0;
                }--%>
                //alert(GSTAmt);
            }

            if (ServiceAmt != 0 && GSTAmt != 0) {
                TCharge = parseFloat(GSTAmt) + parseFloat(ServiceAmt);
                if (TCharge != 0)
                {
                    document.getElementById('').value = TCharge.toFixed(2);
                }

            }
            else
            {
              <%--  document.getElementById('<%= txtTamount.ClientID %>').value = ServiceAmt;--%>
            }
        }

        
        function gstvalue()
        {
           
            //var chkStatus1 = document.getElementById('');
            var gstvalue = document.getElementById('<%= Hdfvalue.ClientID %>').value;
            if (chkStatus1.checked)
            {
                
               // document.getElementById('').value = gstvalue;
                CalculatService()
            }
            else
            {
                
              Gst = 0.00;
               // document.getElementById('').value = Gst; 
               // document.getElementById('').value = 0.00;
                 CalculatService()
            }

        }

        function serviceval()
        {
           
            var chkStatus1 = document.getElementById('<%= Chkservice.ClientID %>');
            var servalue = document.getElementById('<%= Hdfservicevalue.ClientID %>').value;
            if (chkStatus1.checked)
            {
                 <%--Service = 0.00;
                 document.getElementById('<%= txtSerAnt.ClientID %>').value = Service; --%>
              //  document.getElementById('').checked = false;;
            
             CalculatService()
                
            }
            else
            {
              
                document.getElementById('<%= txtSerAnt.ClientID %>').value = servalue;
                CalculatService()

            }
            gstvalue();

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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    

    <!--------------------
                START - Breadcrumbs
                -------------------->
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Create Invoice</a></li>
        <%--<li class="breadcrumb-item"><span>Laptop with retina screen</span></li>--%>
    </ul>
    <!--------------------
                END - Breadcrumbs
                -------------------->
    <div class="content-panel-toggler"><i class="os-icon os-icon-grid-squares-22"></i><span>Sidebar</span></div>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:HiddenField ID="Hdfsale" runat="server" />
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
                     <asp:HiddenField ID="Hdfservicevalue" runat="server" />
                    <asp:HiddenField ID="hdfclient" runat="server" />

                   

    <div class="content-i">
        <div class="content-box">
            
            <div class="row">
                <div class="col-sm-12">
                    <div class="element-wrapper">
                        <div class="element-box">
                            <h5 class="form-header" id="topheading">Create Invoice</h5>
                           
                            <div id="alert" runat="server" visible="false" class="alert alert-success" style="padding: 10px;">
                                <asp:Label ID="lblMSG" runat="server" Text="Label"></asp:Label>
                            </div>
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

                                       <asp:Button ID="btnAutoSubmit"   runat="server"  CssClass="btn btn-primary input-group-addon"  OnClick="btnAutoSubmit_Click" style="background-color:#047BF8;color:white;border-radius: 8px"  Text="search" />

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

                            <fieldset class="form-group">
                                <legend><span>Add Services</span></legend>
                                 <div class="element-box" style="background:#F2F4F8;">
                                  <div class="row">

                                      <asp:HiddenField ID="hdfClienrServiceId" runat="server" />
                                               <div class="col-sm-6">
                                                <div class="form-group input-group">
                                                     <label for="" class="input-group-addon">Purchase Type</label>
                                                    <asp:DropDownList ID="drdPurTP" CssClass="form-control" runat="server" OnSelectedIndexChanged="drdPurTP_SelectedIndexChanged" AutoPostBack="true">
                                                        <asp:ListItem Value="0" Text="--Select Purchase Type--"></asp:ListItem>
                                                        <asp:ListItem Value="1" Text="New"></asp:ListItem>
                                                        <asp:ListItem Value="2" Text="Renew"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                         </div>
                                          <div class="row" id="servDiv" runat="server" visible="false">
                                              
                                              <div class="col-sm-6" id="renewDiv" runat="server" visible="false">
                                                <div class="form-group input-group">
                                                    <label for="" class="input-group-addon">Select Service</label>
                                                    <asp:DropDownList ID="drdClntSrvc" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="drdClntSrvc_SelectedIndexChanged"></asp:DropDownList>
                                                </div>
                                            </div>
                                          
                                              <div id="newDiv" runat="server">
                                            <div class="col-sm-12">
                                                <div class="form-group input-group">
                                                    <label for="" class="input-group-addon">Select Service Type</label>
                                                    <asp:DropDownList ID="drdServiceTp" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="drdServiceTp_SelectedIndexChanged"></asp:DropDownList>
                                                </div>
                                            </div>
                                             
                                            <div class="col-sm-12">
                                                <div class="form-group input-group">
                                                     <label for="" class="input-group-addon">Select Service</label>
                                                    <asp:DropDownList ID="drdService" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="drdService_SelectedIndexChanged"></asp:DropDownList>
                                                </div>
                                            </div>
                                                   </div>

                                             <div class="col-sm-6" id="domDiv" runat="server" visible="false">
                                                <div class="form-group input-group">
                                                     <label for="" class="input-group-addon">Domain Name</label>
                                                    <asp:TextBox ID="txtDomnName" runat="server" CssClass="form-control" placeholder="Enter Domain Name"></asp:TextBox>
                                                </div>
                                            </div>
                                                 
                                            <div class="col-sm-6">                                               
                                             
                                                    <asp:CheckBox ID="Chkservice"  runat="server" onclick="serviceval(this)" style="margin-left:5%;" />
                                                 <label for="">Is service free</label>
                                                

                                            </div>
                                        
                                            <div class="col-sm-6">
                                                <div class="form-group input-group">
                                                      <label for="" class="input-group-addon">Service Amount</label>
                                                    <asp:TextBox ID="txtSerAnt" CssClass="form-control" onblur="javascript:CalculatService();" placeholder="Enter Service Amount" runat="server"></asp:TextBox>
                                                </div>
                                            </div>


                                           <%-- <div class="col-sm-6">
                                                <div class="form-group input-group" >
                                                     <label for="" class="input-group-addon">Gst Amount</label>
                                                    <asp:TextBox ID="txtGstAmt" CssClass="form-control" Visible="true" onkeyPress="return false;" placeholder="Enter GST Service Amount" runat="server"></asp:TextBox>
                                                </div>
                                            </div>--%>

                                        

                                        <%--     <div class="col-sm-6" id="divAMCCharge" runat="server" visible="false">
                                                <div class="form-group input-group">
                                                    <label for="" class="input-group-addon">AMC Charge</label>
                                                    <asp:TextBox ID="txtAmcCharge" CssClass="form-control" placeholder="Enter Renew Service Amount" runat="server"></asp:TextBox>
                                                </div>
                                            </div>--%>




                                           <%-- <div class="col-sm-6">
                                                <div class="form-group input-group">
                                                    <label for="" class="input-group-addon">Total Amount</label>
                                                    <asp:TextBox ID="txtTamount" CssClass="form-control" onkeyPress="return false;" placeholder="Enter Total Amount" runat="server"></asp:TextBox>
                                                </div>
                                            </div>--%>


                                                <div class="col-sm-6">
                                                <div class="form-group input-group">
                                                    <label for="" class="input-group-addon">Next Renew Service/AMC Charge</label>
                                                    <asp:TextBox ID="txtReNewAmt" CssClass="form-control" placeholder="Enter Renew Service Amount" runat="server"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <div class="form-group input-group">
                                                    <asp:Label ID="lblServDateText" runat="server" Text="Start Service Date" CssClass="input-group-addon"></asp:Label>
                                                    
                                                    <asp:TextBox ID="txtSerDate" CssClass="form-control" OnTextChanged="txtSerDate_TextChanged" AutoPostBack="true" placeholder="Select Start Service Date" runat="server" autocomplete="off"></asp:TextBox>
                                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" ClientIDMode="Static" TargetControlID="txtSerDate" Format="dd-MM-yyyy"></asp:CalendarExtender>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSerDate"
                                             Display="None" ErrorMessage="Enter service Date" ForeColor="Red" SetFocusOnError="True"
                                            ValidationGroup="Cat_Update">*****</asp:RequiredFieldValidator>

                                           <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1"
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group input-group">
                                                     <label for="" class="input-group-addon">Next Renew Service Date</label>
                                                    <asp:TextBox ID="txtRendate" CssClass="form-control" placeholder="Select Renew Service Date" runat="server" autocomplete="off"></asp:TextBox>
                                                    <asp:CalendarExtender ID="CalendarExtender2" runat="server" ClientIDMode="Static" TargetControlID="txtRendate" Format="dd-MM-yyyy"></asp:CalendarExtender>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtRendate"
                                             Display="None" ErrorMessage="Enter Renew Date" ForeColor="Red" SetFocusOnError="True"
                                            ValidationGroup="Cat_Update">*****</asp:RequiredFieldValidator>

                                           <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2"
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>
                                                </div>
                                            </div>
                                           
                                         
                                            <div class="col-sm-6">
                                                <div class="form-group input-group">
                                                    <label for="" class="input-group-addon">Service Description</label>
                                                    <asp:TextBox ID="txtDisS" TextMode="MultiLine" CssClass="form-control" placeholder="Enter Service Description" runat="server"></asp:TextBox>
                                                </div>
                                            </div>


                                              <div class="col-sm-6">
                                                   <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary"  Text="Submit"
                                            ValidationGroup="Cat_Update" OnClick="btnSubmit_Click" />


                                        <asp:Button ID="btnCancel" runat="server" CommandCharge_Details="Cancel" CssClass="btn btn-primary"
                                            Text="Close" OnClick="btnCancel_Click" />
                                              </div>
                                                 
                                          
                                        </div>

                                     </div>
                               <%-- <div class="row">
                                    <div class="col-sm-3">



                                        <asp:LinkButton ID="lbtnAddService" runat="server" Style="font-size: 20px;" ValidationGroup="sv" OnClick="lbtnAddService_Click"><i class="icon-plus"></i> Add Service</asp:LinkButton>

                                        
                                    </div>
                                </div>--%>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="table-responsive">
                                            <asp:GridView ID="gvDetails" runat="server" CssClass="table table-striped table-bordered table-hover"
                                                EmptyDataText="Result Not Found" Width="100%" AllowPaging="true" PageSize="10" ShowFooter="true"
                                                AutoGenerateColumns="false" OnRowDataBound="gvDetails_RowDataBound">


                                                <Columns>
                                                    <asp:TemplateField HeaderText="sn.">
                                                        <ItemTemplate>

                                                            <%# Container.DataItemIndex + 1 %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField HeaderText="Service Type">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblItem_Amount" runat="server" Text='<%#Eval("CategoryName") %>' /><br />
                                                            <%#Eval("DomainName") %>
                                                        </ItemTemplate>

                                                    </asp:TemplateField>



                                                   

                                                    <asp:TemplateField HeaderText="Service Price">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSprice" runat="server" Text='<%#Eval("Per_unit_Rate_Price") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            Total Price:-<span> <i class="fa fa-inr"></i>
                                                                <asp:Label ID="lblPriceP" runat="server" Text=""></asp:Label></span>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>

                                                    
                                                   <%-- <asp:TemplateField HeaderText="Gst Percent (Amount)">
                                                        <ItemTemplate>
                                                             <asp:Label ID="Label1" runat="server" Text='<%#Eval("Gst")%>'></asp:Label><span>%</span>
                                                            <asp:Label ID="lblGSTPrice" runat="server" style="margin-left:20px" Text='<%#Eval("Gst_Amount") %>'></asp:Label><span style="margin-left:2px;">&#8377;</span>
                                                           

                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            Gst Amount:-<span> <i class="fa fa-inr"></i>
                                                                <asp:Label ID="lblGstAmt" runat="server" Text=""></asp:Label></span>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>--%>

                                                     <asp:TemplateField HeaderText="Service">

                                                        <ItemTemplate>
                                                            <%#Eval("SubCategoryN") %>
                                                        </ItemTemplate>

                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Amount">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAmt" runat="server" Text='<%#Eval("Amount") %>' />
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            Amount:-<span> <i class="fa fa-inr"></i>
                                                                <asp:Label ID="lblTAmt" runat="server" Text=""></asp:Label></span>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Edit">
                                                        <HeaderStyle />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>

                                                            <asp:HiddenField ID="hdfParty" runat="server" Value='<%#Eval("PartyID")%>' />
                                                            <asp:HiddenField ID="hdfVoucherID" runat="server" Value='<%#Eval("VoucherDetailsID")%>' />
                                                            <asp:HiddenField ID="hdfServId" runat="server" Value='<%#Eval("SerID")%>' />
                                                            <asp:ImageButton ID="imgbtnEdit" runat="server" ImageAlign="Middle" OnClick="Edit"
                                                                ToolTip="Edit" ImageUrl="~/img/pensil.png" />
                                                            </button>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField HeaderText="Delete">
                                                        <HeaderStyle />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle" OnClick="Edit"
                                                                ToolTip="Delete" ImageUrl="~/img/Delete_Record.png" />
                                                            </button>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>



                                </div>
                                <div class="col-sm-12">
                                    <fieldset class="form-group">
                                        <legend><span>Other Charges</span></legend>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group input-group">
                                                     <label for="" class="input-group-addon">Other Charge Name</label>
                                                    <asp:TextBox ID="txtOthSName" placeholder="Enter Other Charges Name" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group input-group">
                                                     <label for="" class="input-group-addon">Other Charge Amount</label>
                                                    <asp:TextBox ID="txtOthCharge" CssClass="form-control" placeholder="Enter Other Charge Amount" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">

                                                    <asp:Button ID="btnSaveCharge" CssClass="btn btn-primary" runat="server" Text="Add Charges" OnClick="btnSaveCharge_Click" />
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <div class="table-responsive">
                                                    <asp:GridView ID="gridotherChr" runat="server" CssClass="table table-striped table-bordered table-hover"
                                                        EmptyDataText="Result Not Found" Width="100%" AllowPaging="true" PageSize="10" ShowFooter="true"
                                                        AutoGenerateColumns="false" OnRowDataBound="gridotherChr_RowDataBound">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S No.">
                                                                <ItemTemplate>

                                                                    <%# Container.DataItemIndex + 1 %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Charges Name">

                                                                <ItemTemplate>
                                                                    <%#Eval("ChargesName") %>
                                                                </ItemTemplate>

                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Charge Amount">

                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCAmt" runat="server" Text='<%#Eval("ChargeAmount") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    Total Charge:-  <i class="fa fa-inr"></i>
                                                                    <asp:Label ID="lblOtCAmt" runat="server" Text="Label"></asp:Label>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Edit">
                                                                <HeaderStyle />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <ItemTemplate>

                                                                    <asp:HiddenField ID="hdfChrID" runat="server" Value='<%#Eval("ChargesID")%>' />
                                                                    <asp:ImageButton ID="imgbtnEdit" runat="server" ImageAlign="Middle" OnClick="OthEdit"
                                                                        ToolTip="Edit" ImageUrl="~/img/pensil.png" />
                                                                    </button>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>


                                                            <asp:TemplateField HeaderText="Delete">
                                                                <HeaderStyle />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle" OnClick="OthEdit"
                                                                        ToolTip="Delete" ImageUrl="~/img/Delete_Record.png" />
                                                                    </button>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                           </div>
                                        </fieldset>
                                             <fieldset class="form-group">
                                                 <legend><span>Amount Summery</span></legend>
                                                   <div class="row">
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label for="">Total Service  Amount</label>
                                                    <asp:TextBox ID="txtTotAmt" onkeyPress="return false;" CssClass="form-control" placeholder="Total Amount" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="">Total Other Charges</label>
                                                    <asp:TextBox ID="txtToChr" CssClass="form-control" onkeyPress="return false;" placeholder="Total Other Charges" runat="server"></asp:TextBox>
                                                </div>
                                            </div>


                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="">Total Amount</label>
                                                    <asp:TextBox ID="txtGtAmt" CssClass="form-control" onkeyPress="return false;" placeholder="Total Amount" runat="server"></asp:TextBox>
                                                </div>
                                            </div>


                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="">Discount Amount</label>
                                                    <asp:TextBox ID="txtDis" CssClass="form-control" onblur="javascript:Calculat();" placeholder="Enter Discount Amount" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label for="">Grand Total</label>
                                                    <asp:TextBox ID="txtGrandTAmt" CssClass="form-control" onkeyPress="return false;" onblur="javascript:Calculat();" placeholder="Grand Total" runat="server"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col-sm-2" style="display: none;">
                                                <div class="form-group">
                                                    <label for="">After Discount</label><%-- Enabled="false"--%>
                                                    <asp:TextBox ID="txtOfDicAmt" CssClass="form-control" onkeyPress="return false;" placeholder="After Discount Amount" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                                       </div>
                                    </fieldset>
                                </div>
                                <div class="form-group">
                                    <label>Remark</label>
                                    <asp:TextBox ID="txtRemark" CssClass="form-control" placeholder="Enter Remark......." TextMode="MultiLine" runat="server"></asp:TextBox>
                                    <%--<textarea class="form-control" rows="3"></textarea>--%>
                                </div>
                            </fieldset>
                            <%--<div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="checkbox">I agree to terms and conditions</label>
                            </div>--%>
                            <div class="form-buttons-w">
                                <asp:Button ID="btnSubMitSaleV" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubMitSaleV_Click" />
                                 <asp:Button ID="Btnpayment" CssClass="btn btn-primary" runat="server" Text="Payment" OnClick="btnpay_Click"/>
                                <%--<button class="btn btn-primary" type="submit">Submit</button>--%>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
               
            <!--------------------
                        START - Chat Popup Box
                        -------------------->

            <!--------------------
                        END - Chat Popup Box
                        -------------------->
        </div>
        <!--------------------
                    START - Sidebar
                    -------------------->

        <!--------------------
                    END - Sidebar
                    -------------------->
    </div>
 </ContentTemplate>
                </asp:UpdatePanel>
    <!----Kishan =====Strat Model Popup Add Service=====---->

    <asp:ModalPopupExtender runat="server" ID="programmaticModalPopup" BehaviorID="programmaticModalPopupBehavior"
        TargetControlID="hiddenTargetControlForModalPopup" PopupControlID="programmaticPopup"
        BackgroundCssClass="modalBackground">
    </asp:ModalPopupExtender>


    <asp:UpdatePanel ID="upPopUps" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
        <ContentTemplate>
            <asp:Panel ID="programmaticPopup" runat="server" Style="width: 100%; left: 0;">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                    <ContentTemplate>
                        <asp:Panel ID="pnlHeaderPopup" runat="server">

                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Add Service</h5>
                                    </div>


                                    <div class="modal-body">
                                        <div id="Divalert" runat="server" visible="false" class="alert alert-success" style="padding: 10px;">
                                            <asp:Label ID="lblMSGSer" runat="server" Text="Label"></asp:Label>
                                        </div>
                                      

                                    </div>
                                    <div class="modal-footer">

                                       

                                    </div>
                                </div>
                            </div>

                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnPlan" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:LinkButton runat="server" ID="hiddenTargetControlForModalPopup" />
    <!----Kishan =====End Model Popup Add Service=====---->
    <div style="display: none">
        <asp:Button ID="btnPlan" runat="server" Text="Button" OnClick="btnPlan_Click" />
    </div>
    <script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>
