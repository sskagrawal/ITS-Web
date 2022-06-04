<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Staff_list.aspx.cs" Inherits="Admin_Employee_Staff_list" EnableEventValidation="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Admin/PagingControl.ascx" TagName="PagingControl" TagPrefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
        <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Staff List</a></li>
    </ul>
    <!--------------------END - Breadcrumbs-------------------->
    <div class="content-panel-toggler">
        <i class="os-icon os-icon-grid-squares-22"></i><span>Sidebar</span>
    </div>
    <div class="content-i">
        <div class="content-box">
            <div class="element-wrapper">
                <h6 class="element-header">
                    Staff List</h6>
                <div class="element-box">
                    <asp:HiddenField ID="Hdfparty" runat="server" />
                           
                                            <div >
                                                <asp:Button ID="Button1"  runat="server" style="border-radius: 16px;float:right;" class="btn btn-primary" 
                                                    Text="Back" />
                                            </div>
                                           
                    <h5 class="form-header">
                        Staff List</h5>
                    <div class="controls-above-table">
                        <div class="row">

                            

                             <div class="col-lg-3">
                                       
                                            <div class="form-group" >
                                                <label>Search Type</label>
                            
                                <asp:DropDownList data-placeholder="Choose Party Type" runat="server" ID="ddlPartysearch" class="form-control" Style="width: 200px;">
                                    <asp:ListItem Value="0">Select Search Type</asp:ListItem>
                                    <asp:ListItem Value="UserName">Name</asp:ListItem>
                                    <asp:ListItem Value="MobileNo">Mobile-no</asp:ListItem>
                                   
                                </asp:DropDownList>
                                                </div>
                                         
                                    </div>
                           

                            <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="">
                                                Search
                                            </label>
                                          
                                            <asp:TextBox ID="txtsearch" placeholder="Search" runat="server" CssClass="form-control"></asp:TextBox>

                                        </div></div>

                             <div class="col-lg-3">
                                       
                                            <div class="form-group" >
                                                <label>Search By Active/Deactive</label>
                            
                                <asp:DropDownList data-placeholder="Choose Party Type" runat="server" ID="Drdactivesearch" class="form-control" OnSelectedIndexChanged="Drdactivesearch_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="-1">Select  </asp:ListItem>
                                    <asp:ListItem Value="1"  style="color:green;">Active</asp:ListItem>
                                    <asp:ListItem Value="0" style="color:red;">Deactive</asp:ListItem>
                                   
                                </asp:DropDownList>
                                                </div>
                                         
                                    </div>
                            

                            <div class="col-lg-2">       
                                            <div class="form-group">
                                                <asp:Button ID="btnbtnSave"  runat="server" style="margin-top: 31px;border-radius: 30px;" class="btn btn-primary" OnClick="btnbtnSave_Click"
                                                    Text="Search" />
                                            </div>
                                           </div>

                        </div>
                    </div>
                  
                    <div class="table-responsive">
                        <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px"
                            EmptyDataText="Result Not Found" Width="100%" CssClass="table table-lightborder table-bordered table-hover"
                            PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false"
                             AllowPaging="true" OnRowDataBound="grideViewCatogry_RowDataBound" PageSize="10">
                           
                              <AlternatingRowStyle BackColor="#F7F7F7"/>
                            
                              <Columns>
                                <asp:TemplateField HeaderText="S No.">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Login Detail">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                  <strong>Username-</strong><%#Eval("UserName")%><br /><strong>Password-</strong><%#Eval("PassWord")%> 
                                         
                                    </ItemTemplate>

                                </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Personal Detail">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                       <strong>Name-</strong><%#Eval("UserName")%><br /><strong>Mob-</strong><%#Eval("MobileNo")%><br /><strong>Email-ID-</strong><%#Eval("EmailID")%><br /><strong>Address-</strong><%#Eval("Address")%>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Joining Date">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Joining_Date")%> 
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Edit">
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnUpdate" runat="server" ImageAlign="Middle" OnClick="Edit"
                                            ToolTip="Update" ImageUrl="~/Admin/img/pensil.png" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Active/Deactive">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                <asp:HiddenField ID="hdfIsActive" runat="server" Value='<%#Eval("Is_active")%>' />
                                                 <asp:HiddenField ID="hdfID" Value='<%#Eval("ID")%>' runat="server" />
                                                <asp:ImageButton ID="imgbtnActive" runat="server" ImageAlign="Middle" 
                                                   OnClick="imgbtnActive_Click" ToolTip="Active"/>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Delete">
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnDelete" runat="server"  ImageAlign="Middle" OnClick="Edit"
                                            ToolTip="Delete" ImageUrl="~/Admin/img/Delete_Record.png" />
                                        <asp:ConfirmButtonExtender ID="imgbtnactive_ConfirmButtonExtenderDelete" runat="server"
                                            TargetControlID="imgbtnDelete" ConfirmText="Are you sure you want to delete this record ?">
                                        </asp:ConfirmButtonExtender>
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

                          <uc1:PagingControl ID="CustPager" OnPageChanged="CustPager_PageChanged" runat="server" />

                        <div style="text-align: center;">
                            
                            
                        </div>
                    </div>
                    <!----------End----------->
                </div>
            </div>
            
            
            
        </div>
        <!--------------------START - Sidebar-------------------->
        
        <!--------------------END - Sidebar-------------------->
    </div><script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

