<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddPlan.aspx.cs" Inherits="Admin_AddPoint" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hdfImage" runat="server" />
    <!--------------------START - Breadcrumbs-------------------->
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Plan</a></li>
        <%-- <li class="breadcrumb-item">
  <span>Laptop with retina screen</span></li>--%>
    </ul>
    <!--------------------END - Breadcrumbs-------------------->
    <div class="content-i">
        <div class="content-box">
            <div class="row">
                <div class="col-lg-8">
                    <div class="element-wrapper">
                        <h6 class="element-header">
                            Add Update Plan</h6>
                        <div class="element-box">
                            <h5 class="form-header">
                                Add Update Plan</h5>
                            <%-- <div class="form-desc">Discharge best employed your phase each the of shine. Be met even reason consider logbook redesigns. Never a turned interfaces among asking</div>--%>
                            <div class="alert alert-success alert-dismissible fade show" visible="false" runat="server"
                                id="alert">
                                <button aria-label="Close" class="close" data-dismiss="alert" type="button">
                                    <span aria-hidden="true">×</span>
                                </button>
                                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">
                               User Type
                                </label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="drdUserType" CssClass="form-control" runat="server">

                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPlanName"
                                        ErrorMessage="Please Enter Plan Name" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator1" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">
                                   Plan Name
                                </label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtPlanName" class="form-control" placeholder="Enter Plan Name" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPlanName"
                                        ErrorMessage="Please Enter Plan Name" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator1" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">
                                    Plan Point</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtPoint" class="form-control" placeholder="Enter Plan Point"
                                        runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPoint"
                                        ErrorMessage="Please Enter Plan Point" ForeColor="Red" SetFocusOnError="True"
                                        ValidationGroup="sv" Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator2" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
                                </div>
                            </div>
                             <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">
                                    Plan Amount</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtAmount" class="form-control" placeholder="Enter Plan Amount"
                                        runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAmount"
                                        ErrorMessage="Please Enter Plan Point" ForeColor="Red" SetFocusOnError="True"
                                        ValidationGroup="sv" Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator3" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
                                </div>
                            </div>
                            <asp:HiddenField ID="hdfID" runat="server" />
                            <div class="form-buttons-w">
                                <asp:Button ID="btnSubmit" class="btn btn-primary" ValidationGroup="sv" 
                                    runat="server" Text="submit" onclick="btnSubmit_Click"/>
                            </div>
                            <div class="col-md-12">
                            <br />
                    <div class="table-responsive">
                        <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px"
                            EmptyDataText="Result Not Found" Width="100%" CssClass="table table-lightborder table-bordered table-hover"
                            PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false"
                            AllowPaging="true" PageSize="10">
                            <Columns>
                                <asp:TemplateField HeaderText="S.No.">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                               <asp:TemplateField HeaderText="User Type">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("UserTypeName")%>
                                    </ItemTemplate>
                                </asp:TemplateField> 
                                 <asp:TemplateField HeaderText="Plan Name">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("PlanName")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Plan Amount">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("PlanPoint")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:TemplateField HeaderText="Plan Point">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("PlanAmount")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Edit">
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:HiddenField ID="hdfID" Value='<%#Eval("ID")%>' runat="server" />
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
                            </Columns>
                        </asp:GridView>
                    </div>
                    </div>
                        </div>
                        
                    </div>

                    
                </div>
            </div>
        </div>
    </div><script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

