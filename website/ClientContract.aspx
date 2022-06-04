<%@ Page Title="Client Memorandom Form | ITS Gwalior" MetaDescription="Client Memorandom Form of Its Gwalior" MetaKeywords="Client Memorandom Form" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="ClientContract.aspx.cs" Inherits="ClientContract" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

 
    <link href="css/jquery-te-1.4.0.css" rel="stylesheet" />
    <style type="text/css">
        .divModalBackground

{

filter: alpha(opacity=50); -moz-opacity:0.5; opacity: 0.5;

width:100%;

background-color: #999988;

position: absolute;

top: 0px; 

left: 0px;

z-index: 800;

}
    </style>
    <style type="text/css">
    .modal
    {
        position: fixed;
        top: 0;
        left: 0;
        background-color: black;
        z-index: 99;
        opacity: 0.8;
        filter: alpha(opacity=80);
        -moz-opacity: 0.8;
        min-height: 100%;
        width: 100%;
    }
    .loading
    {
        font-family: Arial;
        font-size: 10pt;
        border: 5px solid #67CFF5;
        width: 200px;
        height: 100px;
        display: none;
        position: fixed;
        background-color: White;
        z-index: 999;
    }
</style>

      <script type="text/javascript">       
     
        function CalculatDisc() {
            var totalAmt = document.getElementById('<%= txtPrjAmt.ClientID %>').value;          
            var AdvAmt = document.getElementById('<%= txtPrjAdvAmt.ClientID %>').value;        
            var dueAmt;
            if (totalAmt != "" && AdvAmt != "")
            {
                dueAmt = document.getElementById('<%= txtDueAmt.ClientID %>').value = parseFloat(totalAmt) - parseFloat(AdvAmt);           
             
            }
        }


        
function isNumberKey(evt)
{
          var charCode = (evt.which) ? evt.which : event.keyCode;
          if (charCode != 46 && charCode > 31 
            && (charCode < 48 || charCode > 57))
             return false;

          return true;
}
</script>
    <style type="text/css">
        .modal
        {
            position: fixed;
            top: 0;
            left: 0;
            background-color: black;
            z-index: 99;
            opacity: 0.8;
            filter: alpha(opacity=80);
            -moz-opacity: 0.8;
            min-height: 100%;
            width: 100%;
        }
        .loading
        {
            font-family: Arial;
            font-size: 10pt;
            border: 5px solid #67CFF5;
            width: 200px;
            height: 100px;
            display: none;
            position: fixed;
            background-color: White;
            z-index: 999;
        }
    </style>



            
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:HiddenField ID="hdfPartyId" runat="server" />
     <asp:HiddenField ID="hdfUserPass" runat="server" />


    <header class="rich-header page-header version1" data-parallax="true" id="header_d901_0">
                    <div class="parallax-container" id="div_d901_0">&nbsp;</div>

                    <div class="container nz-clearfix">
                        <div class="rh-content">

                            <h1>Client Memorandom Form</h1>

                            <div class="rh-separator">&nbsp;</div>
                            <div id="div_d901_1" class="nz-breadcrumbs nz-clearfix"><a href="default.aspx"  property="v:title">Home</a><span class="current">Client</span></div>
                        </div>
                    </div>
                    <div id="slider-arrow" data-target="#nz-target" data-from="90" data-offset="90" class="i-separator animate nz-clearfix"><i class="icon-arrow-down10"></i></div>
                </header>

                <div class="blog-layout-wrap standard sidebar-true" id="nz-target">

                    <div>
                        <div class="container nz-clearfix">
                       <%-- <form class="" name="customerData" action="ccavRequestHandler.aspx" method="post">
                        <input type="hidden" name="tid" id="tid" />
