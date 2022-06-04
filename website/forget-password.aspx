<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forget-password.aspx.cs" Inherits="ForgetPassword" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta content="ie=edge" http-equiv="x-ua-compatible">
    <meta content="ITS Gwalior" name="keywords">
    <meta content="ITS Gwalior" name="author">
    <meta content="ITS Gwalior" name="description">
    
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
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <div>
    <div class="all-wrapper menu-side with-pattern">
                <div class="auth-box-w">
                    <div class="logo-w">
<a href="default.aspx">
<img alt="" src="../upload/Logo.png" width="300px">
</a>
</div>
                    <h4 class="auth-header" style="text-align: center; padding-left: 0px; padding-top: 10px;">Forgot Password</h4>
                      <div style="padding:10px" class="alert alert-info alert-dismissible fade show">
                          Forgotten your password? Enter your registred mobile no below to Find your password
                          </div>
                    
                     <div runat="server" id="alert" class="alert alert-success alert-dismissible fade show" visible="false">
            <asp:Label ID="lblMSG" class="alert-message" runat="server" Text=""></asp:Label>
           
        </div>
                     <script type="text/javascript">
                                                            function HideLabel() {
                                                                var seconds = 10;
                                                                setTimeout(function () {
                                                                    document.getElementById("<%=alert.ClientID %>").style.display = "none";
                                                                }, seconds * 1000);
                                                            };
</script>  
                    <div class="form-group" style="padding: 10px;">
                        <label for="">Mobile No</label>
                        <asp:TextBox ID="txtMobNo" class="form-control" placeholder="Enter your Mobile No" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMobNo"
                                            ErrorMessage="Please Enter Mobile No" ForeColor="Red" SetFocusOnError="True" 
                                            Display="None">*</asp:RequiredFieldValidator>
                                        
                                             <asp:ValidatorCalloutExtender ID="RequiredFieldValidator3_ValidatorCalloutExtender" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
                    </div>
                   
                    <div class="buttons-w" style="text-align: center; padding-bottom: 10px;">
                        <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary"
                            Text="Get Password" OnClick="btnLogin_Click" />
                        &nbsp;&nbsp;
                        <a href="Admin/Login.aspx" class="btn btn-success">Login</a>
                    </div>
                 
                </div>
            </div>
    </div>
    </form>
</body>
</html>
