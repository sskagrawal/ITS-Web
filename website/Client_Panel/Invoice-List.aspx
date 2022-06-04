<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Invoice-List.aspx.cs" Inherits="Client_Panel_Invoice_List" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <asp:HiddenField ID="hdfUserID" runat="server"></asp:HiddenField>
     <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="Default.aspx">Client</a></li>
        <li class="breadcrumb-item"><a href="#">Invoice List</a></li>
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
                        Invoice List</h5>
                    
                    <!----------kishan-------->
                    <div class="table-responsive" style="overflow:auto;">
                        <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px"
                            EmptyDataText="Result Not Found" Width="100%" CssClass="table table-hover table-bordered table-condensed"
                            PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="true">
                          
                            
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
                                       
                                             <asp:LinkButton ID="linkVoucherNo" runat="server"   OnClick="linkVouvher_Click"> <%#Eval("VoucherNo")%></asp:LinkButton>

                                    </ItemTemplate>
                                </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Invoice Date" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("VoucherDate","{0:dd/MM/yyyy}")%>
                                    </ItemTemplate>
                                </asp:TemplateField>     
                           


                               


                                  <%--  <asp:TemplateField HeaderText="Amount" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Amount")%>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>



                                 <%--  <asp:TemplateField HeaderText="Discount" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Discount")%>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>

                             <%--      <asp:TemplateField HeaderText="Total Amount" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Total_Amount")%>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>

                             <%--      <asp:TemplateField HeaderText="Due Amount" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("DueAmt")%>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>


                                    <asp:TemplateField HeaderText="Total" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                     <strong>Amount:</strong>    <%#Eval("Total_Amount")%> <br />
                                     <strong>GST Amt:</strong>    <%#Eval("gst_Amount")%> <br />
                                     <strong>Total  :</strong>  <i class="fa fa-inr"></i> <%#Eval("GrandTotal")%> 
                                        
                                     
                                       
                                    </ItemTemplate>
                                </asp:TemplateField>



                                   <asp:TemplateField HeaderText="Payment Status" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                       

                                           <span class="value badge badge-pill badge-danger" style="font-size:14px;">

                                      <%#Eval("PaymentStatus")%>
                                            </span>


                                    </ItemTemplate>
                                </asp:TemplateField>


                                  


                                 <asp:TemplateField HeaderText="View" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>                                  

                                              <asp:LinkButton Id="LinkButton1" OnClick="LinkButton1_Click" runat="server">Invoice</asp:LinkButton>
                                           <asp:HiddenField ID="hdfID" Value='<%#Eval("VoucherMasterID")%>' runat="server" />

                                    </ItemTemplate>
                                </asp:TemplateField>
                                  

                                <%--   <asp:TemplateField HeaderText="Payment" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                  <HeaderStyle HorizontalAlign="Center" />
                                     <ItemStyle HorizontalAlign="Center" />
                                      <ItemTemplate> 
                                
                                     <asp:HiddenField ID="hdfTrans_id" Value='<%#Eval("Trans_Id")%>' runat="server" />
                                      <asp:LinkButton ID="lnkBtnPayNow" runat="server" OnClick="lnkBtnPayNow_Click1" CssClass="btn btn-success"><i class="fa fa-inr"></i> Pay Now</asp:LinkButton>
                                                                
                                       </ItemTemplate>
                                     </asp:TemplateField>--%>

                             


                             
                            </Columns>
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

