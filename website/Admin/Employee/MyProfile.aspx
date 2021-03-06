<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    CodeFile="MyProfile.aspx.cs" Inherits="MyProfile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .kkBtn {
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdfUserID" runat="server"></asp:HiddenField>
    <header class="rich-header page-header version1" data-parallax="true" id="header_d901_0">
                    <div class="parallax-container" id="div_d901_0">&nbsp;</div>

                    <div class="container nz-clearfix">
                        <div class="rh-content">

                            <h1>Employee Profile</h1>
                            <%--  <div class="col-inner">
                                                    <h3 id="h3_df14_1" class="vc_custom_heading ninzio-latter-spacing">Employee Profile</h3>
                                                    <div class="sep-wrap element-animate element-animate-false center nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_df14_14">&nbsp;</div>
                                                    </div>
                                                </div>--%>

                            <div class="rh-separator">&nbsp;</div>
                            <div id="div_d901_1" class="nz-breadcrumbs nz-clearfix"><a href="Default.aspx"  property="v:title">Home</a><span class="current">Employee Profile</span></div>
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
                                                    <h3 id="h3_01b4_1" class="vc_custom_heading ninzio-latter-spacing">Employee Profile</h3>
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
 <p class="comment-form-author">
      <label>Company Name</label>            
     <asp:TextBox ID="txtCompany" class="ninzio-placeholder" placeholder="Enter Company Name" runat="server"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtCompany"
                                            ErrorMessage="Please Enter Company Name" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator11" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
                                                                        </p>
                                       <p class="comment-form-author">
                                            <label>Employee Name</label>       
                  <asp:TextBox ID="txtName" class="ninzio-placeholder" placeholder="Enter Contact Person Name" runat="server"></asp:TextBox>
                                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                                            ErrorMessage="Please Enter Name" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
                                                                        </p>

                                                                         <p class="comment-form-author">
                                                                              <label>Your Post</label>       
                  <asp:TextBox ID="txtPost" class="ninzio-placeholder" placeholder="Enter Your Post" runat="server"></asp:TextBox>
                                                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPost"
                                            ErrorMessage="Please Enter Post" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
                                                                        </p>
                                                                           <p class="comment-form-author">
                                                                               <label>Mobile</label>  
                 <asp:TextBox ID="txtMob" class="ninzio-placeholder" placeholder="Enter Contact Person Name Mobile No." runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMob"
                                            ErrorMessage="Please Enter Mobile" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>
                                                                        </p>
                                                                           <p class="comment-form-author">
                                                                               <label>Email ID</label>
                 <asp:TextBox ID="txtEmail" class="ninzio-placeholder" placeholder="Enter Your Email ID" runat="server"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail"
                                            ErrorMessage="Please Enter Email ID" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator4" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>
                                                                        </p>
                                                                         <p class="comment-form-author">
                                                                             <label>Gendar</label>
<asp:RadioButtonList ID="rbtGendar" runat="server" RepeatDirection="Horizontal">
<asp:ListItem Text="Male" Value="Male"></asp:ListItem>
<asp:ListItem Text="Female" Value="Female"></asp:ListItem>
</asp:RadioButtonList>
                                                                         </p>
                                                                            <p class="comment-form-author">
                                                                                <label>Website Url</label>
                 <asp:TextBox ID="txtWebsite" class="ninzio-placeholder" placeholder="Enter Your Website URL" runat="server"></asp:TextBox>
                                                                     
                                                                        </p>



                                     






                                                                          
                                                                           <%-- <p class="comment-form-author">
                 <asp:TextBox ID="txtPswd" TextMode="Password" class="ninzio-placeholder" placeholder="Enter Your Password" runat="server"></asp:TextBox>
                                                                        </p>--%>

                                                                        <%-- <p class="comment-form-author">
                                                              <asp:DropDownList ID="drdIndustry" runat="server">
                                                              <asp:ListItem Text="Select Industry" Value="0"></asp:ListItem>
                                                              </asp:DropDownList>     
                                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="drdIndustry"
                                            ErrorMessage="Please Select Industry" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender6" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator5" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>
                                                                   </p>--%>
                                                                     <p class="comment-form-author">
                                                                           <label>Address</label>
                 <asp:TextBox ID="txtAddress" TextMode="MultiLine" class="ninzio-placeholder" placeholder="Enter Your Address" runat="server"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAddress"
                                            ErrorMessage="Please Enter Address" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender7" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator6" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>
                                                                        </p>

  <%-- 
                                                                            <p class="comment-form-author">
                 <asp:TextBox ID="TextBox7" class="ninzio-placeholder" placeholder="Enter Your Name" runat="server"></asp:TextBox>
                                                                        </p>--%>
<div class="col12">
                                       <p class="form-submit">
                                       <asp:LinkButton ID="lbtnSubmit" class="button button-ghost blue full-false medium square icon-true animate-false anim-type-ghost hover-side element-animate-false" runat="server" onclick="lbtnSubmit_Click" ValidationGroup="sv"><strong>Update</strong></asp:LinkButton>
                                        </p>
</div>
                                        
                                    </div>
                                </section>
                                
                            </section>
                <aside class="sidebar">
                                <aside class='blog-widget-area widget-area'>

                                   
                                   <%-- <div id="respond" class="comment-respond">
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
                                                 
                                          </div>--%>
                                    <div id="tag_cloud-2" class="widget widget_tag_cloud">
                                        <h6 class="widget_title">Shortcut</h6>
                                        <div class="tagcloud">

                                            <%--<a runat="server" href="~/FindJob.aspx" class='tag-link-108 tag-link-position-1' title='Find Job' id="a_f795_0">Find Job</a>--%>
                                              <a runat="server" href="~/FindResumes.aspx" class='tag-link-108 tag-link-position-1' title='Find Job' id="a1">Find Resumes</a>
                                              <a runat="server" href="~/Employer/JobPost.aspx" class='tag-link-108 tag-link-position-1' title='Find Job' id="a2">Post Job</a>
                                              <a runat="server" href="~/Employer/PostJobList.aspx" class='tag-link-108 tag-link-position-1' title='Find Job' id="a3">Post Job List</a>
                                              <a runat="server" href="~/Employer/MyProfile.aspx" class='tag-link-108 tag-link-position-1' title='Find Job' id="a4">Profile</a>
                                              <a runat="server" href="~/ChangePassword.aspx" class='tag-link-108 tag-link-position-1' title='Find Job' id="a5">Change Password</a>
                                         
                                           </div>
                                    </div>
                                </aside>
                            </aside>
            </div>
        </div>
    </div>
</asp:Content>
