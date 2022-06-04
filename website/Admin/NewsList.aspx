<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="NewsList.aspx.cs" Inherits="Admin_NewsList" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register src="PagingControl.ascx" tagname="PagingControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<ul class="breadcrumb">
<li class="breadcrumb-item">
<a href="Default.aspx">Home</a></li>
<li class="breadcrumb-item"><a href="#">Portfolio List</a></li>
<%--<li class="breadcrumb-item"><span>Laptop with retina screen</span></li>--%>
</ul>
<!--------------------END - Breadcrumbs-------------------->
<div class="content-panel-toggler">
<i class="os-icon os-icon-grid-squares-22"></i>
<span>Sidebar</span>
</div>
<div class="content-i">
<div class="content-box">
<div class="element-wrapper">
<h6 class="element-header">News List</h6>
<div class="element-box">
<h5 class="form-header">News List</h5>
<%--<div class="form-desc">You can put a table tag inside an <code>.element-box</code> class wrapper and add <code>.table</code> class to it to get something like this:</div>--%>
<div class="controls-above-table">
<div class="row">

</div>
</div>



<!----------kishan-------->
<div class="table-responsive">
<asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px" EmptyDataText="Result Not Found" Width="100%" CssClass="table table-lightborder table-bordered table-hover" PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false" AllowPaging="true" PageSize="10"><%----%>
                                    <Columns>
                                     
                                       
                                        <asp:TemplateField HeaderText="SrNo.">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>                                            
                                            </ItemTemplate>
                                        </asp:TemplateField>



                                          <asp:TemplateField HeaderText="NewsImage">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                           <img src='../News_Image/<%#Eval("News_Image")%>'  style="width:100px"/>
                                            
                                            </ItemTemplate>
                                        </asp:TemplateField>




                                           <asp:TemplateField HeaderText="News Title">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                             <%#Eval("News_Title")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>    
                                        
                                                                  
                                           
                                           <asp:TemplateField HeaderText="Description">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                            <%#Eval("News_Desc")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                     
                                           <asp:TemplateField HeaderText=" News Date">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>                                        

                                                <%#Eval("News_Date", "{0:dd-MMM-yyyy}")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                         

                                     
                                        
                                          <asp:TemplateField HeaderText="Edit">
                                            <HeaderStyle />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>

                                             <asp:HiddenField ID="hdfID" Value='<%#Eval("News_Id")%>' runat="server" />

                                                <asp:ImageButton ID="imgbtnUpdate" runat="server" ImageAlign="Middle" OnClick="Edit" ToolTip="Update" ImageUrl="~/Admin/img/pensil.png" />                                             
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                           <asp:TemplateField HeaderText="Delete">
                                            <HeaderStyle />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle" OnClick="Edit"
                                                    ToolTip="Delete" ImageUrl="~/Admin/img/Delete_Record.png" />
                                                <asp:ConfirmButtonExtender ID="imgbtnactive_ConfirmButtonExtenderDelete" runat="server" TargetControlID="imgbtnDelete"
                                                    ConfirmText="Are you sure you want to delete this record ?">
                                                </asp:ConfirmButtonExtender>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
    <center><uc1:PagingControl ID="CustPager" OnPageChanged="CustPager_PageChanged" runat="server" /></center>
    
