<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="SaleVoucherList.aspx.cs" Inherits="Admin_Sale_SaleVoucherList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="../PagingControl.ascx" TagName="PagingControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <%--<style>

         #topheading {
             border:2px solid #B2AEE2;
             text-align:center;
             padding:15px;
             border-radius:30px;
             color:
            
             width:50%;margin:auto;
             font-family:'Satisfy', cursive;
             margin-bottom:10px;
        }


    </style>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Sale Invoice List</a></li>
        
    </ul>
    
    <div class="content-panel-toggler">
        <i class="os-icon os-icon-grid-squares-22"></i><span>Sidebar</span>
        
    </div>
    <div class="content-i">
        <div class="content-box">
            <div class="element-wrapper">
                 
                <h6 class="element-header">Sale Invoice List</h6>
              
                <div class="element-box">
                     <div style="float: right;">
                                        <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Back"   />
                                    </div>
                    <h5 class="form-header" id="topheading">Generated Sale Invoice List</h5>
                    <div class="controls-above-table">
                    </div>
                    <!----------kishan-------->
                    <div class="row">
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
                                        <asp:Button ID="btnSearch" class="btn btn-primary" runat="server" Text="Search" OnClick="btnSearch_Click" />
                                    </div>
                                </div>
                                <%--<button class="btn btn-primary" type="submit"> Submit</button>--%>
                            </div>
                        </div>
                    </div> <br />
                    <br />


                    <div class="table-responsive" style="overflow:auto;">
                        <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px"
                            EmptyDataText="Result Not Found" Width="100%" CssClass="table table-hover table-bordered table-condensed"
                            PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="true"
                            AllowPaging="true" PageSize="10" OnRowDataBound="grdView_RowDataBound">
                            <Columns>
                              <%--  <asp:TemplateField HeaderText="SNo." HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>

                                  <asp:TemplateField HeaderText="Inv Date" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("VoucherDate","{0:dd/MM/yyyy}")%>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="InvoiceNo" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("VoucherNo")%>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Party Detail" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <strong>Party Name : </strong><%#Eval("Party_name")%>(<%#Eval("UserTypeName")%>)<br />
                                        <strong>Address : </strong><%#Eval("PartyAddress")%><br />
                                        <strong>Email : </strong> <%#Eval("Email")%>
                                       
                                    </ItemTemplate>
                                </asp:TemplateField>
                              <%--  <asp:TemplateField HeaderText="Address" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email ID" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                       
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                             <%--  <asp:TemplateField HeaderText="Grand Total" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("GrandTotal")%>
                                    </ItemTemplate>
                                </asp:TemplateField>  --%>

                                  <asp:TemplateField HeaderText="Total Amount" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Total_Amount")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Deposit Amount" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("DepositAmt")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Due Amount" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <asp:Label ID="lblDueAmt" runat="server" Text='<%#Eval("DueAmt")%>'></asp:Label>
                                        
                                    </ItemTemplate>
                                </asp:TemplateField>
                              
                                <asp:TemplateField HeaderText="Status" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <asp:Literal ID="ltrStatus" runat="server"></asp:Literal>
                                    </ItemTemplate>
                                </asp:TemplateField>
                               <%-- <asp:TemplateField HeaderText="Payment">
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnStatus" runat="server" ImageAlign="Middle" OnClick="Edit"
                                            ToolTip="Change Status" ImageUrl="~/img/changeStatus.png" />
                                    </ItemTemplate>
                                </asp:TemplateField>--%>


                                    <asp:TemplateField HeaderText="Payment" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <ItemTemplate> 
                                                                    <asp:HiddenField ID="hdfPartyID" Value='<%#Eval("PartyID")%>' runat="server" />
                                                                    <asp:HiddenField ID="hdfVCID" Value='<%#Eval("VoucherMasterID")%>' runat="server" />

                                                                    <asp:LinkButton ID="lnkBtnPayNow" runat="server" OnClick="lnkBtnPayNow_Click1" CssClass="btn btn-success"><i class="fa fa-inr"></i> Pay Now</asp:LinkButton>
                                                                <%--    <asp:ImageButton ID="imgbtnPayment" runat="server" ImageAlign="Middle" OnClick="Edit"
                                                                        ToolTip="Payment" ImageUrl="~/Admin/img/rupay.png" />--%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>


                                <asp:TemplateField HeaderText="Edit/Delete" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:HiddenField ID="hdfStatus" Value='<%#Eval("PaymentStatus")%>' runat="server" />
                                        <asp:HiddenField ID="hdfVCHMST" Value='<%#Eval("VoucherMasterID")%>' runat="server" />
                                        <asp:ImageButton ID="imgbtnUpdate" runat="server" ImageAlign="Middle" OnClick="Edit"
                                            ToolTip="Edit" ImageUrl="~/admin/img/pensil.png" />
                                        <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle" OnClick="Edit"
                                            ToolTip="Delete" ImageUrl="~/admin/img/Delete_Record.png" />
                                        <asp:ConfirmButtonExtender ID="imgbtnactive_ConfirmButtonExtenderDelete" runat="server"
                                            TargetControlID="imgbtnDelete" ConfirmText="Are you sure you want to delete this record ?"></asp:ConfirmButtonExtender>
                                    </ItemTemplate>
                                </asp:TemplateField>
                              
                                  <asp:TemplateField HeaderText="Print Invoice" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnPrintInv" runat="server" ImageAlign="Middle" OnClick="imgbtnPrintInv_Click"
                                            ToolTip="Print Invoice" ImageUrl="~/Admin/img/Print_ICO.png" />
                                      
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <div style="text-align: center">
                            <uc1:PagingControl ID="CustPager" OnPageChanged="CustPager_PageChanged" runat="server" />
                            <%--   <uc1:PagingControl ID="PagingControl1" runat="server" />--%>
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

