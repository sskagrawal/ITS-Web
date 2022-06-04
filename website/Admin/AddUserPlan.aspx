<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddUserPlan.aspx.cs" Inherits="Admin_AddUserPlan" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register src="PagingControl.ascx" tagname="PagingControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hdfImage" runat="server" />
        <asp:HiddenField ID="hdfID" runat="server" />
    <!--------------------START - Breadcrumbs-------------------->
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Add User Plan</a></li>
        <%-- <li class="breadcrumb-item">
  <span>Laptop with retina screen</span></li>--%>
    </ul>
    <!--------------------END - Breadcrumbs-------------------->
    <div class="content-i">
        <div class="content-box">
            <div class="row">
                <div class="col-lg-12">
                    <div class="element-wrapper">
                        <h6 class="element-header">
                            Add Update User Plan</h6>
                        <div class="element-box">
                            <h5 class="form-header">
                                Add Update User Plan</h5>
                            <%-- <div class="form-desc">Discharge best employed your phase each the of shine. Be met even reason consider logbook redesigns. Never a turned interfaces among asking</div>--%>
                          
                            
                              <div class="alert alert-success alert-dismissible fade show" visible="false" runat="server"
                                id="alert">
                                <button aria-label="Close" class="close" data-dismiss="alert" type="button">
                                    <span aria-hidden="true">×</span>
                                </button>
                                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                            </div>


                            <div class="row">
                                   <div class="col-lg-6"> 

                                          <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">
                                 Select Plan
                                </label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="drdPlan" CssClass="form-control" runat="server" AutoPostBack="true" 
                                        onselectedindexchanged="drdPlan_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="drdPlan"
                                        ErrorMessage="Please Select Plan" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator1" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
                                </div>
                            </div>


                              <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">
                                    Plan Amount</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtAmount" class="form-control" placeholder="Enter Plan Amount"
                                        runat="server"></asp:TextBox>                                  
                                </div>
                            </div>



                                         <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">
                                  Active Plan Date</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtActvDate" class="form-control" placeholder="Enter Active Plan Date" runat="server"></asp:TextBox>                                  
                                  <asp:CalendarExtender ID="calfromDate" runat="server" ClientIDMode="Static" TargetControlID="txtActvDate" Format="dd/MM/yyyy"></asp:CalendarExtender>
                                </div>
                            </div>



                                   </div>
                                 <div class="col-lg-6"> 

                                           <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">
                                    Select User</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="drdUser" CssClass="form-control" runat="server">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPoint"
                                        ErrorMessage="Please Select User" ForeColor="Red" SetFocusOnError="True"
                                        ValidationGroup="sv" Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator2" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
                                </div>
                            </div>


                                           <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">
                                    Plan Point</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtPoint" class="form-control" placeholder="Enter Plan Amount"
                                        runat="server"></asp:TextBox>                                  
                                </div>
                            </div>


                                          <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">
                                    Active Plan Expiry </label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtExpiry" class="form-control" placeholder="Enter Active Plan Expiry"
                                        runat="server"></asp:TextBox>     
                                         <asp:CalendarExtender ID="CalendarExtender1" runat="server" ClientIDMode="Static" TargetControlID="txtExpiry" Format="dd/MM/yyyy"></asp:CalendarExtender>                             
                                </div>
                            </div>


                                 </div>

                            </div>

                            
                         
                      
                          
                       
                          
                       
                        
                            <div class="form-buttons-w">
                                <asp:Button ID="btnSubmit" class="btn btn-primary" ValidationGroup="sv" 
                                    runat="server" Text="Submit" onclick="btnSubmit_Click"/>
                            </div>

                                 <br />



                           <div class="table-responsive">
                       



                        <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px"
                            EmptyDataText="Result Not Found" Width="100%" CssClass="table table-lightborder table-bordered table-hover"
                            PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false"
                            AllowPaging="true" PageSize="10" onrowdatabound="grdView_RowDataBound">
                         
                              <AlternatingRowStyle BackColor="#F7F7F7"/>
                               <Columns>
                                <asp:TemplateField HeaderText="SrNo.">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:TemplateField HeaderText="Name">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Name")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mobile No.">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("MobileNo")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Plan Name">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("PlanName")%>
                                    </ItemTemplate>
                                </asp:TemplateField> 
                                <asp:TemplateField HeaderText="Plan Point">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("PlanPoint")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Plan Amount">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("PlanAmount")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Plan Active Date">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("PlanActiveDate", "{0:dd-MMM-yyyy}")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Plan Exp Date">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("PlanExpDate", "{0:dd-MMM-yyyy}")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                    <asp:TemplateField HeaderText="Subscribe">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("CreateOn", "{0:dd-MMM-yyyy}")%>
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
                                    <asp:HiddenField ID="hdfStatus" Value='<%#Eval("Inactive")%>' runat="server" />
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
                     <%--   <uc1:PagingControl ID="CustPager" OnPageChanged="CustPager_PageChanged" runat="server" />--%>
                    </div>
                        </div>
                        
                    </div>

                    
                </div>
            </div>
        </div>
    </div>
</asp:Content>

