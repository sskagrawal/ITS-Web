<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="My_Profile.aspx.cs" Inherits="myProfile" %>
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
    

     <div class="content-w">
        <!--------------------
                START - Breadcrumbs
                -------------------->
        <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
            <li class="breadcrumb-item"><a href="index.html">Products</a></li>
            <li class="breadcrumb-item"><span>Laptop with retina screen</span></li>
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
                                    <div id="formValidate"><h5 class="form-header">Add Update Campany Profile</h5>
                                        
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="alert alert-success alert-dismissible fade show" visible="false" runat="server" ID="divMsg">
 
 

     <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
 </div>
                                        <div class="row">
                                            
                                        <div class="col-sm-6">
                                             <div class="form-group"><label for="">Campany Name</label> 
                            
                            <%--<input class="form-control" data-error="Your email address is invalid" placeholder="Enter email" required="required" type="email">--%>
                              <asp:TextBox ID="txtcampny" runat="server" class="form-control" placeholder="Enter Campany Name"  type="Category"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtcampny"
                                             Display="None" ErrorMessage="Enter Category" ForeColor="Red" SetFocusOnError="True"
                                            ValidationGroup="sv">*****</asp:RequiredFieldValidator>


                       <div class="help-block form-text with-errors form-control-feedback"></div></div>

                                         <div class="form-group"><label for="">Owner Name</label>
                                             
                            <%--<input class="form-control" data-error="Your email address is invalid" placeholder="Enter email" required="required" type="email">--%>
                          <asp:TextBox ID="txtOwner" runat="server" class="form-control" placeholder="Enter Owner Name" type="Category"></asp:TextBox>
                        <div class="help-block form-text with-errors form-control-feedback"></div></div>

                                        <div class="form-group"><label for="">Contact-No</label>
                                            
                            <%--<input class="form-control" data-error="Your email address is invalid" placeholder="Enter email" required="required" type="email">--%>
                          <asp:TextBox ID="TxtContact" runat="server" class="form-control" placeholder="Enter Contact-No" type="Category"></asp:TextBox>
                        <div class="help-block form-text with-errors form-control-feedback"></div></div>


                                        <div class="form-group"><label for="">Email</label>
                                            
                            <%--<input class="form-control" data-error="Your email address is invalid" placeholder="Enter email" required="required" type="email">--%>
                          <asp:TextBox ID="TxtEmail" runat="server" class="form-control" placeholder="Enter Email" type="Category"></asp:TextBox>
                        <div class="help-block form-text with-errors form-control-feedback"></div></div>

                                        <div class="form-group"><label for="">Campany Gst No</label>
                                             
                            <%--<input class="form-control" data-error="Your email address is invalid" placeholder="Enter email" required="required" type="email">--%>
                          <asp:TextBox ID="Txtgstcmp" runat="server" class="form-control" placeholder="Enter Campany Gst" type="Category"></asp:TextBox>
                        <div class="help-block form-text with-errors form-control-feedback"></div></div>

                                        <div class="form-group"><label for="">Acc/No</label>
                                             
                            <%--<input class="form-control" data-error="Your email address is invalid" placeholder="Enter email" required="required" type="email">--%>
                          <asp:TextBox ID="Txtacc" runat="server" class="form-control" placeholder="Enter Account no" type="Category"></asp:TextBox>
                        <div class="help-block form-text with-errors form-control-feedback"></div></div>


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

                                            <div class="col-sm-6">
                                                
                            <asp:Image ID="imgVehicle" runat="server" Width="40%" Height="41%" BorderColor="#333333" 
                                    BorderStyle="Solid" BorderWidth="2px" EnableViewState="False" style="border-radius:25px;"
                                    ViewStateMode="Disabled" />
                                                <br />
                                                <br />

                                                 <asp:FileUpload ID="fuLogoImage" runat="server" onchange="showimagepreview(this)" />
                                    

                                            </div>

                                            <div class="col-lg-3">
                            <div class="form-group">
                             
                               
                                <asp:HiddenField ID="hdfLogoImg" runat="server" />
                                 
                                <br />
                            </div>
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

      
        </div>
    </div><script src="../../js/jquery-1.12.4.js"></script>

 
</asp:Content>

