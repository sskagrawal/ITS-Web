<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    CodeFile="Upload_Job_List.aspx.cs" Inherits="Admin_Upload_Job_List" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register src="../PagingControl.ascx" tagname="PagingControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Post Job List</a></li>
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
                    Post Job List</h6>
                <div class="element-box">
                    <h5 class="form-header">
                        Post Job List</h5>
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
                                        <asp:ListItem  Value="Mobile">Mobile</asp:ListItem>
                                         <asp:ListItem  Value="CompanyName">Company</asp:ListItem>
                                         <asp:ListItem  Value="job_Title">Job Title</asp:ListItem>
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
                                        Job Open Date</label>
                                    <asp:TextBox ID="txtOpendate" class="form-control mb-2 mr-sm-2 mb-sm-0" placeholder="Job Open Date"
                                        runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="calfromdate" runat="server" ClientIDMode="Static" TargetControlID="txtOpendate"
                                        Format="MM/dd/yyyy"></asp:CalendarExtender>
                                </div>

                                <div class="col-md-2" style="padding-bottom: 10px">
                                    <label class="sr-only">
                                       Job Close Date</label>
                                    <asp:TextBox ID="txtClosedate" class="form-control mb-2 mr-sm-2 mb-sm-0" placeholder="Job Close Date"
                                        runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="calTodate" runat="server" ClientIDMode="Static" TargetControlID="txtClosedate"
                                        Format="MM/dd/yyyy"></asp:CalendarExtender>
                                </div>



                                <div class="col-md-2" style="padding-bottom: 10px">
                                    <label class="sr-only">
                                        &nbsp;</label>
                                    <asp:Button ID="btnSearch" OnClick="btnSearch_Click" class="btn btn-primary" runat="server" Text="Search "  />
                                </div>
                              
                          
                     
                    </div>

                    </div>



                    <br />
                    <br />


                    


                    <div class="table-responsive" style="overflow-x:scroll;">

                        <asp:GridView ID="grdView" runat="server"  AutoGenerateColumns="false" Font-Size="12px"
                            EmptyDataText="Result Not Found" Width="100%" CssClass="table full-color-table full-info-table hover-table"
                            PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false"
                            AllowPaging="true" PageSize="10" OnRowDataBound="grdView_RowDataBound">

                              <AlternatingRowStyle BackColor="#F7F7F7"/>
                            <Columns>
                                <asp:TemplateField HeaderText="SN.">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                               
                                 <asp:TemplateField HeaderText="Company">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Party_name")%>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="ContactPerson">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Contact_person_name")%> <br />
                                             <%#Eval("mobile_no")%>
                                    </ItemTemplate>
                                </asp:TemplateField>

                              


                             


                                <asp:TemplateField HeaderText="JobTitle">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                     <span style="color:#0026ff;">Job Title: </span>   <%#Eval("job_Title")%> <br />
                                     <span style="color:#0026ff;">Description: </span> <%#Eval("job_Desc")%><br />
                                     <span style="color:#0026ff;">Qualification: </span>   <%#Eval("job_Qulalification")%> <br />

                                    </ItemTemplate>
                                </asp:TemplateField>


                              <%--  <asp:TemplateField HeaderText="Description">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("job_Desc")%>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>


                              <%--  <asp:TemplateField HeaderText="Qualification">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("job_Qulalification")%>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>

                                <asp:TemplateField HeaderText="Open/CloseDate">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                     <%#Eval("jobopen_Date", "{0:dd-MMM-yyyy}")%> <br />
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
                                </asp:TemplateField>



                                  <asp:TemplateField HeaderText="SetOrder">
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                       
                                        <asp:HiddenField ID="hdfOrderId" Value='<%#Eval("OrderPosition")%>' runat="server" />


                                        <asp:Label ID="lblOrderId" class="badge badge-primary" runat="server" Text='<%#Eval("OrderPosition")%>'></asp:Label><br /> <br />
                                     <%--   <label class="badge badge-primary" id="lblOrderId"  runat="server" visible="false"><%#Eval("OrderPosition")%></label> <br /> <br />--%>
                                      
                                        <asp:ImageButton ID="imgbtnsetorder" runat="server" ImageAlign="Middle" OnClick="Edit"
                                            ToolTip="Update" ImageUrl="../img/plus-5-512.png" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                             
                               

                            </Columns>

                           <%--   <FooterStyle BackColor="#B5C7DE" ForeColor="#2cabe3" />
                                            <HeaderStyle BackColor="#2cabe3" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <PagerSettings Visible="False"></PagerSettings>
                                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                            <SelectedRowStyle BackColor="#738A9C"  ForeColor="#F7F7F7" />
                                            <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                            <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                            <SortedDescendingHeaderStyle BackColor="#3E3277" />  --%>

                        </asp:GridView>
                        <uc1:PagingControl ID="CustPager" OnPageChanged="CustPager_PageChanged"  runat="server" />
                        <%--<uc2:PagingControl ID="CustPager" OnPageChanged="CustPager_PageChanged" runat="server" />--%>
                        <%--<uc1:PagingControl ID="CustPager" OnPageChanged="CustPager_PageChanged" runat="server" />--%>
                    </div>
                    <!----------End----------->
                </div>
            </div>
        </div>
    </div><script src="../../js/jquery-1.12.4.js" type="text/javascript"></script>
</asp:Content>
