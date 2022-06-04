<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="HireEmployeeCalltoAction.aspx.cs" Inherits="Admin_HireEmployeeCalltoAction" %>
<%@ Register Src="~/Admin/PagingControl.ascx" TagName="PagingControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Call To Action List</a></li>
    </ul>
    <div class="content-panel-toggler">
        <i class="os-icon os-icon-grid-squares-22"></i><span>Sidebar</span>
    </div>
    <div class="content-i">
        <div class="content-box">
            <div class="element-wrapper">
                <h6 class="element-header">Call To Action List</h6>
                <div class="element-box">
                    <h5 class="form-header">Call To Action List</h5>
                    <div class="controls-above-table">
                    </div>
                  
                    <div class="table-responsive">
                        <div style="overflow: auto;">
                            
                            <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px"
                                EmptyDataText="Result Not Found" Width="100%" CssClass="table table-hover table-bordered table-condensed"
                                PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="true"
                                AllowPaging="true" PageSize="10">
                                <Columns>
                                    <asp:TemplateField HeaderText="S No.">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle />
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                  
                                    <asp:TemplateField HeaderText="Name">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle />
                                        <ItemTemplate>
                                            <%#Eval("Contact_person_name")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   
                                    <asp:TemplateField HeaderText="Mobile No">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle />
                                        <ItemTemplate>
                                            <%#Eval("mobile_no")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Clicked At">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle />
                                        <ItemTemplate>
                                            <%#Eval("MobileNo")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Clicked On">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle />
                                        <ItemTemplate>
                                            <%#Eval("AddedOn")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="IP Address">
                                         <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle />
                                        <ItemTemplate>
                                            <%#Eval("IpAddresss")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                  
                                </Columns>
                            </asp:GridView>
                            <div style="text-align: center">
                                <uc1:PagingControl ID="CustPager" OnPageChanged="CustPager_PageChanged" runat="server" />
                                
                            </div>
                        </div>
                    </div>
                    <!----------End----------->
                </div>
            </div>
        </div>
    </div>
    <script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

