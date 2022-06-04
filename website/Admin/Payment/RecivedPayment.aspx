<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="RecivedPayment.aspx.cs" Inherits="Admin_Payment_AddPayment" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function Calculat() {
              var ddl = document.getElementById("<%=drdPaymentMode.ClientID%>");
            var SelVal = ddl.options[ddl.selectedIndex].text;
            var RvAmt = document.getElementById('<%= txtRAmt.ClientID %>').value;
           // var DueAmt = 
            var DisAmt = document.getElementById('<%= txtDisAmt.ClientID %>').value;
            var TDueAmt = document.getElementById('<%= lblDueAmt.ClientID %>').innerHTML;
            var DueAmt = 0;
          
            //DropDown Work Proper
              if (SelVal == "Cash") {
                document.getElementById('<%= txtBName.ClientID %>').value = " ";
                document.getElementById('<%= txtIFSC.ClientID %>').value = " ";
                document.getElementById('<%= txtBCheque.ClientID %>').value = " ";
                var BName = document.getElementById("BName");
                BName.style.display = "none";

                var CQNo = document.getElementById("CQNo");
                CQNo.style.display = "none";

                var IfscDiv = document.getElementById("IfscDiv");
                IfscDiv.style.display = "none";
  if(RvAmt != 0)
            {
                DueAmt = TDueAmt - RvAmt;
                if(DisAmt != 0)
                {
                    DueAmt=DueAmt-DisAmt;
                }  
                document.getElementById('<%= txtDuAmt.ClientID %>').value=DueAmt;
            }
                else {

                }


            }
            else if (SelVal == "Bill") {
                document.getElementById('<%= txtBName.ClientID %>').value = " ";
                document.getElementById('<%= txtIFSC.ClientID %>').value = " ";
                document.getElementById('<%= txtBCheque.ClientID %>').value = " ";
                var BName = document.getElementById("BName");
                BName.style.display = "none";

                var CQNo = document.getElementById("CQNo");
                CQNo.style.display = "none";

                var IfscDiv = document.getElementById("IfscDiv");
                IfscDiv.style.display = "none";
               if(RvAmt != 0)
            {
                DueAmt = TDueAmt - RvAmt;
                if(DisAmt != 0)
                {
                    DueAmt=DueAmt-DisAmt;
                }  
                document.getElementById('<%= txtDuAmt.ClientID %>').value=DueAmt;
            }
                else {

                }
            

            }
            else if (SelVal == "Bank Cheque") {
                var BName = document.getElementById("BName");
                BName.style.display = "block";

                var CQNo = document.getElementById("CQNo");
                CQNo.style.display = "block";

                var IfscDiv = document.getElementById("IfscDiv");
                IfscDiv.style.display = "block";
             if(RvAmt != 0)
            {
                DueAmt = TDueAmt - RvAmt;
                if(DisAmt != 0)
                {
                    DueAmt=DueAmt-DisAmt;
                }  
                document.getElementById('<%= txtDuAmt.ClientID %>').value=DueAmt;
            }
                else {

                }

            }
            else {
                var Countt = document.getElementById('<%= hdfCount.ClientID %>').value;
                if (Countt == 0) {
                    //                    alert(Countt);
                    var count = 1;
                    document.getElementById('<%= hdfCount.ClientID %>').value = count;
                    document.getElementById('<%= drdPaymentMode.ClientID %>').focus();
                    alert("Please select payment mode");
                }
                else {
                    document.getElementById('<%= hdfCount.ClientID %>').value = 1;
                }
            }
            //End DropDown Work
        }


        //function ShowHideTextBox(ddlId)
        //{
        //    var ddl = document.getElementById(ddlId.id);

        //    if (ddl.value == 1)  //your condition
        //    {
        //        document.getElementById('txtBName').style.display = 'none';
        //    }
        //    else {
        //        document.getElementById('txtBName').style.display = '';

        //    }
        //}


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdfPartyID" runat="server" />    <asp:HiddenField ID="hdfVoucerMST" runat="server" />
    <asp:HiddenField ID="hdfVch" runat="server" />
    <asp:HiddenField ID="hdfoThCHar" runat="server" />
    <asp:HiddenField ID="hdfPartyTpID" runat="server" />
    <asp:HiddenField ID="hdfSaleVID" runat="server" />
    <asp:HiddenField ID="hdfVDID" runat="server" /> <asp:HiddenField ID="hdfCount" runat="server" />
    <!--------------------
                START - Breadcrumbs
                -------------------->
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Received Payment</a></li>
        <%--<li class="breadcrumb-item"><span>Laptop with retina screen</span></li>--%>
    </ul>
    <!--------------------
                END - Breadcrumbs
                -------------------->
    <div class="content-panel-toggler"><i class="os-icon os-icon-grid-squares-22"></i><span>Sidebar</span></div>
    <div class="content-i">
        <div class="content-box">
            <div class="row">
                <div class="col-sm-12">
                    <div class="element-wrapper">
                        <div class="element-box">
                            <h5 class="form-header">Received Payment</h5>
                            <%--<div class="form-group">
                                    <label for="">Email address</label><input class="form-control" data-error="Your email address is invalid" placeholder="Enter email" required="required" type="email"><div class="help-block form-text with-errors form-control-feedback"></div>
                                </div>--%>
                            <div id="alert" runat="server" visible="false" class="alert alert-success" style="padding: 10px;">
                                <asp:Label ID="lblMSG" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="">Select Party</label>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <asp:DropDownList ID="drdParty" CssClass="form-control" runat="server">
                                                    <asp:ListItem Text="--Select Party--" Value="0"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-sm-6">
                                                <asp:Button ID="btnSerParty" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSerParty_Click" />

                                            </div>
                                        </div>
                                        <div class="help-block form-text text-muted form-control-feedback">Search Party Name</div>
                                    </div>
                                    <div class="form-group">
                                        <label for="">Receive No.</label>
                                        <asp:Label ID="lblinVoice" runat="server" class="form-control" Text=""></asp:Label>
                                        <div class="help-block form-text text-muted form-control-feedback">Receive No.</div>
                                    </div>
                                    <div class="form-group">
                                        <label for="">Receive Payment Date</label>
                                        <asp:TextBox ID="txtReceiveeD" class="form-control" placeholder="Select Receive Date" runat="server"></asp:TextBox>
                                        <asp:CalendarExtender ID="caljobopenDate" runat="server" ClientIDMode="Static" TargetControlID="txtReceiveeD" Format="dd-MM-yyyy"></asp:CalendarExtender>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtReceiveeD"
                                            ErrorMessage="Please Select Date" ForeColor="Red" SetFocusOnError="True" ValidationGroup="svv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" runat="server" Enabled="True"
                                            TargetControlID="RequiredFieldValidator5" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>
                                        <div class="help-block form-text text-muted form-control-feedback">Receive Date</div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="element-box" style="background: #F2F4F8;">
                                        <h5 class="form-header">Party Details</h5>

                                        <div class="table-responsive">
                                            <table class="table table-lightborder">
                                                <tbody>
                                                    <tr>
                                                        <td>Name :-</td>
                                                        <td>
                                                            <asp:Label ID="lblPartyN" runat="server" Text=""></asp:Label>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Mobile No.:-</td>
                                                        <td>
                                                            <asp:Label ID="lblPmob" runat="server" Text=""></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Email-ID:-</td>
                                                        <td>
                                                            <asp:Label ID="lblEmailID" runat="server" Text=""></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Address :-</td>
                                                        <td>
                                                            <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <fieldset class="form-group">
                                <legend><span>Service</span></legend>
                                <div class="col-sm-12">
                                    <div class="table-responsive">
                                        <asp:GridView ID="gvDetails" runat="server" CssClass="table table-striped table-bordered table-hover"
                                            EmptyDataText="Result Not Found" Width="100%" AllowPaging="true" PageSize="10"
                                            AutoGenerateColumns="false" OnRowDataBound="gvDetails_RowDataBound">
                                            <Columns>
                                                <%-- ShowFooter="true"--%>
                                                <asp:TemplateField HeaderText="S No." HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                    <ItemTemplate>

                                                        <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText="Service Type" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">

                                                    <ItemTemplate>
                                                        <asp:Label ID="lblItem_Amount" runat="server" Text='<%#Eval("CategoryName") %>' />
                                                    </ItemTemplate>

                                                </asp:TemplateField>



                                                <asp:TemplateField HeaderText="Service" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">

                                                    <ItemTemplate>
                                                        <%#Eval("SubCategoryN") %>
                                                    </ItemTemplate>

                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Service Price" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">

                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTAmt" runat="server" Text='<%#Eval("Total_Amount") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    
                                                </asp:TemplateField>

                                                <%--<asp:TemplateField HeaderText="Gst %">

                                                    <ItemTemplate>
                                                        <%#Eval("Gst")%>
                                                    </ItemTemplate>

                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Gst Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblGSTPrice" runat="server" Text='<%#Eval("Gst_Amount") %>'></asp:Label>
                                                    </ItemTemplate>
                                                 
                                                </asp:TemplateField>--%>
                                                <asp:TemplateField HeaderText="Deposite Amount" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDposit" runat="server" Text='<%#Eval("DepositAmt") %>' />
                                                    </ItemTemplate>                                                 
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="DueAmt" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDueAmt" runat="server" Text='<%#Eval("DueAmt") %>' />
                                                    </ItemTemplate>                                                 
                                                </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Payment" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                    <asp:HiddenField ID="hdfVCID" Value='<%#Eval("VoucherMasterID")%>' runat="server" />
                                                                    <asp:ImageButton ID="imgbtnPayment" runat="server" ImageAlign="Middle" OnClick="Edit"
                                                                        ToolTip="Payment" ImageUrl="~/Admin/img/rupay.png" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <div id="PayDiv" runat="server" visible="false">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="element-box el-tablo" style="background: #88D1F0;">
                                            <div class="label" style="font-weight: bolder">
                                                Total Amount
                                            </div>
                                            <div class="value">
                                                <i class="fa fa-inr"></i>
                                                <asp:Label ID="lblTAmt" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div class="trending trending-up" style="background: none; font-size: 5.72rem;">
                                                <span class="fa fa-sort-amount-asc"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="element-box el-tablo" style="background: #88D1F0;">
                                            <div class="label" style="font-weight: bolder">
                                                Deposit Amount
                                            </div>
                                            <div class="value">
                                                <i class="fa fa-inr"></i>
                                                <asp:Label ID="lblDpAmt" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div class="trending trending-up" style="background: none; font-size: 5.72rem;">
                                                <span class="fa fa-money"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="element-box el-tablo" style="background: #88D1F0;">
                                            <div class="label" style="font-weight: bolder">
                                                Due Amount
                                            </div>
                                            <div class="value">
                                                <i class="fa fa-inr"></i>
                                                <asp:Label ID="lblDueAmt" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div class="trending trending-up" style="background: none; font-size: 5.72rem;">
                                                <span class="fa fa-arrow-down"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <fieldset class="form-group">
                                        <legend><span>Payment</span></legend>
                                        <div class="row">
                                             <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="">
                                                        Payment Mode <i class="icon-question" data-placement="right" data-toggle="tooltip"
                                                            title="" type="button" data-original-title="please select any one payment mode ">
                                                        </i>
                                                    </label>
                                                    <asp:DropDownList ID="drdPaymentMode" onblur="javascript:Calculat();"
                                                        onchange="ddl_changed(this.value)" CssClass="form-control" runat="server"
                                                        >
                                                      <asp:ListItem Value="0">-Select Payment Mode-</asp:ListItem>
                                                        <asp:ListItem Text="Cash" Value="1">Cash</asp:ListItem>
                                                        <asp:ListItem Text="Bill" Value="3">Bill</asp:ListItem>
                                                        <asp:ListItem Text="BankCheque" Value="4">Bank Cheque</asp:ListItem>
                                                         <asp:ListItem Text="Online Payment" Value="5">Online Payment</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <script type="text/javascript">
                                                        function ddl_changed(ddl) {
                                                            document.getElementById('<%= txtBName.ClientID %>').value = " ";
                                                            document.getElementById('<%= txtIFSC.ClientID %>').value = " ";
                                                            document.getElementById('<%= txtBCheque.ClientID %>').value = " ";

                                                            var ddl = document.getElementById('<%= drdPaymentMode.ClientID %>');
                                                           // alert(ddl[ddl.selectedIndex].value);
                                                            //if (ddl.value == '1')  //your condition
                                                            if (ddl[ddl.selectedIndex].value == "5")
                                                            {
                                                                
                                                               <%-- document.getElementById('<%= txtDisAmt.ClientID %>').style.display = 'none';--%>
                                                                
                                                                
                                                                var refdiv = document.getElementById("refdiv");
                                                                refdiv.style.display = "block";
                                                                var IfscDiv = document.getElementById("IfscDiv");
                                                                IfscDiv.style.display = "none";
                                                                var BName = document.getElementById("BName");
                                                                BName.style.display = "none";
                                                                var CQNo = document.getElementById("CQNo");
                                                                CQNo.style.display = "none";

                                                            }
                                                            else if (ddl[ddl.selectedIndex].value == "4")
                                                                {
                                                               var refdiv = document.getElementById("refdiv");
                                                               refdiv.style.display = "none";
                                                               var BName = document.getElementById("BName");
                                                               BName.style.display = "block";
                                                               var IfscDiv = document.getElementById("IfscDiv");
                                                               IfscDiv.style.display = "block";
                                                               var CQNo = document.getElementById("CQNo");
                                                               CQNo.style.display = "block";

                                                            }
                                                        }
                                                    </script>
                                                </div>
                                            </div>
                                            <div class="col-md-4" id="BName" style="display: none;">
                                                <div class="form-group">
                                                    <label for="">
                                                        Bank Name</label>
                                                    <asp:TextBox ID="txtBName" CssClass="form-control" Width="100%" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4" id="IfscDiv" style="display: none;">
                                                <div class="form-group">
                                                    <label for="">
                                                        IFSC Code</label>
                                                    <asp:TextBox ID="txtIFSC" CssClass="form-control" Width="100%" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4" id="CQNo" style="display: none;">
                                                <div class="form-group">
                                                    <label for="">
                                                        Bank Cheque No
                                                    </label>
                                                    <asp:TextBox ID="txtBCheque" CssClass="form-control" Width="100%" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">
                                                        Received Amount</label>
                                                    <asp:TextBox ID="txtRAmt" onblur="javascript:Calculat();" CssClass="form-control"
                                                        runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">
                                                        Due Amount</label>
                                                    <asp:TextBox ID="txtDuAmt" onkeyPress="return false;" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">
                                                        Discount Amount</label>
                                                    <asp:TextBox ID="txtDisAmt" onblur="javascript:Calculat();" CssClass="form-control"
                                                        runat="server"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col-md-4" id="refdiv" style="display: none;">
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">
                                                        Ref no</label>
                                                    <asp:TextBox ID="Txtrefno"  CssClass="form-control"
                                                        runat="server"></asp:TextBox>
                                                </div>
                                            </div>



                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">
                                                        Submit Query</label>
                                                    <asp:TextBox ID="txtSubQ" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>
                                                <div class="col-md-12" style="text-align: center;">
                                                    <asp:Button ID="btnPayment" CssClass="btn btn-primary" OnClick="btnPayment_Click" runat="server" Text="Submit" />
                                                </div>
                                                <br />

                                                <div class="table-responsive">
                                                    <asp:GridView ID="grdPayD" class="table table-bordered table-responsive table-hover"
                                                        runat="server" AutoGenerateColumns="false" PagerSettings-Visible="false" OnRowDataBound="grdPayD_RowDataBound" Width="100%">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="sno." HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbSN" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Receipt No." HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                                <ItemTemplate>
                                                                    <%#Eval("RecipNo")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Total Amount" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                                <ItemTemplate>
                                                                    <asp:HiddenField ID="hdfPartyID" runat="server" Value='<%#Eval("Party_Id")%>' />
                                                                    <asp:Label ID="lblTamount" runat="server" Text='<%#Eval("Total")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Deposit Amount" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDpAmt" runat="server" Text='<%#Eval("DepositAmt")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Due amount" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDUAmt" runat="server" Text='<%#Eval("DueAmt")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Discount Amount" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDiscount" runat="server" Text='<%#Eval("DiscountAmount")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Payment Mode" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                                <ItemTemplate>
                                                                    <%#Eval("PaymentMode")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Payment Date" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                                <ItemTemplate>
                                                                    <%#Eval("Date", "{0:dd/MM/yyyy}")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Print Receipt" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                                                <HeaderStyle />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                    <asp:HiddenField ID="hdfPayMID" runat="server" Value='<%#Eval("Trans_Id")%>' />
                                                                    <asp:HiddenField ID="hdfWorkTransID" runat="server" Value="" />
                                                                    <asp:HiddenField ID="hdfTAmt" runat="server" Value='<%#Eval("Total")%>' />
                                                                    <asp:HiddenField ID="hdfDueAmt" runat="server" Value='<%#Eval("DueAmt")%>' />
                                                                    <asp:ImageButton ID="imgbtnEdit" runat="server" ImageAlign="Middle"
                                                                        ToolTip="Edit" ImageUrl="~/img/Print_ICO.png" OnClick="Printf" />
                                                                    </button><%----%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                        </Columns>
                                                    </asp:GridView>

                                                </div>
                                                <div class="col-md-12">
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            Total Amount:-
                                                            <asp:Label ID="lblVTAmt" runat="server" Text="Label"></asp:Label>
                                                        </div>
                                                        <div class="col-md-3">
                                                            Total Received :-
                                                            <asp:Label ID="lblVDpAmt" runat="server" Text="Label"></asp:Label>
                                                        </div>
                                                        <div class="col-md-3">
                                                            Discount Amount:-<asp:Label ID="lblVDis" runat="server" Text="Label"></asp:Label>
                                                        </div>
                                                        <div class="col-md-3">
                                                            Due Amount :-
                                                            <asp:Label ID="lblVDue" runat="server" Text="Label"></asp:Label>
                                                        </div>

                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
</div>
                            </fieldset>

                            <%--   <div class="form-buttons-w">
                                <asp:Button ID="btnSubMitSaleV" CssClass="btn btn-primary" runat="server" Text="Submit" />
                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
    <script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