</div>
<!----------End----------->
</div>
</div>
<%--<div class="element-wrapper">
<div class="element-box-tp">
<h5 class="form-header">Table without wrapper</h5>
<div class="form-desc">You can put a table tag inside an <code>.element-box-tp</code> class wrapper and add <code>.table</code> class to it to get something like this:</div><div class="element-box-tp">
<div class="controls-above-table">
<div class="row">
<div class="col-sm-6">
<a class="btn btn-sm btn-secondary" href="#">Download CSV</a>
<a class="btn btn-sm btn-secondary" href="#">Archive</a>
<a class="btn btn-sm btn-danger" href="#">Delete</a></div>
<div class="col-sm-6">
<form class="form-inline justify-content-sm-end">
<input class="form-control form-control-sm rounded bright" placeholder="Search" type="text">
<select class="form-control form-control-sm rounded bright">
<option selected="selected" value="">Select Status</option>
<option value="Pending">Pending</option>
<option value="Active">Active</option>
<option value="Cancelled">Cancelled</option>
</select>
</form>
</div>
</div>
</div>
<div class="table-responsive">
<table class="table table-bordered table-lg table-v2 table-striped">
<thead>
<tr>
<th class="text-center">
<input class="form-control" type="checkbox"></th>
<th>Customer Name</th>
<th>Country</th>
<th>Order Total</th>
<th>Referral</th>
<th>Status</th>
<th>Actions</th>
</tr>
</thead>
<tbody>
<tr>
<td class="text-center">
<input class="form-control" type="checkbox"></td>
<td>John Mayers</td>
<td><img alt="" src="img/flags-icons/us.png" width="25px"></td>
<td class="text-right">$245</td>
<td>Organic</td>
<td class="text-center"><div class="status-pill green" data-title="Complete" data-toggle="tooltip" data-original-title="" title=""></div></td>
<td class="row-actions">
<a href="#"><i class="os-icon os-icon-pencil-2"></i></a>
<a href="#"><i class="os-icon os-icon-link-3"></i></a>
<a class="danger" href="#"><i class="os-icon os-icon-database-remove"></i></a>
</td>
</tr>
<tr>
<td class="text-center"><input class="form-control" type="checkbox"></td>
<td>Mike Astone</td>
<td><img alt="" src="img/flags-icons/fr.png" width="25px"></td>
<td class="text-right">$154</td>
<td>Organic</td>
<td class="text-center"><div class="status-pill red" data-title="Cancelled" data-toggle="tooltip" data-original-title="" title=""></div>
</td>
<td class="row-actions"><a href="#"><i class="os-icon os-icon-pencil-2"></i></a>
<a href="#"><i class="os-icon os-icon-link-3"></i></a>
<a class="danger" href="#"><i class="os-icon os-icon-database-remove"></i>
</a>
</td>
</tr>
<tr>
<td class="text-center">
<input class="form-control" type="checkbox">
</td>
<td>Kira Knight</td>
<td><img alt="" src="img/flags-icons/us.png" width="25px"></td>
<td class="text-right">$23</td><td>Adwords</td>
<td class="text-center"><div class="status-pill green" data-title="Complete" data-toggle="tooltip" data-original-title="" title=""></div></td>
<td class="row-actions"><a href="#"><i class="os-icon os-icon-pencil-2"></i></a>
<a href="#"><i class="os-icon os-icon-link-3"></i></a>
<a class="danger" href="#"><i class="os-icon os-icon-database-remove"></i></a>
</td>
</tr>
<tr><td class="text-center"><input class="form-control" type="checkbox"></td>
<td>Jessica Bloom</td>
<td><img alt="" src="img/flags-icons/ca.png" width="25px"></td>
<td class="text-right">$112</td>
<td>Organic</td>
<td class="text-center">
<div class="status-pill green" data-title="Complete" data-toggle="tooltip" data-original-title="" title=""></div>
</td>
<td class="row-actions">
<a href="#"><i class="os-icon os-icon-pencil-2"></i></a>
<a href="#"><i class="os-icon os-icon-link-3"></i></a>
<a class="danger" href="#"><i class="os-icon os-icon-database-remove"></i></a>
</td>
</tr>
<tr>
<td class="text-center">
<input class="form-control" type="checkbox">
</td>
<td>Gary Lineker</td>
<td><img alt="" src="img/flags-icons/ca.png" width="25px"></td>
<td class="text-right">$64</td><td>Organic</td>
<td class="text-center"><div class="status-pill yellow" data-title="Pending" data-toggle="tooltip" data-original-title="" title=""></div></td>
<td class="row-actions"><a href="#"><i class="os-icon os-icon-pencil-2"></i></a>
<a href="#"><i class="os-icon os-icon-link-3"></i></a>
<a class="danger" href="#"><i class="os-icon os-icon-database-remove"></i></a>
</td>
</tr>
</tbody>
</table>
</div>
<div class="controls-below-table">
<div class="table-records-info">Showing records 1 - 5</div>
<div class="table-records-pages">
<ul>
<li>
<a href="#">Previous</a></li>
<li><a class="current" href="#">1</a></li>
<li><a href="#">2</a></li>
<li><a href="#">3</a></li>
<li><a href="#">4</a></li>
<li><a href="#">Next</a></li>
</ul>
</div>
</div>
</div>
</div>
</div>--%>
<%--<div class="element-wrapper">
<div class="element-box">
<h5 class="form-header">Table Striped</h5>
<div class="form-desc">You can add class <code>.table-striped</code> and <code>.table</code> to a table element to get striped table:</div>
<div class="table-responsive">
<table class="table table-striped">
<thead><tr><th>Customer Name</th>
<th>Orders</th><th>Location</th>
<th class="text-center">Status</th>
<th class="text-right">Order Total</th>
</tr>
</thead>
<tbody>
<tr>
<td>John Mayers</td>
<td>12</td>
<td><img alt="" src="img/flags-icons/us.png" width="25px"></td><td class="text-center">
<div class="status-pill green" data-title="Complete" data-toggle="tooltip" data-original-title="" title=""></div></td>
<td class="text-right">$354</td></tr>
<tr><td>Kelly Brans</td><td>45</td>
<td><img alt="" src="img/flags-icons/ca.png" width="25px"></td>
<td class="text-center"><div class="status-pill red" data-title="Cancelled" data-toggle="tooltip" data-original-title="" title=""></div>
</td>
<td class="text-right">$94</td>
</tr><tr><td>Tim Howard</td>
<td>112</td>
<td><img alt="" src="img/flags-icons/uk.png" width="25px"></td>
<td class="text-center">
<div class="status-pill green" data-title="Complete" data-toggle="tooltip" data-original-title="" title=""></div></td>
<td class="text-right">$156</td></tr>
<tr>
<td>Joe Trulli</td>
<td>1,256</td>
<td><img alt="" src="img/flags-icons/es.png" width="25px"></td>
<td class="text-center">
<div class="status-pill yellow" data-title="Pending" data-toggle="tooltip" data-original-title="" title=""></div>
</td>
<td class="text-right">$1,120</td>
</tr><tr>
<td>Fred Kolton</td>
<td>74</td>
<td><img alt="" src="img/flags-icons/fr.png" width="25px"></td>
<td class="text-center">
<div class="status-pill green" data-title="Complete" data-toggle="tooltip" data-original-title="" title="">
</div>
</td>
<td class="text-right">$74</td>
</tr>
</tbody>
</table>
</div>
</div>
</div>--%>
<%--<div class="element-wrapper">
<div class="element-box">
<h5 class="form-header">Bordered and Striped Table</h5>
<div class="form-desc">You can add class <code>.table-bordered</code>, <code>.table-striped</code> and <code>.table</code> to a table element to get striped table:</div>
<div class="table-responsive">
<table class="table table-striped table-bordered">
<thead>
<tr>
<th>Customer Name</th>
<th>Orders</th>
<th>Location</th>
<th class="text-center">Status</th>
<th class="text-right">Order Total</th>
</tr>
</thead>
<tbody>
<tr>
<td>John Mayers</td>
<td>12</td>
<td><img alt="" src="img/flags-icons/us.png" width="25px"></td>
<td class="text-center">
<div class="status-pill green" data-title="Complete" data-toggle="tooltip" data-original-title="" title=""></div>
</td><td class="text-right">$354</td></tr>
<tr><td>Kelly Brans</td><td>45</td>
<td>
<img alt="" src="img/flags-icons/ca.png" width="25px"></td>
<td class="text-center">
<div class="status-pill red" data-title="Cancelled" data-toggle="tooltip" data-original-title="" title=""></div>
</td>
<td class="text-right">$94</td>
</tr>
<tr>
<td>Tim Howard</td><td>112</td>
<td><img alt="" src="img/flags-icons/uk.png" width="25px"></td>
<td class="text-center"><div class="status-pill green" data-title="Complete" data-toggle="tooltip" data-original-title="" title=""></div>
</td>
<td class="text-right">$156</td>
</tr>
<tr>
<td>Joe Trulli</td>
<td>1,256</td>
<td><img alt="" src="img/flags-icons/es.png" width="25px"></td>
<td class="text-center">
<div class="status-pill yellow" data-title="Pending" data-toggle="tooltip" data-original-title="" title=""></div>
</td>
<td class="text-right">$1,120</td>
</tr>
<tr>
<td>Fred Kolton</td>
<td>74</td>
<td><img alt="" src="img/flags-icons/fr.png" width="25px"></td>
<td class="text-center">
<div class="status-pill green" data-title="Complete" data-toggle="tooltip" data-original-title="" title=""></div>
</td>
<td class="text-right">$74</td>
</tr>
</tbody>
</table>
</div>
</div>
</div>--%>

