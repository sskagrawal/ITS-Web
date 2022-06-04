<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="RecivedPaymentList.aspx.cs" Inherits="Admin_Payment_PaymentList" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Admin/PagingControl.ascx" TagName="PagingControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-i">
        <div class="content-box">
            <div class="row">
                <div class="col-lg-12">
                    <div class="element-wrapper">
                        <div class="element-box">
                            <div class="alert alert-danger alert-dismissible" id="DivMSG" runat="server" visible="false">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                                    ×</button>
                                <h4>
                                    <i class="icon fa fa-ban"></i>
                                    <asp:Label ID="lblMSG" runat="server" Text=""></asp:Label></h4>
                            </div>
                            <div>
                                <fieldset class="form-group">
                                    <legend><span>Search</span></legend>
                                    <div class="row">
                                    <div class="col-md-3">
                                            <label for="exampleInputEmail1">
                                                Select Option</label>
                                            <div class="form-group">
                                                <asp:DropDownList ID="drdmultisearch" CssClass="form-control" runat="server">
                                                   
                                                </asp:DropDownList>
                                            </div>
                                        </div>  
                                          <div class="col-md-3">
                                            <label for="exampleInputEmail1">
                                                Select Party</label>
                                            <div class="form-group">
                                                <asp:DropDownList ID="drdParty" CssClass="form-control" runat="server">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        
                                    
                                        <div class="col-md-3" style="padding-top: 24px">
                                            <div class="form-group">
                                                <asp:Button ID="btnbtnSave" OnClick="btnSave_Click" runat="server" class="btn btn-primary"
                                                    Text="Save" />
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="element-wrapper">
                                            <div class="element-box-tp">
                                                <div class="controls-above-table">
                                                    <div style="overflow: auto;">
                                                        <div class="table-responsive">
                                                            <asp:GridView ID="grdEmp" class="table table-bordered table-responsive table-hover"
                                                                runat="server" AutoGenerateColumns="false" PagerSettings-Visible="false" AllowPaging="true"
                                                                PageSize="10" OnRowDataBound="grdEmp_RowDataBound" Width="100%">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="sno." HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lbSN" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                      <asp:TemplateField HeaderText="Receipt No." HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                                        <ItemTemplate>
                                                              <%#Eval("RecipNo")%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Party Details" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                                        <ItemTemplate>
                                                                            <asp:HiddenField ID="hdfPartyID" runat="server" Value='<%#Eval("Party_Id")%>' />
                                                                            <asp:Label ID="lblParty" runat="server" Text='<%#Eval("Party_name")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                  
                                                                    <asp:TemplateField HeaderText="Total Amount" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblTamount" runat="server" Text='<%#Eval("Total_Amount")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    
                                                           <asp:TemplateField HeaderText="Received Amount" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                                        <ItemTemplate>
                                                                            <%#Eval("DepositAmt")%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Due amount" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDUAmt" runat="server" Text='<%#Eval("DueAmt")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                   <asp:TemplateField HeaderText="Discount Amount" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                                        <ItemTemplate>
                                                                         <%#Eval("DiscountAmount")%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    
                                                            <asp:TemplateField HeaderText="Date" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                                        <ItemTemplate>
                                                                            <%#Eval("Date", "{0:dd/MM/yyyy}")%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>   
                                                                    <%--
                                                                    <asp:TemplateField HeaderText="Payment" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="imgbtnPayment" runat="server" ImageAlign="Middle" OnClick="Edit"
                                                                                ToolTip="Payment" ImageUrl="~/img/rupay.png" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Vehicle" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="imgbtnVehicle" runat="server" ImageAlign="Middle" OnClick="Edit"
                                                                                ToolTip="Vehicle" ImageUrl="~/img/preview.png" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Driver" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="imgbtnDriver" runat="server" ImageAlign="Middle" OnClick="Edit"
                                                                                ToolTip="Driver" ImageUrl="~/img/preview.png" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>--%>
                                                                    <asp:TemplateField HeaderText="Print Receipt" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                                        <HeaderStyle />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                        <ItemTemplate>
                                                                         <asp:HiddenField ID="hdfPayMID" runat="server" Value='<%#Eval("Party_Id")%>' />
                                                                            <asp:HiddenField ID="hdfWorkTransID" runat="server" Value='<%#Eval("Trans_Id")%>' />
                                                                            <asp:HiddenField ID="hdfDueAmt" runat="server" Value='<%#Eval("DueAmt")%>' />
                                                                            <asp:ImageButton ID="imgbtnEdit" runat="server" ImageAlign="Middle" OnClick="Edit"
                                                                                ToolTip="Edit" ImageUrl="~/img/Print_ICO.png" />
                                                                            </button>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <%--<asp:TemplateField HeaderText="Delete" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle" OnClick="Edit"
                                                                                ToolTip="Delete Record" ImageUrl="~/img/Delete_Record.png" />
                                                                            <asp:ConfirmButtonExtender ID="imgbtnDelete_ConfirmButtonExtender1" runat="server"
                                                                                TargetControlID="imgbtnDelete" ConfirmText="Are you sure you want to delete this record ?">
                                                                            </asp:ConfirmButtonExtender>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>--%>
                                                                </Columns>
                                                            </asp:GridView>
                                                            <uc1:PagingControl ID="CustPager" runat="server" OnPageChanged="CustPager_PageChanged" />
                                                        </div>
                                                    </div>
                                                    <%--  </fieldset>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