<input type="hidden" name="merchant_id" id="merchant_id" value="139453" />
<input type="hidden" name="order_id" id="oid"/>
<input type="hidden" name="currency" value="INR"/>
<input type="hidden" name="redirect_url" value="https://itsgwalior.com/ccavResponseHandler.aspx"/>
<input type="hidden" name="cancel_url" value="https://itsgwalior.com/ccavResponseHandler.aspx"/>--%>
                        
                         <div class="col12">
                                <div runat="server" id="alert" class="alert alert-success alert-dismissible fade show" visible="false">
            <asp:Label ID="lblMSG" class="alert-message" runat="server" Text=""></asp:Label>
            <span class="close-alert">X</span>
        </div>

                          <h3>Client Detail</h3>
                        <div class="sep-wrap element-animate element-animate-false nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_3605_3">&nbsp;</div>
                                                    </div>
                           


                              <div class="col3">
                       <label>Contact Person Name<span style="color:red">*</span></label>
    <asp:TextBox ID="txtContPersn" runat="server"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtContPersn"
                                            ErrorMessage="Please Enter Contact Person Name" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv11"
                                            Display="None">*</asp:RequiredFieldValidator>
                                        
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender6" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator6" WarningIconImageUrl="~/images/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
                        </div>
                          <div class="col3">
                          <label>Mobile No (without 0 or +91)<span style="color:red">*</span></label>
          <asp:TextBox ID="txtMobNo" runat="server"  MaxLength="10"></asp:TextBox>
                           <%--   <span>Enter Mobile No without 0 or +91 </span>--%>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMobNo"
                                            ErrorMessage="Please Enter Your Mobile No" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv11"
                                            Display="None">*</asp:RequiredFieldValidator>
                                        
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2" WarningIconImageUrl="~/images/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
                        </div>
                          <div class="col3">
                          <label>Email ID<span style="color:red">*</span></label>
           <asp:TextBox ID="txtEmailID" runat="server"></asp:TextBox>
                              <p></p>




             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmailID"
                                            ErrorMessage="Please Enter Your Email ID" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv11"
                                            Display="None">*</asp:RequiredFieldValidator>                                 



                                <asp:RegularExpressionValidator ID="revEmail" runat="server" ClientIDMode="Static"
                            SetFocusOnError="true" ControlToValidate="txtEmailID" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                            ErrorMessage="Please Enter Valid Email Address" ValidationGroup="sv" Display="None"></asp:RegularExpressionValidator>

                            <asp:ValidatorCalloutExtender ID="ValCalEmailAddress" runat="server" Enabled="True"
                            TargetControlID="revEmail" WarningIconImageUrl="~/images/wrning.gif">
                         </asp:ValidatorCalloutExtender>




                        </div>


                              <div class="col3">
                       <label>Company/Organization Name<span style="color:red">*</span></label>
    <asp:TextBox ID="txtCustName" runat="server"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCustName"
                                            ErrorMessage="Please Enter Company/Organization Name" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv11"
                                            Display="None">*</asp:RequiredFieldValidator>
                                        
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1" WarningIconImageUrl="~/images/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
                        </div>

                  <div class="col3">
                          <label>GST No.</label>
           <asp:TextBox ID="txtgstNumber" runat="server"></asp:TextBox>
                        </div>

                          <div class="col3">
                          <label>Country</label>                             
                          
                          <asp:DropDownList ID="ddlCountry" runat="server">                                           
                          </asp:DropDownList>                            

                        </div>
                           <%--  <div style="clear:both"></div>--%>


                       <div class="col3">
                          <label>Address</label>
           <asp:TextBox ID="txtAddr" runat="server"></asp:TextBox>
                        </div>
                          <div class="col3">
                          <label>Pin Code</label>
           <asp:TextBox ID="txtZipCode" runat="server"></asp:TextBox>
                        </div> </div>
                          <div class="col12">
      <h3>Project Detail</h3>
                        <div class="sep-wrap element-animate element-animate-false nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_3605_3">&nbsp;</div>
                                                    </div>
                              <div class="col12">
                       <label>Project Description<span style="color:red">*</span></label>

                               
 <asp:TextBox ID="txtPrjDesc" TextMode="MultiLine" runat="server" CssClass="textEditor"
           ></asp:TextBox>



                                  <asp:HiddenField ID="hdText" runat="server" />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPrjDesc"
                                            ErrorMessage="Please Enter Project Description" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv11"
                                            Display="None">*</asp:RequiredFieldValidator>
                                        
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator4" WarningIconImageUrl="~/images/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
                        </div>
   <div class="col12">
      OR
       </div>
                               <div class="col4">
                                     <label>Project Document File</label>
                                   <asp:FileUpload ID="fuPrjDocFile" runat="server" />
                                   <asp:HiddenField ID="hdfPrjDocFile" runat="server" />
                                   </div>
                                
                              <div class="col4">
                       <label>Client Address Proof</label>
                                  <asp:FileUpload ID="fuClntAddrProof" runat="server" />
                                   <asp:HiddenField ID="hdfClntAddrPrf" runat="server" />
                        </div>
                              <div class="col4">
                       <label>Company Registration</label>
                                  <asp:FileUpload ID="fuCompReNo" runat="server" />
                                   <asp:HiddenField ID="hdfCompReg" runat="server" />
                        </div>
                              <div class="col3">
                       <label>Project Amount<span style="color:red">*</span></label>
    <asp:TextBox ID="txtPrjAmt" onkeypress="return isNumberKey(event)" onblur="javascript:Calculat();" runat="server"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPrjAmt"
                                            ErrorMessage="Please Enter Project Amount" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv11"
                                            Display="None">*</asp:RequiredFieldValidator>
                                        
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator5" WarningIconImageUrl="~/images/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
                        </div>
                                   <div class="col3">
                       <label>Project Advance Amount</label>
    <asp:TextBox ID="txtPrjAdvAmt" onkeypress="return isNumberKey(event)"  onblur="javascript:Calculat();"  runat="server"></asp:TextBox>

         
    
                        </div>

               <div class="col3">
                       <label>Due Amount</label>
                              <asp:TextBox ID="txtDueAmt"  onkeypress="return isNumberKey(event)" onblur="CalculatDisc()" runat="server" ></asp:TextBox>   
    
                        </div>

                               <div class="col3">
                       <label>Payment Mode</label>
                                   <asp:DropDownList ID="ddlPayMode" runat="server"></asp:DropDownList>
    
                        </div>
                           
                             
                               <div class="col12">
                                   <asp:CheckBox ID="chkTermsCond" runat="server" />
                                   We accept Terms & Conditions<span style="color:red">*</span>  <a href="Company/terms-conditions.aspx" target="_blank">Click here to View</a>
                                    <asp:CustomValidator id="vTerms"
                ClientValidationFunction="validateTerms" 
                ErrorMessage="<br/>Please Accept Terms and Conditions." 
                ForeColor="Red"
                Display="Static"
                EnableClientScript="true"
                ValidationGroup="sv11"
                runat="server"/>

                        </div>
               <%--<asp:Button ID="Button1" runat="server" Text="Submit" CausesValidation="true" onclick="lbtnSubmit_Click" ValidationGroup="sv" />--%>
                           <asp:LinkButton ID="lbtnSubmit"  
                                     class="button button-ghost blue full-false medium square icon-true animate-false anim-type-ghost hover-side element-animate-false"  
                                      ValidationGroup="sv11" runat="server" OnClientClick="DisableLink()" onclick="lbtnSubmit_Click">Submit</asp:LinkButton>
                                     </div>
                        
                        <%-- </form>--%>
                            <section class="main-content left">
                                <section class="content lazy blog-layout nz-clearfix">
                                    <div class="blog-post blog-post-1 nz-clearfix">   
                                                                                                                  
                                    </div>
                                </section>
                                
                            </section>
                            <aside class="sidebar">
                                <aside class='blog-widget-area widget-area'>
