<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PaymentConfirmation.aspx.cs"
    Inherits="Buyer_PaymentConfirmation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .btn {
  background: #3498db;
  background-image: -webkit-linear-gradient(top, #3498db, #2980b9);
  background-image: -moz-linear-gradient(top, #3498db, #2980b9);
  background-image: -ms-linear-gradient(top, #3498db, #2980b9);
  background-image: -o-linear-gradient(top, #3498db, #2980b9);
  background-image: linear-gradient(to bottom, #3498db, #2980b9);
  -webkit-border-radius: 28;
  -moz-border-radius: 28;
  border-radius: 28px;
  font-family: Arial;
  color: #ffffff;
  font-size: 20px;
  padding: 10px 20px 10px 20px;
  text-decoration: none;
}

.btn:hover {
  background: #3cb0fd;
  background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
  background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
  text-decoration: none;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField ID="hdfOrderId" runat="server" />
    <center>
    <div>
    
        <img src="~/upload/Logo.png" runat="server" alt="" width="200" height="70" /><br />
        <div id="ConfMsg">
        <p>Thank You for Using The ITS Gwalior Service <br/><br />

            <asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true" Font-Size="Medium" ForeColor="Green"></asp:Label>
        </p>
        <br />
        
            
            <asp:Button ID="btnHome" runat="server" Text="Back To Home" CssClass="btn" 
                onclick="btnHome_Click" />
        
        </div>

    </div>
    </center>
    </form>
</body>
</html>