</div>
<!--------------------START - Sidebar-------------------->
<%--<div class="content-panel">
<div class="content-panel-close">
<i class="os-icon os-icon-close"></i>
</div>
<div class="element-wrapper">
<h6 class="element-header">Agents List</h6>
<div class="element-box-tp">
<div class="profile-tile">
<div class="profile-tile-box">
<div class="pt-avatar-w">
<img alt="" src="img/avatar1.jpg">
</div>
<div class="pt-user-name">Mark Parson</div>
</div>
<div class="profile-tile-meta">
<ul>
<li>Last Login:<strong>Online Now</strong></li>
<li>Tickets:<strong>12</strong></li>
<li>Response Time:<strong>2 hours</strong></li>
</ul>
<div class="pt-btn">
<a class="btn btn-success btn-sm" href="#">Send Message</a>
</div>
</div>
</div>
<div class="profile-tile">
<div class="profile-tile-box">
<div class="pt-avatar-w">
<img alt="" src="img/avatar3.jpg">
</div><div class="pt-user-name">Ken Morris</div>
</div>
<div class="profile-tile-meta">
<ul>
<li>Last Login:<strong>Online Now</strong></li>
<li>Tickets:<strong>8</strong></li>
<li>Response Time:<strong>4 hours</strong></li>
</ul>
<div class="pt-btn">
<a class="btn btn-success btn-sm" href="#">Send Message</a>
</div>
</div>
</div>
<div class="profile-tile">
<div class="profile-tile-box">
<div class="pt-avatar-w">
<img alt="" src="img/avatar2.jpg">
</div>
<div class="pt-user-name">John Newman</div>
</div><div class="profile-tile-meta">
<ul>
<li>Last Login:<strong>Online Now</strong></li>
<li>Tickets:<strong>14</strong></li>
<li>Response Time:<strong>1 hour</strong></li>
</ul>
<div class="pt-btn">
<a class="btn btn-danger btn-sm" href="#">Offline Now</a>
</div>
</div>
</div>
</div>
</div>
<div class="element-wrapper">
<h6 class="element-header">Side Tables</h6>
<div class="element-box">
<h5 class="form-header">Table in white box</h5>
<div class="form-desc">You can put a table tag inside an <code>.element-box</code> class wrapper and add <code>.table</code> class to it to get something like this:</div>
<div class="controls-above-table">
<div class="row">
<div class="col-sm-12">
<a class="btn btn-sm btn-primary" href="#">Download CSV</a>
<a class="btn btn-sm btn-danger" href="#">Delete</a>
</div>
</div>
</div>
<div class="table-responsive">
<table class="table table-lightborder">
<thead>
<tr>
<th>Customer</th>
<th class="text-center">Status</th>
</tr>
</thead>
<tbody>
<tr>
<td>John Mayers</td>
<td class="text-center">
<div class="status-pill green" data-title="Complete" data-toggle="tooltip" data-original-title="" title=""></div>
</td>
</tr>
<tr><td>Kelly Brans</td>
<td class="text-center">
<div class="status-pill red" data-title="Cancelled" data-toggle="tooltip" data-original-title="" title=""></div>
</td>
</tr>
<tr>
<td>Tim Howard</td>
<td class="text-center">
<div class="status-pill green" data-title="Complete" data-toggle="tooltip" data-original-title="" title=""></div>
</td>
</tr>
<tr>
<td>Joe Trulli</td>
<td class="text-center">
<div class="status-pill yellow" data-title="Pending" data-toggle="tooltip" data-original-title="" title=""></div>
</td>
</tr>
<tr>
<td>Fred Kolton</td>
<td class="text-center">
<div class="status-pill green" data-title="Complete" data-toggle="tooltip" data-original-title="" title=""></div>
</td>
</tr>
</tbody>
</table>
</div>
</div>
</div>
</div>--%>
<!--------------------END - Sidebar-------------------->
</div>
    <script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

