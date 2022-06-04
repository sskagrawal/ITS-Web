<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RazorpayCallBack.aspx.cs" Inherits="RazorpayCallBack" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        
            
            <asp:Button ID="btnHome" runat="server" Text="Back To Home" CssClass="btn btn-primary" 
                onclick="btnHome_Click" />
        
        </div>

    </div>
    </center>
    </form>
</body>
</html>
