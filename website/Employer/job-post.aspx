<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="job-post.aspx.cs" Inherits="MyProfile" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .kkBtn
    {
    border: medium none;
    color: #fff;
    display: inline-block;
    margin: 0 0 5px;
    outline: medium none;
    overflow: hidden;
    position: relative;
    text-align: center;
    text-transform: uppercase !important;
    z-index: 1;
    }
</style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hdfUserID" runat="server"> </asp:HiddenField>
  <asp:HiddenField ID="hdfPostID" runat="server"> </asp:HiddenField>
                <header class="rich-header page-header version1" data-parallax="true" id="header_d901_0">
                    <div class="parallax-container" id="div_d901_0">&nbsp;</div>

                    <div class="container nz-clearfix">
                        <div class="rh-content">

                            <h1>Post Job</h1>

                            <div class="rh-separator">&nbsp;</div>
                            <div id="div_d901_1" class="nz-breadcrumbs nz-clearfix"><a href="Default.aspx"  property="v:title">Home</a><span class="current">Post Job</span></div>
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
                                    <div class="column-12" style="text-align:center;">

                                    <div class="col-inner">
                                                    <h3 id="h3_01b4_1" class="vc_custom_heading ninzio-latter-spacing">Post Job</h3>
                                                    <div class="sep-wrap element-animate element-animate-false center nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_01b4_21">&nbsp;</div>
                                                    </div>
                                                   
                                                </div>
                                
                                   <br />
                                   <div id="alert" runat="server" visible="false" class="alert success">
                                                       
<asp:Label ID="lblMSG" runat="server" Text=""></asp:Label>
                                                        <span class="close-alert">X</span>
                                                        </div>

                                                        <script type="text/javascript">
                                                            function HideLabel() {
                                                                var seconds = 5;
                                                                setTimeout(function () {
                                                                    document.getElementById("<%=alert.ClientID %>").style.display = "none";
                                                                }, seconds * 1000);
                                                            };
</script>  
<div class="col-lg-4">
                                       <p class="comment-form-author">
                  <asp:TextBox ID="txtJobTitle" class="ninzio-placeholder" placeholder="Required Employee title" runat="server"></asp:TextBox>
                                                                        </p>
                                                                        </div>
                                                                        <div class="col-lg-4">
                                                                           <p class="comment-form-author">
                                                                           <asp:DropDownList ID="drdJobType" runat="server">
                                                                           <asp:ListItem Text="Select Job Type" Value="0"></asp:ListItem>
                                                                          
                                                                           </asp:DropDownList>
                                                                        </p>
                                                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="drdJobType"
                                            ErrorMessage="Please Select Job Type" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>                                        
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3" WarningIconImageUrl="~/images/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
                                                                        </div>
                                                                        <div class="col-lg-4">
                                                                            <p class="comment-form-author">
                 <asp:TextBox ID="txtNoPosition" class="ninzio-placeholder" placeholder="Enter No. Of Position" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNoPosition"
                                            ErrorMessage="Please Enter No. Position" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>                                        
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1" WarningIconImageUrl="~/images/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
                                                                        </p>
                                                                        </div>
                                                                        <div class="col-lg-4">

                                                                            <p class="comment-form-author">
<asp:DropDownList ID="drdExp" runat="server"></asp:DropDownList>
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="drdExp"
                                            ErrorMessage="Please Select Experience" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>                                        
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2" WarningIconImageUrl="~/images/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
                                                                        </p>
                                                                        </div>

                                                                            <div class="col-lg-4">

                                                                            <p class="comment-form-author">
                 <asp:TextBox ID="txtOpeningDAte" class="ninzio-placeholder" placeholder="Select job Opening Date" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="caljobopenDate" runat="server" ClientIDMode="Static" TargetControlID="txtOpeningDAte" Format="dd/MM/yyyy"></asp:CalendarExtender>
                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtOpeningDAte"
                                            ErrorMessage="Please Select job Opening Date" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>                                        
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator4" WarningIconImageUrl="~/images/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
                                                                        </p>
                                                                        </div>
                                                                          <div class="col-lg-4">

                                                                            <p class="comment-form-author">
                 <asp:TextBox ID="txtClosingdate" class="ninzio-placeholder" placeholder="Select job Closing Date" runat="server"></asp:TextBox>
                   <asp:CalendarExtender ID="caljobClosenDate" runat="server" ClientIDMode="Static" TargetControlID="txtClosingdate" Format="dd/MM/yyyy"></asp:CalendarExtender>
                                                                     <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtClosingdate"
                                            ErrorMessage="Please Select job Closing Date" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>                                        
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator5" WarningIconImageUrl="~/images/wrning.gif">
                                        </asp:ValidatorCalloutExtender> --%>
                                                                        </p>
                                                                        </div>
                                                                       <div class="col-lg-4">  
                                                                           <p class="comment-form-author">
                                                                           <asp:DropDownList ID="drdQualification" runat="server"></asp:DropDownList>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="drdQualification"
                                            ErrorMessage="Please Select Job Qualification" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>                                        
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender6" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator6" WarningIconImageUrl="~/images/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
                                                                        </p> 
                                                                       </div>
                                                                       
                                                  
                   <div class="col-lg-4">
                   <p class="comment-form-author">
                 <asp:TextBox ID="txtMinimum" class="ninzio-placeholder" placeholder="Enter Mimimum Salery" runat="server"></asp:TextBox>
                </p>
                </div>
                <div class="col-lg-4">
                   <p class="comment-form-author">
                 <asp:TextBox ID="txtMaxmum" class="ninzio-placeholder" placeholder="Enter Maxmum Salery" runat="server"></asp:TextBox>
                </p>
                </div>
                <div class="col-lg-4">  
                                                                           <p class="comment-form-author">
                                                                           <asp:DropDownList ID="drdIndustry" runat="server"></asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="drdIndustry"
                                            ErrorMessage="Please Select Job Industry" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>                                        
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender8" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator8" WarningIconImageUrl="~/images/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
                                                                        </p> 
                                                                       </div>
                                                                        <%-- <div class="col-lg-4">  
                                                                           <p class="comment-form-author">
                                                                           <label>Upload Logo</label>
                                                                    <asp:FileUpload ID="FileUploadLogo" runat="server"></asp:FileUpload>
                                                                           <asp:HiddenField ID="hdfImage" runat="server"></asp:HiddenField>
                                                                        </p> 
                                                                        </div>--%>
                                                                        <div class="col-lg-4">
                                                                           <p class="comment-form-author">
