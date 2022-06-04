<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ClientPrf.aspx.cs" Inherits="Client_Panel_ClientPrf" EnableEventValidation="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>

     <link href="bower_components/select2/dist/css/select2.min.css" rel="stylesheet" />



<script>
    $(document).ready(function () {
        $(".select2").select2();
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
   
     <script type="text/javascript">         

        function displaydiv() {   
           // alert("1");
           document.getElementById('<%=divPerPrfile.ClientID %>').style.display = 'block';
           document.getElementById('<%=divBusProfile.ClientID %>').style.display = 'none';
           document.getElementById('<%=divDocument.ClientID %>').style.display = 'none'; 
           document.getElementById('<%=divBank.ClientID %>').style.display = 'none';
           document.getElementById('<%=divContact.ClientID %>').style.display = 'none';
           document.getElementById('<%=divWorkExperience.ClientID %>').style.display = 'none';
       }   
         function displaydiv1() {
          //   alert("2");
           document.getElementById('<%=divBusProfile.ClientID %>').style.display = 'block';
           document.getElementById('<%=divPerPrfile.ClientID %>').style.display = 'none';
           document.getElementById('<%=divDocument.ClientID %>').style.display = 'none'; 
           document.getElementById('<%=divBank.ClientID %>').style.display = 'none';
           document.getElementById('<%=divContact.ClientID %>').style.display = 'none';
           document.getElementById('<%=divWorkExperience.ClientID %>').style.display = 'none';           
       }

         function displaydiv2() {
           //  alert("3");
            document.getElementById('<%=divContact.ClientID %>').style.display = 'block';
            document.getElementById('<%=divBusProfile.ClientID %>').style.display = 'none';
            document.getElementById('<%=divPerPrfile.ClientID %>').style.display = 'none';
            document.getElementById('<%=divDocument.ClientID %>').style.display = 'none'; 
            document.getElementById('<%=divBank.ClientID %>').style.display = 'none';
           document.getElementById('<%=divWorkExperience.ClientID %>').style.display = 'none';
        }

         function displaydiv3() {
           //  alert("4");
            document.getElementById('<%=divDocument.ClientID %>').style.display = 'block';
            document.getElementById('<%=divContact.ClientID %>').style.display = 'none'; 
            document.getElementById('<%=divBusProfile.ClientID %>').style.display = 'none';
            document.getElementById('<%=divPerPrfile.ClientID %>').style.display = 'none';
            document.getElementById('<%=divBank.ClientID %>').style.display = 'none';
            document.getElementById('<%=divWorkExperience.ClientID %>').style.display = 'none';
        }
         function displaydiv4() {
         //    alert("5");
            document.getElementById('<%=divBank.ClientID %>').style.display = 'block';
            document.getElementById('<%=divDocument.ClientID %>').style.display = 'none';
            document.getElementById('<%=divContact.ClientID %>').style.display = 'none'; 
            document.getElementById('<%=divBusProfile.ClientID %>').style.display = 'none';
            document.getElementById('<%=divPerPrfile.ClientID %>').style.display = 'none';
           document.getElementById('<%=divWorkExperience.ClientID %>').style.display = 'none';
        }
         function displaydiv5() {
             document.getElementById('<%=divWorkExperience.ClientID %>').style.display = 'block';
             document.getElementById('<%=divBank.ClientID %>').style.display = 'none';
            document.getElementById('<%=divDocument.ClientID %>').style.display = 'none';
            document.getElementById('<%=divContact.ClientID %>').style.display = 'none'; 
            document.getElementById('<%=divBusProfile.ClientID %>').style.display = 'none';
            document.getElementById('<%=divPerPrfile.ClientID %>').style.display = 'none';
        }       

          $(function () {
       
        $('#<%=ddlSkill2.ClientID%>').on('change', function () {
            $('#<%=hfSelected.ClientID%>').val($(this).val());
          
        });
    });

           $(function () {       
        $('#<%=ddlKeyword.ClientID%>').on('change', function () {
            $('#<%=hdfSelectedkeywrd.ClientID%>').val($(this).val());          
        });
    });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hdfClientId" runat="server" />
     <asp:HiddenField ID="hdfusertypeid" runat="server" />
     <asp:HiddenField ID="hdfjobid" runat="server" />

    <asp:HiddenField ID="hdfdoc_id" runat="server" />

      <asp:HiddenField ID="hdfProject_id" runat="server" />

      <asp:HiddenField ID="hdfBannerPhoto" runat="server" />
      <asp:HiddenField ID="hdfkywdId" runat="server" />
     <asp:HiddenField ID="hdfskillId" runat="server" />



                <!--------------------
START - Breadcrumbs
--------------------> 
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li><li class="breadcrumb-item">
                        <a href="index.html">Products</a></li><li class="breadcrumb-item"><span>Laptop with
                            retina screen</span></li></ul>
                <!--------------------
END - Breadcrumbs
-------------------->
                <div class="content-panel-toggler">
                    <i class="os-icon os-icon-grid-squares-22"></i><span>Sidebar</span></div>

                <div class="content-i">
                    <div class="content-box">
                        <div class="row">
                            <div class="col-sm-5">
                                <div class="user-profile compact">
                                     <asp:Literal ID="ltrDisplayProfile" runat="server"></asp:Literal>

                                    <asp:Image ID="imgBanner" runat="server" />
                                     
                                        <%-- <div class="up-head-w" style="background-image:url(../ClientContractDoc/13_ClnA010114111103.jpg)">                        
                                        
                                              <div class="up-social">
                                            <a href="#"><i class="os-icon os-icon-twitter"></i></a><a href="#"><i class="os-icon os-icon-facebook">
                                            </i></a>
                                        </div>
                                       
                                              <div class="up-main-info">
                                            <h2 class="up-header"><asp:Label ID="lblName" runat="server"> </asp:Label> </h2>
                                             <h6 class="up-sub-header"><asp:Label ID="lbltagline" runat="server" Text=""></asp:Label></h6>
                                            <h6><asp:Label ID="lblBusineeCategory" runat="server" Text="Label"></asp:Label></h6>                                   
                                        </div>
                                       
                                              <svg class="decor" width="842px" height="219px" viewbox="0 0 842 219" preserveaspectratio="xMaxYMax meet"
                                            version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g transform="translate(-381.000000, -362.000000)" fill="#FFFFFF"><path class="decor-path" d="M1223,362 L1223,581 L381,581 C868.912802,575.666667 1149.57947,502.666667 1223,362 Z"></path></g></svg>
                                    </div>--%>
                                   
                                 


                                    <div class="up-controls">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <h4>
                                                    <asp:Label ID="lblJobTitle" runat="server"></asp:Label>
                                                </h4><br />
                                                <div class="value-pair">                                                   
                                                    <div class="value badge badge-pill badge-success">
                                                    Short Description</div>
                                                </div>

                                                 <div class="el-tablo padded-v text-justify">                                                                                                          
                                                     <label>
                                                         <asp:label ID="lblshortDesc" runat="server" text=""></asp:label> </label>
                                                    </div>
                                            </div>
                                         
                                        </div>
                                    </div>

                                    

                                    <div class="up-contents">
                                        <div class="m-b">
                                            <div class="row m-b">
                                                <div class="col-sm-12 b-r b-b">
                                                     <div class="value-pair">
                                                   
                                                    <div class="value badge badge-pill badge-success">
                                                    Long Description</div>
                                                </div>

                                                   
                                                </div>
                                             
                                                    <div class="el-tablo padded-v text-justify">     
                                                       
                                                         <label>
                                                         <asp:label ID="lblLongDesc" runat="server" text=""></asp:label> </label>
                                                    </div>


                                                  
                                                </div>
                                            </div>
                                            <div class="padded">
                                                <div class="os-progress-bar primary">
                                                    <div class="bar-labels">
                                                        <div class="bar-label-left">
                                                            <span>Profile Completion</span><span class="positive">+10</span></div>
                                                        <div class="bar-label-right">
                                                            <span class="info">85/100</span></div>
                                                    </div>
                                                    <div class="bar-level-1" style="width:100%">
                                                     <div class="bar-level-2" style="width:80%">
                                                     <div class="bar-level-3" style="width:30%">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="element-box-content text-right">
                                                    <asp:Button ID="btnViewProfile" OnClick="btnViewProfile_Click" class="mr-2 mb-2 btn btn-primary btn-rounded" runat="server" Text="View Profile" />

    </div>



                                           
                                            </div>
                                        </div>
                                    </div>
                                </div>
                               
                          <%--  </div>--%>
                            <div class="col-sm-7">
                                <div class="element-wrapper">
                                    <div class="element-box">
                                        <div id="formValidate">
                                        <div class="element-info">
                                            <div class="element-info-with-icon">
                                                <div class="element-info-icon">
                                                    <div class="os-icon os-icon-wallet-loaded">
                                                    </div>
                                                </div>
                                                <div class="element-info-text">
                                                    <h5 class="element-inner-header">
                                                        Profile Settings</h5>
                                               
                                                </div>
                                            </div>
                                        </div>                    
                                            
                                            
                                             
                                                     
                                   
                                           <div id="divPerPrfile" runat="server" visible="true">
                                               <fieldset class="form-group">
                                            <legend><span>Personal Detail</span></legend>
                                                  
                                        <div class="row">
                                             <div class="col-sm-12">
                                            <div class="alert alert-success" role="alert" runat="server" visible="false" id="alertDiv">
                                                <asp:Label ID="lblMsg" runat="server"></asp:Label></div>
                                                 </div>
                                            <div class="clearfix"></div>

                                               <div class="col-sm-12">

                                                    <div class="form-group">
                                                    <label for="">Add Reference Person Name </label>
                                                   <asp:TextBox ID="txtExpert" CssClass="form-control" placeholder="Add Reference Person Name" runat="server" onkeyup = "SetContextKey()"></asp:TextBox>
                                                        <asp:HiddenField ID="hdfRefId" runat="server" />              
                                                     <asp:AutoCompleteExtender ServiceMethod="SearchDelPrsn" OnClientItemSelected="OnEmployeeSelected"
                                                            MinimumPrefixLength="1"
                                                            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                                            TargetControlID="txtExpert" UseContextKey="true"
                                                            ID="AutoCompleteExtender1" runat="server" FirstRowSelected="false" CompletionListCssClass="autoCompleteList" CompletionListItemCssClass="autoCompleteListItem" CompletionListHighlightedItemCssClass="autoCompleteSelectedListItem">
                                                        </asp:AutoCompleteExtender>  
                                                    
                                                       <div class="form-buttons-w" style="padding-top:0px;">
                                                       <asp:Button ID="btnAutoSubmit" Visible="false" OnClick="btnAutoSubmit_Click" class="btn btn-info btn-flat" runat="server" Text="Search !"></asp:Button>
                                      </div>
                                                                          
                                                </div>


                                                   </div>

                                           


                                           
                                             <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">
                                                        Full Name </label>
                                                   <asp:TextBox ID="txtPernName" CssClass="form-control" placeholder="Contact Person Name" runat="server"></asp:TextBox>
                                                                                                  
                                                </div>
                                            </div>


                                               <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">
                                                        Mobile No</label>
                                                    <asp:TextBox ID="txtMobNo" CssClass="form-control" placeholder="Mobile No" runat="server"></asp:TextBox>
                                                 
                                                 
                                                </div>
                                            </div>
                                                 
                                             <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">
                                                      WhatsApp No</label>
                                                 <asp:TextBox ID="txtAltMobNo" CssClass="form-control" placeholder="Alt Mobile No" runat="server"></asp:TextBox>
                                                 
                                                
                                                </div>
                                            </div>


                                                 <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">
                                                      Email ID</label>
                                                   <asp:TextBox ID="txtEmailId" CssClass="form-control" placeholder="Email ID" runat="server"></asp:TextBox>
                                                 
                                                 
                                                </div>
                                            </div>

                                           

                                            </div>
                                                   </fieldset>

                                            <div class="form-buttons-w">
                                            <asp:Button ID="btnUpdate1" onclick="btnUpdate1_Click"  runat="server" Text="Update" CssClass="btn btn-primary" />                                              
                                             <input id="btnNext" type="button" onclick="displaydiv1()" value="Skip" class="btn btn-success" />
                                                <%--<asp:Button ID="btnNextProfile" OnClick="btnNextProfile_Click" class="btn btn-success" runat="server" Text="Next" />--%>

                                           </div>

                                            
                                            </div>


                                           <div id="divBusProfile" runat="server" style="display:none">
                                              <fieldset class="form-group">
                                                   <legend><span>Job Profile</span></legend>                                      

                                                   <div class="row">


                                                              <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">
                                                      Industry</label>

                                                    <asp:DropDownList ID="ddlBusinessCat" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlBusinessCat_SelectedIndexChanged" AutoPostBack="true">
                                                        
                                                    </asp:DropDownList>
                                                 
                                                 
                                                  
                                                </div>
                                            </div>

                                        <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">Job Category</label>

                                                 <asp:DropDownList ID="ddljobSubCategory" class="form-control" runat="server" OnSelectedIndexChanged="ddljobSubCategory_SelectedIndexChanged" AutoPostBack="true">

                                                 </asp:DropDownList>

  
                                       <asp:RequiredFieldValidator ID="rfvjobSubCategory" runat="server" ControlToValidate="ddljobSubCategory"
                                            ErrorMessage="Select Category" InitialValue="0" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>

                                             <asp:ValidatorCalloutExtender ID="VCEjobsubCategory" 
                                            runat="server" Enabled="True" TargetControlID="rfvjobSubCategory" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
                                                 
                                               
                                                </div>
                                            </div>


                                                <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label for="">
                                                      Select job Skills</label>
                                                    
                                                      <asp:DropDownList ID="ddlSkill2" runat="server" class="form-control select2" multiple="true" style="width:100%">


                                                      </asp:DropDownList>

                                                   


                                                   <asp:HiddenField ID="hfSelected" runat="server" />
                                                                 <div id="skillList"></div> 
                                                   <%--    <ul class="nav nav-pills smaller hidden-md-down">                                
                                                    <asp:Literal ID="ltrJobList" runat="server"></asp:Literal>
                                             
                                                       </ul>--%>
                                                </div>
                                            </div>



                                   


  
                                         
                                        </div>

  <div class="row">
<div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">
                                                      Company Name(Optional)</label>
                                                    <asp:TextBox ID="txtName" CssClass="form-control" placeholder="Company Name" runat="server"></asp:TextBox>
                                                 
                                                  
                                                </div>
                                            </div>

<div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">
                                                     Website (Optional)</label>
                                                  <asp:TextBox ID="txtwebsite" CssClass="form-control" placeholder="Enter Website" runat="server"></asp:TextBox>
                                                 
                                               
                                                </div>
                                            </div>

      </div>
                         <div class="row" id="divcompDetail" runat="server" visible="false">


                                


                                <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">
                                                     Tagline</label>
                                                  <asp:TextBox ID="txttagline" CssClass="form-control" placeholder="Enter Tagline" runat="server"></asp:TextBox>
                                                 
                                               
                                                </div>
                                            </div>

                                       <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">
                                                     Company GST No.</label>
                                                  <asp:TextBox ID="txtGstNo" CssClass="form-control" placeholder="Gst No" runat="server"></asp:TextBox>
                                                 
                                               
                                                </div>
                                            </div>


                                                 <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">
                                                     Designation</label>
                                                  <asp:TextBox ID="txtDesignation" CssClass="form-control" placeholder="Enter Designation" runat="server"></asp:TextBox>
                                                 
                                               
                                                </div>
                                            </div>


                                              


                            
                                                      
                                  <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">Established On</label>
                                                    <asp:TextBox ID="txtEstablishedDte" CssClass="form-control" runat="server"></asp:TextBox>
                                                 <asp:CalendarExtender ID="caljobopenDate" runat="server" ClientIDMode="Static" TargetControlID="txtEstablishedDte" Format="dd/MM/yyyy"></asp:CalendarExtender>
                                               
                                                </div>
                                            </div>

                                                     
                                           
                                         
                                     

                                         
                                           


                                  
                             </div>


                                                       
                                            

                                                    <div class="row" id="divjobtype" runat="server" visible="false">       
                                                
                                                        
                                                        <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label for="">Job Title</label>

                             <asp:TextBox ID="txtJobTitle" TextMode="Multiline" class="form-control" placeholder="Enter Job Title" runat="server"></asp:TextBox>

</div>
      </div>
                                                        
                                                        
                                                         <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">Job Type</label>
                                                   <asp:DropDownList ID="drdJobType" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Select Job Type" Value="0"></asp:ListItem>

                                    </asp:DropDownList>
                                                 
                                               
                                                </div>
                                            </div>
                                                  <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">Experience</label>
                                                  <asp:DropDownList ID="drdExp" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Select Experience" Value="0"></asp:ListItem>

                                    </asp:DropDownList>
                                                 
                                               
                                                </div>
                                            </div>
                                            
                                 <div class="col-sm-6">
                                                <div class="form-group">
                                      <label>Select Qualification</label>
                                           <asp:DropDownList ID="drdQualification" CssClass="form-control" runat="server"></asp:DropDownList>
                             
                                                    </div>
                                                 </div>
                                                         <div class="col-sm-6">
                                                <div class="form-group">
                                 
                              <asp:Label ID="lblMinBudget" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="txtMiniSalary" class="form-control" placeholder="Enter Mimimum Salery" runat="server"></asp:TextBox>
                                   </div>
                              </div>




                              <div class="col-sm-6" id="divMaxBudget" runat="server" visible="false">
                                                <div class="form-group">
                                      <label>Max Budget </label>

                            <asp:TextBox ID="txtMaxSalary" class="form-control" placeholder="Enter Mimimum Salery" runat="server"></asp:TextBox>
                                   </div>
                              </div>




                              <div class="col-sm-6">
                                                <div class="form-group">
                                                       <label>Select Job Period</label>
                                       <asp:DropDownList ID="ddlUnit" CssClass="form-control" runat="server">
                                        <asp:ListItem Selected="True" Value="0">Select</asp:ListItem>

                                        <asp:ListItem Value="Monthly">Monthly</asp:ListItem>
                                        <asp:ListItem Value="Day Wise">Day Wise</asp:ListItem>
                                        <asp:ListItem Value="Hourly">Hourly</asp:ListItem>
                                           <asp:ListItem Value="Yearly">Yearly</asp:ListItem>
                                    </asp:DropDownList>
                         </div>
                              </div>



                              
                          <div class="col-sm-12">
                                                <div class="form-group">
                                      <label>Keyword</label>                    

                             <asp:DropDownList ID="ddlKeyword" runat="server" class="form-control select2" multiple="true" style="width:100%">


                              </asp:DropDownList>

                               <asp:HiddenField ID="hdfSelectedkeywrd" runat="server" />
                                <div id="selKeywords"></div>
                           <%--                                       <div id="vPincode"></div>
                               <ul class="nav nav-pills smaller hidden-md-down" style="padding:5px;">  
                                                                 
                               <asp:Literal ID="ltrSeletedkeywrd" runat="server"></asp:Literal>



                          


                                   

                                             
                                  </ul>--%>






                               </div>


                              </div>

                               </div>

                                                          <div class="row">       

                         

                      
                       
                                            

                                                        <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label for="">
                                                      Short Description(Limit 150 Character)</label>
                                                  <asp:TextBox ID="txtShortDest" TextMode="Multiline" CssClass="form-control" placeholder="Enter Short Description" runat="server"></asp:TextBox>
                                                 
                                                
                                                </div>
                                            </div>


                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label for="">
                                                      Long Description(Limit 500 Character)</label>
                                                  <asp:TextBox ID="txtLongDest" TextMode="Multiline" CssClass="form-control" placeholder="Enter Long Description" runat="server" Rows="10"></asp:TextBox>
                                                 
                                                
                                                </div>
                                            </div>               

                                                       </div>

                                                 </fieldset>

                                             <div class="form-buttons-w">
                                                 <input id="btnBack1" type="button" value="Back" onclick="displaydiv()" class="btn btn-info" />

                                                 <asp:Button ID="btnUpdate2" onclick="btnUpdate2_Click"  runat="server" Text="Update" CssClass="btn btn-primary" />
                                        
                                                 <%--<asp:Button ID="btnbtnNext1" OnClick="btnbtnNext1_Click" runat="server" class="btn btn-success" Text="Next" />--%>
                                             <input id="btnNext1" type="button" value="Skip" onclick="displaydiv2()" class="btn btn-success" />

                                                 
                                                 
                                                 
                                                    </div>

                                                   </div>
                                            
                                            
                                           <div id="divContact" runat="server" style="display:none">
                                            <fieldset class="form-group">
                                            <legend><span>Contact Details</span></legend>   

                                            <div class="row">
                                             <div class="col-sm-6">
                                                <div class="form-group">
                                      <label>Select Country</label>
                                            <asp:DropDownList ID="ddlCountry"   runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" AutoPostBack="true">
                                           
                                            </asp:DropDownList>
                             
                                                    </div>
                                                 </div>

                                       <div class="col-sm-6">
                                                <div class="form-group">
                                      <label>Select State</label>
                                            <asp:DropDownList ID="ddlState"   runat="server" CssClass="form-control">
                                           
                                            </asp:DropDownList>
                             
                                                    </div>
                                                 </div>


                                                <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">
                                                      City</label>
                                                   <asp:TextBox ID="txtCityName" CssClass="form-control" placeholder="City Name" runat="server"></asp:TextBox>
                                                 
                                                 
                                                </div>
                                            </div>

                                             <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">
                                                      Pin Code</label>
                                                   <asp:TextBox ID="txtPinCode" CssClass="form-control" placeholder="Pin Code" runat="server"></asp:TextBox>
                                                 
                                                 
                                                </div>
                                            </div>

                                              <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label for="">
                                                     Full Address</label>
                                                  <asp:TextBox ID="txtAddr" TextMode="Multiline" CssClass="form-control" placeholder="Address" runat="server"></asp:TextBox>
                                                 
                                                
                                                </div>
                                            </div>

                                                </div>

                                       </fieldset>
                                            
                                               <div class="form-buttons-w">
                                                    <input id="btnNext33" type="button"  onclick="displaydiv1()" value="Back" class="btn btn-info" />
                                            <asp:Button ID="btnContact" OnClick="btnContact_Click"   runat="server" Text="Update" CssClass="btn btn-primary" />

                                                 
                                                  <input id="btnNext2" type="button"   onclick ="displaydiv3()"  value="Skip" class="btn btn-success" />
                                              
                                                   <%--<asp:Button ID="btnNext2" OnClick="btnNext2_Click" class="btn btn-success" runat="server" Text="Next" />--%>
                                           </div>
                                            
                                              </div>


                                          <div id="divDocument" runat="server" style="display:none;">

                                                 <fieldset class="form-group">
                                            <legend><span>Documents Details</span></legend>


                              <div class="row">

                                   <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label for="">
                                                      Select File</label>

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


                                   <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">Upload File</label>

                                                    <asp:FileUpload ID="fuDocument" runat="server" />


                                                    </div>
                                                    <asp:HiddenField ID="hdfPhoto" runat="server" />

                                       </div>


                                   <div class="col-sm-2" style="margin-top:25px;">
                                                <div class="form-group">
                                                   
                                                    <asp:Button ID="btnAddDocument" OnClick="btnAddDocument_Click"  CssClass="btn btn-primary"  runat="server" Text="Add" />
                                                    </div>
                                       </div>




                                  <hr />

                                  <div style="width: 100%; overflow-x: auto">
                                    <asp:GridView ID="gvFileDetails" runat="server" Width="100%" OnRowDataBound="gvFileDetails_RowDataBound"
                                        CssClass="table table-bordered table-striped" AutoGenerateColumns="False"
                                        RowStyle-HorizontalAlign="Center" HorizontalAlign="Center">
                                        
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    Sno</HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSRNO" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            
                                                 <asp:BoundField DataField="Document_Name" HeaderText="FileName " />
                                                <asp:BoundField DataField="Upload_File" HeaderText="UploadFile " />                                         
                                            
                                       
                                             <asp:TemplateField HeaderText="Download">   
                                                                                           
                                                <ItemTemplate>

                                                    <asp:HiddenField ID="hdfDocId" Value='<%# Eval("Document_Id") %>' runat="server" />
                                                    <asp:Literal ID="ltrDoc" runat="server"></asp:Literal>

                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="60px" />
                                            </asp:TemplateField>



                                              <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>

                                   <asp:ImageButton ID="imgbtnEdit" runat="server" ImageAlign="Middle" OnClick="imgbtnEdit_Click"  ToolTip="Edit" ImageUrl="../img/icon_edit.gif" /></button>
                            
                               </ItemTemplate>
                                                 
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Delete">
                               <ItemTemplate>

                              

                                 <asp:HiddenField ID="hdf_ID"  runat="server" Value='<%#Eval("Document_Id")%>' ></asp:HiddenField>

                              <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle" 
                                                    ToolTip="Delete" OnClick="Delete" ImageUrl="../img/icon_delete.gif"/>
                                 
                                     
                            
                               </ItemTemplate>
                                </asp:TemplateField>



                                        </Columns>
                                       
                                    </asp:GridView>
                                </div>

                                  </div>                                            
                                                </fieldset>
                                           
                                        
                                        <div class="form-buttons-w">
                                        
                                                     <input id="btnBack3" type="button" value="Back" onclick="displaydiv2()" class="btn btn-info" />
                                                     <input id="btnNext3" type="button" value="Skip" onclick="displaydiv4()" class="btn btn-success" />

                                            
                                            
                                             </div>


                                                     </div>                                           


                                         <div id="divBank" runat="server" style="display:none;">
                                              <fieldset class="form-group">

                                                    <legend><span>Bank Details</span></legend>

                                                   <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">
                                                      Bank Name</label>                                                         
                                                  <asp:TextBox ID="txtBankName"  CssClass="form-control" placeholder="Enter Bank Name" runat="server"></asp:TextBox>
                                                                                                              
                                                 
                                                  
                                                </div>
                                            </div>


                                                        <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">Account Holder Name</label>
                                 <asp:TextBox ID="txtAccHolderName"  CssClass="form-control" placeholder="Enter Account Holder Name" runat="server"></asp:TextBox>
                                                                             
                                               
                                                </div>
                                            </div>                                          
                                         
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label for="">Branch Name</label>
                                             <asp:TextBox ID="txtBranchName"  CssClass="form-control" placeholder="Enter Branch Name" runat="server"></asp:TextBox>
                                                                               
                                                  
                                                </div>
                                            </div>                                      

                                         
                                             <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">Account No.</label>
                                                 <asp:TextBox ID="txtAccNumber"  CssClass="form-control" placeholder="Enter Account No" runat="server"></asp:TextBox>
                                                                                                
                                                </div>
                                            </div>


                                                 <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">IFSC Code</label>
                                                     <asp:TextBox ID="txtIFSCcode"  CssClass="form-control" placeholder="Enter Account No" runat="server"></asp:TextBox>                                                                                          
                                                                                               
                                                </div>
                                            </div>                         

                                                  </div>
                                                   </fieldset>

                                             <div class="form-buttons-w">
                                                 <input id="btnBack4" type="button" value="Back" onclick="displaydiv3()" class="btn btn-info" />
                                           
                                                 

                                                  <asp:Button ID="btnbankDetail"  OnClick="btnbankDetail_Click"   runat="server" Text="Update" CssClass="btn btn-primary" />
                                        
                                               <input  id="btnNext4" type="button" value="Skip" onclick="displaydiv5()" class="btn btn-success" />

                                                  
                                                 <%--<asp:Button ID="btnBankNext" OnClick="btnBankNext_Click" class="btn btn-success" runat="server" Text="Next" />--%>
                                                 
                                                 
                                                 
                                                    </div>

                                                   </div>


                                            <div id="divWorkExperience" runat="server" style="display:none;">
                                              <fieldset class="form-group">

                                                    <legend><span>Work Experience Details</span></legend>

                                                   <div class="row">
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label for="">
                                                      Project Name</label>                                                         
                                                  <asp:TextBox ID="txtProjectName"  CssClass="form-control" placeholder="Enter Project Name" runat="server"></asp:TextBox>
                                                                                                              
                                                 
                                                  
                                                </div>
                                            </div>


                                                                                    
                                         
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label for="">Description</label>
                                             <asp:TextBox ID="txtProjectDesc"  TextMode="MultiLine" CssClass="form-control" placeholder="Project Description" runat="server"></asp:TextBox>
                                                                               
                                                  
                                                </div>
                                            </div>     
                                                       
                                                       
                                              <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">Project Screen Shot</label>
                              
                                                    <asp:FileUpload ID="fuProjectFile" runat="server" />              
                                                      <asp:HiddenField ID="hdfProjectFile" runat="server" />
                                                </div>
                                            </div>                       
                                                       
                                                                                        

                                           <div class="col-sm-2" style="margin-top:25px;">
                                                <div class="form-group">
                                                   
                                                    <asp:Button ID="btnAddWork" OnClick="btnAddWork_Click"   CssClass="btn btn-primary"  runat="server" Text="Add" />
                                                    </div>
                                       </div>
                                           
                                      <hr/>

                                  <div style="width: 100%; overflow-x:auto">
                                    <asp:GridView ID="gvWorkExp" runat="server" Width="100%" OnRowDataBound="gvWorkExp_RowDataBound"  CssClass="table table-bordered table-striped" AutoGenerateColumns="False"
                                        RowStyle-HorizontalAlign="Center" HorizontalAlign="Center">
                                        
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    Sno</HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSRNO" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>




                                                   <asp:TemplateField HeaderText="Project_Photo" >
                               <ItemTemplate>
                              
                                    <asp:HiddenField ID="hdfProjectimg" Value='<%#Eval("Project_Image")%>' runat="server"></asp:HiddenField>
                                   <asp:Literal ID="ltrProject" runat="server"></asp:Literal>

                               

                                 
                                    </ItemTemplate>
                                </asp:TemplateField>

                                            
                                                <asp:BoundField DataField="Project_Name" HeaderText="Project_Name " />

                                              <asp:BoundField DataField="Project_Desc" HeaderText="Project_Desc " />


                                              <%-- <asp:BoundField DataField="Project_Image" HeaderText="Project_Image " />  --%>                                       
                                            
                                       
                                            <%-- <asp:TemplateField HeaderText="Download">   
                                                                                           
                                                <ItemTemplate>

                                               
                                                    <asp:Literal ID="ltrProject" runat="server"></asp:Literal>

                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="60px" />
                                            </asp:TemplateField>--%>



                                              <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>

                                   <asp:ImageButton ID="imgProjectbtnEdit" runat="server" ImageAlign="Middle" OnClick="imgProjectbtnEdit_Click" ToolTip="Edit" ImageUrl="../img/icon_edit.gif" /></button>
                            
                               </ItemTemplate>
                                                 
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Delete">
                               <ItemTemplate>

                              

                                  <asp:HiddenField ID="hdfProjId" Value='<%# Eval("Project_Id") %>' runat="server" />

                              <asp:ImageButton ID="imgProjectbtnDelete" runat="server" ImageAlign="Middle" 
                                                    ToolTip="Delete" OnClick="imgProjectbtnDelete_Click"  ImageUrl="../img/icon_delete.gif"/>
                                 
                                     
                            
                               </ItemTemplate>
                                </asp:TemplateField>



                                        </Columns>
                                       
                                    </asp:GridView>
                                </div>





                  

                                                  </div>
                                                   </fieldset>

                                             <div class="form-buttons-w">
                                            <input id="btnBack5" type="button" value="Back" onclick="displaydiv4()" class="btn btn-info" />
                                                                            
                                                    </div>
                                                   </div>
                                                  </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> 
                   </div>                
               
  


    <script src="../js/jquery-1.12.4.js"></script>
     <script type="text/javascript">
        
        function OnEmployeeSelected(source, eventArgs)
        {
           
                document.getElementById("<%= txtExpert.ClientID %>").value =eventArgs.get_value();
                document.getElementById("<%= btnAutoSubmit.ClientID %>", "").click();
        }
        function SetContextKey(x) {
           $find('<%=AutoCompleteExtender1.ClientID%>').set_contextKey($get("<%=hdfClientId.ClientID %>").value);
          
        }
       </script>

  <script src="bower_components/select2/dist/js/select2.full.min.js"></script>
    
    <script type="text/javascript">
 $(function () {
       
        $('#<%=ddlKeyword.ClientID%>').on('change', function () {
            $('#<%=hdfSelectedkeywrd.ClientID%>').val($(this).val());
           
        });

 });



        function bindSkill(vId) {
            var baseURL = window.location.protocol + "//" + window.location.host + "//";
            //alert(vPincodeid);
            $.ajax({
                type: "POST",
                url: "" + baseURL + "WebMethod/AutoComplete.asmx/bindskill",
                data: "{'vId':'" + vId + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var jsondata = $.parseJSON(data.d);

                    var htmlstring = "<ul class='nav nav-pills smaller hidden-md-down' style='padding:5px;'>";
                    if (jsondata == "") {

                    }
                    else {
                        $.each(jsondata, function (index, value) {
                            //alert(jsondata);
                            htmlstring += "<li class='nav-item'><span class='nav-link active'>" + this.Skill_Name + " <a href='javascript:void(0)' style='color:#000;' onclick='delskill(" + this.Post_JobSkill_Id + ")'> X </a></span> </li>&nbsp;";
                        });
                    }
                    htmlstring += "</ul>";
                   // alert(htmlstring);
                    document.getElementById("skillList").innerHTML = htmlstring;
                },
                error: function () {

                }
            });
        }


     
          function delskill(vPincodeid)
        {
            var baseURL = window.location.protocol + "//" + window.location.host + "//";
            //alert(vPincodeid);
            $.ajax({
                type: "POST",
                url: "" + baseURL + "WebMethod/AutoComplete.asmx/delskill",
                data: "{'vId':'" + vPincodeid + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    //document.getElementById("cart_num1").innerHTML = data.d;
                    var vid = document.getElementById('<%=hdfClientId.ClientID %>').value; 
                    bindSkill(vid);
                },
                error: function () {

                }
            });
        }







        function delkeyword(vPincodeid)
        {
            var baseURL = window.location.protocol + "//" + window.location.host + "//";
            //alert(vPincodeid);
            $.ajax({
                type: "POST",
                url: "" + baseURL + "WebMethod/AutoComplete.asmx/delkeyword",
                data: "{'pId':'" + vPincodeid + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    //document.getElementById("cart_num1").innerHTML = data.d;
                    var vid = document.getElementById('<%=hdfClientId.ClientID %>').value; 
                    bindkeyword(vid);
                },
                error: function () {

                }
            });
        }
        function bindkeyword(vId) {
            var baseURL = window.location.protocol + "//" + window.location.host + "//";
            //alert(vPincodeid);
            $.ajax({
                type: "POST",
                url: "" + baseURL + "WebMethod/AutoComplete.asmx/bindkeyword",
                data: "{'vId':'" + vId + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var jsondata = $.parseJSON(data.d);
                    
                    var htmlstring = "<ul class='nav nav-pills smaller hidden-md-down' style='padding:5px;'>";
                    if (jsondata == "") {

                    }
                    else
                    {
                        $.each(jsondata, function (index, value) {
                            //alert(jsondata);
                            htmlstring += "<li class='nav-item'><span class='nav-link active'>" + this.Keyword + " <a href='javascript:void(0)' style='color:#000;' onclick='delkeyword(" + this.Job_keywrd_Id + ")'> X </a></span> </li>&nbsp;";
                        });
                    }
                    htmlstring += "</ul>";
                    //alert(htmlstring);
                    document.getElementById("selKeywords").innerHTML = htmlstring;
                },
                error: function () {

                }
            });
        }
    </script>


     <%--  cmdkywrd.Parameters.AddWithValue("@PartyID", hdfClientId.Value);--%>



    
</asp:Content>

