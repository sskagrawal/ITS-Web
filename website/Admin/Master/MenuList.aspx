<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="MenuList.aspx.cs" Inherits="MenuList" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register src="~/Admin/PagingControl.ascx" tagname="PagingControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hdfBranchId" runat="server" />
<ul class="breadcrumb">
<li class="breadcrumb-item">
<a href="Default.aspx">Home</a></li>
<li class="breadcrumb-item"><a href="#">Menu List</a></li>
</ul>
<div class="content-panel-toggler">
<i class="os-icon os-icon-grid-squares-22"></i>
<span>Sidebar</span>
</div>
<div class="content-i">
<div class="content-box">
<div class="element-wrapper">
<h6 class="element-header">Menu List</h6>
<div class="element-box">
<h5 class="form-header">Menu List</h5>
<div class="controls-above-table">
</div>

<!----------kishan-------->
<div class="row">
<%--<div class="col-md-12">
<div class="form-inline">


    <div class="input-group mb-2 mr-sm-2 mb-sm-0 col-md-3">
    <asp:DropDownList ID="drdSearchType" Width="100%" CssClass="form-control" runat="server">
    <asp:ListItem Text="Select Search Type" Value="0"></asp:ListItem>
     <asp:ListItem Text="Mobile No." Value="1"></asp:ListItem>
      <asp:ListItem Text="Customer Name" Value="2"></asp:ListItem>
      <asp:ListItem Text="Delar Name" Value="4"></asp:ListItem>
       <asp:ListItem Text="Product Name" Value="3"></asp:ListItem>
    </asp:DropDownList>
    </div>
<label class="sr-only"> Enter Search Value</label>
    <asp:TextBox ID="txtSearch" class="form-control mb-2 mr-sm-2 mb-sm-0" placeholder="Enter Search Value" runat="server"></asp:TextBox>
<asp:Button ID="btnSearch" class="btn btn-primary"  runat="server" Text="Search" onclick="btnSearch_Click" />


</div>
</div>--%>
</div>
<div class="col-md-12" style="padding-top:10px;">
<div class="table-responsive">
    
<asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" 
        Font-Size="12px" EmptyDataText="Result Not Found" Width="100%" 
        CssClass="table table-hover table-bordered table-condensed" 
        PagerSettings-Visible="false" AllowPaging="true" PageSize="10" 
        onrowdatabound="grdView_RowDataBound">
                                    <Columns>
                                     
                                       
                                        <asp:TemplateField HeaderText="S No.">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>                                            
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

                                          <asp:TemplateField HeaderText="Status">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                                <asp:Literal ID="ltrStatus" runat="server"></asp:Literal>
                                                <asp:HiddenField ID="hdfStatus" Value='<%#Eval("IsActive")%>' runat="server" />           
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Change Status">
                                            <HeaderStyle />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                                                                 
                                                <asp:ImageButton ID="imgbtnStatus" runat="server" ImageAlign="Middle" OnClick="Edit" ToolTip="Change Status" ImageUrl="~/img/changeStatus.png" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                          <asp:TemplateField HeaderText="Edit">
                                            <HeaderStyle />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:HiddenField ID="hdfMenuID" Value='<%#Eval("MenuID")%>' runat="server" />                                                     
                                                <asp:ImageButton ID="imgbtnUpdate" runat="server" ImageAlign="Middle" OnClick="Edit" ToolTip="Update" ImageUrl="~/img/pensil.png" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                           <asp:TemplateField HeaderText="Delete">
                                            <HeaderStyle />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                               <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle" OnClick="Edit"
                                                    ToolTip="Delete" ImageUrl="~/img/Delete_Record.png" />
                                                <asp:ConfirmButtonExtender ID="imgbtnactive_ConfirmButtonExtenderDelete" runat="server" TargetControlID="imgbtnDelete"
                                                    ConfirmText="Are you sure you want to delete this record ?">
                                                </asp:ConfirmButtonExtender>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>

                                <uc1:PagingControl ID="CustPager" runat="server" OnPageChanged="CustPager_PageChanged" />
</div>
</div>
<!----------End----------->
</div>
</div>




</div>

</div>
<script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

