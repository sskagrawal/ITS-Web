<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta charset="utf-8">
    <meta name="robots" content="noindex, nofollow" />
    <meta content="ie=edge" http-equiv="x-ua-compatible">
    <meta content="template language" name="keywords">
    <meta content="Tamerlan Soziev" name="author">
    <meta content="Admin dashboard html template" name="description">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <link href="favicon.png" rel="shortcut icon">
    <link href="apple-touch-icon.png" rel="apple-touch-icon">
    <link href="//fast.fonts.net/cssapi/175a63a1-3f26-476a-ab32-4e21cbdb8be2.css" rel="stylesheet" type="text/css">
    <link href="bower_components/select2/dist/css/select2.min.css" rel="stylesheet">
    <link href="bower_components/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <link href="bower_components/dropzone/dist/dropzone.css" rel="stylesheet">
    <link href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="bower_components/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet">
    <link href="bower_components/perfect-scrollbar/css/perfect-scrollbar.min.css" rel="stylesheet">
    <link href="css/main.css?version=3.3" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="all-wrapper menu-side with-pattern">
                <div class="auth-box-w">
                    <div class="logo-w">
<a href="../Default.aspx">
<img alt="" src="../upload/logo.png" width="300px">
</a>
</div>
                    <h4 class="auth-header" style="text-align: center; padding-left: 0px; padding-top: 10px;">Login</h4>
                    <div class="form-group" style="padding: 10px;">
                        <label for="">Username</label>
                        <asp:TextBox ID="txtUser" class="form-control" placeholder="Enter your username" runat="server"></asp:TextBox>
                        <%--<input class="form-control" placeholder="Enter your username" type="text">
<div class="pre-icon os-icon os-icon-user-male-circle"></div>--%>
                    </div>
                    <div class="form-group" style="padding: 10px;">
                        <label for="">Password</label>
                        <asp:TextBox ID="txtPSWD" TextMode="Password" class="form-control" placeholder="Enter your password" runat="server"></asp:TextBox>
                        <%--<input class="form-control" placeholder="Enter your password" type="password">--%>
                        <%--<div class="pre-icon os-icon os-icon-fingerprint"></div>--%>
                    </div>
                    <div class="buttons-w" style="text-align: center; padding-bottom: 10px;">
                        <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary"
                            Text="Log me in" OnClick="btnLogin_Click" />


                    </div>
                    <div class="form-group" style="padding: 10px;">
                        <a class="btn btn-link left" href="../Job/Register.aspx">New Registration</a>
                        <a class="btn btn-link" style="float: right" href="../forget-password.aspx">Forget Password?</a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
