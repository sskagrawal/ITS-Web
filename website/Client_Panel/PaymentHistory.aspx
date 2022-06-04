<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="PaymentHistory.aspx.cs" Inherits="Client_Panel_PaymentHisoty" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <asp:HiddenField ID="hdfUserID" runat="server"></asp:HiddenField>
     <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="Default.aspx">Client</a></li>
        <li class="breadcrumb-item"><a href="#">Payment History</a></li>
    </ul>
    <!--------------------END - Breadcrumbs-------------------->
    <div class="content-panel-toggler">
        <i class="os-icon os-icon-grid-squares-22"></i><span>Sidebar</span>
    </div>
    <div class="content-i">
        <div class="content-box">
            <div class="element-wrapper">
               <%-- <h6 class="element-header">
                    Party List</h6>--%>
                <div class="element-box">
                    <asp:HiddenField ID="Hdfparty" runat="server" />
                    <asp:HiddenField ID="hdfmsgCode" runat="server" />
                    <asp:HiddenField ID="Hdfpartyname" runat="server" />
                           
                                         
                                           
                    <h5 class="form-header" id="topheading">
                        Payment History</h5>
                    
                    <!----------Surendra-------->
                    <div class="table-responsive" style="overflow:auto;">
                        <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px"
                            EmptyDataText="Result Not Found" Width="100%" CssClass="table table-hover table-bordered table-condensed"
                            PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="true">
                          
                            
                               <AlternatingRowStyle BackColor="#F7F7F7"/>
                              <Columns>
                                <asp:TemplateField HeaderText="SNo." HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate> 
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 

                                   <asp:TemplateField HeaderText="Invoice No" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Voucher_No")%>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                  
                                  <asp:TemplateField HeaderText="Payment Date" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Date","{0:dd/MM/yyyy}")%>
                                    </ItemTemplate>
                                </asp:TemplateField>     


                               
                                  


                               <%--   <asp:TemplateField HeaderText="Paid Amount" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>

                                     <span> <i class="fa fa-inr"></i> </span>    <%#Eval("DepositAmt")%>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>


                                  



                                   <asp:TemplateField HeaderText="Payment Mode" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("PaymentMode")%>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                   <asp:TemplateField HeaderText="Recipt No" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("RecipNo")%>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                   <asp:TemplateField HeaderText="Due Amount" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                       <span> <i class="fa fa-inr"></i> </span>  <%#Eval("DueAmt")%>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                 <asp:TemplateField HeaderText="Payment" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                  <HeaderStyle HorizontalAlign="Center" />
                                     <ItemStyle HorizontalAlign="Center" />
                                      <ItemTemplate> 
                                   <%--  <asp:HiddenField ID="hdfPartyID" Value='<%#Eval("PartyID")%>' runat="server" />--%>
                                     <asp:HiddenField ID="hdfTrans_id" Value='<%#Eval("Trans_Id")%>' runat="server" />
                                      <asp:LinkButton ID="lnkBtnPayNow" runat="server" OnClick="lnkBtnPayNow_Click1" CssClass="btn btn-success"><i class="fa fa-inr"></i> Pay Now</asp:LinkButton>
                                                                
                                       </ItemTemplate>
                                     </asp:TemplateField>




                           </Columns>

                            <FooterStyle BackColor="#B5C7DE" ForeColor="#2cabe3" />
                                            <HeaderStyle BackColor="#2cabe3" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <PagerSettings Visible="False"></PagerSettings>
                                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                            <SelectedRowStyle BackColor="#738A9C"  ForeColor="#F7F7F7" />
                                            <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                            <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                            <SortedDescendingHeaderStyle BackColor="#3E3277" /> 
                        </asp:GridView>
                       
                    </div>
                    <!----------End----------->
                </div>
            </div>
            
            
            
        </div>
        <!--------------------START - Sidebar-------------------->
        
        <!--------------------END - Sidebar-------------------->
    </div><script src="../../js/jquery-1.12.4.js"></script>

</asp:Content>

