<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="change-password.aspx.cs" Inherits="ChangePassword" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hdfID" runat="server" />
    <header class="rich-header page-header version1" data-parallax="true" id="header_d901_0">
                    <div class="parallax-container" id="div_d901_0">&nbsp;</div>

                    <div class="container nz-clearfix">
                        <div class="rh-content">

                            <h1>Change Password</h1>

                            <div class="rh-separator">&nbsp;</div>
                            <div id="div_d901_1" class="nz-breadcrumbs nz-clearfix"><a href="default.aspx"  property="v:title">Home</a><span class="current">Change Password</span></div>
                        </div>
                    </div>
                    <div id="slider-arrow" data-target="#nz-target" data-from="90" data-offset="90" class="i-separator animate nz-clearfix"><i class="icon-arrow-down10"></i></div>
                </header>

                <div class="blog-layout-wrap standard sidebar-true" id="nz-target">

                    <div id="loop" class="loop">
                        <div class="container nz-clearfix">
                        
                            <section class="main-content left">
                                <section class="content lazy blog-layout nz-clearfix">
                                    <div class="blog-post blog-post-1 nz-clearfix">


                                        <fieldset>
                    
                        <div class="col12">
                        <div id="alert" runat="server" class="alert success" visible="false">
                                           <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>         
                                                        <%--<div class="alert-message">Success message goes here
                                                        </div>--%>
                         <span class="close-alert">X</span>
                         
                         </div>

                        <div class="col12">
                       
                            <asp:TextBox ID="txtOldPSWD" TextMode="Password" placeholder="Enter Old Password" runat="server"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtOldPSWD"
                                        ErrorMessage="Please Enter Old Password" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender11" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator11" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
                        </div>
                          
                          <div class="col12">
          <asp:TextBox ID="txtNewPSWD" TextMode="Password" placeholder="Enter New Password" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNewPSWD"
                                        ErrorMessage="Please Enter New Password" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" Enabled="True"
                                        TargetControlID="RequiredFieldValidator1" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
                        </div>
                            <div class="col12">
          <asp:TextBox ID="txtCNPSWD" TextMode="Password" placeholder="Enter Confirm Password" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCNPSWD"
                                            Display="None" ErrorMessage="Please Enter Confirm Password" ForeColor="Red"
                                            SetFocusOnError="True" ValidationGroup="sv">*</asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" Enabled="True"
                                            TargetControlID="RequiredFieldValidator3" WarningIconImageUrl="~/images/wrning.gif">
                                        </asp:ValidatorCalloutExtender>
                                         <asp:CompareValidator ID="cmpvldPassword" runat="server" ControlToCompare="txtNewPSWD"
                                         ControlToValidate="txtCNPSWD" Type="String" Operator="Equal" ValidationGroup="sv"
                                                     Display="None"    ErrorMessage="Password Mismatch"></asp:CompareValidator>
                                            <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" Enabled="True"
                                                  TargetControlID="cmpvldPassword" WarningIconImageUrl="~/images/wrning.gif"
                                           >
                                        </asp:ValidatorCalloutExtender>
                        </div>
                          <div class="col12">
                          <div style="float:right;">
             <asp:LinkButton class="button button-3d green full-false medium square icon-true animate-false anim-type-ghost element-animate-false"  
                                  ID="lbtnSend" style="background-color:#F0634C;" runat="server" onclick="lbtnSend_Click"  ValidationGroup="sv"
                                ><span class="txt">Confirm</span><span class="btn-icon icon-search"></span></asp:LinkButton>
                                </div>
                        </div>
                        </div>
                        </fieldset>

                                 

                                        
                                    </div>
                                </section>
                                
                            </section>
                            <aside class="sidebar">
                           
                                <aside class='blog-widget-area widget-area'>
  
                                    <div id="tag_cloud-2" class="widget widget_tag_cloud">
                                        <h6 class="widget_title">Tags</h6>
                                        <div class="tagcloud">

                                            <a href='#' class='tag-link-108 tag-link-position-1' title='5 topics' id="a_f795_0">Static website design </a>
                                            <a href='#' class='tag-link-67 tag-link-position-2' title='13 topics' id="a_f795_1"> Dynamic Website Design </a>
                                            <a href='#' class='tag-link-112 tag-link-position-3' title='8 topics' id="a_f795_2"> 
Responsive website design </a>
                                            <a href='#' class='tag-link-113 tag-link-position-4' title='8 topics' id="a_f795_3">Mobile Apps Development</a>
                                            <a href='#' class='tag-link-109 tag-link-position-5' title='5 topics' id="a_f795_4">  
E-commerce design Development
</a>
                                            <a href='#' class='tag-link-68 tag-link-position-6' title='10 topics' id="a_f795_5"> 
Software Development</a>
                                            <a href='#' class='tag-link-69 tag-link-position-7' title='8 topics' id="a_f795_6">  
ASP.net Website
</a>
                                            <a href='#' class='tag-link-110 tag-link-position-8' title='5 topics' id="a_f795_7">  
Website Design
</a>
                                            <a href='#' class='tag-link-70 tag-link-position-9' title='9 topics' id="a_f795_8">  
Wordpress website
</a>
                                            <a href='#' class='tag-link-71 tag-link-position-10' title='10 topics' id="a_f795_9"> School management Software</a>
                                            <a href='#' class='tag-link-72 tag-link-position-11' title='10 topics' id="a_f795_10">  
Online Exam management Software
</a>
                                            <a href='#' class='tag-link-73 tag-link-position-12' title='11 topics' id="a_f795_11"> 
Game parlour software </a>
                                           </div>
                                    </div>
                                </aside>
                            </aside>

                        </div>
                        
                    </div>

                </div>
</asp:Content>

