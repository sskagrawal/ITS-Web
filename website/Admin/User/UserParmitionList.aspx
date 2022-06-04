<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="UserParmitionList.aspx.cs" Inherits="Admin_User_UserParmitionList" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Admin/PagingControl.ascx" TagName="PagingControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">   <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
        <li class="breadcrumb-item"><a href="#">User List</a></li>
    </ul>
    <div class="content-panel-toggler">
        <i class="os-icon os-icon-grid-squares-22"></i><span>Sidebar</span>
    </div>
    <div class="content-i">
        <div class="content-box">
            <div class="element-wrapper">
                <h6 class="element-header">
                    User List</h6>
                <div class="element-box">
                    <h5 class="form-header">
                        User List</h5>
                    <div class="controls-above-table">
                    </div>
                    <!----------kishan-------->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-inline">
                                <div class="col-md-3" style="padding-bottom: 10px">
                                    <label class="sr-only">
                                        From Date</label>
                                    <asp:TextBox ID="txtFromdate" class="form-control mb-2 mr-sm-2 mb-sm-0" placeholder="Select From Date"
                                        runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="calfromdate" runat="server" ClientIDMode="Static" TargetControlID="txtFromdate"
                                        Format="yyyy-MM-dd"></asp:CalendarExtender>
                                </div>
                                <div class="col-md-3" style="padding-bottom: 10px">
                                    <label class="sr-only">
                                        To Date</label>
                                    <asp:TextBox ID="txtTodate" class="form-control mb-2 mr-sm-2 mb-sm-0" placeholder="Select To Date"
                                        runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="calTodate" runat="server" ClientIDMode="Static" TargetControlID="txtTodate"
                                        Format="yyyy-MM-dd"></asp:CalendarExtender>
                                </div>
                                <div class="col-md-3" style="padding-bottom: 10px">
                                    <label class="sr-only">
                                        Search Type</label>
                                    <asp:DropDownList class="form-control mb-2 mr-sm-2 mb-sm-0" Width="100%" ID="drdSeacrchTP"
                                        runat="server">
                                        <asp:ListItem Text="Select Search Type" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Name" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Mobile" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-3" style="padding-bottom: 10px">
                                    <label class="sr-only">
                                        Enter Value</label>
                                    <asp:TextBox ID="txtSearchValue" class="form-control mb-2 mr-sm-2 mb-sm-0" placeholder="Enter Search Value"
                                        runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-12">
                                    <div style="float: right;">
                                        <asp:Button ID="btnSearch" class="btn btn-primary" runat="server" Text="Submit" OnClick="btnSearch_Click" />
                                    </div>
                                </div>
                                <%--<button class="btn btn-primary" type="submit"> Submit</button>--%>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
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
                              
                                <asp:TemplateField HeaderText="User Role">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("User_Role")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:TemplateField HeaderText="Menu Name">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("MenuName")%>
                                    </ItemTemplate>
                                </asp:TemplateField> 
                                <asp:TemplateField HeaderText="Menu Url">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("MenuUrl")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Created Date">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Created_On","{0:dd/MM/yyyy}")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit">
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:HiddenField ID="hdfStatus" Value='<%#Eval("IsActive")%>' runat="server" />
                                        <asp:HiddenField ID="hdfBookingID" Value='<%#Eval("User_Permission_ID")%>' runat="server" />
                                        <asp:ImageButton ID="imgbtnUpdate" runat="server" ImageAlign="Middle" OnClick="Edit"
                                            ToolTip="Update" ImageUrl="~/Admin/img/pensil.png" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete">
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle" OnClick="Edit"
                                            ToolTip="Delete" ImageUrl="~/Admin/img/Delete_Record.png" />
                                        <asp:ConfirmButtonExtender ID="imgbtnactive_ConfirmButtonExtenderDelete" runat="server"
                                            TargetControlID="imgbtnDelete" ConfirmText="Are you sure you want to delete this record ?">
                                        </asp:ConfirmButtonExtender>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <div style="text-align: center">
                            <uc1:PagingControl ID="CustPager" OnPageChanged="CustPager_PageChanged" runat="server" />
                            <%--<uc1:pagingcontrol  ID="CustPager" OnPageChanged="CustPager_PageChanged" runat="server" />--%>
                        </div>
                    </div>
                    <!----------End----------->
                </div>
            </div>
        </div>
    </div>
    <script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

