<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintReciept.aspx.cs" Inherits="PrintReciept" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Print Reciept</title>
        <style type="text/css">
   body {
        /*height: 842px;*/
        width: 40%;
        /* to centre page on screen*/
        margin-left: auto;
        margin-right: auto;
    }
    </style>
    <script type="text/javascript">
        function Print(elementId) {

            var printContent = document.getElementById(elementId);

            var windowUrl = 'about:blank';

            var uniqueName = new Date();

            var windowName = 'Print' + uniqueName.getTime();

            var printWindow = window.open(windowUrl, windowName, 'left=500,top=500,width=300,height:300,margin-left: auto,margin-right:auto');

            printWindow.document.write(printContent.innerHTML);

            printWindow.document.close();

            printWindow.focus();

            printWindow.print();

            printWindow.close();

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>

<asp:HiddenField ID="hdfRegID" runat="server" />
<center>
        <div>
            
            <asp:HiddenField ID="hdfBillNo" runat="server" />
            <div align="center" id="PrintReceipt">
                <div>
                <div style="width:100%;padding:4px">
                   <div style="text-align:center">
                        
                                    <br />
                         <div style="font-size: 15px">
                                      <strong style="font-size:20px">Its Gwalior</strong></div>
                                    <div style="font-size: 14px">
                                   15-D Parsadi Pura behind of M.E.S. Power house 
                                        <br />
                                        Mob:+91 89890-24130 <br />
                                      
                                    </div>
                   </div>
                   <br />
                   <div style="text-align:center">
                    <table align="right" width="100%">
                        <tr>
                         <td>
                                Reciept No
                            </td>
                            <td>
                                <div>
                                    <asp:Label ID="lblBillNo" runat="server" Text=""></asp:Label></div>
                            </td>
                        <td>
                              Payment Date
                            </td>
                            <td>
                                <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                       
                         <tr>
                            <td>
                                Party Name
                            </td>
                            <td>
                                <div>
                                   
                                    
                                    <asp:Label ID="lblCustName" runat="server" Text=""></asp:Label>
                                    
                                    </div>
                            </td>
                             <td>
                                Mobile No
                            </td>
                            <td>
                                <div>
                                    <asp:Label ID="lblMobNo" runat="server" Text=""></asp:Label></div>
                            </td>
                        </tr>
                        
                        
                    </table>
                   </div>

                </div>
                   <div style="clear:both">
                    
                  <br />
                    <table style="" width="100%" border="1">
                        <tr>
                            <td>Particular</td>
                            
                            <td style="text-align:center">Amount</td>
                        </tr>
                        <tr style="height:70px">
                            <td style="width:80%;">
                                <asp:Label ID="lblParticular" runat="server" Text=""></asp:Label></td>
                                <td style="width:20%;text-align:center">
                                    <asp:Label ID="lblPartAmount" runat="server" Text=""></asp:Label></td>
                        </tr>
                    </table>

                    
                    <div style="" id="DivFinalBillDetails">
                        <table style="width: 100%;" cellspacing="0">
                        <tr bgcolor="#F0F0F0">
                            <td width="10%" cellspacing="10">
                                 
                                <div><strong>Declaration : </strong>    
                                <p> All disputes subject to the<br /> Jurisdiction of Gwalior Court Only</p></div>
                           
                            </td>
                            <td width="10%">
                             <table style="width: 100%;" cellspacing="10">
                                <tr bgcolor="#F0F0F0">
                                
                                <td align="right" width="50%" valign="middle">
                                   Total Amount:
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Admin/img/rupay.png" style="width:15px;height:10px"/>
                                    <asp:Label ID="lblAmount" runat="server" Text="0.00"></asp:Label>
                                </td>
                               
                            </tr>
                            <tr>
                                 <td align="right" width="50%" valign="middle">Received Amount:
                                  <asp:Image ID="Image2" runat="server" ImageUrl="~/Admin/img/rupay.png" style="width:15px;height:10px"/> 
                                <asp:Label ID="lblRAmt" runat="server" Text="0.00"></asp:Label>
                                </td>
                            </tr>
                             <tr>
                                 <td align="right" width="50%" valign="middle">Due Amount:
                                  <asp:Image ID="Image3" runat="server" ImageUrl="~/Admin/img/rupay.png" style="width:15px;height:10px"/> 
                                <asp:Label ID="DueAmt" runat="server" Text="0.00"></asp:Label>
                                </td>
                            </tr>
                          
                           
                           
                            </table>
                            </td>
                        </tr>
                            
                         
                        </table>
                    </div>
                    </div>
                </div>
            </div>
            <div style="clear:both; text-align: center">
              <a href="RecivedPaymentList.aspx">Back To Home</a>  <input id="btnPrint" type="button" value="Print" onclick="Print('PrintReceipt')" />
            </div>
            
        </div>
    </center>
    </div>
    </form>
</body>
</html>
