<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Service-List.aspx.cs" Inherits="Client_Panel_Service_List" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <asp:HiddenField ID="hdfUserID" runat="server"></asp:HiddenField>
     <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="Default.aspx">Client</a></li>
        <li class="breadcrumb-item"><a href="#">Service List</a></li>
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
                        Service List</h5>
                    
                    <!----------kishan-------->
                    <div class="table-responsive" style="overflow:auto;">
                        <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px" showfooter="true"  OnRowDataBound="grdView_RowDataBound"
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

                                 

                                  
                                   <asp:TemplateField HeaderText="Domain Name" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("DomainName")%>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                   <asp:TemplateField HeaderText="Service" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("CategoryName")%>
                                    </ItemTemplate>
                                </asp:TemplateField>


                               


                                    <asp:TemplateField HeaderText="Service Name" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("SubCategoryN")%>
                                    </ItemTemplate>

                                             <FooterTemplate>
                                                            Total Price:-
                                              </FooterTemplate>


                                </asp:TemplateField>



                                   <asp:TemplateField HeaderText="PurchasePrice" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                 
                                          <span> <i class="fa fa-inr"></i></span> <asp:Label ID="lblAmt" runat="server" Text='<%#Eval("PurchasePrice") %>'></asp:Label>
                                    </ItemTemplate>

                                         <FooterTemplate>
                                                           
                                        <span> <i class="fa fa-inr"></i></span> <asp:Label ID="lblPriceP" runat="server" Text=""></asp:Label>
                                        </FooterTemplate>


                                </asp:TemplateField>

                                   <asp:TemplateField HeaderText="NextRenewPrice" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <span> <i class="fa fa-inr"></i></span> <%#Eval("NextRenewPrice")%>
                                    </ItemTemplate>
                                </asp:TemplateField>             

                                
                                  

                                  <asp:TemplateField HeaderText="PurchaseDate" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("PurCahseDate","{0:dd/MM/yyyy}")%>
                                    </ItemTemplate>
                                </asp:TemplateField>  
                                  
                                  
                                    <asp:TemplateField HeaderText="Renew Date" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>

                                        <span class="value badge badge-pill badge-success" style="font-size:16px;">

                                        <%#Eval("NextReNewdate","{0:dd/MM/yyyy}")%>
                                            </span>
                                    </ItemTemplate>
                                </asp:TemplateField>     
                           
                                  

                             


                             
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

