<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

   

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server">

      <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <div>
      <div class="container">
        <div class="row">

          



            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        </div>
                            <fieldset>
                                <div class="form-group">
                                  FullName:<asp:TextBox id="txtFname"  runat="server" />

                                 
                                    

                                     <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFname"
                                            Display="None" ErrorMessage="Enter Full  Name" ForeColor="Red" SetFocusOnError="True"
                                            ValidationGroup="sv">*</asp:RequiredFieldValidator>

                                        <asp:ValidatorCalloutExtender ID="valCal_FullName"
                                            runat="server" Enabled="True" TargetControlID="rfvFullName" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>
            
                                   
                                </div>

                                 <div class="form-group">
                                  Email:<asp:TextBox id="txtemail"  runat="server" />
                                  </br>
                                   

                            
                                
                                  <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtemail"
                                     ErrorMessage="Please Enter Email" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                    Display="None"></asp:RequiredFieldValidator>


                                <asp:RegularExpressionValidator ID="revEmail" runat="server" ClientIDMode="Static"
                                 SetFocusOnError="true" ControlToValidate="txtemail" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                                 AccessKeyErrorMessage="Please Enter Valid Email Address" ValidationGroup="sv" Display="None"></asp:RegularExpressionValidator>

                                 <asp:ValidatorCalloutExtender ID="ValCalEmailAddress" runat="server" Enabled="True"
                                 TargetControlID="revEmail" >
                                 </asp:ValidatorCalloutExtender>





                                </div>


                                </div>

                                 <div class="form-group">
                                  password:<asp:TextBox id="txtpassword"  runat="server" />
                                   </br>




                                   
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtpassword"
                                     ErrorMessage="Please Enter password" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                    Display="None"></asp:RequiredFieldValidator>


                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ClientIDMode="Static"
                                 SetFocusOnError="true" ControlToValidate="txtpassword" ValidationExpression="^.*(?=.{8,})(?=..*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).*$"
                                 AccessKeyErrorMessage="Please Enter valid password" ValidationGroup="sv" Display="None"></asp:RegularExpressionValidator>

                                 <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" Enabled="True"
                                 TargetControlID="revEmail" >
                                 </asp:ValidatorCalloutExtender>


                                </div>

                                <div class="form-group">

                                  Mobile no.:<asp:TextBox id="txtmobile"  runat="server" /></br>

                                   
                                     <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtmobile"
                                            Display="None" ErrorMessage="Enter Mobile " ForeColor="Red"
                                            SetFocusOnError="True" ValidationGroup="sv">*</asp:RequiredFieldValidator>

                                  <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2"
                                 runat="server" Enabled="True" TargetControlID="rfvMobile" >
                                  </asp:ValidatorCalloutExtender>

                                   
                                   
                                    <asp:RegularExpressionValidator ID="revMobileNumber" ClientIDMode="Static" runat="server" SetFocusOnError="true" ValidationGroup="sv"
                                         ControlToValidate="txtmobile" ErrorMessage="Enter Valid Mobile No" 
                                          ValidationExpression="[0-9]{10}" Display="None"></asp:RegularExpressionValidator>
   
                                   <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender11"
                                 runat="server" Enabled="True" TargetControlID="revMobileNumber" >
                                  </asp:ValidatorCalloutExtender>



                                </div>



                                <div>
                                User Type:<asp:DropDownList ID="ddutype" runat="server">
                                    <asp:ListItem Enabled="true" Text="Select UserType" Value="-1"></asp:ListItem>
                                    <asp:ListItem Text="Admin" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="user" Value="2"></asp:ListItem>
                                    
                                </asp:DropDownList>

                                </div>

                                <div class="form-group">
                               Gender:<asp:RadioButtonList ID="rbgender" runat="server">
                                 <asp:ListItem Text="male" Value="male" />
                                  <asp:ListItem Text="Female" Value="female" />
                                 
                                </asp:RadioButtonList>
                               
                                </div>


                                <div>

                               Catagory:<asp:DropDownList ID="ddcatagory" runat="server">
                                    <asp:ListItem Enabled="true" Text="Select Catagory" Value="-1"></asp:ListItem>
                                    <asp:ListItem Text="General" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Obc" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="sc" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="st" Value="4"></asp:ListItem>
                                </asp:DropDownList>

                               
                                </div>

                                <div>


                              <asp:CheckBoxList ID="CheckBoxList1" runat="Server">

                                <asp:ListItem>singing</asp:ListItem>
                                 <asp:ListItem>listening</asp:ListItem>
                                    <asp:ListItem>watching</asp:ListItem>
                                     <asp:ListItem>playing</asp:ListItem>
                                     </asp:CheckBoxList>


                                    </div>
                                <div class="checkbox">
                                    <br />
                                    <label>
                                       <asp:Button ID="btnregister" class="btn btn-lg btn-success btn-block"  
                                        runat="server"  Text="Register" ValidationGroup="sv" onclick="btnregister_Click" />

                                        <asp:Button ID="btnreset" class="btn btn-lg btn-success btn-block"  
                                        runat="server"  Text="Reset"  onclick="Reset_Click" />

                                   
                                    <br />
                                    <%--<asp:Button ID="btnregister" runat="server" Text="Button" 
                                        onclick="btnregister_Click" />
                                    <br />--%>

                                   
                                    </label>
                                    </br>
                                    

                                    <%--<label>

                                        <asp:Hyperlink ID="NavLink1" runat="server" NavigateUrl="<%#~/Register.aspx %>">Details</asp:Hyperlink>
                                    </label>
--%>
                                     
                                </div>
                                 <asp:Label ID="Label2" runat="server" Font-Size="X-Large"/>
                                <!-- Change this to a button or input when using this as a form -->
                            <%--    <a href="index.html" class="btn btn-lg btn-success btn-block">Login</a>--%>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

 
    </div>
    </form>
       <!-- jQuery Version 1.11.0 -->
    <script src="js/jquery-1.11.0.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="js/plugins/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/sb-admin-2.js"></script>
</body>
</html>
