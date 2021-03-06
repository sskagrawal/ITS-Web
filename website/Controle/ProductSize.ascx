<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProductSize.ascx.cs" Inherits="Controle_ProductSize" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Admin/PagingControl.ascx" TagName="PagingControl" TagPrefix="uc1" %>

  <div class="content-w">
        <!--------------------
                START - Breadcrumbs
                -------------------->
        <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item"><span>Size Manager</span></li>
         
        </ul>
        <!--------------------
                END - Breadcrumbs
                -------------------->
            <div class="content-panel-toggler"><i class="os-icon os-icon-grid-squares-22"></i><span>Sidebar</span></div><div class="content-i">
                <div class="content-box">
                    <div class="row">
                        <div class="col-sm-7">
                            <div class="element-wrapper">
                                <div class="element-box">

                                    <div class="alert alert-success" runat="server" id="divMsg" visible="false">

                                      <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                                   </div>

                                    <div id="formValidate">
                                        
                                        <h5 class="form-header">Add Update Size</h5>

                         <div class="form-group"><label for="">Category</label>
                             <asp:DropDownList ID="drdcategory" runat="server" class="form-control"></asp:DropDownList>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="drdcategory"
                                             Display="None" ErrorMessage="Enter Category" ForeColor="Red" SetFocusOnError="True" InitialValue="0"
                                            ValidationGroup="sv">*****</asp:RequiredFieldValidator>


                                           <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2"
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2" WarningIconImageUrl="img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>
                         


                         </div>

                        <div class="form-group"><label for="">Size</label>
                            <%--<input class="form-control" data-error="Your email address is invalid" placeholder="Enter email" required="required" type="email">--%>
                            <asp:TextBox ID="txtsize" runat="server" class="form-control" placeholder="Enter Size"  type="Category"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtsize"
                                             Display="None" ErrorMessage="Enter Size" ForeColor="Red" SetFocusOnError="True"
                                            ValidationGroup="sv">*****</asp:RequiredFieldValidator>


                                           <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1"
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1" WarningIconImageUrl="img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>

                        <div class="help-block form-text with-errors form-control-feedback"></div></div>

                                         
                        
                        
                        
                        
                        <div class="form-buttons-w"><%--<button class="btn btn-primary" type="submit"> Save</button>--%>
                             <asp:Button ID="Button2" runat="server" OnClick="btnSubmit_Click" ValidationGroup="sv" Text="Save" class="btn btn-primary" />&nbsp&nbsp

                                        <%--button class="btn btn-primary" type="submit">Reset</button>--%>
                                         <asp:Button ID="Button1" runat="server" Text="Reset" class="btn btn-primary" />
                        </div>

                                    </div>

                                    <hr class="h-50" />

                                    <h5 class="form-header">View Size</h5>

                                    <div>
                                <asp:HiddenField ID="hdfid" runat="server" />


                              <%--  <asp:GridView ID="grideViewCatogry" class="table table-bordered table-striped dataTable" runat="server" AutoGenerateColumns="false" PagerSettings-Visible="false" AllowPaging="true" PageSize="40">--%>
                                          <asp:GridView ID="grideViewCatogry" runat="server" AutoGenerateColumns="false" Font-Size="12px"
                            EmptyDataText="Result Not Found" Width="100%" CssClass="table table-lightborder table-bordered table-hover"
                            PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false"  AllowPaging="true" PageSize="10">
                                  
                                   <AlternatingRowStyle BackColor="#F7F7F7"/>

                                <Columns>
                                 
                    
                         <asp:TemplateField >
                          <HeaderTemplate>
                          SrNo.
                        
                        </HeaderTemplate>
                               <ItemTemplate>
                                  
                                 <asp:Label ID="Label2" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                               </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Category">
                               <ItemTemplate>
                              <asp:Label ID="lbltName1" runat="server" Text='<%#Eval("CategoryName")%>'></asp:Label>
                               </ItemTemplate>
                               </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Size">
                               <ItemTemplate>
                              <asp:Label ID="lbltName2" runat="server" Text='<%#Eval("Size_name")%>'></asp:Label>
                               </ItemTemplate>
                               </asp:TemplateField>

                               <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>

                                   <asp:ImageButton ID="imgbtnEdit" runat="server" ImageAlign="Middle" OnClick="imgbtnEdit_Click"  ToolTip="Edit" ImageUrl="../img/icon_edit.gif" /></button>
                            
                               </ItemTemplate>
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Delete">
                               <ItemTemplate>

                              

                                 <asp:HiddenField ID="hdf_ID"  runat="server" Value='<%#Eval("Sizemaster_id")%>' ></asp:HiddenField>

                              <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle" 
                                                    ToolTip="Delete" OnClick="Delete" ImageUrl="../img/icon_delete.gif"/>
                                 
                                 
                            
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
                                        <uc1:PagingControl ID="CustPager" runat="server" OnPageChanged="CustPager_PageChanged" />

							</div>

                                </div>
  
   
        
        
        
    
    <!--END - Projects Statistics--></div></div>




                        <div class="col-md-5">


                            <div class="element-box" >


    <div class="padded m-b">
        <div class="centered-header">
        <h6>Number of Size</h6>
        </div>
        <div class="row">
        <div class="col-12 ">
            <div class="el-tablo centered padded-v-big highlight bigger">
            <div class="label">Total</div>
            <div class="value">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></div></div></div>
      </div></div>
    


                            </div>

                        </div>

                        </div>

                            </div>

                        </div>
            </script><script src="../../js/jquery-1.12.4.js"></script>
                    </div>
                   