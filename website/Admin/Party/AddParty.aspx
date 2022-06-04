<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddParty.aspx.cs" Inherits="Admin_AddParty" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">



          <script type="text/javascript">       
     
        function CalculatDisc() {
            var totalAmt = document.getElementById('<%= txtPrjAmt.ClientID %>').value;          
            var AdvAmt = document.getElementById('<%= txtPrjAdvAmt.ClientID %>').value;        
            var dueAmt;
            if (totalAmt != "" && AdvAmt != "")
            {
                dueAmt = document.getElementById('<%= txtDueAmt.ClientID %>').value = parseFloat(totalAmt) - parseFloat(AdvAmt);           
             
            }
        }
    </script>   


 <script src="../../js/jquery-1.10.2.min.js"  type="text/javascript"></script>
<script src="../../js/jquery-te-1.4.0.min.js" type="text/javascript"></script>
   
<script language="javascript" type="text/javascript">  
    $('.textEditor').jqte();
$(".textBox2").jqte({  
     blur: function() {  
         
     }  
});  
</script> 


  



    <style type="text/css">
         .autoCompleteList
		{
             font-size:16px;
			background-color: #F2F4F8 ;
			border: solid 1px black;
			margin: 0px;
			z-index: 100000 ;
		}
		.autoCompleteListItem
		{
			background-color: #F2F4F8 ;
			color: black ;
			z-index: 100000 ;
		}
		.autoCompleteSelectedListItem
		{
			background-color: #B2AEE2 ;
			color: Black ;
			z-index: 100000 ;
		}
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdfImage" runat="server" />
    <asp:HiddenField ID="hdfID" runat="server" />

     <asp:HiddenField ID="hdfuserPsw" runat="server" />

    <!--------------------START - Breadcrumbs-------------------->
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Add Party</a></li>
        <%-- <li class="breadcrumb-item">
  <span>Laptop with retina screen</span></li>--%>
    </ul>
    <!--------------------END - Breadcrumbs-------------------->
    <div class="content-i">
        <div class="content-box">
            <div class="row">

                <div class="col-lg-12">
                    <div class="element-wrapper">
                        <h6 class="element-header">Add Update Party</h6>
                        <div class="element-box">

                            <h5 class="form-header">Add Update Party</h5>

                            <div class="alert alert-success alert-dismissible fade show" visible="false" runat="server" id="alert" style="padding:10px">
                                <button aria-label="Close" class="close" data-dismiss="alert" type="button">
                                    <span aria-hidden="true">×</span>
                                </button>
                                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                            </div>


                            <fieldset class="form-group">
                                <legend><span>Party Basic Details</span></legend>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Party Type</label>
                                            <asp:DropDownList CssClass="form-control" ID="drdPartyType" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        
                                            <label for="">Party Category</label>
                                            <div class="form-group ">
                                            <asp:TextBox ID="Txtprtyctgy" class="form-control" placeholder="Enter Party Category" runat="server"></asp:TextBox>
                                      <%--      <asp:AutoCompleteExtender ServiceMethod="SearchpartyBycat" OnClientItemSelected="OnpartycategorySelected"
                                                            MinimumPrefixLength="1"
                                                            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                                            TargetControlID="Txtprtyctgy"
                                                            ID="AutoCompleteExtender2" runat="server" FirstRowSelected="false" CompletionListCssClass="autoCompleteList" CompletionListItemCssClass="autoCompleteListItem" CompletionListHighlightedItemCssClass="autoCompleteSelectedListItem">
                                                        </asp:AutoCompleteExtender>--%>
                                             </div>
                                    </div>

                                    <div class="col-md-6">
                                        
                                            <label for="">Party Name</label>
                                            <div class="form-group ">
                                            <asp:TextBox ID="txtName" class="form-control" placeholder="Enter Party Name" runat="server"></asp:TextBox>
                                            <%-- <asp:AutoCompleteExtender ServiceMethod="SearchEmpByName" OnClientItemSelected="OnPartySelected"
                                                            MinimumPrefixLength="1"
                                                            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                                            TargetControlID="txtName"
                                                            ID="AutoCompleteExtender1" runat="server" FirstRowSelected="false" CompletionListCssClass="autoCompleteList" CompletionListItemCssClass="autoCompleteListItem" CompletionListHighlightedItemCssClass="autoCompleteSelectedListItem">
                                                        </asp:AutoCompleteExtender>

                                             <asp:Button ID="btnAutoSubmit" visible="false"  runat="server"  CssClass="btn btn-primary "   style="background-color:#047BF8;color:white;border-radius: 8px"  Text="search" />--%>
                                        </div>
                                    </div>

                                    
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="">Country</label>
                                            <asp:DropDownList ID="drdCountry" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="">State</label>
                                            <asp:DropDownList ID="drdState" CssClass="form-control" runat="server"></asp:DropDownList>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">City</label>

                                            <asp:TextBox ID="txtCity" class="form-control" placeholder="Enter City Name" runat="server"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Address</label>
                                            <asp:TextBox ID="txtAddress" class="form-control" placeholder="Enter Address" runat="server"></asp:TextBox>

                                        </div>
                                    </div>


                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="">Pin Code</label>
                                            <asp:TextBox ID="txtPinCode" class="form-control" placeholder="Enter Pincode" runat="server"></asp:TextBox>

                                        </div>
                                    </div>


                                    
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="">Gst No</label>
                                            <asp:TextBox ID="TxtGstno" class="form-control" placeholder="Enter Gst No" runat="server"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Contact Person Name</label>
                                            <asp:TextBox ID="txtCName" class="form-control" placeholder="Enter Contact Person Name" runat="server"></asp:TextBox>

                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Phone No</label>
                                            <asp:TextBox ID="txtPhonNo" class="form-control" placeholder="Enter Phone No" runat="server"></asp:TextBox>

                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Mobile No</label>
                                            <asp:TextBox ID="txtMobNo" class="form-control" placeholder="Enter Mobile No" runat="server"></asp:TextBox>

                                        </div>
                                    </div>
                                     <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Email ID</label>
                                            <asp:TextBox ID="txtEmailID" class="form-control" placeholder="Enter Email ID" runat="server"></asp:TextBox>

                                        </div>
                                    </div>






                                     <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Owner Name</label>
                                            <asp:TextBox ID="txtOwnerName" class="form-control" placeholder="Enter Owner Name" runat="server"></asp:TextBox>
                                        </div>
                                    </div>

                                     <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Owner Mobile</label>
                                            <asp:TextBox ID="txtOwnerMob" class="form-control" placeholder="Enter Owner Mobile" runat="server"></asp:TextBox>
                                        </div>
                                    </div>


                                     <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Owner Email</label>
                                            <asp:TextBox ID="txtOwnerEmail" class="form-control" placeholder="Enter Owner Email" runat="server"></asp:TextBox>
                                        </div>
                                    </div>

                                </div>
                            </fieldset>

                               <fieldset class="form-group">
                                <legend><span>Party Document Details</span></legend>

                                           <div class="row">
                                        <div class="col-md-12">
                                        <div class="form-group">
                                             <label for="">Project Description</label>

                                   <asp:TextBox ID="txtPrjDesc"  TextMode="MultiLine" runat="server" CssClass="form-control textEditor"
           ></asp:TextBox>
                                  <asp:HiddenField ID="hdText" runat="server" />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPrjDesc"
                                            ErrorMessage="Please Enter Project Description" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv11"
                                            Display="None">*</asp:RequiredFieldValidator>
                                        
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator4" WarningIconImageUrl="~/images/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 

                             </div>
                                            </div>
                                               </div>


                                      <label for="">or </label>
                                   <div class="row">

                                        <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="">Project Document File</label>
                                       <asp:FileUpload ID="fuPrjDocFile" runat="server" />
                                       <asp:HiddenField ID="hdfPrjDocFile" runat="server" />

                                            <div id="divProject" runat="server" visible="false" style="padding-top:10px;">
                                               <a id="anchorIDprojectFile" class="mr-2 mb-2 btn-sm" style="color: #047bf8;"  runat="server">Download Project File</a>
                                                </div>
                                            </div>
                                        </div>
                                    

                                        <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="">Address Proof</label>
                                           <asp:FileUpload ID="fuClntAddrProof" runat="server" />
                                 
                                              <asp:HiddenField ID="hdfClntAddrPrf" runat="server" />
                                                 <div id="divAddressProof" runat="server" visible="false" style="padding-top:10px;">
                                               <a id="anchorIdAddProof" class="mr-2 mb-2 btn-sm" style="color: #047bf8;"  runat="server">Download Address Proof</a>
                                                </div>
                                        </div>
                                    </div>

                                       <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="">Company Registration</label>
                                    <asp:FileUpload ID="fuCompReNo" runat="server" />
                                   <asp:HiddenField ID="hdfCompReg" runat="server" />

                                                  <div id="divCompReg" runat="server" visible="false" style="padding-top:10px;">
                                            
                                                <a id="anchorCompReg" class="mr-2 mb-2 btn-sm" style="color: #047bf8;"  runat="server">Download Company Registration</a>
                                                      </div>





                                        </div>
                                    </div>

                                   </div>


                                   <div class="row">


                                        <div class="col-md-3">
                       <label>Project Amount<span style="color:red">*</span></label>
    <asp:TextBox ID="txtPrjAmt" class="form-control" onblur="javascript:Calculat();" runat="server"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPrjAmt"
                                            ErrorMessage="Please Enter Project Amount" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv11"
                                            Display="None">*</asp:RequiredFieldValidator>
                                        
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator5" WarningIconImageUrl="~/images/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
                        </div>
                                   <div class="col-md-3">
                       <label>Project Advance Amount</label>
    <asp:TextBox ID="txtPrjAdvAmt"  onblur="javascript:Calculat();"  runat="server"></asp:TextBox>

         
    
                        </div>

              <div class="col-md-3">
                       <label>Due Amount</label>
                              <asp:TextBox ID="txtDueAmt" class="form-control"  onblur="CalculatDisc()" runat="server" ></asp:TextBox>   
    
                        </div>

                             <div class="col-md-3">
                       <label>Payment Mode</label>
                                   <asp:DropDownList ID="ddlPayMode" class="form-control" runat="server"></asp:DropDownList>
    
                        </div>


                                   </div>

                                   </fieldset>


                          <%--  <fieldset class="form-group">
                                <legend><span>Bank Details</span></legend>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">PAN Card No.</label>
                                            <asp:TextBox ID="txtPanNo" class="form-control" placeholder="Enter PAN Card No." runat="server"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">GST No</label>
                                            <asp:TextBox ID="txtGstNo" class="form-control" placeholder="Enter GST No" runat="server"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">CST No</label>
                                            <asp:TextBox ID="txtCstNo" class="form-control" placeholder="Enter CST No" runat="server"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Bank Name</label>
                                            <asp:TextBox ID="txtBank" class="form-control" placeholder="Enter Bank Name" runat="server"></asp:TextBox>

                                        </div>
                                    </div>
                                     <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">IFSC Code</label>
                                            <asp:TextBox ID="txtIfscCode" class="form-control" placeholder="Enter IFSC Code" runat="server"></asp:TextBox>

                                        </div>
                                    </div>
<div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Account No.</label>
                                            <asp:TextBox ID="txtAcNo" class="form-control" placeholder="Enter Account No." runat="server"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Cheque Printing Name</label>
                                            <asp:TextBox ID="txtPrName" class="form-control" placeholder="Enter Cheque Printing Name" runat="server"></asp:TextBox>

                                        </div>
                                    </div>
                                   
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="">Remarks</label>

                                            <asp:TextBox ID="txtRemarks" class="form-control" TextMode="MultiLine" placeholder="Enter Remarks" runat="server"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>
                            </fieldset>--%>

                            <%--  <fieldset class="form-group">
                                <legend><span>Party Login Details</span></legend>
                                <div class="row">
                                  
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Party User Id</label>
                                            <asp:TextBox ID="txtUserID" class="form-control" placeholder="Enter User ID" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                  
                                    </div>
                                  </fieldset>--%>
                            <div class="form-buttons-w">
                                <asp:Button ID="btnSubmit" class="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
        
        
       
         

        
        
        
        <script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

