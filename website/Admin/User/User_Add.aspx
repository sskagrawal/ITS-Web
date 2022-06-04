<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="User_Add.aspx.cs" Inherits="Admin_User_Add"  EnableEventValidation="false"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<%--<script type="text/javascript">
    function showimagepreview(input) {
        if (input.files && input.files[0]) {
            var filerdr = new FileReader();
            filerdr.onload = function (e) {
                $('#<%=imgVehicle.ClientID %>').attr('src', e.target.result);
            }
            filerdr.readAsDataURL(input.files[0]);
        }
    }


</script>--%>

     <script type="text/javascript">
      function openTab1() {
         //alert('hiiii');
          $('#1').addClass('active');
          $('#2').removeClass('active');
          $('#3').removeClass('active');
          $('#4').removeClass('active');

          $('#stepContent1').addClass('active');
          $('#stepContent2').removeClass('active');
          $('#stepContent3').removeClass('active');
          $('#stepContent4').removeClass('active');
      }
      function openTab2() {
          //alert('hiiii 2');
          $('#1').removeClass('active');
          $('#2').addClass('active');
          $('#3').removeClass('active');
          $('#4').removeClass('active');

          $('#stepContent1').removeClass('active');
          $('#stepContent2').addClass('active');
          $('#stepContent3').removeClass('active');
          $('#stepContent4').removeClass('active');
      }
      
      function openTab3() {
          //alert('hiiii 2');
          $('#1').removeClass('active');
          $('#2').removeClass('active');
          $('#3').addClass('active');
          $('#4').removeClass('active');

          $('#stepContent1').removeClass('active');
          $('#stepContent2').removeClass('active');       
          $('#stepContent3').addClass('active');
          $('#stepContent4').removeClass('active');
      }

      function openTab4() {
          //alert('hiiii 2');
          $('#1').removeClass('active');
          $('#2').removeClass('active');
          $('#3').addClass('active');
          $('#4').addClass('active');

          $('#stepContent1').removeClass('active');
          $('#stepContent2').removeClass('active');
          $('#stepContent3').removeClass('active');
          $('#stepContent4').addClass('active');

      }



      function Document()
        {
          var IfscDiv = document.getElementById("Divdocument");
          IfscDiv.style.display = "block";
          var IfscDiv = document.getElementById("IfscDiv");
          IfscDiv.style.display = "none";
          
      }
      function Image() {
          var IfscDiv = document.getElementById("IfscDiv");
          IfscDiv.style.display = "block";
          var IfscDiv = document.getElementById("Divdocument");
          IfscDiv.style.display = "none";

      }
      
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <asp:HiddenField ID="hdfImage" runat="server" />
     <asp:HiddenField ID="HdfIdDocument" runat="server" />
    <asp:HiddenField id="hdfResume" runat="server"></asp:HiddenField>

    <asp:HiddenField ID="hdfPageName" runat="server" />
    <%--<asp:HiddenField ID="hdfID" runat="server" />--%>
     <asp:HiddenField ID="HDFUserID" runat="server" />
     <asp:HiddenField ID="Hdfuser" runat="server" />
     <asp:HiddenField ID="Hidduserid" runat="server" />
    <asp:HiddenField ID="hdfpartyid" runat="server" />
    <asp:HiddenField ID="hdfdoc_id" runat="server" />
    

            <!--------------------
                START - Breadcrumbs
                -------------------->
                <ul class="breadcrumb"><li class="breadcrumb-item"><a href="index.html">Home</a></li><li class="breadcrumb-item"><a href="index.html">Products</a></li><li class="breadcrumb-item"><span>Laptop with retina screen</span></li></ul>
                <!--------------------
                END - Breadcrumbs
                -------------------->
                <div class="content-panel-toggler"><i class="os-icon os-icon-grid-squares-22"></i><span>Sidebar</span></div><div class="content-i">
                    <div class="content-box">
                        <div class="element-wrapper">
                            <div class="element-box">
                                 <div class="alert alert-success alert-dismissible fade show" visible="false" runat="server" ID="alert" style="padding:10px;">
 <button aria-label="Close" class="close" data-dismiss="alert" type="button">
 <span aria-hidden="true"> ×</span>
 </button>
     <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
 </div>
                            <form><div class="steps-w">
                            <div class="step-triggers">
                                <a class="step-trigger  active" id="1" href="#stepContent1">Basic Details</a>
                                <a class="step-trigger" id="2" href="#stepContent2">Salary Details</a>
                                <a class="step-trigger " id="3" href="#stepContent3">Add Document</a>
                                <a class="step-trigger " id="4" href="#stepContent4">Bank Details</a></div>

                                <div class="step-contents">
                                    <div class="step-content active" id="stepContent1">


                                           <fieldset class="form-group">

                                                    <legend><span>Basic Details</span></legend>   

                                   <div class="form-group row">

  <label class="col-form-label col-sm-4" for="">User Type</label>
  <div class="col-sm-6">
   
      <asp:DropDownList ID="drdUserType" CssClass="form-control" runat="server" autoPostBack="true"  OnSelectedIndexChanged="OnSelectedIndexChanged"  >
      <asp:ListItem Text="Select User Type " Value="0"></asp:ListItem> 
      </asp:DropDownList>
       <asp:RequiredFieldValidator ID="rfvUserType" runat="server" ControlToValidate="drdUserType"
                                        ErrorMessage="Please Select User Type" InitialValue="0" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>

                                    <asp:ValidatorCalloutExtender ID="VCE_UserType" runat="server" Enabled="True"
                                        TargetControlID="rfvUserType" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
  </div>

  </div> 
 
  <div class="form-group row">

  <label class="col-form-label col-sm-4" for="">Full Name </label>
  <div class="col-sm-6">
       <asp:TextBox ID="txtName" class="form-control" placeholder="Enter the Name" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtName"
                                        ErrorMessage="Please Enter Name" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                   
       <asp:ValidatorCalloutExtender ID="VCE_FullName" runat="server" Enabled="True"
                                        TargetControlID="rfvFullName" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
  </div>

  </div>

  <div class="form-group row"><label class="col-form-label col-sm-4" for="">Mobile No.</label>
  <div class="col-sm-6">
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
  <div class="col-sm-6">
      <asp:TextBox ID="txtEmailID" class="form-control" placeholder="Enter Email ID" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmailID"
                                        ErrorMessage="Please Enter Email-ID" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="Required3" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator3" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
  </div>
  </div>

 

  <div class="form-group row"><label class="col-form-label col-sm-4" for="">Password</label>
  <div class="col-sm-6">
      <asp:TextBox ID="txtPSWD"  class="form-control" placeholder="Enter Password" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPSWD"
                                        ErrorMessage="Please Enter Password" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="Required7" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator6" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
  </div>
  </div>

      

                                    <div class="form-buttons-w text-right">
                                        <%--<a class="btn btn-primary step-trigger-btn" href="#stepContent2"> Continue</a>--%>
                                        <asp:Button ID="Button1" ValidationGroup="sv" class="btn btn-primary "  runat="server"  Text="Submit" onclick="btnSubmit_Click"/>
                                    </div>

                                               </fieldset>

                                                           </div>
   <div class="step-content " id="stepContent2">
  
               <fieldset class="form-group">

                                                    <legend><span>Salary Details</span></legend>   
                   
                    <div class="form-group row">
    <label class="col-form-label col-sm-4" for=""> Salary Mode</label>
    <div class="col-sm-6">

        <asp:DropDownList ID="ddlSalaryMode" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlSalaryMode_SelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem Value="0" Selected="True">Select Salary Mode</asp:ListItem>
            <asp:ListItem Value="Monthly">Monthly</asp:ListItem>
              <asp:ListItem Value="Commission">Commission</asp:ListItem>

        </asp:DropDownList>

        </div>