<asp:DropDownList ID="drdState" runat="server" AutoPostBack="true" 
            onselectedindexchanged="drdState_SelectedIndexChanged">
<asp:ListItem Text="Select Job Prepare State " Value="0"></asp:ListItem>
</asp:DropDownList>
                                                                        </p>

                                                                          
                                                                        </div> 
                                                                        
                                                                        <div class="col-md-12">
                                                                          <p class="comment-form-author">
<asp:DropDownList ID="drdCity" runat="server">
<asp:ListItem Text="Select Job Prepare City" Value="0"></asp:ListItem>
</asp:DropDownList>
                                                                        </p></div>
                                                                       
                                                      <div class="col-md-12">
                                                                     <p class="comment-form-author">
                 <asp:TextBox ID="txtDes" TextMode="MultiLine" class="ninzio-placeholder" placeholder="Enter Job Description" runat="server"></asp:TextBox>
                                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtDes"
                                            ErrorMessage="Please Enter Job Description" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>                                        
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender7" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator7" WarningIconImageUrl="~/images/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
                                                                        </p>
                                                               
                                                                  <div class="col12">
                                                                        <p class="form-submit">
                                       <asp:LinkButton ID="lbtnSubmit" class="button button-3d green full-false medium square icon-true animate-false anim-type-ghost element-animate-false" style="background-color:#F0634C;" runat="server" onclick="lbtnSubmit_Click" ValidationGroup="sv"><span class="txt">Submit</span><span class="btn-icon fa fa-save"></span></asp:LinkButton>
       
     </p></div>
</div>


                                      

                                        
                                    </div>
                                </section>
                                
                            </section>
                            <aside class="sidebar">
                                <aside class='blog-widget-area widget-area'>

                                          <div id="tag_cloud-2" class="widget widget_tag_cloud">
                                        <h6 class="widget_title">Shortcut</h6>
                                        <div class="tagcloud">

                                            <%--<a runat="server" href="~/FindJob.aspx" class='tag-link-108 tag-link-position-1' title='Find Job' id="a_f795_0">Find Job</a>--%>
                                              <a runat="server" href="~/find-resumes.aspx" class='tag-link-108 tag-link-position-1' title='Find Job' id="a1">Find Resumes</a>
                                              <a runat="server" href="~/Employer/job-post.aspx" class='tag-link-108 tag-link-position-1' title='Find Job' id="a2">Post Job</a>
                                              <a runat="server" href="~/Employer/post-joblist.aspx" class='tag-link-108 tag-link-position-1' title='Find Job' id="a3">Post Job List</a>
                                              <a runat="server" href="~/Employer/my-profile.aspx" class='tag-link-108 tag-link-position-1' title='Find Job' id="a4">Profile</a>
                                              <a runat="server" href="~/change-password.aspx" class='tag-link-108 tag-link-position-1' title='Find Job' id="a5">Change Password</a>
                                         
                                           </div>
                                    </div>
                                 <%--   <div id="respond" class="comment-respond">
                                                    <h3 id="reply-title" class="comment-reply-title">Our Services</h3>
                                                    <ul class="list" style="list-style-type:none;">
                                                    <li><a href="#">Website Design</a></li>
                                                     <li><a href="#">Development</a></li>
                                                      <li><a href="#">Web Application</a></li>
                                                       <li><a href="#">Mobile Application</a></li>
                                                        <li><a href="#">E-commerce Development</a></li>
                                                         <li><a href="#">Portal Developmment</a></li>
                                                          <li><a href="#">Computer Support</a></li>
                                                    </ul>
                                                 
                                          </div>
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
                                    </div>--%>
                                </aside>
                            </aside>

                        </div>
                    </div>

                </div>

 
</div>

 
</asp:Content>

