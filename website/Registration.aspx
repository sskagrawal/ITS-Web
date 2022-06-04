<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="Registration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
<meta content="ie=edge" http-equiv="x-ua-compatible">
<meta content="template language" name="keywords">
<meta content="Tamerlan Soziev" name="author">
<meta content="Admin dashboard html template" name="description">
<meta content="width=device-width, initial-scale=1" name="viewport">
<link href="favicon.png" rel="shortcut icon">
<link href="apple-touch-icon.png" rel="apple-touch-icon">
<link href="//fast.fonts.net/cssapi/175a63a1-3f26-476a-ab32-4e21cbdb8be2.css" rel="stylesheet" type="text/css">
<link href="Admin/bower_components/select2/dist/css/select2.min.css" rel="stylesheet">
<link href="Admin/bower_components/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
<link href="Admin/bower_components/dropzone/dist/dropzone.css" rel="stylesheet">
<link href="Admin/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="Admin/bower_components/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet">
<link href="Admin/bower_components/perfect-scrollbar/css/perfect-scrollbar.min.css" rel="stylesheet">
<link href="Admin/css/main.css?version=3.3" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
    <div><asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    
       <div class="all-wrapper menu-side with-pattern">
                <div class="auth-box-w">
                    <div class="logo-w">
<a href="#">
<img alt="" src="../upload/Logo.png" width="300px"/>
</a>
</div>
                    <h4 class="auth-header" style="text-align: center; padding-left: 0px; padding-top: 10px;">Registration</h4>
                    <div runat="server" id="alert" class="alert alert-success alert-dismissible fade show" visible="false">
            <asp:Label ID="lblMSG" class="alert-message" runat="server" Text=""></asp:Label>
            <span class="close-alert">X</span>
        </div>
                    <div class="form-group" style="padding: 10px;">
                         <label>Select User Type*</label>
                <asp:DropDownList ID="drdIndustries" runat="server" class="form-control" onchange="getUserType()">
                    <asp:ListItem Text="Select User Type" Value="0"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="drdIndustries"
                    ErrorMessage="Please Select Employee Type" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                    Display="None">*</asp:RequiredFieldValidator>

                <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1"
                    runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3" WarningIconImageUrl="~/images/wrning.gif">
                </asp:ValidatorCalloutExtender>

                       
                    </div>
                    <div class="form-group" style="padding: 10px;">
                         <label>Enter Name*</label>
                <asp:TextBox ID="txtName" class="form-control" placeholder="Enter Your Name *" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                    ErrorMessage="Please Enter Your Name" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                    Display="None">*</asp:RequiredFieldValidator>

                <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2"
                    runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1" WarningIconImageUrl="~/img/wrning.gif">
                </asp:ValidatorCalloutExtender>
                       
                    </div>
                       <div class="form-group" style="padding: 10px;">
                <label>Enter Mobile no * (User Name)</label>
                <asp:TextBox ID="txtMobNo" class="form-control" placeholder="Enter Your Mobile No. *" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMobNo"
                    ErrorMessage="Please Enter Your Mobile No." ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                    Display="None">*</asp:RequiredFieldValidator>

                <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender3"
                    runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2" WarningIconImageUrl="~/img/wrning.gif">
                </asp:ValidatorCalloutExtender>
            </div>
               <div class="form-group" style="padding: 10px;">
                <label>Enter Email ID</label>
                <asp:TextBox ID="txtEmailID" class="form-control" placeholder="Enter Your Email-ID" runat="server"></asp:TextBox>
               <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmailID"
                    ErrorMessage="Please Enter Your Email ID" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                    Display="None">*</asp:RequiredFieldValidator>--%>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ControlToValidate="txtEmailID" ErrorMessage="Please enter corect email" 
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender4"
                    runat="server" Enabled="True" TargetControlID="RegularExpressionValidator1" WarningIconImageUrl="~/img/wrning.gif">
                </asp:ValidatorCalloutExtender>
           </div>
               <div class="form-group" style="padding: 10px;">
                <label>Enter Password*</label>
                <asp:TextBox ID="txtPSWD" class="form-control" TextMode="Password" placeholder="Enter Your Password *" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPSWD"
                    ErrorMessage="Please Enter Your Password" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                    Display="None">*</asp:RequiredFieldValidator>

                <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender5"
                    runat="server" Enabled="True" TargetControlID="RequiredFieldValidator5" WarningIconImageUrl="~/img/wrning.gif">
                </asp:ValidatorCalloutExtender>
            </div>
                     <div class="form-group" style="padding: 10px;display:none" id="uplCV">
               <label>Upload Resume</label>
                 <asp:FileUpload ID="fuUploadResm" runat="server" CssClass="form-control" />
                 <asp:HiddenField ID="hdfCV" runat="server" />
            </div>
                    <div class="buttons-w" style="text-align: center; padding-bottom: 10px;">
                        <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary"
                            Text="Register Me" OnClick="btnLogin_Click" />


                    </div>
                    <div class="form-group" style="padding: 10px;">
                        <a class="btn btn-link left" href="Admin/Login.aspx">Login Here</a>
                      <%--  <a class="btn btn-link" style="float: right" href="#">Forget Password?</a>--%>
                    </div>
                </div>
            </div>
    
    </div>
    </form>
    <script type="text/javascript">

    function getUserType()
    {
        var userType = document.getElementById('<%=drdIndustries.ClientID %>').options[document.getElementById('<%=drdIndustries.ClientID %>').selectedIndex].value;
        if(userType=="3")
        {
            uplCV.style.display = "block";
            jobTitle.style.display = "block";
        }
        else
        {
            uplCV.style.display = "none";
            jobTitle.style.display = "none";
        }

        
    }
    function getjobTitle()
    {
        
    }
</script>
</body>
</html>
