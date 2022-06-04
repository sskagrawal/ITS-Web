<%@ Page Title="find job|job in gwalior|job portal in gwalior|consultancy in gwalior|job consultancy in gwalior|placement services in gwalior|job consultant in gwalior" MetaKeywords="find job, job in gwalior, job portal in gwalior, consultancy website in gwalior, job consultancy company in gwalior, placement services company in gwalior, job consultant company in gwalior" MetaDescription="job in gwalior, madhya pradesh, india -8989024130" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="FindJob.aspx.cs" Inherits="FindJob" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%--<%@ Register Src="Controle/Newregistration.ascx" TagName="Newregistration" TagPrefix="uc1" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"> 
    <style type="text/css">
        fieldset {
            border: 1px solid #F0634C; 
        } 

        legend {
            padding: 0.2em 0.5em;
            /*border:1px solid green;*/
            color: #F0634C;
            font-size: 200%;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdfUserID" runat="server" />
    <header class="rich-header page-header version1" data-parallax="true" id="header_d901_0">
                    <div class="parallax-container" id="div_d901_0">&nbsp;</div>

                    <div class="container nz-clearfix">
                        <div class="rh-content">

                            <h1>Find Jobs </h1>

                            <div class="rh-separator">&nbsp;</div>
                            <div id="div_d901_1" class="nz-breadcrumbs nz-clearfix"><a href="Default.aspx"  property="v:title">Home</a><span class="current">Career</span></div>
                        </div>
                    </div>
                    <div id="slider-arrow" data-target="#nz-target" data-from="90" data-offset="90" class="i-separator animate nz-clearfix"><i class="icon-arrow-down10"></i></div>
                </header>
    <div class="blog-layout-wrap standard sidebar-true" id="nz-target">
        <div id="loop" class="loop">
            <div class="container nz-clearfix">

                <%-- <legend>Search</legend>--%>
                <div runat="server" id="alertM" class="alert" style="font-size: 24px; background: #7FBA00;" visible="false">
                    <asp:Label ID="lblPMSG" class="alert-message" Style="color: #ffffff;" runat="server" Text=""></asp:Label>
                    <span class="close-alert">X</span>
                </div>
                <fieldset>
                    <legend>Find Job</legend>
                    <div class="col12" style="padding-top: 40px; text-align: center;">
                        <div class="col3">
                            <asp:DropDownList ID="drdIndustry" runat="server">
                                <asp:ListItem Text="Select Industry" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col3">
                            <asp:DropDownList ID="drdExperience" runat="server">
                                <asp:ListItem Text="Select Experience" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col3">
                            <asp:DropDownList ID="drdQual" runat="server">
                                <asp:ListItem Text="Select Qualification" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col3">
                            <asp:LinkButton class="button button-3d green full-false medium square icon-true animate-false anim-type-ghost element-animate-false"
                                ID="lbtnSend" Style="background-color: #F0634C;" runat="server" OnClick="lbtnSend_Click"><span class="txt">Find Jobs</span><span class="btn-icon icon-search"></span></asp:LinkButton>
                        </div>
                    </div>
                </fieldset>
                <script type="text/javascript">
                    function HideLabel() {
                        var seconds = 5;
                        setTimeout(function () {
                            document.getElementById("<%=alertM.ClientID %>").style.display = "none";
                        }, seconds * 1000);
                    };
                </script>



                <section class="main-content left">
                                <section class="content lazy blog-layout nz-clearfix">
                                    <div class="blog-post blog-post-1 nz-clearfix">
                                     <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" CssClass="Temp" 
                                            onitemdatabound="DataList1_ItemDataBound" >
                        <ItemTemplate>
                            <br />
              <article data-grid="ninzio_01" class="post-194 post type-post status-publish format-aside has-post-thumbnail hentry category-marketing tag-design tag-eva tag-external tag-logo tag-marketing tag-ninzio-style tag-painting tag-smart post_format-post-format-aside" id="post-194" style="position: absolute; left: 0px; top: 0px;">
                            <div class="post-date-custom">
                            <span><%# Eval("CreatedOn", "{0:dd}")%></span><span><%# Eval("CreatedOn", "{0:MMM}")%></span></div> 
                            <div class="post-body">
                            <div class="post-body-in">
                            <div class="format-wrapper nz-clearfix">
                            <div class="col12" style="margin:0;"> 

                            <div class="col-inner">
                            <h3 id="h3_01b4_1" class="vc_custom_heading ninzio-latter-spacing" style="text-align:left;"><%# Eval("job_Title")%></h3>
                            <div class="" style="text-align:left;" data-effect="none">
                            <div class="nz-separator solid" id="div_01b4_21">&nbsp;</div></div>
                            </div>


                            </div>  <%--<a href="#"></a><a href="#"></a><a href="#"> </a>--%>

                            <div class="postmeta"><span class="post-comments" style="font-style:normal; font-family:san-serif;">Job Open Date: <%# Eval("jobopen_Date","{0:dd-MM-yyyy}")%>  &nbsp; &nbsp;<strong>|</strong> &nbsp;&nbsp;   Job Close Date: <%# Eval("jobClose_Date", "{0:dd-MM-yyyy}")%>  &nbsp; &nbsp;<strong>|</strong> &nbsp;&nbsp; Location: <%# Eval("CityID")%></span></div>

                            <p><strong>Experience:-</strong><%# Eval("Exp")%>&nbsp;<strong>|</strong> &nbsp;&nbsp;<strong>No. of Position:-</strong><%# Eval("Position")%>&nbsp;&nbsp;<strong>|</strong> &nbsp;&nbsp;<strong>Salary:-</strong> <i class="fa fa-inr"></i> <%# Eval("MimiSalery")%> To <i class="fa fa-inr"></i>  <%# Eval("MaxiMum")%> &nbsp;&nbsp;<strong>|</strong> &nbsp;&nbsp;<strong>Qualification:-</strong><%# Eval("job_Qulalification")%>&nbsp;&nbsp;
                            
                            
                            <br /><strong>Job Type:-</strong><%# Eval("JobType")%> &nbsp;&nbsp;<strong>|</strong> &nbsp;&nbsp; <strong>Job Field:-</strong> <%# Eval("Industry")%></p>
                            
                            <div class="post-excerpt" style="font-size: 14px; margin-bottom: 22px;  line-height: 25px;  font-family: Open Sans;    font-style: normal;">
                            <strong>  Description:-</strong><%# Eval("job_Desc")%></div>
                              <hr>
                             <asp:Panel ID="pDownload" visible="false" runat="server">                         
                              <h3 style="padding-top: 14px;">Company Name:-<strong><%# Eval("CompanyName")%></strong></h3>
                              <p><strong>Contact Info: Name:-</strong><%# Eval("Name")%>&nbsp;|&nbsp;<strong>Mobile No.:-</strong><%# Eval("MobileNo")%>&nbsp;|&nbsp;<strong>Email ID.:-</strong><%# Eval("EmailID")%></p>
                              <p><strong>Website:-</strong><a href="<%# Eval("Website")%>" target="_blank">Click Here</a>&nbsp;|&nbsp;<strong>Address:-</strong><%# Eval("Address")%></p>
                              <div class="col12">
                              <br />
                              <div style="float:right;">
                              <a href="JobApplyNow.aspx?JID=<%# Eval("job_Id")%>" class="button button-3d green full-false medium square icon-true animate-false anim-type-ghost element-animate-false" style="background-color:#F0634C">Apply Now</a>
                              </div>
                              </div>
                             
                              </asp:Panel>
                                  <asp:Panel ID="pRMore" visible="true" runat="server">                             
                              <div class="col12" style="margin-top:20px;">
                              <div style="float:right;">
                              <a runat="server" href="UserPlan.aspx" class="button button-3d green full-false medium square icon-true animate-false anim-type-ghost element-animate-false" style="background-color:#F0634C"><span class="txt">Read More</span><span class="btn-icon icon-arrow-right10"></span></a>
                              </div>
                              </div>                                          
                              </asp:Panel>
                             
                              </div>
                              </div>
                              </div>
                              </article>
                                        </ItemTemplate>
                                        </asp:DataList>
                                      
                                         <article data-grid="ninzio_01" class="post-194 post type-post status-publish format-aside has-post-thumbnail hentry category-marketing tag-design tag-eva tag-external tag-logo tag-marketing tag-ninzio-style tag-painting tag-smart post_format-post-format-aside" id="post-194">
                                         <asp:Panel ID="pnlPager" runat="server" Height="20px" Width="153px">

    <asp:LinkButton ID="lnkPrev" runat="server" CommandName = "Previous"

        Text = "<< Previous" OnClick = "Pager_Click"></asp:LinkButton>

    &nbsp;

    <asp:LinkButton ID="lnkNext" runat="server" CommandName = "Next"

        Text = "Next >>"  OnClick = "Pager_Click"></asp:LinkButton>

</asp:Panel>
</article>



              <asp:Literal ID="ltrJobList" Visible="false" runat="server"></asp:Literal>                        

                                        
                                    </div>
                                </section>
                                
                            </section>
                <aside class="sidebar">
                         <%--   <uc1:Newregistration ID="Newregistration1" runat="server" />--%>
                               <%-- <aside class='blog-widget-area widget-area'>

                                   
                                    <div id="respond" class="comment-respond">
                                                    <h3 id="reply-title" class="comment-reply-title">New Register</h3>
                                                
                                                          <div runat="server" id="alert" class="alert success" visible="false">    
                                                                       <asp:Label ID="lblMSG" class="alert-message" runat="server" Text=""></asp:Label>                                     
                                                      
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
                                                                 
             <div class="comment-form">
            
                 <div class="nz-clearfix"></div>
                  <p class="comment-form-author">
                 <asp:DropDownList class="ninzio-placeholder" ID="drdIndustries" runat="server">
             <asp:ListItem Text="Select Employee Type" Value="0"></asp:ListItem> 
             <asp:ListItem Text="Job Seeker" Value="3"></asp:ListItem> 
             <asp:ListItem Text="Employer" Value="2"></asp:ListItem>
             </asp:DropDownList>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="drdIndustries"
                                            ErrorMessage="Please Select Employee Type" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                        
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3" WarningIconImageUrl="~/images/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
             </p>
                <p class="comment-form-author">                  
               <asp:TextBox ID="txtName" class="ninzio-placeholder" placeholder="Enter Your Name *" runat="server"></asp:TextBox>  
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                                            ErrorMessage="Please Enter Your Name" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                        
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1" WarningIconImageUrl="~/images/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
                                         </p>
                <p class="comment-form-author">                  
               <asp:TextBox ID="txtMobNo" class="ninzio-placeholder" placeholder="Enter Your Mobile No. *" runat="server"></asp:TextBox>  
               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMobNo"
                                            ErrorMessage="Please Enter Your Mobile No." ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                        
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2" WarningIconImageUrl="~/images/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
               </p>
                <p class="comment-form-author">                  
               <asp:TextBox ID="txtEmailID" class="ninzio-placeholder" placeholder="Enter Your Email-ID *" runat="server"></asp:TextBox>  
               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmailID"
                                            ErrorMessage="Please Enter Your Email ID" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                        
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator4" WarningIconImageUrl="~/images/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
               </p>
                <p class="comment-form-author">                  
               <asp:TextBox ID="txtPSWD" class="ninzio-placeholder" TextMode="Password" placeholder="Enter Your Password *" runat="server"></asp:TextBox>  
               <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPSWD"
                                            ErrorMessage="Please Enter Your Password" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                        
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator5" WarningIconImageUrl="~/images/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
               </p>

               
             
                             <p class="form-submit">
          <asp:LinkButton ID="lbtnSubmit"  
                                     class="button button-ghost blue full-false medium square icon-true animate-false anim-type-ghost hover-side element-animate-false"  
                                     ValidationGroup="sv" runat="server" onclick="lbtnSubmit_Click">Submit</asp:LinkButton>
     

                                                                     </p>
                                                    </div>
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
                                    </div>
                                </aside>--%>
                            </aside>
            </div>
        </div>
    </div>
</asp:Content>
