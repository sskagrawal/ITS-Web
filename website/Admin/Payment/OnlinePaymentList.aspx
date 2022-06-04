<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="OnlinePaymentList.aspx.cs" Inherits="Admin_Payment_OnlinePaymentList" %>
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
                               
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="element-wrapper">
                                            <div class="element-box-tp">
                                                <div class="controls-above-table">
                                                    <div style="overflow: auto;">
                                                        <div class="table-responsive">
                                                            <asp:GridView ID="grdEmp" class="table table-bordered table-responsive table-hover"
                                                                runat="server" PagerSettings-Visible="false" AllowPaging="true"
                                                                PageSize="10" Width="100%">
                                                                
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

