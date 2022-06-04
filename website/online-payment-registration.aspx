<%@ Page Title="Online Payment | ITS Gwalior" MetaDescription="online payment for ITS Gwalior" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="online-payment-registration.aspx.cs" Inherits="OnlinePaymentRegistration" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
<script>
    //window.onload = function () {
    //    var d = new Date().getTime();
    //    document.getElementById("tid").value = d;
    //};
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<header class="rich-header page-header version1" data-parallax="true" id="header_d901_0">
                    <div class="parallax-container" id="div_d901_0">&nbsp;</div>

                    <div class="container nz-clearfix">
                        <div class="rh-content">

                            <h1>Online Payment</h1>

                            <div class="rh-separator">&nbsp;</div>
                            <div id="div_d901_1" class="nz-breadcrumbs nz-clearfix"><a href="default.aspx"  property="v:title">Home</a><span class="current">Payment</span></div>
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
                        <h3>Payment Detail</h3>
                        <div class="sep-wrap element-animate element-animate-false nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_df14_14">&nbsp;</div>
                                                    </div>
                           
                            <div class="col6">
                             <label>Enter Amount</label>
    <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAmount"
                                            ErrorMessage="Please Enter Amount" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                        
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator5" WarningIconImageUrl="~/images/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
                            </div>
                            <div class="col6">
                            </div>
                            
                        </div>
                         <div class="col12">
                          <h3>Customer Detail</h3>
                        <div class="sep-wrap element-animate element-animate-false nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_3605_3">&nbsp;</div>
                                                    </div>
                            <div class="col6">
                       <label>Customer Name</label>
    <asp:TextBox ID="txtCustName" runat="server"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCustName"
                                            ErrorMessage="Please Enter Your Name" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                        
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1" WarningIconImageUrl="~/images/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
                        </div>
                          <div class="col6">
                          <label>Mobile No</label>
          <asp:TextBox ID="txtMobNo" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMobNo"
                                            ErrorMessage="Please Enter Your Mobile No" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                        
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2" WarningIconImageUrl="~/images/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
                        </div>
                          <div class="col6">
                          <label>Email ID</label>
           <asp:TextBox ID="txtEmailID" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmailID"
                                            ErrorMessage="Please Enter Your Email ID" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                        
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3" WarningIconImageUrl="~/images/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
                        </div>
                          <%--<div class="col6">
                          <label>Country</label>
                                            <asp:DropDownList ID="ddlCountry" runat="server" 
                                  onselectedindexchanged="ddlCountry_SelectedIndexChanged1" AutoPostBack="true">
                                           
                                            </asp:DropDownList>

                        </div>
                        <div class="clearfix"></div>
                      
                            <div class="col6">
                       <label>State</label>
                      
                                                <asp:DropDownList ID="ddlState" runat="server">
                                                <asp:ListItem>Select</asp:ListItem>
                                                </asp:DropDownList>
                        </div>
                          <div class="col6">
                          <label>City</label>
          <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                        </div>--%>
                          <div class="col6">
                          <label>Address</label>
           <asp:TextBox ID="txtAddr" runat="server"></asp:TextBox>
                        </div>
                          <div class="col6">
                          <label>Zip Code</label>
           <asp:TextBox ID="txtZipCode" runat="server"></asp:TextBox>
                        </div>
                          <div class="col12">
               <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click1"/>

                       <%--    <asp:LinkButton ID="lbtnSubmit"  
                                     class="button button-ghost blue full-false medium square icon-true animate-false anim-type-ghost hover-side element-animate-false"  
                                     ValidationGroup="sv" runat="server" onclick="lbtnSubmit_Click">Submit</asp:LinkButton>--%>
                                     </div>
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
</asp:Content>