</div>


  <div class="form-group row" runat="server" id="divMonthly" visible="false"><label class="col-form-label col-sm-4" for="">Monthly Salary</label>
  <div class="col-sm-6">
      <asp:TextBox ID="txtMonthlysalary" class="form-control" placeholder="Enter Total Salary" runat="server"></asp:TextBox>
  </div>
  </div>   

   <div class="form-group row"  runat="server" id="divCommision" visible="false"><label class="col-form-label col-sm-4" for="">Commission % </label>
  <div class="col-sm-6">
      <asp:TextBox ID="txtCommission" class="form-control" placeholder="Enter Commission % " runat="server"></asp:TextBox>
  </div>
  </div>                           
       
        
    

   
        
  

   
       <div class="form-group row"><label class="col-form-label col-sm-4" for="">State</label>
  <div class="col-sm-6">
  
      <asp:DropDownList ID="Drdstate" CssClass="form-control" runat="server">
     
      </asp:DropDownList>


  </div>
  </div>   
      <div class="form-group row"><label class="col-form-label col-sm-4" for="">City</label>
  <div class="col-sm-6">
      <asp:TextBox ID="txtCity" class="form-control" placeholder="Enter The City" runat="server"></asp:TextBox>
  </div>
  </div>    

                   <div class="form-group row"><label class="col-form-label col-sm-4" for="">Address</label>
  <div class="col-sm-6">
      <asp:TextBox ID="txtAddress" TextMode="MultiLine" class="form-control" placeholder="Enter  Address" runat="server"></asp:TextBox>

  </div>
  </div>

      <div class="form-group row"><label class="col-form-label col-sm-4" for="">Zipcode</label>
  <div class="col-sm-6">
      <asp:TextBox ID="txtZipcode" class="form-control" placeholder="Enter The Zipcode" runat="server"></asp:TextBox>
  </div>
  </div>   


  

                                                                

 
                                                              
    
                                                                
                                   

                                                               <div class="form-buttons-w text-right">
                                                                  <%-- <a class="btn btn-primary step-trigger-btn" href="#stepContent3"> Continue</a>--%>
                                                                    <asp:Button ID="btnSubmitSalary" OnClick="btnSubmitSalary_Click" class="btn btn-primary "  
                                                            runat="server"  Text="Submit"  />
                                                               </div>


                   </fieldset>

                                                                 </div>


                                                                <div class="step-content" id="stepContent3">

                                                                        <fieldset class="form-group">

                                                    <legend><span>Document Details</span></legend>

                                                                    <div class="row">

                                   <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label for="">
                                                      Select Document</label>

                                                     <asp:DropDownList ID="ddlDocument" CssClass="form-control"  runat="server">
                                                         <asp:ListItem Selected="True" Value="0">Select File </asp:ListItem>
                                                         <asp:ListItem Value="Profile Photo">Profile Photo </asp:ListItem>
                                                         <asp:ListItem Value="Banner Photo">Banner Photo </asp:ListItem>
                                                         <asp:ListItem Value="Aadhar Card Front">Aadhar Card Front </asp:ListItem>
                                                         <asp:ListItem Value="Aadhar Card Back">Aadhar Card Back </asp:ListItem>
                                                         <asp:ListItem Value="Company Registration">Company Registration </asp:ListItem>
                                                         <asp:ListItem Value="Client Address Proof">Client Address Proof </asp:ListItem>                                                         
                                                        <asp:ListItem Value="GST File">GST File </asp:ListItem>
                                                        <asp:ListItem Value="Resume">Resume</asp:ListItem>
                                                        <asp:ListItem Value="Project File">Project File</asp:ListItem>                                              
                                                         
                                                       </asp:DropDownList>
                                                  
                                                 
                                                </div>
                                            </div>

                             <div class="col-sm-1"></div>
  

                                   <div class="col-sm-4">
                                                <div class="form-group">


                                                    <label for="">Upload File</label>

                                                    <asp:FileUpload ID="fuDocument" CssClass="form-control" runat="server" />


                                                    </div>
                                                    <asp:HiddenField ID="hdfPhoto" runat="server" />

                                       </div>

                                                                       

                                   <div class="col-sm-4" >
                                                <div class="form-group">
                                                   
                                                    <asp:Button ID="btnAddDocument" OnClick="btnAddDocument_Click"  CssClass="btn btn-primary"  runat="server" Text="Add" />



                                                    </div>
                                       </div>




                                  <hr />

                                  <div style="width: 100%; overflow-x: auto">
                                    
                              <hr />

                                  <div style="width: 100%; overflow-x: auto">
                                    <asp:GridView ID="gvFileDetails" runat="server" Width="100%" OnRowDataBound="gvFileDetails_RowDataBound"
                                        CssClass="table table-bordered table-striped" AutoGenerateColumns="False"
                                        RowStyle-HorizontalAlign="Center" HorizontalAlign="Center">
                                        
                                        <Columns>
                                            <asp:TemplateField HeaderText="Sno" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSRNO" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>



                                             <asp:TemplateField HeaderText="FileName" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDocument_Name" runat="server" Text='<%# Eval("Document_Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>


                                              <asp:TemplateField HeaderText="UploadFile" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUpload_File" runat="server" Text='<%# Eval("Upload_File") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            
                                                <%-- <asp:BoundField DataField="Document_Name" HeaderText="FileName " />--%>
                                              <%--  <asp:BoundField DataField="Upload_File" HeaderText="UploadFile " />       --%>                                  
                                            
                                       
                                             <asp:TemplateField HeaderText="Download" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">   
                                                                                           
                                                <ItemTemplate>

                                                    <asp:HiddenField ID="hdfDocId" Value='<%# Eval("Document_Id") %>' runat="server" />
                                                    <asp:Literal ID="ltrDoc" runat="server"></asp:Literal>

                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="60px" />
                                            </asp:TemplateField>



                       <asp:TemplateField HeaderText="Edit" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                            <ItemTemplate>

                                   <asp:ImageButton ID="imgbtnEdit" runat="server" ImageAlign="Middle" OnClick="imgbtnEdit_Click"  ToolTip="Edit" ImageUrl="../img/icon_edit.gif" /></button>
                            
                               </ItemTemplate>
                                                 
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Delete" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                               <ItemTemplate>                             

                                 <asp:HiddenField ID="hdf_ID"  runat="server" Value='<%#Eval("Document_Id")%>' ></asp:HiddenField>

                              <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle" 
                                                    ToolTip="Delete" OnClick="imgbtnDelete_Click" ImageUrl="../img/icon_delete.gif"/>
                                                                     
                            
                               </ItemTemplate>
                                </asp:TemplateField>

                                        </Columns>
                                       
                                    </asp:GridView>
                                </div>

                                </div>

                                  </div>
                                                                     
                                                                 </fieldset>
                                                                          
                                                                   </div>
                  
                                       <div class="step-content" id="stepContent4">


 
                 <fieldset class="form-group">

                                                    <legend><span>Bank Details</span></legend>

                                                   <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label for="">
                                                      Bank Name</label>                                                         
                                                  <asp:TextBox ID="txtBankName"  CssClass="form-control" placeholder="Enter Bank Name" runat="server"></asp:TextBox>
                                                                                                              
                                                 
                                                  
                                                </div>
                                            </div>


                                                        <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label for="">Account Holder Name</label>
                                 <asp:TextBox ID="txtAccHolderName"  CssClass="form-control" placeholder="Enter Account Holder Name" runat="server"></asp:TextBox>
                                                                             
                                               
                                                </div>
                                            </div>                                          
                                         
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label for="">Branch Name</label>
                                             <asp:TextBox ID="txtBranchName"  CssClass="form-control" placeholder="Enter Branch Name" runat="server"></asp:TextBox>
                                                                               
                                                  
                                                </div>
                                            </div>                                      

                                         
                                             <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label for="">Account No.</label>
                                                 <asp:TextBox ID="txtAccNumber"  CssClass="form-control" placeholder="Enter Account No" runat="server"></asp:TextBox>
                                                                                                
                                                </div>
                                            </div>


                                                 <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label for="">IFSC Code</label>
                                                     <asp:TextBox ID="txtIFSCcode"  CssClass="form-control" placeholder="Enter Account No" runat="server"></asp:TextBox>                                                                                          
                                                                                               
                                                </div>
                                            </div>                         

                                                  </div>


                       <div class="form-buttons-w">
                                                                          

  <asp:Button ID="btnSubmitBankDetail"   class="btn btn-primary"   
          runat="server" Text="Submit" OnClick="btnSubmitBankDetail_Click"  />
  </div>


                                                   </fieldset>                                                       
                                      



                                                                       </div>

                                                                              </div></div>

                                                                       </form></div></div>
                        
                                                                            </div>
                    
                </div>
          
       <div class="display-type"></div>

    </div><script src="../../js/jquery-1.12.4.js"></script>
    

</asp:Content>

