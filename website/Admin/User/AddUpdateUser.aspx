<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddUpdateUser.aspx.cs" Inherits="Admin_AddUpdateUser" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hdfImage" runat="server" />
    <asp:HiddenField id="hdfResume" runat="server"></asp:HiddenField>

    <asp:HiddenField ID="hdfPageName" runat="server" />

  <!--------------------START - Breadcrumbs-------------------->
  <ul class="breadcrumb">
  <li class="breadcrumb-item"><a href="#">Home</a></li>
  <li class="breadcrumb-item"><a href="#">User</a></li>
 <%-- <li class="breadcrumb-item">
  <span>Laptop with retina screen</span></li>--%>
  </ul>
  <!--------------------END - Breadcrumbs-------------------->
  <div class="content-i">
  <div class="content-box">
  <div class="row">
  
  <div class="col-lg-6">
  <div class="element-wrapper">
  <h6 class="element-header">Add Update User</h6>
  <div class="element-box">

  <h5 class="form-header">Add Update User</h5>
 <%-- <div class="form-desc">Discharge best employed your phase each the of shine. Be met even reason consider logbook redesigns. Never a turned interfaces among asking</div>--%>
   <div class="alert alert-success alert-dismissible fade show" visible="false" runat="server" ID="alert" style="padding:10px;">
 <button aria-label="Close" class="close" data-dismiss="alert" type="button">
 <span aria-hidden="true"> ×</span>
 </button>
     <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
 </div>
 <div class="form-group row">

  <label class="col-form-label col-sm-4" for="">User Type</label>
  <div class="col-sm-8">
   
      <asp:DropDownList ID="drdUserType" CssClass="form-control" runat="server" autoPostBack="true"  OnSelectedIndexChanged="OnSelectedIndexChanged" >
      <asp:ListItem Text="Select User Type " Value="0"></asp:ListItem> 
      </asp:DropDownList>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="drdUserType"
                                        ErrorMessage="Please Select User Type" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator4" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
  </div>

  </div> 
   <%--    <div class="form-group row">

  <label class="col-form-label col-sm-4" for="">User Role</label>
  <div class="col-sm-8">
   
      <asp:DropDownList ID="drdUserRole" CssClass="form-control" runat="server">
      <asp:ListItem Text="Select User Role " Value="0"></asp:ListItem> 
      </asp:DropDownList>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="drdUserRole"
                                        ErrorMessage="Please Select User Type" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator7" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
  </div>

  </div> --%>
  <div class="form-group row">

  <label class="col-form-label col-sm-4" for="">Name </label>
  <div class="col-sm-8">
       <asp:TextBox ID="txtName" class="form-control" placeholder="Enter the Name" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                                        ErrorMessage="Please Enter Name" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="Required1" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator4" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
  </div>

  </div>

  <div class="form-group row"><label class="col-form-label col-sm-4" for="">Mobile No.</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtMob" class="form-control" placeholder="Enter  Mobile No." runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMob"
                                        ErrorMessage="Please Enter Mobile" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="Required2" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator2" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
  </div>
  </div>

  <div class="form-group row"><label class="col-form-label col-sm-4" for="">Email ID</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtEmailID" class="form-control" placeholder="Enter Email ID" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmailID"
                                        ErrorMessage="Please Enter Email-ID" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="Required3" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator3" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
  </div>
  </div>

    <div class="form-group row"><label class="col-form-label col-sm-4" for="">Gendar</label>
  <div class="col-sm-8">
      <asp:RadioButtonList ID="rbtGendar" runat="server" RepeatDirection="Horizontal">
      <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
      </asp:RadioButtonList>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="rbtGendar"
                                        ErrorMessage="Please Select Gendar" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="Required4" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator5" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
     
  </div>
  </div>

  <div class="form-group row"><label class="col-form-label col-sm-4" for="">Password</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtPSWD"  class="form-control" placeholder="Enter Password" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPSWD"
                                        ErrorMessage="Please Enter Password" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="Required7" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator6" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
  </div>
  </div>

      <div class="form-group row"><label class="col-form-label col-sm-4" for="">Confirm Password</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtConfirm_Password"  class="form-control" placeholder="Enter Password" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPSWD"
                                        ErrorMessage="Please Enter Confirm Password" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator6" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
  </div>
  </div>
  
       

       <div class="form-group row" id="di_company" runat="server" visible="false" ><label class="col-form-label col-sm-4" for="">Company Name</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtCompanyname" class="form-control" placeholder="Enter company name" runat="server"></asp:TextBox>

  </div>
  </div> 

      <div class="form-group row" id="di_website" runat="server" visible="false"><label class="col-form-label col-sm-4" for="">Website</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtWebsite"  class="form-control" placeholder="Enter  website" runat="server"></asp:TextBox>

  </div>
  </div>

      <div class="form-group row" id="di_jobTitle" runat="server" visible="false"><label class="col-form-label col-sm-4" for="">Job Title</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtjobTitle"  class="form-control" placeholder="Enter Job Title" runat="server"></asp:TextBox>

  </div>
          </div>
           <div class="form-group row" id="di_experience" runat="server" visible="false"><label class="col-form-label col-sm-4" for="">Job Experience</label>
  <div class="col-sm-8">
     <asp:DropDownList ID="drd_Experience" CssClass="form-control" runat="server" autoPostBack="true"  >
      <asp:ListItem Text="Select Experience " Value="0"></asp:ListItem> 
            <asp:ListItem Text="0-1 " Value="1"></asp:ListItem> 
            <asp:ListItem Text="1-2 " Value="2"></asp:ListItem> 
            <asp:ListItem Text="2-5 " Value="3"></asp:ListItem> 
            <asp:ListItem Text=" 10 " Value="4"></asp:ListItem> 
      </asp:DropDownList>

  </div>
          </div>
                <div class="form-group row" id="di_salary" runat="server" visible="false"><label class="col-form-label col-sm-4" for="">Salary</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtsalary"  class="form-control" placeholder="Enter The Salary" runat="server"></asp:TextBox>

  </div>

  </div>

                <div class="form-group row" id="di_qualification" runat="server" visible="false"><label class="col-form-label col-sm-4" for="">Qualification</label>
  <div class="col-sm-8">
      <asp:DropDownList ID="drd_Qualification" CssClass="form-control" runat="server" autoPostBack="true"  >
      <asp:ListItem Text="Select qualification " Value="0"></asp:ListItem> 
            <asp:ListItem Text="MCA" Value="1"></asp:ListItem> 
            <asp:ListItem Text="MBA " Value="2"></asp:ListItem> 
            <asp:ListItem Text="BE " Value="3"></asp:ListItem> 
            <asp:ListItem Text="BCA " Value="4"></asp:ListItem> 
      </asp:DropDownList>

  </div>
                    </div>

                      <div class="form-group row" id="di_Other_education" runat="server" visible="false"><label class="col-form-label col-sm-4" for="">Other Education</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txt_education"  class="form-control" placeholder="Enter The Other Education" runat="server"></asp:TextBox>

  </div>

  </div>

       <div class="form-group row" id="di_JobType" runat="server" visible="false"><label class="col-form-label col-sm-4" for="">Job Type</label>
  <div class="col-sm-8">


       <asp:DropDownList ID="drd_JobType" CssClass="form-control" runat="server" autoPostBack="true"  >
      <asp:ListItem Text="Select User Type " Value="0"></asp:ListItem> 
            <asp:ListItem Text="Contract Base " Value="1"></asp:ListItem> 
            <asp:ListItem Text="Freelancer " Value="2"></asp:ListItem> 
            <asp:ListItem Text="Full Time " Value="3"></asp:ListItem> 
            <asp:ListItem Text="Part Time " Value="4"></asp:ListItem> 
      </asp:DropDownList>


      

  </div>

  </div>

      <div class="form-group row" id="di_resume" runat="server" visible="false"><label class="col-form-label col-sm-4" for="">Upload Resume</label>
  <div class="col-sm-8">
     <asp:FileUpload id="fup_Resume" runat="server"></asp:FileUpload>\

      <asp:Label ID="lblresume" runat="server" visible="false"></asp:Label>

  </div>
  </div>

       <div class="form-group row" id="di_applyfor" runat="server" visible="false"><label class="col-form-label col-sm-4" for="">Apply For</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtApplyFor"  class="form-control" placeholder="Apply For" runat="server"></asp:TextBox>

  </div>
  </div>

        
  <div class="form-group row" id="di_address" runat="server" visible="true"><label class="col-form-label col-sm-4" for="">Address</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtAddress" TextMode="MultiLine" class="form-control" placeholder="Enter  Address" runat="server"></asp:TextBox>

  </div>
  </div>

       <div class="form-group row" id="di_landmark" runat="server" visible="false"><label class="col-form-label col-sm-4" for="">Landmark</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtLandMark" class="form-control" placeholder="Enter  The Landmark" runat="server"></asp:TextBox>

  </div>
  </div>   
      <div class="form-group row" id="di_country" runat="server" visible="false"><label class="col-form-label col-sm-4" for="">Country</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtCountry" class="form-control" placeholder="Enter The Country" runat="server"></asp:TextBox>
  </div>
  </div>    

       <div class="form-group row" id="di_state" runat="server" visible="false"><label class="col-form-label col-sm-4" for="">State</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtState" class="form-control" placeholder="Enter  The State" runat="server"></asp:TextBox>

  </div>
  </div>   
      <div class="form-group row" id="di_city" runat="server" visible="false"><label class="col-form-label col-sm-4" for="">City</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtCity" class="form-control" placeholder="Enter The City" runat="server"></asp:TextBox>
  </div>
  </div>    

      <div class="form-group row" id="di_zipcode" runat="server" visible="false"><label class="col-form-label col-sm-4" for="">Zipcode</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtZipcode" class="form-control" placeholder="Enter The Zipcode" runat="server"></asp:TextBox>
  </div>
  </div>   
      
      
      <div class="form-group row" id="di_jdate" runat="server" visible="false"><label class="col-form-label col-sm-4" for="">Joining Date</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtJdate" class="form-control" placeholder="Enter Joining Date" runat="server"></asp:TextBox>


       <asp:CalendarExtender ID="dal_date" runat="server" ClientIDMode="Static" TargetControlID="txtJdate" Format="dd/MM/yyyy">
                                            </asp:CalendarExtender>
  </div>
  </div>   

        <div class="form-group row" id="di_uploadImage" runat="server" visible="false"><label class="col-form-label col-sm-4" for="">Profile</label>
  <div class="col-sm-8">
      <asp:FileUpload ID="UploadImage" runat="server" />

       </div>
  </div>    



      <div class="form-group row" id="di_bankDetails" runat="server" visible="false"><label class="col-form-label col-sm-4" for="">Bank Details</label>
  <div class="col-sm-8">
       </div>
  </div>    


       <div class="form-group row" id="di_bankName" runat="server" visible="false"><label class="col-form-label col-sm-4" for="">Bank Name</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtBankName" class="form-control" placeholder="Enter  The BankName" runat="server"></asp:TextBox>

  </div>
  </div>   
      <div class="form-group row" id="di_HolderName" runat="server" visible="false"><label class="col-form-label col-sm-4" for="">Account Holder Name</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtHolderName" class="form-control" placeholder="Enter The Account Holder Name" runat="server"></asp:TextBox>
  </div>
  </div>    

      <div class="form-group row" id="di_accountNO" runat="server" visible="false"><label class="col-form-label col-sm-4" for="">Account No.</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtAccountno" class="form-control" placeholder="Enter The Account No." runat="server"></asp:TextBox>
  </div>
  </div>   
      
      
      <div class="form-group row" id="di_ifsc" runat="server" visible="false"><label class="col-form-label col-sm-4" for="">IFSC </label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtIfsc" class="form-control" placeholder="Enter The IFSC" runat="server"></asp:TextBox>
  </div>
  </div>   






     <asp:HiddenField ID="hdfID" runat="server" />




  <div class="form-buttons-w">
  <asp:Button ID="btnSubmit"  class="btn btn-primary"   ValidationGroup="sv"
          runat="server" Text="submit" onclick="btnSubmit_Click" />
  </div>
  
  </div>
  </div></div>
  </div>
  
</div></div>
    <script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

