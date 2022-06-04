<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Sale-Invoice-List.aspx.cs" Inherits="Admin_Sale_Sale_Invoice_List" EnableEventValidation="false" %>
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

    
   <%-- <asp:HiddenField ID="hdfVMID" runat="server" />--%>

      <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Sale Invoice List</a></li>
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
                    Sale Invoice List</h6>
                <div class="element-box">


                      <h5 class="form-header">
                        Generated Sale Invoice  List</h5>
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

                             <div class="col-lg-3">

                                    <div class="form-group">
                                            <label for="">
                                               Select Company
                                            </label>
                                   <asp:DropDownList ID="ddlCompany" class="form-control mb-2 mr-sm-2 mb-sm-0" runat="server">
                                      
                                   </asp:DropDownList>

                                   </div>   </div>
                            

                            <div class="col-lg-3">       
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


                                 <asp:TemplateField HeaderText="InvoiceDate"  HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("VoucherDate","{0:dd/MM/yyyy}")%>                                       
                                    </ItemTemplate>
                                </asp:TemplateField>

                               
                                  <asp:TemplateField HeaderText="InvoiceNo" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">

                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInvoiceNo" runat="server" Text='<%#Eval("VoucherNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    
                                                </asp:TemplateField>
                                                                                  

                                                <asp:TemplateField HeaderText="Party_name" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">

                                                    <ItemTemplate>
                                                        <asp:Label ID="lblParty_name" runat="server" Text='<%#Eval("Party_name") %>'></asp:Label> <br />
                                                       <%--  <asp:Label ID="lblmobile_no" runat="server" Text='<%#Eval("mobile_no") %>' />--%>
                                                    </ItemTemplate>
                                                    
                                                </asp:TemplateField>


                                             
                                                                                     



                                                 <asp:TemplateField HeaderText="InvoiceAmt" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                    <ItemTemplate>
                                                      
                                                    <span><i class="fa fa-inr" aria-hidden="true"></i></span> <asp:Label ID="lblPurchasePrice" runat="server" Text='<%#Eval("GrandTotal") %>' />
                                                    </ItemTemplate> 
                                                 </asp:TemplateField>

                                            



                                                   <asp:TemplateField HeaderText="Description" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                    <ItemTemplate>

                                                         <asp:HiddenField ID="hdfVMId" Value='<%#Eval("VoucherMasterID")%>' runat="server" />
                                                        
                                                        
                                                        <asp:Literal ID="ltrServices" runat="server"></asp:Literal>
                                                            <%--<div> <asp:Label ID="lblCategoryName" Class="text-dark" runat="server" Text=''></asp:Label> <span>-</span><asp:Label ID="lblSubCategory" runat="server" Text=''></asp:Label> <span>-</span><asp:Label ID="lblDomainName" runat="server" Text=''></asp:Label></div> --%>

                                                      
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

