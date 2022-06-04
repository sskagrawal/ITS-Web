<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Co-ordinator.aspx.cs" Inherits="Admin_Co_Ordinator" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="PagingControl.ascx" TagName="PagingControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


      <script>

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
    <asp:HiddenField ID="hdfpartyid" runat="server" />

      <div class="content-w">
                <!--------------------
START - Breadcrumbs
-------------------->
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                       <li class="breadcrumb-item"><a href="index.html">Admin</a></li>
                        <li class="breadcrumb-item"><span>Add Co- Ordinator</span></li>

                    </ul>
                <!--------------------
END - Breadcrumbs
-------------------->
                <div class="content-i">
                    <div class="content-box">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="element-wrapper">

                                 <%--   <h6 class="element-header">
                                        Default Form Layout</h6>--%>

                                    <div class="element-box">



                                         <div class="alert alert-success alert-dismissible fade show" visible="false" runat="server" ID="alert">
 <button aria-label="Close" class="close" data-dismiss="alert" type="button">
 <span aria-hidden="true"> ×</span>
 </button>
     <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
 </div>




                                        <div>
                                        <h5 class="form-header">
                                            Co-Ordinator Form</h5>
                                      <fieldset class="form-group">
                                            <legend><span>Basic details</span></legend>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label for="">
                                                            Full Name</label>

                                                         <div class="input-group">

                                                                 <div class="input-group-addon">
                                                                   <i class="fa fa-user" aria-hidden="true"></i>
                                                                </div>



                                                        <asp:TextBox ID="txtFullName" runat="server" class="form-control" placeholder="Full Name"></asp:TextBox>

                                                <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName"
                                            ErrorMessage="Enter Full Name"  ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>

                                             <asp:ValidatorCalloutExtender ID="VCECategoty" 
                                            runat="server" Enabled="True" TargetControlID="rfvFullName" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 


                                                             </div>
                                                    

                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label for="">
                                                            Mobile No.</label>

                                                           <div class="input-group">

                                                                 <div class="input-group-addon">
                                                                   <i class="fa fa-mobile" aria-hidden="true"></i>
                                                                </div>



                                                        <asp:TextBox ID="txtMobile" runat="server" class="form-control" placeholder="Mobile"></asp:TextBox>

                                                               
                                  <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile"
                                            Display="None" ErrorMessage="Enter Mobile " ForeColor="Red"
                                            SetFocusOnError="True" ValidationGroup="sv">*</asp:RequiredFieldValidator>

                                  <asp:ValidatorCalloutExtender ID="ValCalMobile"
                                 runat="server" Enabled="True" TargetControlID="rfvMobile" WarningIconImageUrl="~/img/wrning.gif">
                                  </asp:ValidatorCalloutExtender>

                                   
                                   
                                    <asp:RegularExpressionValidator ID="revMobileNumver" ClientIDMode="Static" runat="server" SetFocusOnError="true" ValidationGroup="sv"
                                         ControlToValidate="txtMobile" ErrorMessage="Enter Valid Mobile No" 
                                          ValidationExpression="[0-9]{10}" Display="None"></asp:RegularExpressionValidator>
   
                                   <asp:ValidatorCalloutExtender ID="ValCalMobile2"
                                 runat="server" Enabled="True" TargetControlID="revMobileNumver" WarningIconImageUrl="~/img/wrning.gif">
                                  </asp:ValidatorCalloutExtender>




                                                               </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group">

                                                       

                                                        <label for="">
                                                            Email</label>

                                                           <div class="input-group">

                                                                 <div class="input-group-addon">
                                                                   <i class="fa fa-envelope" aria-hidden="true"></i>
                                                                </div>

                                                            <asp:TextBox ID="txtemail" runat="server" class="form-control" placeholder="Email"></asp:TextBox>
                                                     

                                                                 <asp:RegularExpressionValidator ID="revEmail" runat="server" ClientIDMode="Static"
                            SetFocusOnError="true" ControlToValidate="txtemail" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                            ErrorMessage="Please Enter Valid Email Address" ValidationGroup="sv" Display="None"></asp:RegularExpressionValidator>

                            <asp:ValidatorCalloutExtender ID="ValCalEmailAddress" runat="server" Enabled="True"
                            TargetControlID="revEmail" WarningIconImageUrl="~/img/wrning.gif">
                         </asp:ValidatorCalloutExtender>



                                                               </div>

                                                    </div>
                                                </div>


                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label for="">
                                                            Password</label>
                                                        
                                                        <div class="input-group">
                                                                <div class="input-group-addon">
                                                                   <i class="fa fa-key" aria-hidden="true"></i>
                                                                </div>
                                                                 <asp:TextBox ID="txtPSWD" TextMode="Password" runat="server" class="form-control" placeholder="Enter Password"></asp:TextBox>
                                                        
                                                        </div>

                                                    </div>
                                                </div>




                                            </div>
                                            <div class="form-group">
                                                <label for="">
                                                   Co-Ordinator Photo</label> <br />
                                                
                                               <asp:FileUpload ID="fuPhoto" runat="server" onchange="showimagepreview(this)"/>
                         <div id="UplFromComp" style="padding:10px;">


                        <asp:HiddenField ID="hdfStdImage" runat="server" />
                                       
                         <asp:Image ID="imgVehicle"   runat="server" Width="150px" Height="100px" BorderColor="#333333"
                                                            BorderStyle="Solid" BorderWidth="2px" EnableViewState="False" ViewStateMode="Disabled" />
                                                                                                                                   
                           
                             
                             
                             
                              </div> 
                                             <p class="help-block alert-success" style="width:180px;" >Image Size:(200px X 150px)</p>





                                            </div>
                                        </fieldset>

                                      


                                        <div class="form-buttons-w">
                                           <%-- <button class="btn btn-primary" type="submit">
                                                Submit</button></div>--%>

                                            <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" ValidationGroup="sv" class="btn btn-primary" runat="server" Text="Submit" />


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

