<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    CodeFile="JobList.aspx.cs" Inherits="Admin_Upload_Job_List" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Job List</a></li>
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
                    Job List</h6>
                <div class="element-box">
                    <h5 class="form-header">
                        Job List</h5>
                    <%--<div class="form-desc">You can put a table tag inside an <code>.element-box</code> class wrapper and add <code>.table</code> class to it to get something like this:</div>--%>
                    <div class="controls-above-table">
                        <div class="row">
                        </div>
                    </div>
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
                                        <asp:Button ID="btnSearch" class="btn btn-primary" runat="server" Text="Search" OnClick="btnSearch_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!----------kishan-------->
                    <div class="table-responsive">
                        <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px"
                            EmptyDataText="Result Not Found" Width="100%" CssClass="table table-lightborder table-bordered table-hover"
                            PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false"
                            AllowPaging="true" PageSize="10">
                            <Columns>
                                <asp:TemplateField HeaderText="SrNo.">
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
                                        <%#Eval("Name")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mobile">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("MobileNo")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Send Date">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("CrearteOn", "{0:dd-MMM-yyyy}")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sectors">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("jobType")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Download CV">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <a href="../CV/<%#Eval("CvName")%>">Download</a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--<asp:TemplateField HeaderText=" Close Date">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>                                        

                                                <%#Eval("jobClose_Date", "{0:dd-MMM-yyyy}")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="job Fees">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                            <%#Eval("job_Fees")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="web Link">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                            <%#Eval("job_weblink")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>                                        
                                         <asp:TemplateField HeaderText="Edit">
                                            <HeaderStyle />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>

                                             <asp:HiddenField ID="hdfID" Value='<%#Eval("job_Id")%>' runat="server" />

                                                <asp:ImageButton ID="imgbtnUpdate" runat="server" ImageAlign="Middle" OnClick="Edit" ToolTip="Update" ImageUrl="~/Admin/img/pensil.png" />                                             
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
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
                    </div>
                    <!----------End----------->
                </div>
            </div>
        </div>
    </div>
</asp:Content>
