<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Post-Job.aspx.cs" Inherits="Client_Panel_Post_Resume" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>


<script type="text/javascript">
    $(function () {
        //$(".js-example-placeholder-single").select2({
        //    placeholder: "Select",
        //    allowClear: false
        //});
        $('#<%=ddlSkill2.ClientID%>').on('change', function () {
            $('#<%=hfSelected.ClientID%>').val($(this).val());
            <%--alert($('#<%=hfSelected.ClientID%>').val());--%>
        });
    });
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


      


   <asp:HiddenField ID="hdfImage" runat="server" />
    <asp:HiddenField ID="hdfUserID" runat="server" />
    <asp:HiddenField ID="hdfPostID" runat="server" />
     <asp:HiddenField ID="hdfpostjob_id" runat="server" />
    <asp:HiddenField ID="hdfPartyId" runat="server" />
  

       <div class="content-w">
    <!--------------------START - Breadcrumbs-------------------->
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Job Post /Profile</a></li>
    </ul>
    <!--------------------END - Breadcrumbs-------------------->
    <div class="content-i">
        <div class="content-box">
            <div class="row">

                <div class="col-lg-8">
                    <div class="element-wrapper">
                        <h6 class="element-header">Jobs Post</h6>
                        <div class="element-box">

                            <h5 class="form-header">Jobs Post/ Profile</h5>

                            <div id="alert" runat="server" visible="false" class="alert alert-success">
                                <asp:Label ID="lblMSG" runat="server" Text=""></asp:Label>
                            </div>



                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Job Industry</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="drdIndustry" CssClass="form-control" runat="server" OnSelectedIndexChanged="drdIndustry_SelectedIndexChanged" AutoPostBack="true">

                                    </asp:DropDownList>


                                    <asp:RequiredFieldValidator ID="rfvJobIndustry" runat="server" ControlToValidate="drdIndustry"
                                            ErrorMessage="Select Job Industry" InitialValue="0" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>

                                             <asp:ValidatorCalloutExtender ID="VCEJobIndustry" 
                                            runat="server" Enabled="True" TargetControlID="rfvJobIndustry" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 



                                </div>
                            </div>


                            <div class="form-group row">
  <label class="col-form-label col-sm-4" for="">job Category</label>
  <div class="col-sm-8">

      <asp:DropDownList ID="ddljobSubCategory" class="form-control" runat="server" OnSelectedIndexChanged="ddljobSubCategory_SelectedIndexChanged" AutoPostBack="true">


      </asp:DropDownList>

  
         <asp:RequiredFieldValidator ID="rfvjobSubCategory" runat="server" ControlToValidate="ddljobSubCategory"
                                            ErrorMessage="Select Job Category" InitialValue="0" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>

                                             <asp:ValidatorCalloutExtender ID="VCEjobsubCategory" 
                                            runat="server" Enabled="True" TargetControlID="rfvjobSubCategory" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
  </div>
  </div>



                             <div class="form-group row">


                                <label class="col-form-label col-sm-4" for="">Job Skills </label>
                                <div class="col-sm-8">

                                            <asp:DropDownList ID="ddlSkill2" runat="server" class="form-control select2" multiple="true">


                                                 </asp:DropDownList>

                                     <asp:HiddenField ID="hfSelected" runat="server" />
                                 
                                    <asp:Literal ID="ltrJobSkill" runat="server"></asp:Literal>
                               
                                </div>

                            
                                 </div>

                          <%--  </div>--%>




                                <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Job Type</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="drdJobType" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Select Job Type" Value="0"></asp:ListItem>
                                    </asp:DropDownList>


                                     <%--<asp:RequiredFieldValidator ID="rfvJobType" runat="server" ControlToValidate="drdJobType"
                                            ErrorMessage="Select Job Type" InitialValue="0" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>

                                             <asp:ValidatorCalloutExtender ID="VCEJobType" 
                                            runat="server" Enabled="True" TargetControlID="rfvJobType" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>--%>




                                </div>
                            </div>


                            <div class="form-group row">


                                <label class="col-form-label col-sm-4" for="">Job Title</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtJobTitle" class="form-control" placeholder="Enter Job Title" runat="server"></asp:TextBox>
                                
                                       <asp:RequiredFieldValidator ID="rfvJobTitle" runat="server" ControlToValidate="txtJobTitle"
                                            ErrorMessage="Enter Job Title"  ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>

                                             <asp:ValidatorCalloutExtender ID="VCEJobtitle" 
                                            runat="server" Enabled="True" TargetControlID="rfvJobTitle" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>
                                
                                
                                
                                </div>

                            </div>



                             <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">No. Position</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtNoPosition" class="form-control" placeholder="Enter No. Of Position" runat="server"></asp:TextBox>
                                
                                      <asp:RequiredFieldValidator ID="rfvJobPosition" runat="server" ControlToValidate="txtNoPosition"
                                            ErrorMessage="Enter Job Position"  ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>

                                             <asp:ValidatorCalloutExtender ID="VCE_Job_Position" 
                                            runat="server" Enabled="True" TargetControlID="rfvJobPosition" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>


                                
                                </div>
                            </div>


                              <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Experience</label>
                                <div class="col-sm-8">

                                        <asp:DropDownList ID="drdExp" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Select Experience" Value="0"></asp:ListItem>

                                    </asp:DropDownList>



                                       <asp:RequiredFieldValidator ID="rfvExp" runat="server" ControlToValidate="drdExp"
                                            ErrorMessage="Select Experience" InitialValue="0" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>

                                             <asp:ValidatorCalloutExtender ID="VCE_expe" 
                                            runat="server" Enabled="True" TargetControlID="rfvExp" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>



                                  
                                </div>
                            </div>
                             <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Time Duration</label>
                                   <div class="col-sm-4">
                                 
                                    <asp:DropDownList ID="ddlUnit" CssClass="form-control" runat="server" onchange="changDiv()">
                                        <asp:ListItem Selected="True" Value="0">Select Unit</asp:ListItem>
                                        <asp:ListItem Value="month">Month</asp:ListItem>
                                        <asp:ListItem Value="day">Day</asp:ListItem>
                                        <asp:ListItem Value="hour">Hour</asp:ListItem>
                                         <asp:ListItem Value="Fix Price">Fix Price</asp:ListItem>
                                    </asp:DropDownList>


                                         <asp:RequiredFieldValidator ID="rfv_Unit" runat="server" ControlToValidate="ddlUnit"
                                            ErrorMessage="Select Unit" InitialValue="0" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>

                                             <asp:ValidatorCalloutExtender ID="VCE_rfv_Unit" 
                                            runat="server" Enabled="True" TargetControlID="rfv_Unit" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>



                                </div>
                                <div class="col-sm-4" id="timeDuraionDiv">
                                      <asp:TextBox ID="txtTimeDuration" class="form-control" placeholder="Enter Amount" runat="server"></asp:TextBox>
                              
                                </div>
                                  <div class="col-sm-4" id="FixPriceDiv" style="display:none">
                                      <asp:TextBox ID="txtFixPrice" class="form-control" placeholder="Enter Fix Price" runat="server"></asp:TextBox>
                              
                                </div>

                                

                            </div>


                        


                            
                            <div class="form-group row" id="minBudgtDiv">
                                <label class="col-form-label col-sm-4" for="">Minimum Budget</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtMinimum" class="form-control" placeholder="Enter Mimimum Budget" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row" id="maxBudetDiv">
                                <label class="col-form-label col-sm-4" for="">Maximum Budget</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtMaxmum" class="form-control" placeholder="Enter Maximum Budget" runat="server"></asp:TextBox>
                                </div>
                            </div>


                            

                           




                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Qualification</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="drdQualification" CssClass="form-control" runat="server">

                                    </asp:DropDownList>


                                   <%--   <asp:RequiredFieldValidator ID="rfvQualification" runat="server" ControlToValidate="drdQualification"
                                            ErrorMessage="Select Qualification" InitialValue="0" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>

                                             <asp:ValidatorCalloutExtender ID="VCErfvQualification" 
                                            runat="server" Enabled="True" TargetControlID="rfvQualification" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>--%>


                                </div>
                            </div>


                           


                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">State</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="drdState" runat="server" CssClass="form-control" AutoPostBack="true"
                                        OnSelectedIndexChanged="drdState_SelectedIndexChanged">
                                   <%--     <asp:ListItem Text="Select Job Prepare State " Value="0"></asp:ListItem>--%>
                                    </asp:DropDownList>
                                </div>


                            </div>

                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">City</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="drdCity" CssClass="form-control" runat="server">
                               
                                    </asp:DropDownList>

                                    <%--  <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="drdCity"
                                            ErrorMessage="Select City" InitialValue="0" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>

                                             <asp:ValidatorCalloutExtender ID="VCE_City" 
                                            runat="server" Enabled="True" TargetControlID="rfvCity" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>--%>


                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Job Description</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtDes" TextMode="MultiLine" class="form-control" placeholder="Enter Job Description" runat="server"></asp:TextBox>

                                       <asp:RequiredFieldValidator ID="rfvJobDescription" runat="server" ControlToValidate="txtDes"
                                            ErrorMessage="Enter Job Position"  ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>

                                             <asp:ValidatorCalloutExtender ID="VCE_JobDescription" 
                                            runat="server" Enabled="True" TargetControlID="rfvJobDescription" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>


                                </div>
                            </div>


                                 <div class="form-group row">

                                       <label class="col-form-label col-sm-4" for="">Upload Project File</label>

                                     <asp:FileUpload ID="FileUpload1" runat="server" />
                                     
                                     <asp:HiddenField ID="hdfPhoto" runat="server" />
                       
                                   </div>        
                            
                            
                            
                            
                                                                




                            <div class="form-group row">


                              <asp:LinkButton ID="lbtnSubmit" class="btn btn-primary" runat="server" OnClick="lbtnSubmit_Click" ValidationGroup="sv"><span class="txt">Submit</span>  <span class="btn-icon fa fa-save"></span>  </asp:LinkButton>


                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>

        </div>
           </div>
    
         <script src="../../js/jquery-1.12.4.js"></script>
        <asp:HiddenField ID="hdfID" runat="server" />


    <script type="text/javascript">
        function changDiv()
        {
            var dUnit = document.getElementById('<%=ddlUnit.ClientID %>').options[document.getElementById('<%=ddlUnit.ClientID %>').selectedIndex].value;
            if (dUnit == "Fix Price")
            {
                document.getElementById('FixPriceDiv').style.display = 'block';
            document.getElementById('timeDuraionDiv').style.display = 'none';
            document.getElementById('minBudgtDiv').style.display = 'none'; 
            document.getElementById('maxBudetDiv').style.display = 'none';
            
            }
            else
            {
                document.getElementById('FixPriceDiv').style.display = 'none';
                document.getElementById('timeDuraionDiv').style.display = 'block';
                document.getElementById('minBudgtDiv').style.display = '';
                document.getElementById('maxBudetDiv').style.display = '';
            }
        }
    </script>

</asp:Content>

