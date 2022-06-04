<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="View_Salevoucher.aspx.cs" Inherits="Admin_Sale_View_Salevoucher" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Party Service List</a></li>
    </ul>
    <!--------------------END - Breadcrumbs-------------------->
    <div class="content-panel-toggler">
        <i class="os-icon os-icon-grid-squares-22"></i><span>Sidebar</span>
    </div>
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
        <asp:HiddenField ID="hdfprty" runat="server" />
        <asp:HiddenField ID="HDFUserID" runat="server" />
        <div class="content-box">
            <div class="element-wrapper">
                <h6 class="element-header">
                   Party Service List</h6>
                <div class="element-box">
                           
                                            <div >
                                                <asp:Button ID="Button1"  runat="server" onclick="btn_back"  style="border-radius: 16px;float:right;" class="btn btn-primary"
                                                    Text="Back" />
                                            </div>
                                           
                    <h5 class="form-header">
                        Party Service List</h5>
                    <div class="controls-above-table">
                        <div class="row">
                             <div class="col-sm-6">
                                    <div class="element-box" style="background: #F2F4F8;">
                                        <h5 class="form-header">Party Details</h5>
                                        <h5 style="float:right" class="form-header"><asp:Label ID="Lblusertype" runat="server" Text=""></asp:Label></h5>
                                         
                                   

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
                             <div class="col-sm-6" style="text-align:center"><br /><br />
                                 <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CssClass="mr-2 mb-2 btn btn-secondary btn-rounded btn-lg"><i class="icon-plus"></i> Add New Service</asp:LinkButton>
                                 </div>
                           
                        </div>
                    </div>
                    <%--   <div class="row">
                                    <div class="col-sm-3">



                                        <asp:LinkButton ID="lbtnAddService" runat="server" Style="font-size: 20px;" ValidationGroup="sv" OnClick="lbtnAddService_Click"><i class="icon-plus"></i> Add Service</asp:LinkButton>

                                        
                                    </div>
                                </div>--%>
                    <div class="table-responsive">
                        <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px"
                            EmptyDataText="Result Not Found" Width="100%" CssClass="table table-lightborder table-bordered table-hover"
                            PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false"
                             AllowPaging="true" PageSize="10">
                            <Columns>
                                                    <asp:TemplateField HeaderText="S No.">
                                                        <ItemTemplate>

                                                            <%# Container.DataItemIndex + 1 %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                              <%--    <asp:TemplateField HeaderText="Invoice No">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblVoucherNo" runat="server" Text='<%#Eval("VoucherNo") %>' />
                                                        </ItemTemplate>

                                                    </asp:TemplateField>--%>

                                                    <asp:TemplateField HeaderText="Service Name">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblItem_Amount" runat="server" Text='<%#Eval("CategoryName") %>' /><br />
                                                             <%#Eval("DomainName") %><%#Eval("SubCategoryN") %><br />


                                                        </ItemTemplate>

                                                    </asp:TemplateField>



                                                   

                                                <%--    <asp:TemplateField HeaderText="Service + GST Price">

                                                        <ItemTemplate>
                                                            <span style="margin-left:2px;">&#8377;</span><asp:Label ID="lblSprice" runat="server" Text='<%#Eval("PurchasePrice") %>'></asp:Label> +<span style="margin-left:2px;">&#8377;</span><asp:Label ID="lblGSTPrice" runat="server" Text='<%#Eval("Gst_Amount") %>'></asp:Label>
                                                           
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            Total Price:-<span> <i class="fa fa-inr"></i>
                                                                <asp:Label ID="lblPriceP" runat="server" Text=""></asp:Label></span>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>--%>

                                                    
                                                  <%--  <asp:TemplateField HeaderText="Gst Percent (Amount)">
                                                        <ItemTemplate>
                                                             <asp:Label ID="Label1" runat="server" Text='<%#Eval("Gst")%>'></asp:Label><span>%</span>
                                                           
                                                           

                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            Gst Amount:-<span> <i class="fa fa-inr"></i>
                                                                <asp:Label ID="lblGstAmt" runat="server" Text=""></asp:Label></span>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>--%>

                                                 

                                               <%--     <asp:TemplateField HeaderText="Amount">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAmt" runat="server" Text='<%#Eval("Amount") %>' />
                                                            
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            Amount:-<span> <i class="fa fa-inr"></i>
                                                                <asp:Label ID="lblTAmt" runat="server" Text=""></asp:Label></span>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>--%>
                                    <asp:TemplateField HeaderText="Registred Date">

                                                        <ItemTemplate>

                                                            <asp:Label ID="lblRegDate" runat="server" Text='<%#Eval("PurCahseDate", "{0:dd MMM yyyy}") %>' />
                                                        </ItemTemplate>

                                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Renew Date">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRenDate" runat="server" Text='<%#Eval("NextReNewdate", "{0:dd MMM yyyy}") %>' />
                                                        </ItemTemplate>

                                                    </asp:TemplateField>
                              <%--  <asp:TemplateField HeaderText="Edit">
                                                        <HeaderStyle />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>

                                                        
                                                           
                                                            <asp:ImageButton ID="imgbtnEdit" runat="server" ImageAlign="Middle" OnClick="Edit"
                                                                ToolTip="Edit" ImageUrl="~/img/pensil.png" />
                                                            </button>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>


                                                    <asp:TemplateField HeaderText="Delete">
                                                        <HeaderStyle />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                                <asp:HiddenField ID="hdfParty" runat="server" Value='<%#Eval("PartyId")%>' />
                                                             <asp:HiddenField ID="hdfServId" runat="server" Value='<%#Eval("SerID")%>' />
                                                            <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle" OnClick="Edit"
                                                                ToolTip="Delete" ImageUrl="~/img/Delete_Record.png" />
                                                            </button>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>
                        </asp:GridView>
                        <div style="text-align: center;">
                            <%--<uc1:pagingcontrol ID="CustPager" OnPageChanged="CustPager_PageChanged" runat="server" />--%>
                            
                        </div>
                    </div>
                    <!----------End----------->
                </div>
            </div>
            
            
            
        </div>
        <!--------------------START - Sidebar-------------------->
        
        <!--------------------END - Sidebar-------------------->
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
                                        <div class="row">

                                            <div class="col-sm-6">
                                                <div class="form-group input-group">
                                                    <label for="" class="input-group-addon">Select Service Type</label>
                                                    <asp:DropDownList ID="drdServiceTp" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="drdServiceTp_SelectedIndexChanged"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group input-group">
                                                     <label for="" class="input-group-addon">Select Service</label>
                                                    <asp:DropDownList ID="drdService" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="drdService_SelectedIndexChanged"></asp:DropDownList>
                                                </div>
                                            </div>
                                             <div class="col-sm-6" id="domDiv" runat="server" visible="false">
                                                <div class="form-group input-group">
                                                     <label for="" class="input-group-addon">Domain Name</label>
                                                    <asp:TextBox ID="txtDomnName" runat="server" CssClass="form-control" placeholder="Enter Domain Name"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                
                                                    <asp:CheckBox ID="chkgst"  runat="server" onclick="gstvalue(this)" style="margin-left:5%;" />&nbsp
                                                 <label for="">Gst charge Enable</label>
                                                
                                               
                                                    <asp:CheckBox ID="Chkservice"  runat="server" onclick="serviceval(this)" style="margin-left:5%;" />
                                                 <label for="">Is service free</label>
                                                

                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group input-group">
                                                     <label for="" class="input-group-addon">Gst</label>
                                                    <asp:TextBox ID="txtGst" CssClass="form-control" onkeyPress="return false;" placeholder="Enter Gst" runat="server"></asp:TextBox>
                                                </div>
                                            </div>

                                            

                                            <div class="col-sm-6">
                                                <div class="form-group input-group">
                                                      <label for="" class="input-group-addon">Service Amount</label>
                                                    <asp:TextBox ID="txtSerAnt" CssClass="form-control" onblur="javascript:CalculatService();" placeholder="Enter Service Amount" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group input-group" >
                                                     <label for="" class="input-group-addon">Gst Amount</label>
                                                    <asp:TextBox ID="txtGstAmt" CssClass="form-control" Visible="true" onkeyPress="return false;" placeholder="Enter GST Service Amount" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group input-group" id="divRenewSrvcAmt" runat="server" visible="false">
                                                    <label for="" class="input-group-addon">Renew Service Amount</label>
                                                    <asp:TextBox ID="txtReNewAmt" CssClass="form-control" placeholder="Enter Renew Service Amount" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                             <div class="col-sm-6" id="divAMCCharge" runat="server" visible="false">
                                                <div class="form-group input-group">
                                                    <label for="" class="input-group-addon">AMC Charge</label>
                                                    <asp:TextBox ID="txtAmcCharge" CssClass="form-control" placeholder="Enter Renew Service Amount" runat="server"></asp:TextBox>
                                                </div>
                                            </div>


                                            <div class="col-sm-6">
                                                <div class="form-group input-group">
                                                    <label for="" class="input-group-addon">Total Amount</label>
                                                    <asp:TextBox ID="txtTamount" CssClass="form-control" onkeyPress="return false;" placeholder="Enter Total Amount" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group input-group">
                                                    <label for="" class="input-group-addon">Start Service Date</label>
                                                    <asp:TextBox ID="txtSerDate" CssClass="form-control" placeholder="Select Start Service Date" runat="server"></asp:TextBox>
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
                                                     <label for="" class="input-group-addon">Renew Service Date</label>
                                                    <asp:TextBox ID="txtRendate" CssClass="form-control" placeholder="Select Renew Service Date" runat="server"></asp:TextBox>
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
                                                     <label for="" class="input-group-addon">Purchase Type</label>
                                                    <asp:DropDownList ID="drdPurTP" CssClass="form-control" runat="server">
                                                        <asp:ListItem Value="0" Text="--Select Purchase Type--"></asp:ListItem>
                                                        <asp:ListItem Value="1" Text="New"></asp:ListItem>
                                                        <asp:ListItem Value="2" Text="Renew"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group input-group">
                                                    <label for="" class="input-group-addon">Service Description</label>
                                                    <asp:TextBox ID="txtDisS" TextMode="MultiLine" CssClass="form-control" placeholder="Enter Service Description" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                           
                                        </div>

                                    </div>
                                    <div class="modal-footer">

                                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary"  Text="Submit"
                                            ValidationGroup="Cat_Update" OnClick="btnSubmit_Click" />


                                        <asp:Button ID="btnCancel" runat="server" CommandCharge_Details="Cancel" CssClass="btn btn-primary"
                                            Text="Close" OnClick="btnCancel_Click" />

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

