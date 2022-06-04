<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="CvList.aspx.cs" Inherits="Admin_Job_CvList" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register src="../PagingControl.ascx" tagname="PagingControl" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Post CV List</a></li>
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
                    Post CV List</h6>
                <div class="element-box">
                    <h5 class="form-header">
                        Post CV List</h5>
                    <%--<div class="form-desc">You can put a table tag inside an <code>.element-box</code> class wrapper and add <code>.table</code> class to it to get something like this:</div>--%>
                    <div class="controls-above-table">
                        <div class="row">
                        </div>
                    </div>
                    <!----------Surendra-------->
                    
                 
                  
                       <div class="table-responsive">
                    <div class="row" style="border:1px solid grey;padding:20px;border-radius:20px;">
                        <%-- <span class="border border-info">--%>


                     
                        
                               

                                <div class="col-md-3">
                                    <label class="sr-only">
                                        Search</label>
                                    <asp:DropDownList class="form-control mb-2 mr-sm-2 mb-sm-0" Width="100%" ID="drdSearch"
                                        runat="server">
                                        <asp:ListItem   Value="Select Search" Selected="True"></asp:ListItem>
                                        <asp:ListItem  Value="Name">Name</asp:ListItem>
                                        <asp:ListItem  Value="MobileNo">Mobile</asp:ListItem>
                                       <%--  <asp:ListItem  Value="CompanyName">Apply For</asp:ListItem>--%>
                                        
                                    </asp:DropDownList>
                                </div>
                             
                                <div class="col-md-3" style="padding-bottom: 10px">
                                    <label class="sr-only">
                                        Enter Value</label>
                                    <asp:TextBox ID="txtSearchValue" class="form-control mb-2 mr-sm-2 mb-sm-0" placeholder="Enter Search Value"
                                        runat="server"></asp:TextBox>
                                </div>


                         <div class="col-md-2">
                                    <label class="sr-only">
                                        Job Apply Date</label>
                                    <asp:TextBox ID="txtApplydate" class="form-control mb-2 mr-sm-2 mb-sm-0" placeholder="Job Apply Date"
                                        runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="calfromdate" runat="server" ClientIDMode="Static" TargetControlID="txtApplydate"
                                        Format="MM/dd/yyyy"></asp:CalendarExtender>
                                </div>

                               <%-- <div class="col-md-2" style="padding-bottom: 10px">
                                    <label class="sr-only">
                                       Job Close Date</label>
                                    <asp:TextBox ID="txtClosedate" class="form-control mb-2 mr-sm-2 mb-sm-0" placeholder="Job Close Date"
                                        runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="calTodate" runat="server" ClientIDMode="Static" TargetControlID="txtClosedate"
                                        Format="MM/dd/yyyy"></asp:CalendarExtender>
                                </div>--%>



                                <div class="col-md-2" style="padding-bottom: 10px">
                                    <label class="sr-only">
                                        &nbsp;</label>
                                    <asp:Button ID="btnSearch" OnClick="btnSearch_Click" class="btn btn-primary" runat="server" Text="Search "  />
                                </div>
                              
                          
                     
                    </div>

                    </div>



                    <br />
                    <br />






                    <div class="table-responsive">
                        <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px"
                            EmptyDataText="Result Not Found" Width="100%" CssClass="table table-lightborder table-bordered table-hover"
                            PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false"
                            AllowPaging="true" PageSize="10">

                              <AlternatingRowStyle BackColor="#F7F7F7"/>
                            <Columns>
                                <asp:TemplateField HeaderText="S.No.">
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
                                 <asp:TemplateField HeaderText="MobileNo">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("MobileNo")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Apply For">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <asp:Label ID="lblJobDet" runat="server" Text='<%#GetJobDet(Eval("UserID"))%>'></asp:Label>
                                        
                                    </ItemTemplate>
                                </asp:TemplateField>
                               <%-- <asp:TemplateField HeaderText="job Description">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("job_Desc")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                               
                                <asp:TemplateField HeaderText="Qualification">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("job_Qulalification")%>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>

                                <asp:TemplateField HeaderText="ApplyDate">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("CrearteOn", "{0:dd-MMM-yyyy}")%>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                  <asp:TemplateField HeaderText="Resume">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                      <%--  <%#Eval("Createon", "{0:dd-MMM-yyyy}")%>--%>
                                        <a href="../../CV/<%#Eval("CvName")%>" target="_blank">Download</a>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Edit">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                      <%--  <%#Eval("Createon", "{0:dd-MMM-yyyy}")%>--%>
                                       
                                        <asp:HiddenField ID="hdf_Edit" runat="server"  Value='<%# Eval("UserID") %>' />
                                        <asp:ImageButton ID="img_Edit" runat="server" onClick="img_Edit_Click"  ImageUrl="~/img/pensil.png" />

                                    </ItemTemplate>
                                </asp:TemplateField>

                                <%--<asp:TemplateField HeaderText=" Close Date">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("jobClose_Date", "{0:dd-MMM-yyyy}")%>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                
                                <asp:TemplateField HeaderText="Edit">
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:HiddenField ID="hdfID" Value='<%#Eval("job_Id")%>' runat="server" />
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
                                </asp:TemplateField>--%>
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
                        <uc2:PagingControl ID="CustPager" OnPageChanged="CustPager_PageChanged" runat="server" />
                        <%--<uc1:PagingControl ID="CustPager" OnPageChanged="CustPager_PageChanged" runat="server" />--%>
                    </div>
                    <!----------End----------->
                </div>
            </div>
        </div>
    </div><script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

