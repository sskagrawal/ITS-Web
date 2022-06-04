<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="RenewList.aspx.cs" Inherits="Admin_Sale_RenewList" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

   <%-- <style>

         #topheading {
             border:2px solid #B2AEE2;
             text-align:center;
             padding:15px;
             border-radius:30px;
             color:#fff;
             background-color:#B2AEE2;
             width:50%;margin:auto;
             font-family:'Satisfy', cursive;
             margin-bottom:10px;
        }


    </style>--%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Renew List</a></li>
        
    </ul>
    
    <div class="content-panel-toggler">
        <i class="os-icon os-icon-grid-squares-22"></i><span>Sidebar</span>
        
    </div>
    <div class="content-i">
        <div class="content-box">
            <div class="element-wrapper">
                 
                <h6 class="element-header">Renew List</h6>
              
                <div class="element-box">
                     <div style="float: right;">
                                        <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Back"   />
                                    </div>
                    <h5 class="form-header" id="topheading">Website,Domain,Hosting Renew List</h5>
                    <div class="controls-above-table">
                    </div>


                    <!----------kishan-------->
                    <div class="row" style="border:1px solid grey;padding:15px;border-radius:20px;">
                        <div class="col-md-12">
                            <div class="form-inline">
                                <div class="col-md-2" style="padding-bottom: 10px">
                                    <label class="sr-only">
                                        From Date</label>
                                    <asp:TextBox ID="txtFromdate" class="form-control" autocomplete="off" placeholder="Select From Date"
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
                                <div class="col-md-3" style="padding-bottom: 10px">
                                    <label class="sr-only">
                                        Search Type</label>
                                    <asp:DropDownList class="form-control mb-2 mr-sm-2 mb-sm-0" Width="100%" ID="drdSeacrchTP"
                                        runat="server">
                                        <asp:ListItem Text="Select Search Type" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Invoice No" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Name" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Mobile" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-3" style="padding-bottom: 10px">
                                    <label class="sr-only">
                                        Enter Value</label>
                                    <asp:TextBox ID="txtSearchValue" class="form-control mb-2 mr-sm-2 mb-sm-0" placeholder="Enter Search Value"
                                        runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <div style="float: right;">
                                        <%--<asp:Button ID="btnSearch" class="btn btn-primary" runat="server" Text="Search" OnClick="btnSearch_Click" />--%>
                                    </div>
                                </div>
                                <%--<button class="btn btn-primary" type="submit"> Submit</button>--%>
                            </div>
                        </div>
                    </div> <br /><br />






                    <div class="table-responsive" style="overflow:auto;">
                        <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px"
                            EmptyDataText="Result Not Found" Width="100%" CssClass="table table-hover table-bordered table-condensed"
                            PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="true"
                            OnRowDataBound="grdView_RowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="S No." HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                
                                                    <asp:TemplateField HeaderText="Service Name" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblItem_Amount" runat="server" Text='<%#Eval("CategoryName") %>' /><br />
                                                             <%#Eval("DomainName") %><%#Eval("SubCategoryN") %><br />


                                                        </ItemTemplate>

                                                    </asp:TemplateField>

                              

                                <asp:TemplateField HeaderText="Party Detail" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <strong>Party Name : </strong><%#Eval("Party_name")%><br />
                                        <strong>Address : </strong><%#Eval("address")%><br />
                                        <strong>Email : </strong> <%#Eval("Email")%><br />
                                        <strong>Mobile : </strong> <%#Eval("mobile_no")%>
                                       
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Registred Date" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">

                                                        <ItemTemplate>

                                                            <asp:Label ID="lblRegDate" runat="server" Text='<%#Eval("PurCahseDate", "{0:dd MMM yyyy}") %>' />
                                                        </ItemTemplate>

                                                    </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                          <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status") %>' />
                                        <%--<asp:HiddenField ID="hdfStatus" Value='<%#Eval("PaymentStatus")%>' runat="server" />--%>
                                        <%--<asp:Literal ID="ltrStatus" runat="server"></asp:Literal>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Renew Date" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">

                                                        <ItemTemplate>

                                                            <asp:Label ID="lblRenDate" runat="server" Text='<%#Eval("NextReNewdate", "{0:dd MMM yyyy}") %>' />
                                                        </ItemTemplate>

                                                    </asp:TemplateField>


                                <asp:TemplateField HeaderText="Days Untill Expiry" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                                           
                                        <asp:Label ID="lblExpiryDate" runat="server" Text='<%#getExpiryDays(Eval("SerID").ToString(),Eval("NextReNewdate").ToString()) %>'></asp:Label>
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
    <script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

