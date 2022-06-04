<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true"
    CodeFile="JobSheekarList.aspx.cs" Inherits="BranchList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Admin/PagingControl.ascx" TagName="PagingControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Job Seekar List</a></li>
    </ul>
    <div class="content-panel-toggler">
        <i class="os-icon os-icon-grid-squares-22"></i><span>Sidebar</span>
    </div>
    <div class="content-i">
        <div class="content-box">
            <div class="element-wrapper">
                <h6 class="element-header">Job Seekar List</h6>
                <div class="element-box">
                    <h5 class="form-header">Job Seekar List</h5>
                    <div class="controls-above-table">
                    </div>
                    <!----------kishan-------->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-inline" style="border:1px solid grey;padding:20px;border-radius:20px;">
                                <div class="col-md-2" style="padding-bottom: 10px">
                                    <label class="sr-only">
                                        From Date</label>
                                    <asp:TextBox ID="txtFromdate" class="form-control mb-2 mr-sm-2 mb-sm-0" placeholder="Select From Date"
                                        runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="calfromdate" runat="server" ClientIDMode="Static" TargetControlID="txtFromdate"
                                        Format="yyyy-MM-dd"></asp:CalendarExtender>
                                </div>
                                 <div class="col-md-1"></div>
                                <div class="col-md-2" style="padding-bottom: 10px">
                                    <label class="sr-only">
                                        To Date</label>
                                    <asp:TextBox ID="txtTodate" class="form-control mb-2 mr-sm-2 mb-sm-0" placeholder="Select To Date"
                                        runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="calTodate" runat="server" ClientIDMode="Static" TargetControlID="txtTodate"
                                        Format="yyyy-MM-dd"></asp:CalendarExtender>
                                </div>
                                 <div class="col-md-1"></div>
                                <div class="col-md-2" style="padding-bottom: 10px">
                                    <label class="sr-only">
                                        Search Type</label>
                                    <asp:DropDownList class="form-control mb-2 mr-sm-2 mb-sm-0" Width="100%" ID="drdSeacrchTP"
                                        runat="server">
                                        <asp:ListItem Text="Select Search Type" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Contact_person_name" Value="1">Name</asp:ListItem>
                                        <asp:ListItem Text="mobile_no" Value="2">Mobile</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                
                                <div class="col-md-2" style="padding-bottom: 10px">
                                    <label class="sr-only">
                                        Enter Value</label>
                                    <asp:TextBox ID="txtSearchValue" class="form-control mb-2 mr-sm-2 mb-sm-0" placeholder="Enter Search Value"
                                        runat="server"></asp:TextBox>
                                </div>
                                 <div class="col-md-1"></div>
                                <div class="col-md-1" style="padding-bottom: 10px">
                                    <label class="sr-only">
                                        &nbsp;</label>
                                    <asp:Button ID="btnSearch" class="btn btn-primary" runat="server" Text="Search " OnClick="btnSearch_Click" />
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <div style="overflow:auto;">
                            <div class="form-inline justify-content-sm-end">
                                <asp:LinkButton ID="lnkBtnPrintExcel" runat="server" CssClass="btn btn-primary" OnClick="lnkBtnPrintExcel_Click">Export To Excel</asp:LinkButton>
                                </div>
                               <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px"
                                EmptyDataText="Result Not Found" Width="100%" CssClass="table table-hover table-bordered table-condensed"
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

                             

                                    <asp:TemplateField HeaderText="JobSeekerDetails">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle />
                                        <ItemTemplate>
                                            <span style="color:#0026ff;"> Name : </span>   <%#Eval("Contact_person_name")%> <br />
                                             <span style="color:#0026ff;">Email: </span>   <%#Eval("Email")%> <br />
                                             <span style="color:#0026ff;">Mob  : </span>   <%#Eval("mobile_no")%> 
                                        </ItemTemplate>
                                    </asp:TemplateField>


                              
                                  


                                  <%--  <asp:TemplateField HeaderText="JobSeekerLoginDetail">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle />
                                        <ItemTemplate>
                                           <span style="color:#0026ff;">UserId : </span>    <%#Eval("mobile_no")%> <br />
                                            <span style="color:#0026ff;">Pasword : </span> <%#Eval("PassWord")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>

                                          <asp:TemplateField HeaderText="Address">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle />
                                        <ItemTemplate>
                                            <%#Eval("Address")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Regi.Date">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle />
                                        <ItemTemplate>
                                            <%#Eval("Createon","{0:dd/MM/yyyy}")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                     <asp:TemplateField HeaderText="Apply For">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                            <%#Eval("job_Title")%>
                                        
                                       <%-- <asp:Label ID="lblJobDet" runat="server" Text='<%#GetJobDet(Eval("ID"))%>'></asp:Label>--%>
                                        
                                    </ItemTemplate>
                                </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Status">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle />
                                        <ItemTemplate>
                                            <asp:Literal ID="ltrStatus" runat="server"></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>



                                    <asp:TemplateField HeaderText="Change Status">
                                        <HeaderStyle />
                                        <ItemStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnStatus" runat="server" ImageAlign="Middle" OnClick="Edit"
                                                ToolTip="Change Status" ImageUrl="~/img/changeStatus.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Edit">
                                        <HeaderStyle />
                                        <ItemStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hdfStatus" Value='<%#Eval("Is_active")%>' runat="server" />
                                            <asp:HiddenField ID="hdfpartyID" Value='<%#Eval("PartyID")%>' runat="server" />
                                            <asp:ImageButton ID="imgbtnUpdate" runat="server" ImageAlign="Middle" OnClick="Edit"
                                                ToolTip="Update" ImageUrl="~/img/pensil.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Delete">
                                        <HeaderStyle />
                                        <ItemStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle" OnClick="Edit"
                                                ToolTip="Delete" ImageUrl="~/img/Delete_Record.png" />
                                            <asp:ConfirmButtonExtender ID="imgbtnactive_ConfirmButtonExtenderDelete" runat="server"
                                                TargetControlID="imgbtnDelete" ConfirmText="Are you sure you want to delete this record ?"></asp:ConfirmButtonExtender>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                   <asp:TemplateField HeaderText="SetOrder">
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                      
                                     <%--   <a class="badge badge-primary" href="#"><%#Eval("JobSeekerOrderPosition")%></a> <br /> <br />--%>
                                         <asp:HiddenField ID="hdfJobsikrOrderId" Value='<%#Eval("JobSeekerOrderPosition")%>' runat="server" />
                                        <asp:Label ID="lblJobSikrOrderId" class="badge badge-primary" runat="server" Text='<%#Eval("JobSeekerOrderPosition")%>'></asp:Label><br /> <br />



                                        <asp:ImageButton ID="imgbtnsetorder" runat="server" ImageAlign="Middle" OnClick="Edit"
                                            ToolTip="Update" ImageUrl="../img/plus-5-512.png" />
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