<!--
                                    <div id="search-3" class="widget widget_search">
                                        <form action="http://ninzio.com/montserrat//" method="get">
                                            <fieldset>
                                                <input type="text" name="s" placeholder="Search for..." value="Search for..." />
                                                <input type="submit"  value="Search" />
                                            </fieldset>
                                        </form>
                                    </div>
-->
                                   
                                   
                                </aside>
                            </aside>

                        </div>
                    </div>

                </div>
   <div class="loading" align="center">
    Loading. Please wait.<br />
    <br />
    <img src="images/loading.gif" alt="" />
</div>

     <script>
         
    function validateTerms(source, arguments) {
        var $c = $('#<%= chkTermsCond.ClientID %>');
        if($c.prop("checked")){
            arguments.IsValid = true;
        } else {
            arguments.IsValid = false;
        }
    }
</script>  





      <script>
    function validateTerms(source, arguments) {
        var $c = $('#<%= chkTermsCond.ClientID %>');
        if($c.prop("checked")){
            arguments.IsValid = true;
        } else {
            arguments.IsValid = false;
        }
    }
</script>  


  <script src="js/jquery-1.10.2.min.js"></script>
<script src="js/jquery-te-1.4.0.min.js"></script>
   
<script language="javascript" type="text/javascript">  
    $('.textEditor').jqte();
$(".textBox2").jqte({  
     blur: function() {  
         
     }  
});
function ClientSideClick(myButton) {
    // Client side validation
    if (typeof (Page_ClientValidate) == 'function') {
        if (Page_ClientValidate() == false)
        { return false; }
    }

    //make sure the button is not of type "submit" but "button"
    if (myButton.getAttribute('type') == 'button') {
        // disable the button
        myButton.disabled = true;
        myButton.className = "btn btn-info disabled";
        myButton.value = "processing...";
    }
    return true;
}
</script> 
     <%--<script type="text/javascript">
        function ShowProgress() {
            setTimeout(function () {
                var modal = $('<div />');
                modal.addClass("modal");
                $('body').append(modal);
                var loading = $(".loading");
                loading.show();
                var top = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
                var left = Math.max($(window).width() / 2 - loading[0].offsetWidth / 2, 0);
                loading.css({ top: top, left: left });
            }, 50);
        }
        $('[id*=lbtnSubmit]').live("click", function () {
            ShowProgress();
        });
    </script>--%>
    <script language="javascript" type="text/javascript">

    function DisableLink() {
        var yesLink = document.getElementById('<%=lbtnSubmit.ClientID %>');
        
        yesLink.disabled = true;
        
    }

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_pageLoaded(pageLoaded);
    function pageLoaded(sender, args) {
        var yesLink = document.getElementById('<%=lbtnSubmit.ClientID %>');
        
        yesLink.disabled = false;
        
    }

</script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
    function ShowProgress() {
        setTimeout(function () {
            var modal = $('<div />');
            modal.addClass("modal");
            $('body').append(modal);
            var loading = $(".loading");
            loading.show();
            var top = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
            var left = Math.max($(window).width() / 2 - loading[0].offsetWidth / 2, 0);
            loading.css({ top: top, left: left });
        }, 200);
    }
    $('[id*=lbtnSubmit]').live("submit", function () {
        //alert("hii");
        ShowProgress();
    });
</script>
</asp:Content>

