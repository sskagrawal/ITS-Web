<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Purchase-Invoice-List.aspx.cs" Inherits="Admin_Purchase_Purchase_Invoice_List" EnableEventValidation="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register src="../PagingControl.ascx" tagname="PagingControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <script type="text/javascript">
    $(document).ready(function() {
        $('#grdView').width($('#grdView').width());
    });
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


      <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Purchase Invoice List</a></li>
        <%--<li class="breadcrumb-item"><span>Laptop with retina screen</span></li>--%>
    </ul>
    <!--------------------END - Breadcrumbs-------------------->
    <div class="content-panel-toggler">
        <i class="os-icon os-icon-grid-squares-22"></i><span>Sidebar</span>
    </div>
    <div class="content-i">
        <div class="content-box">
            <div class="element-wrapper">
                <h6 class="element-header">
                    Purchase Invoice List</h6>
                <div class="element-box">        


                     <h5 class="form-header">
                        Generated Purchase Invoice List</h5>
                    <div class="controls-above-table">
                        <div class="row">

                            

                             <div class="col-lg-3">
                                       
                                            <div class="form-group" >
                                                <label>From Date</label>
                            
                                <asp:TextBox ID="txtFromdate" class="form-control" autocomplete="off" placeholder="Select From Date"
                                        runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="calfromdate" runat="server" ClientIDMode="Static" TargetControlID="txtFromdate"
                                        Format="yyyy-MM-dd"></asp:CalendarExtender>
                                                </div>
                                         
                                    </div>
                           

                            <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="">
                                               To Date
                                            </label>
                                          
                                             <asp:TextBox ID="txtTodate" autocomplete="off" class="form-control mb-2 mr-sm-2 mb-sm-0" placeholder="Select To Date"
                                        runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="calTodate" runat="server" ClientIDMode="Static" TargetControlID="txtTodate"
                                        Format="yyyy-MM-dd"></asp:CalendarExtender>

                                        </div></div>

                             <%--  <div class="col-lg-3">

                                   </div>--%>
                            

                            <div class="col-lg-6">       
                                            <div class="form-group">
                                                <asp:Button ID="btnSearch" OnClick="btnSearch_Click"  runat="server" style="margin-top: 31px;border-radius: 20px;" class="btn btn-primary" 
                                                    Text="Search" />

                                                 <asp:Button ID="btnReset" OnClick="btnReset_Click"  runat="server" style="margin-top: 31px;border-radius: 20px;" class="btn btn-danger" 
                                                    Text="Reset" />
                                            </div>

                              
                                               
                                          
                                           </div>


                            
                        </div>
                    </div>




                 

                    <div style="text-align:right">
                                <div class="btn-group">
                                  
                                            <asp:LinkButton ID="lnkExcel" runat="server" OnClick="lnkExcel_Click">Export to Excel</asp:LinkButton>
                                 
                                </div>
                            </div>


                    <div class="table-responsive">
                        <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px"
                            EmptyDataText="Result Not Found" Width="100%" CssClass="table full-color-table full-info-table hover-table"
                            PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false"
                            AllowPaging="true" PageSize="10" OnRowDataBound="grdView_RowDataBound">

                              <AlternatingRowStyle BackColor="#F7F7F7"/>
                            <Columns>
                                <asp:TemplateField HeaderText="SN" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                  <%--<asp:TemplateField HeaderText="Inv-Date"  HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("InvoiceDate","{0:dd/MM/yyyy}")%>                                       
                                    </ItemTemplate>
                                </asp:TemplateField>--%>


                                 <asp:TemplateField HeaderText="Pur.Invoice" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">

                                                    <ItemTemplate>
                                                        <asp:Label ID="lblComInvoice" runat="server" Text='<%#Eval("PurInvoiceNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    
                                                </asp:TemplateField>

                               
                                  <asp:TemplateField HeaderText="InvNo/Date" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">

                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInvoiceNo" runat="server" Text='<%#Eval("InvoiceNo") %>'></asp:Label> <br />
                                                         (<%#Eval("InvoiceDate","{0:dd/MM/yyyy}")%>)   
                                                    </ItemTemplate>
                                                    
                                                </asp:TemplateField>


                                          


                                                                                  

                                                <asp:TemplateField HeaderText="PartyName" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">

                                                    <ItemTemplate>
                                                        <asp:Label ID="lblParty_name" runat="server" Text='<%#Eval("Party_name") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    
                                                </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Company" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">

                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCompanyName" runat="server" Text='<%#Eval("CompanyName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    
                                                </asp:TemplateField>

                                 

                                             
                                                <asp:TemplateField HeaderText="Mobile" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblmobile_no" runat="server" Text='<%#Eval("mobile_no") %>' />
                                                    </ItemTemplate>                                                 
                                                </asp:TemplateField>                                            



                                                 <asp:TemplateField HeaderText="PaidAmount" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                    <ItemTemplate>
                                                      
                                                    <span><i class="fa fa-inr" aria-hidden="true"></i></span> <asp:Label ID="lblPaidAmount" runat="server" Text='<%#Eval("PaidAmount") %>' />
                                                    </ItemTemplate> 
                                                 </asp:TemplateField>


                                   <asp:TemplateField HeaderText="Dnld" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>           
                                        <asp:HiddenField ID="hdfInvFile" Value='<%#Eval("InvoiceFile")%>' runat="server" />
                                        <asp:Literal ID="ltrInvFile" runat="server"></asp:Literal>
                                                  
                                        <%--<a href="../../PurchaseInvoice/<%#Eval("InvoiceFile")%>" target="_blank"><asp:Image ID="Image1" runat="server" ImageUrl="../../images/Download.gif" /></a>--%>
                                       <%-- <img src="../../images/Download.gif" />--%>
                                         </ItemTemplate>
                                </asp:TemplateField>


                                              
                                                      
                                                     
                                             <asp:TemplateField HeaderText="Description" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDescription" runat="server" Text='<%#Eval("Description") %>' />
                                                    </ItemTemplate> 
                                               </asp:TemplateField>

                                
                                <asp:TemplateField HeaderText="Edit" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:HiddenField ID="hdfID" Value='<%#Eval("PurchaseId")%>' runat="server" />
                                        <asp:ImageButton ID="imgbtnUpdate" runat="server" ImageAlign="Middle" OnClick="Edit"
                                            ToolTip="Update" ImageUrl="../img/icon_edit.gif" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle" OnClick="Edit"
                                            ToolTip="Delete" ImageUrl="../img/icon_delete.gif" />
                                       
                                        <%--<asp:ConfirmButtonExtender ID="imgbtnactive_ConfirmButtonExtenderDelete" runat="server"
                                            TargetControlID="imgbtnDelete" ConfirmText="Are you sure you want to delete this record ?">
                                        </asp:ConfirmButtonExtender>--%>

                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>


                        </asp:GridView>
                        <uc1:PagingControl ID="CustPager" OnPageChanged="CustPager_PageChanged"  runat="server" />
                      
                    </div>
                    <!----------End----------->
                </div>
            </div>
        </div>
    </div><script src="../../js/jquery-1.12.4.js" type="text/javascript"></script>


</asp:Content>

