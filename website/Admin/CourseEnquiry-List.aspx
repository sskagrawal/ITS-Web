<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="CourseEnquiry-List.aspx.cs" Inherits="Admin_CourseEnquiry_List" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Admin/PagingControl.ascx" TagName="PagingControl" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Course Enquiry List</a></li>
    </ul>
    <div class="content-panel-toggler">
        <i class="os-icon os-icon-grid-squares-22"></i><span>Sidebar</span>
    </div>
    <div class="content-i">
        <div class="content-box">
            <div class="element-wrapper">
                <h6 class="element-header">Course Enquiry List</h6>
                <div class="element-box">
                    <h5 class="form-header">Course Enquiry List</h5>
                    <div class="controls-above-table">
                    </div>
                    <!----------kishan-------->
                    <%--<div class="row">
                        <div class="col-md-12">
                            <div class="form-inline">
                                <div class="col-md-2" style="padding-bottom: 10px">
                                    <label class="sr-only">
                                        From Date</label>
                                    <asp:TextBox ID="txtFromdate" class="form-control mb-2 mr-sm-2 mb-sm-0" placeholder="Select From Date"
                                        runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="calfromdate" runat="server" ClientIDMode="Static" TargetControlID="txtFromdate"
                                        Format="yyyy-MM-dd"></asp:CalendarExtender>
                                </div>
                                <div class="col-md-2" style="padding-bottom: 10px">
                                    <label class="sr-only">
                                        To Date</label>
                                    <asp:TextBox ID="txtTodate" class="form-control mb-2 mr-sm-2 mb-sm-0" placeholder="Select To Date"
                                        runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="calTodate" runat="server" ClientIDMode="Static" TargetControlID="txtTodate"
                                        Format="yyyy-MM-dd"></asp:CalendarExtender>
                                </div>
                                <div class="col-md-2" style="padding-bottom: 10px">
                                    <label class="sr-only">
                                        Search Type</label>
                                    <asp:DropDownList class="form-control mb-2 mr-sm-2 mb-sm-0" Width="100%" ID="drdSeacrchTP"
                                        runat="server">
                                        <asp:ListItem Text="Select Search Type" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Name" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Mobile" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                              
                                <div class="col-md-2" style="padding-bottom: 10px">
                                    <label class="sr-only">
                                        Enter Value</label>
                                    <asp:TextBox ID="txtSearchValue" class="form-control mb-2 mr-sm-2 mb-sm-0" placeholder="Enter Search Value"
                                        runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-2" style="padding-bottom: 10px">
                                    <label class="sr-only">
                                        &nbsp;</label>
                                    <asp:Button ID="btnSearch" class="btn btn-primary" runat="server" Text="Search " OnClick="btnSearch_Click" />
                                </div>
                             
                            </div>
                        </div>
                    </div>--%>


                    <div class="table-responsive">
                        <div style="overflow:auto;">
                            
                            <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px"
                                EmptyDataText="Result Not Found" Width="100%" CssClass="table table-hover table-bordered table-condensed"
                                PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="true"
                                AllowPaging="true" PageSize="10">
                                <Columns>
                                    <asp:TemplateField HeaderText="SNo.">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle />
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="CourseName">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle />
                                        <ItemTemplate>
                                            <%#Eval("CourseName")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="WhoIs">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle />
                                        <ItemTemplate>
                                            <%#Eval("ApplicantStatus")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>   
     
    

                                    <asp:TemplateField HeaderText="FullName">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle />
                                        <ItemTemplate>
                                            <%#Eval("FullName")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="MobileNo">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle />
                                        <ItemTemplate>
                                            <%#Eval("MobileNo")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="EmailAddress">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle />
                                        <ItemTemplate>
                                            <%#Eval("EmailId")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CityName">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle />
                                        <ItemTemplate>
                                            <%#Eval("CityName")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                     <asp:TemplateField HeaderText="TrainingMode">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle />
                                        <ItemTemplate>
                                            <%#Eval("TrainingMode")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
 
                             <asp:TemplateField HeaderText="RegDate">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle />
                                        <ItemTemplate>
                                         
                                             (<%#Eval("CreatedOn","{0:dd/MM/yyyy}")%>)   
                                        </ItemTemplate>
                                    </asp:TemplateField>
   
   
                                  


                                  
                                    
                             
                                    <asp:TemplateField HeaderText="Delete">
                                        <HeaderStyle />
                                        <ItemStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                               <asp:HiddenField ID="hdfcorseEnId" Value='<%#Eval("CourseEnquiryId")%>' runat="server" />

                                            <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle" OnClick="Edit"
                                                ToolTip="Delete" ImageUrl="~/img/Delete_Record.png" />
                                            <asp:ConfirmButtonExtender ID="imgbtnactive_ConfirmButtonExtenderDelete" runat="server"
                                                TargetControlID="imgbtnDelete" ConfirmText="Are you sure you want to delete this record ?"></asp:ConfirmButtonExtender>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <div style="text-align: center"><uc1:PagingControl ID="CustPager" OnPageChanged="CustPager_PageChanged" runat="server" />
                                <%--<uc1:PagingControl ID="CustPager" OnPageChanged="CustPager_PageChanged" runat="server" />--%>
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

