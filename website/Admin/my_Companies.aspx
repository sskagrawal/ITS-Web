<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="my_Companies.aspx.cs" Inherits="Admin_my_Companies" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript">
    function showimagepreview(input) {
        if (input.files && input.files[0]) {
            var filerdr = new FileReader();
            filerdr.onload = function (e) {
                $('#<%=imgVehicle.ClientID %>').attr('src', e.target.result);
            }
            filerdr.readAsDataURL(input.files[0]);
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hdfCompId" runat="server" />
    <div class="content-w">
        <!--------------------
                START - Breadcrumbs
                -------------------->
        <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
            <li class="breadcrumb-item"><a href="index.html">My Companies</a></li>
            
        </ul>
        <!--------------------
                END - Breadcrumbs
                -------------------->
            <div class="content-panel-toggler"><i class="os-icon os-icon-grid-squares-22"></i><span>Sidebar</span></div><div class="content-i">
                <div class="content-box">
                    <div class="row">
                        <div class="col-lg-12">
                             
                           
                                

                            <div class="element-wrapper">
                                <div class="element-box">



                                    <asp:HiddenField ID="hdfId" runat="server" />
                                    <asp:HiddenField id="hdfUserID" runat="server"></asp:HiddenField>
                                    <%--<div class="alert alert-success" runat="server" id="divMsg" visible="false">

                                      <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                                   </div>--%>
                                    <div id="formValidate"><h5 class="form-header">Add Update Campany Details</h5>
                                        
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="alert alert-success alert-dismissible fade show" visible="false" runat="server" ID="divMsg">
 
 

     <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
 </div>
                                                </div>
                                            </div>
                                        <div class="row">
                                            <div class="col-sm-3">
                                             <div class="form-group"><label for="">Is Company</label> 
                            
                                                 <asp:RadioButtonList ID="rblGstNonGst" runat="server" RepeatDirection="Horizontal">
                                                     <asp:ListItem Value="GST">GST</asp:ListItem>
                                                     <asp:ListItem Value="Non GST">Non GST</asp:ListItem>
                                                 </asp:RadioButtonList>


                       <div class="help-block form-text with-errors form-control-feedback"></div></div>

                                         </div>   
                                             
                                        <div class="col-sm-3">
                                             <div class="form-group"><label for="">Campany Name</label> 
                            
                            <%--<input class="form-control" data-error="Your email address is invalid" placeholder="Enter email" required="required" type="email">--%>
                              <asp:TextBox ID="txtcampny" runat="server" class="form-control" placeholder="Enter Campany Name"  type="Category"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtcampny"
                                             Display="None" ErrorMessage="Enter Category" ForeColor="Red" SetFocusOnError="True"
                                            ValidationGroup="sv">*****</asp:RequiredFieldValidator>


                       <div class="help-block form-text with-errors form-control-feedback"></div></div>

                                         </div>   
                                             <div class="col-sm-3">
                                         <div class="form-group"><label for="">Owner Name</label>
                                             
                            <%--<input class="form-control" data-error="Your email address is invalid" placeholder="Enter email" required="required" type="email">--%>
                          <asp:TextBox ID="txtOwner" runat="server" class="form-control" placeholder="Enter Owner Name" type="Category"></asp:TextBox>
                        <div class="help-block form-text with-errors form-control-feedback"></div></div>
                                      </div>      
                                              <div class="col-sm-3">

                                        <div class="form-group"><label for="">Contact-No</label>
                                            
                            <%--<input class="form-control" data-error="Your email address is invalid" placeholder="Enter email" required="required" type="email">--%>
                          <asp:TextBox ID="TxtContact" runat="server" class="form-control" placeholder="Enter Contact-No" type="Category"></asp:TextBox>
                        <div class="help-block form-text with-errors form-control-feedback"></div></div>
                                           
                                       </div>   
                                            <div class="col-sm-3">


                                        <div class="form-group"><label for="">Email</label>
                                            
                            <%--<input class="form-control" data-error="Your email address is invalid" placeholder="Enter email" required="required" type="email">--%>
                          <asp:TextBox ID="TxtEmail" runat="server" class="form-control" placeholder="Enter Email" type="Category"></asp:TextBox>
                        <div class="help-block form-text with-errors form-control-feedback"></div></div>

                                </div>          
                                              <div class="col-sm-3">

                                        <div class="form-group"><label for="">Campany Gst No</label>
                                             
                            <%--<input class="form-control" data-error="Your email address is invalid" placeholder="Enter email" required="required" type="email">--%>
                          <asp:TextBox ID="Txtgstcmp" runat="server" class="form-control" placeholder="Enter Campany Gst" type="Category"></asp:TextBox>
                        <div class="help-block form-text with-errors form-control-feedback"></div></div>

                                  </div>         
                                             <div class="col-sm-3">


                                         <div class="form-group"><label for="">Address</label>
                                              
                            <%--<input class="form-control" data-error="Your email address is invalid" placeholder="Enter email" required="required" type="email">--%>
                          <asp:TextBox ID="TxtAddress" runat="server" class="form-control" placeholder="Enter Address" type="Category"></asp:TextBox>
                        <div class="help-block form-text with-errors form-control-feedback"></div></div>
                        

                                            
                        <%-- <div class="form-group">
                    <label>Image Should be (Width=320 x Height=110) and Size should be (100 kb) </label>
                    </div>--%>
                    <%--<div class="col-lg-3">
                    <br />
                      <label>
                                Upload Image
                                </label>
                    </div>--%>

                                            </div>
                                            <div class="col-sm-3">

                                        <div class="form-group"><label for="">PinCode</label>
                                             
                            <%--<input class="form-control" data-error="Your email address is invalid" placeholder="Enter email" required="required" type="email">--%>
                          <asp:TextBox ID="txtPnCode" runat="server" class="form-control" placeholder="Enter Pincode" type="Category"></asp:TextBox>
                        <div class="help-block form-text with-errors form-control-feedback"></div></div>

                            </div>    

                                            <div class="col-sm-3">
                                               

                                                 <asp:FileUpload ID="fuLogoImage" runat="server" onchange="showimagepreview(this)" />
                                    

                                            </div>

                                            <div class="col-lg-3">
                            <div class="form-group">
                                 <asp:Image ID="imgVehicle" runat="server" Width="40%" Height="41%" BorderColor="#333333" 
                                    BorderStyle="Solid" BorderWidth="2px" EnableViewState="False" style="border-radius:25px;"
                                    ViewStateMode="Disabled" />
                               
                                <asp:HiddenField ID="hdfLogoImg" runat="server" />
                                 
                                <br />
                            </div>
                            </div>
                                            <div class="clearfix"></div>
                                           <div class="col-lg-12">
                                          <h5  class="form-header">Company Account Details</h5>
                                               </div>
                                            <div class="clearfix"></div><br />
                                                  <div class="col-lg-3">

                                        <div class="form-group"><label for="">Acc/No</label>
                                             
                            
                          <asp:TextBox ID="Txtacc" runat="server" class="form-control" placeholder="Enter Account no" type="Category"></asp:TextBox>
                        <div class="help-block form-text with-errors form-control-feedback"></div></div>

                            </div>   
                                                <div class="col-lg-3">

                                        <div class="form-group"><label for="">Bank Name</label>
                                             
                            
                          <asp:TextBox ID="txtBankName" runat="server" class="form-control" placeholder="Enter Bank Name" type="Category"></asp:TextBox>
                        <div class="help-block form-text with-errors form-control-feedback"></div></div>

                            </div>   
                                                <div class="col-lg-3">

                                        <div class="form-group"><label for="">Branch</label>
                                             
                            
                          <asp:TextBox ID="txtBranch" runat="server" class="form-control" placeholder="Enter Branch" type="Category"></asp:TextBox>
                        <div class="help-block form-text with-errors form-control-feedback"></div></div>

                            </div>   
                                                <div class="col-lg-3">

                                        <div class="form-group"><label for="">IFSC Code</label>
                                             
                            
                          <asp:TextBox ID="txtIfscCode" runat="server" class="form-control" placeholder="Enter IFSC Code" type="Category"></asp:TextBox>
                        <div class="help-block form-text with-errors form-control-feedback"></div></div>

                            </div>   
                                              <div class="col-lg-3">

                                        <div class="form-group"><label for="">Account Holder Name</label>
                                             
                            
                          <asp:TextBox ID="txtAccHolderName" runat="server" class="form-control" placeholder="Enter Account Holder Name" type="Category"></asp:TextBox>
                        <div class="help-block form-text with-errors form-control-feedback"></div></div>

                            </div>   

                                          
                                            
                                        </div>
                       
                         <div class="row">
                    
                      
                            
                                    <div class="col-lg-12">
                            <div class="form-group">
                                 <div class="form-buttons-w">
                                <asp:Button ID="btnSubmit" runat="server" ValidationGroup="sv" Text="Submit" class="btn btn-primary"   
                                   onclick="btnSubmit_Click"  />

                                       <asp:Button ID="Button3" runat="server" Text="Reset" class="btn btn-primary" />
                            </div>
                                </div>
                        </div>
                    </div>
                                        <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px" EmptyDataText="Result Not Found" Width="100%" CssClass="table table-lightborder table-bordered table-hover" PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false" AllowPaging="true" PageSize="10"><%----%>
                                 
      <AlternatingRowStyle BackColor="#F7F7F7"/>
    
       <Columns>
                                     
                                       
                                   

                                        <asp:TemplateField HeaderText="Company">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                             <%#Eval("CompanyName")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>    
                                        
                                                                  
                                           
                                           <asp:TemplateField HeaderText="Owner">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                            <%#Eval("OwnerName")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
              <asp:TemplateField HeaderText="Contact Detal">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                            <%#Eval("ContactNo")%><br />
                                                 <%#Eval("Email")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
           
              <asp:TemplateField HeaderText="Is GST">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                                 <%#Eval("IsGst")%><br />
                                            <%#Eval("GstNo")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
              <asp:TemplateField HeaderText="Address">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                            <%#Eval("CompAddr")%><br />
                                                <%#Eval("CompPinCode")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
              <asp:TemplateField HeaderText="Account Detal">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                            <strong>Acc No- </strong><%#Eval("AccNo")%><br />
                                                <strong>Bank Name- </strong><%#Eval("BankName")%><br />
                                                <strong>Branch- </strong><%#Eval("BranchName")%><br />
                                                <strong>IFSC code- </strong><%#Eval("IfscCode")%><br />
                                                <strong>Acc Holder- </strong><%#Eval("AccHolderName")%><br />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                         <asp:TemplateField HeaderText="Logo">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                           <img src='../companiesLogo/<%#Eval("CompLogo")%>' alt="" height="80" width="100" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                         

                                     
                                        
                                          <asp:TemplateField HeaderText="Edit">
                                            <HeaderStyle />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>

                                             <asp:HiddenField ID="hdfID" Value='<%#Eval("CompanyID")%>' runat="server" />

                                                <asp:ImageButton ID="imgbtnUpdate" runat="server" ImageAlign="Middle" OnClick="imgbtnUpdate_Click" ToolTip="Update" ImageUrl="~/Admin/img/pensil.png" />                                             
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                           <asp:TemplateField HeaderText="Delete">
                                            <HeaderStyle />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle" OnClick="imgbtnDelete_Click"
                                                    ToolTip="Delete" ImageUrl="~/Admin/img/Delete_Record.png" />
                                                <asp:ConfirmButtonExtender ID="imgbtnactive_ConfirmButtonExtenderDelete" runat="server" TargetControlID="imgbtnDelete"
                                                    ConfirmText="Are you sure you want to delete this record ?">
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
                        
                        </div></div>
                        
                      
                                        


                                    </div>
                                  
                                    
                                  

                                </div>
  
   
        
        
        
    
 

                        </div>

                            </div>

                        </div>

                    </div>
                    
                     <!--------------------
                    START - Chat Popup Box
                    -------------------->
                    <!--------------------
                    END - Chat Popup Box
                    -------------------->

                <!--------------------
                START - Sidebar
                -------------------->
                <!--------------------
                END - Sidebar
                -------------------->

      
       
    <script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

