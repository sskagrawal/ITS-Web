<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Invoice.aspx.cs" Inherits="Admin_Sale_Invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        @media only screen and (max-width: 997px) {
            img.watermark {
                position: absolute !important;
                opacity: 0.5 !important;
                top: 24rem !important;
                width: 50rem !important;
                transform: rotate(-45deg) !important;
            }
        }
        @media only screen and (max-width: 767px) {
            img.watermark {
                position: absolute !important;
                opacity: 0.5 !important;
                top: 30rem !important;
                width: 40rem !important;
                transform: rotate(-45deg) !important;
            }
        }
        @media only screen and (max-width: 575px) {
            img.watermark {
                position: absolute !important;
                opacity: 0.5 !important;
                top: 30rem !important;
                width: 31rem !important;
                transform: rotate(-45deg) !important;
            }
        }
        @media only screen and (max-width: 479px) {
            img.watermark {
                position: absolute !important;
                opacity: 0.5 !important;
                top: 40rem !important;
                width: 20rem !important;
                transform: rotate(-45deg) !important;
            }
        }
        @media only screen and (max-width: 375px) {
            img.watermark {
                position: absolute !important;
                opacity: 0.5 !important;
                top: 50rem !important;
                width: 20rem !important;
                transform: rotate(-45deg) !important;
            }
        }
    </style>
      <script type="text/javascript">
        function Print(elementId) {

            var printContent = document.getElementById(elementId);

            var windowUrl = 'about:blank';

            var uniqueName = new Date();

            var windowName = 'Print' + uniqueName.getTime();

            var printWindow = window.open(windowUrl, windowName, 'left=500,top=500,width=300,height:300,margin-left: auto,margin-right:auto');

            printWindow.document.write(printContent.innerHTML);

            printWindow.document.close();

            printWindow.focus();

            printWindow.print();

            printWindow.close();

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hdfVMId" runat="server" />
    <asp:HiddenField ID="hdfAmount" runat="server" />
     <asp:HiddenField ID="hdfgstAmt" runat="server" />
     <asp:HiddenField ID="hdfdisAmt" runat="server" />
     <asp:HiddenField ID="hdfgrandtotal" runat="server" />

    <asp:HiddenField ID="HDFUserID" runat="server" />
     <asp:HiddenField ID="hdfprty" runat="server" />



     <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Print Invoice</a></li>
        
    </ul>
    
    <div class="content-panel-toggler">
        <i class="os-icon os-icon-grid-squares-22"></i><span>Sidebar</span>
        
    </div>
    <div class="content-i">
        <div class="content-box">
            <div class="element-wrapper">
                 
                <h6 class="element-header">Print Invoice</h6>
              
                <div class="element-box">
                       <div class="white-box printableArea" style="padding:10px " id="println"><br /><br /><br />

                           <div class="row">
                               <div class="col-md-12">
                                   <img style="position:absolute;opacity:0.5;top:38rem;width:20rem;transform:rotate(-31deg);left:14rem;" class="watermark" alt="" src="../../companiesLogo/invoicewatermark.png" />
                               </div>
                           </div>
                             <div style="float:left;width: 40%;padding-left:15px">

                                     <asp:Image ID="imgPrf" runat="server" AlternateText="ITS Gwalior" Height="100" Width="104" />

                             </div>
                              <div style="float:left;width: 56%;text-align:right">
                                    <div style='font-size: 25px;text-transform:uppercase'>
                                        <asp:Label ID="lblCompanyName" runat="server"></asp:Label></div>
                                    <div style='font-size: 16px'>
                                        <asp:Label ID="lblcompAddr" runat="server"></asp:Label> <br />
                                        <asp:Label ID="lblCompStCit" runat="server"></asp:Label>
                                        <br />Mobile No - <asp:Label ID="lblCompMobNo" runat="server"></asp:Label><br />
                                        Account No - <asp:Label ID="lblAccNo" runat="server"></asp:Label><br />
                                         Acc Holder Name - <asp:Label ID="lblAccHolderName" runat="server"></asp:Label><br />
                                        Bank Name - <asp:Label ID="lblBankName" runat="server"></asp:Label><br />
                                        IFSC Code - <asp:Label ID="lblIfscCode" runat="server"></asp:Label><br />
                                     <asp:Label ID="lblGstText" runat="server" Text="Gst No - "></asp:Label> <asp:Label ID="lblCompGstNo" runat="server"></asp:Label>

                                    </div>
                                </div>

                             


                            <div style="clear:both"></div><br /><br /><br />
                           <div style="width:100%;padding:10px;background-color:gainsboro;font-size:18px">
                               <strong>Invoice #<asp:Label ID="lblInvNo" runat="server"></asp:Label></strong><br />
                               <span>Invoice Date: <asp:Label ID="lblinvDate" runat="server"></asp:Label></span>
                           </div>
                           <div style="clear:both"></div><br /><br />
                           <div style="width:60%;float:left">
                               <strong>Invoiced To</strong><br /> 
                               <span>
                                   <asp:Label ID="lblPartyName" runat="server"></asp:Label></span><br />
                               <span>
                                   <asp:Label ID="lblPartyAddr" runat="server"></asp:Label></span><br />
                               <span>
                                   <asp:Label ID="lblStateCityPnd" runat="server"></asp:Label></span><br />
                               <span>Phone No. <asp:Label ID="lblMobNo" runat="server"></asp:Label></span><br />
                                <span>Gst No. <asp:Label ID="lblGstNo" runat="server"></asp:Label></span>
                           </div>
                           <div style="width:40%;float:left;text-align:center;">
                               <span style="text-transform:uppercase;font-size:25px;font-weight:bold;display:none;">
                                   <asp:Label ID="lblPayStatus" runat="server"></asp:Label>
                               </span>
                           </div>
                           <div style="clear:both"></div><br /><br />

                         <asp:GridView ID="grdView" runat="server" footer="true" AutoGenerateColumns="False" Font-Size="14px" EmptyDataText="Result Not Found" Width="100%" PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" ShowFooter="True" OnRowDataBound="grdView_RowDataBound" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                                      <AlternatingRowStyle CssClass="even gradeC"></AlternatingRowStyle>
                            <Columns>
                                                

                                                    <asp:TemplateField HeaderText="Work Description">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblItem_Amount" runat="server" Text='<%#Eval("CategoryName") %>' /><br />
                                                             <%#Eval("SubCategoryN") %>&nbsp;<%#Eval("DomainName") %> (<%#string.Format("{0:dd/MM/yyyy}", Eval("PurCahseDate")) %> - <%#string.Format("{0:dd/MM/yyyy}", Eval("NextReNewdate")) %>)


                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div style="text-align:right;font-size:14px;font-weight:bold;border-bottom:1px solid black;margin:0 -4px 0px -4px;">Sub Total <i class="fa fa-inr" aria-hidden="true"></i> </div><br />
                                                             <div style="text-align:right;font-size:14px;font-weight:bold;border-bottom:1px solid black;margin:0 -4px 0px -4px;">Discount <i class="fa fa-inr" aria-hidden="true"></i></div><br />
                                                              <div style="text-align:right;font-size:14px;font-weight:bold;border-bottom:1px solid black;margin:0 -4px 0px -4px;">GST <i class="fa fa-inr" aria-hidden="true"></i> </div><br />                                                          
                                                        
                                                            <div style="text-align:right;font-size:14px;font-weight:bold;margin: 0 -4px 0px -4px;">Grand Total <i class="fa fa-inr" aria-hidden="true"></i></div>
                                                        </FooterTemplate>

                                                    </asp:TemplateField>


                                                    
                                                  
                                    <asp:TemplateField HeaderText="Total">

                                                        <ItemTemplate>                                                                                                       
                                                              <asp:Label ID="lblTotal" runat="server" Text='<%#Eval("Per_unit_Rate_Price") %>' /> &nbsp;&nbsp;
                                                           <%-- <%#Eval("Is_service") %>--%>
                                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div style="font-size:14px;font-weight:bold;border-bottom:1px solid black;margin:0 -4px 0px -4px;">&nbsp; <asp:Label ID="lblSubTot" runat="server" />  </div><br />
                                              <div style="font-size:14px;font-weight:bold;border-bottom:1px solid black;margin:0 -4px 0px -4px;">&nbsp; <asp:Label ID="lbldisc"  runat="server" />  </div><br />
                                            <div style="font-size:14px;font-weight:bold;border-bottom:1px solid black;margin:0 -4px 0px -4px;">&nbsp; <asp:Label ID="lblGst"  runat="server" />  </div><br />                                          
                                            <div style="font-size:14px;font-weight:bold;margin:0 -4px 0px -4px;">&nbsp; <asp:Label ID="lblGrandTot" runat="server" />  </div>
                                        </FooterTemplate>

                                                    </asp:TemplateField>
                                   
                                                </Columns>
                             <FooterStyle BackColor="#F0F0F0" />
                             <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Font-Size="18px" />

<PagerStyle CssClass="odd gradeA" BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left"></PagerStyle>
                             <RowStyle BackColor="White" />
                             <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                             <SortedAscendingCellStyle BackColor="#F1F1F1" />
                             <SortedAscendingHeaderStyle BackColor="#808080" />
                             <SortedDescendingCellStyle BackColor="#CAC9C9" />
                             <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
                           </div>
                    <input id="Button1" type="button" value="Print" class="btn btn-primary" onclick="Print('println')" />
                    </div>
                </div>
            </div>
        </div>
     <script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

