<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddPartyService.aspx.cs" Inherits="Admin_Sale_AddPartyService" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <script type="text/javascript">

        
     <%--   function OnEmployeeSelected(source, eventArgs)
        {
                document.getElementById("<%= txtParty.ClientID %>").value =eventArgs.get_value();
                document.getElementById("<%= btnAutoSubmit.ClientID %>", "").click();
        }--%>

    

       <%-- function Calculat() {

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
            }--%>

       //  } 
         
         function CalculatService() {
            
            var TCharge = 0;
            var ServiceAmt = document.getElementById('<%= txtSerAnt.ClientID %>').value;
           // var GstPer = document.getElementById('').value;
           // var GSTAmt = 0; //= document.getElementById('').value;
            //alert(GstPer);
      
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     

    <!--------------------
                START - Breadcrumbs
                -------------------->
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Create sale Voucher</a></li>
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

                     <asp:HiddenField ID="hdfClienrServiceId" runat="server" />
                      <asp:HiddenField ID="hdfNextRenewdate" runat="server" />
                     


    <div class="content-i">
        <div class="content-box">
            
            <div class="row">
                <div class="col-sm-12">
                    <div class="element-wrapper">


                       

                        <div class="element-box">
                           <%-- <h5 class="form-header" id="topheading">Create Sale Voucher</h5>--%>
                            <div class="row">
                                <div class="col-md-10"></div>
                                 <div class="col-md-2">

                                    
                                     <asp:Button ID="btngotoInvove" OnClick="btngotoInvove_Click" CssClass="btn btn-danger" runat="server" Text="Go to Invoice" />
                                   <%--   <a href="Invoice.aspx?" class="btn btn-danger"> <i class="fas fa-angle-double-left"></i> Go to Invoice</a>--%>

                                 </div>
                            </div>
                           <%--  <a href="Invoice.aspx" class="text">Go to Invoice</a>--%>
                           
                            <div id="alert" runat="server" visible="false" class="alert alert-success" style="padding: 10px;">
                                <asp:Label ID="lblMSG" runat="server" Text=""></asp:Label>
                            </div>
                            

                            <fieldset class="form-group">
                                <legend><span>Add Services</span></legend>
                                 <div class="element-box" style="background:#F2F4F8;">
                                 
                                          <div class="row">
                                              
                                              <div class="col-sm-6" runat="server" id="divService" visible="false">
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

                                             <div class="col-sm-6">
                                                <div class="form-group input-group">
                                                     <label for="" class="input-group-addon">Domain Name</label>
                                                    <asp:TextBox ID="txtDomnName" runat="server" CssClass="form-control" placeholder="Enter Domain Name"></asp:TextBox>
                                                </div>
                                            </div>
                                                 
                                      
                                        
                                            <div class="col-sm-6">
                                                <div class="form-group input-group">
                                                      <label for="" class="input-group-addon">Service Amount</label>
                                                    <asp:TextBox ID="txtSerAnt" CssClass="form-control" onblur="javascript:CalculatService();" placeholder="Enter Service Amount" runat="server"></asp:TextBox>
                                                </div>
                                            </div>               



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
                                                   <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" runat="server" CssClass="btn btn-primary"  Text="Submit"
                                             ValidationGroup="Cat_Update" />



                                        <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-danger" Text="Close" />
                                              </div>
                                                 
                                          
                                        </div>

                                     </div>



                            
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="table-responsive" style="width:100%;overflow-x:auto">
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
                                                           
                                                        </ItemTemplate>

                                                    </asp:TemplateField>



                                                     <asp:TemplateField HeaderText="Domain Name">

                                                        <ItemTemplate>
                                                           <%#Eval("DomainName") %>
                                                        </ItemTemplate>

                                                    </asp:TemplateField>



                                                     <asp:TemplateField HeaderText="Service">

                                                        <ItemTemplate>
                                                            <%#Eval("SubCategoryN") %>
                                                        </ItemTemplate>

                                                      <FooterTemplate>
                                                           Total Price:-
                                                        </FooterTemplate>

                                                    </asp:TemplateField>

                                                   

                                                    <asp:TemplateField HeaderText="Price">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSprice" runat="server" Text='<%#Eval("PurchasePrice") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>                                                     
                                                                <span> <i class="fa fa-inr"></i></span> <asp:Label ID="lblPriceP" runat="server" Text=""></asp:Label>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>



                                                    


                                                      <asp:TemplateField HeaderText="RenewPrice">

                                                        <ItemTemplate>
                                                            <%#Eval("NextRenewPrice") %>
                                                        </ItemTemplate>

                                                    </asp:TemplateField>


                                                    
                                                  <asp:TemplateField HeaderText="StartDate">

                                                        <ItemTemplate>
                                                            <%#Eval("PurCahseDate","{0:dd/MM/yyyy}")%>
                                                        </ItemTemplate>

                                                    </asp:TemplateField>

                                                     <asp:TemplateField HeaderText="RenewDate">

                                                        <ItemTemplate>
                                                            <%#Eval("NextReNewdate","{0:dd/MM/yyyy}")%>
                                                        </ItemTemplate>

                                                    </asp:TemplateField>


                                                    

                                                 
                                                    <asp:TemplateField HeaderText="Edit">
                                                        <HeaderStyle />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>

                                                            <asp:HiddenField ID="hdfParty" runat="server" Value='<%#Eval("PartyID")%>' />                                                     
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
                                
                              
                            </fieldset>
                          
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
    
 
    <script src="../../js/jquery-1.12.4.js"></script>

</asp:Content>

