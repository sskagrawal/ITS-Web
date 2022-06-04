<%@ Page Title="Job in Gwalior, Find Job Vacancies & Latest Job Alerts | ITS Gwalior" MetaKeywords="jobs in Gwalior, Madhya Pradesh, job search engine, jobs, job listings, find jobs, careers, employment opportunity, online job sites, resumes, salaries, simple, hire, career" MetaDescription="Are You Search Job in Gwalior. ITS Gwalior Provide Find Job Vacancies Services and Get Job Alerts Notifications in Gwalior" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="find-job.aspx.cs" Inherits="FindJob" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Controle/Newregistration.ascx" TagName="Newregistration" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"> 
    <meta itemprop="name" content="Send Free Job Proposal: ITS Gwalior">
<meta property="profile:username" content="ITS Gwalior">
<meta itemprop="description" content="Find Job Vacancies: ITS Gwalior">

      <link rel="canonical" href="https://www.itsgwalior.com/Job/find-job" />

    <meta property="og:title" content="Job in Gwalior, Find Job Vacancies & Latest Job Alerts | ITS Gwalior" />
<meta property="og:site_name" content="ITS Gwalior" />
<meta property="og:locale" content="en_US">
<meta property="og:url" content="https://www.itsgwalior.com/Job/find-job" />
<meta property="og:description" content="Are You Search Job in Gwalior. ITS Gwalior Provide Find Job Vacancies Services and Get Job Alerts Notifications in Gwalior." />
<meta property="og:type" content="article" />
<meta property="og:image" content="https://www.itsgwalior.com/its-image/small-images/it-company/job.webp" />
<meta name="twitter:title" content="Job in Gwalior, Find Job Vacancies & Latest Job Alerts | ITS Gwalior" />
<meta name="twitter:description" content="Are You Search Job in Gwalior. ITS Gwalior Provide Find Job Vacancies Services and Get Job Alerts Notifications in Gwalior." />
    <script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Article",
  "mainEntityOfPage": {
    "@type": "WebPage",
    "@id": "https://www.itsgwalior.com/Job/find-job"
  },
  "headline": "Job in Gwalior, Find Job Vacancies & Latest Job Alerts | ITS Gwalior",
  "description": "Are You Search Job in Gwalior. ITS Gwalior Provide Find Job Vacancies Services and Get Job Alerts Notifications in Gwalior.",
  "image": "https://www.itsgwalior.com/its-image/small-images/it-company/job.webp",  
  "author": {
    "@type": "Organization",
    "name": "ITS Gwalior"
  },  
  "publisher": {
    "@type": "Organization",
    "name": "ITS Gwalior",
    "logo": {
      "@type": "ImageObject",
      "url": "https://www.itsgwalior.com/upload/logo.png"
    }
  },
  "datePublished": "2021-08-04",
  "dateModified": "2021-08-04"
}
</script>
  
     <style>
       .many-skills {
    /* margin-bottom: -36px; */
    padding-left: 5px;
    margin-top: 16px;
    text-align: left;
}

.many-skills {
    margin-bottom: 10px;
}

.many-skills a {
    color: white;
    background: #f0634c;
    padding: 3px 10px 2px 10px;
    display: inline-block;
    text-transform: uppercase;
    font-size: 10px;
    line-height: 20px;
    margin-right: 6px;
}

.many-skills a:last-child {
    margin-top: 10px;
}


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

   

    <asp:HiddenField ID="hdfUserID" runat="server" />


    <header class="rich-header page-header version1" data-parallax="true" id="header_d901_0">
                    <div class="parallax-container" id="div_d901_0">&nbsp;</div>
                    <div class="container nz-clearfix">
                        <div class="rh-content">
                            <h1>Jobs in Gwalior</h1>
                            <div class="rh-separator">&nbsp;</div>
                            <div id="div_d901_1" class="nz-breadcrumbs nz-clearfix"><a runat="server" href="~/default.aspx" property="v:title">Its Gwalior</a><span class="current">Win Job in Gwalior 2021</span></div>
                        </div>
                    </div>
                    <div id="slider-arrow" data-target="#nz-target" data-from="90" data-offset="90" class="i-separator animate nz-clearfix"><i class="icon-arrow-down10"></i></div>
    </header>



    <div class="blog-layout-wrap standard sidebar-true" id="nz-target">
        <div id="loop" class="loop">


            <div class="container nz-clearfix">
							
							<div class="nz-row">
                                            <div class="col col12  element-animate-false valign-top"  data-effect="none" data-align="left">
                                                <div class="col-inner" >
													<h2 id="h3_6127_3" class="vc_custom_heading ninzio-latter-spacing">Win Job in Gwalior 2021</h2>
												
												<div class="sep-wrap element-animate element-animate-false center nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_6127_19">&nbsp;</div>
                                                    </div>
                                                    
                                                        <div  class="nz-column-text nz-clearfix  element-animate-false" data-effect="none" data-effect-speed="50"> <p id="p_6127_3">
                                                            Are You Looking Job in Gwalior? ITS Gwalior Provide best Job in Gwalior. Because ITS Gwalior is a Top local job search engine in Gwalior. Where it works to get you a job in your city. ITS Gwalior have a job in multiple industries. Like Education, Home Services, It, and Other. We Provide Job Opportunity in Gwalior.

                                                                                                                                                                   </p></div>
                                                </div>
												<br>
												
                                            </div>
                                        </div>



            <div class="container nz-clearfix">
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

                     <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" CssClass="Temp" onitemdatabound="DataList1_ItemDataBound"  DataKeyField="job_Id">
                        <ItemTemplate> <br />
                             <article data-grid="ninzio_01" class="post-194 post type-post status-publish format-aside has-post-thumbnail hentry category-marketing tag-design tag-eva tag-external tag-logo tag-marketing tag-ninzio-style tag-painting tag-smart post_format-post-format-aside" id="post-194" style="position:absolute;left:0px; top:0px;">
                                   
                                <div class="post-date-custom"><span><asp:Label ID="lblCounter" runat="server" Text='<%# Eval("View_Counter")%>'></asp:Label>     </span><span>View</span></div>

                                    <div class="post-body">
                                        <div class="post-body-in">
                                            <div class="format-wrapper nz-clearfix">
                                                <div class="col12" style="margin:0;"> 
                                                    <div class="col-inner">
                                                        <h3 id="h3_01b4_1" class="vc_custom_heading ninzio-latter-spacing" style="text-align:left;"> <asp:Label ID="lblJobtitle" runat="server" Text='<%# Eval("job_Title")%>'></asp:Label> </h3>
                                                        <div class="" style="text-align:left;" data-effect="none">
                                                        <div class="nz-separator solid" id="div_01b4_21">&nbsp;</div></div>
                                                       </div>
                                                           
                                                            <asp:HiddenField ID="hdfJOBID" Value='<%# Eval("job_Id")%>' runat="server"></asp:HiddenField>
                                                      
                                                                <asp:HiddenField ID="hdfJobOpDate" Value='<%# Eval("jobopen_Date") %>' runat="server"> 
                                                                </asp:HiddenField>
                                                            <p> <i class="fa fa-calendar" aria-hidden="true"></i> <strong>Posted On: </strong> <asp:Label ID="lblPostDay" runat="server" Text=""></asp:Label> <strong>|</strong> <strong>Posted By: </strong> <asp:Label ID="lblpartyName" runat="server" Text='<%#Eval("Party_name")%>'></asp:Label>    <strong>|</strong> <strong> <i class="fa fa-map-marker"></i><span> Location: </strong><asp:Label ID="lblLocation" runat="server" Text='<%#Eval("CityID") %>'></asp:Label> </p>
                                                             
                                                             

                                                            <p><strong>Experience: </strong> <asp:Label ID="lblExperience" runat="server" Text='<%# Eval("Exp")%>'></asp:Label>       &nbsp;  <strong>|</strong> &nbsp;&nbsp;<strong>No. of Position: </strong><%# Eval("Position")%>&nbsp;&nbsp;<strong>|</strong> &nbsp;&nbsp;<strong>Budget: </strong> <i class="fa fa-inr"></i>
                                                                <asp:HiddenField ID="hdfUnit" runat="server" Value='<%# Eval("Time_Unit")%>' />
                                                                <asp:HiddenField ID="hdfFixPrice" runat="server" Value='<%# Eval("FixPrice")%>' />
                                                                <asp:HiddenField ID="hdfMinSal" runat="server" Value='<%# Eval("MimiSalery")%>' />
                                                                <asp:HiddenField ID="hdfMaxSal" runat="server" Value='<%# Eval("MaxiMum")%>' />
                                                                 <asp:HiddenField ID="hdfJobTiltll" runat="server" Value='<%# Eval("job_Title")%>' />
                                                                <asp:Label ID="lblBudget" runat="server"></asp:Label>
                                                               
                                                                &nbsp;&nbsp;&nbsp;&nbsp;<br /> 
                                                            <p><strong>Qualification: </strong> <asp:Label ID="lblQualification" runat="server" Text='<%# Eval("job_Qulalification")%>'></asp:Label>    &nbsp;<strong>|</strong> &nbsp;<strong>Job Type: </strong><%# Eval("JobType")%> &nbsp;<strong>|</strong> &nbsp;<strong>Job Field: </strong> <%# Eval("Industry")%></p>
                                                           
                                                            <div class="post-excerpt" style="font-size: 14px; font-family: Open Sans;    font-style: normal;">
                                                            <strong>  Description: </strong> 
                                                                <asp:Label ID="lblJobDesription" runat="server" Text='<%# Eval("job_Desc")%>'></asp:Label>     
                                                                                                                             
                                                               
                                                            </div>
                                                     <div class="many-skills">
                                                    <asp:Literal ID="ltrskill" runat="server"></asp:Literal>
                                               <%--    <li class="menu-item" style="list-style:none;display:inline;"><strong> Skills </strong></li>--%>
                                                  </div>
                                                       
                                                            
                                                                
                                                              <hr>
                                                      
                                                       <asp:Panel ID="pRMore" visible="true" runat="server">
                                                          <div class="col12" style="margin-top:20px;">
                                                              <div style="float:right;">                                                          
                                                                 <%-- <a runat="server" href="~/Admin/Login.aspx?" class="button button-3d green full-false medium square icon-true animate-false anim-type-ghost element-animate-false" style="background-color:#F0634C"><span class="txt">Read More</span><span class="btn-icon icon-arrow-right10"></span></a>--%>
                                                              <%--<a  href="Job_full_Profile.aspx?JID=<%#Eval("job_Id")%>" class="button button-3d green full-false medium square icon-true animate-false anim-type-ghost element-animate-false" style="background-color:#F0634C"><span class="txt">Read More</span><span class="btn-icon icon-arrow-right10"></span></a>--%>
                                                                  
                                                                  <%--<asp:LinkButton ID="btnSubmit" runat="server" OnClick="lbtnSubmit_Click" class="button button-3d green full-false medium square icon-true animate-false anim-type-ghost element-animate-false" style="background-color:#F0634C"><span class="txt">Apply Now</span><span class="btn-icon icon-arrow-right10"></span></asp:LinkButton>--%>
                                                                  <asp:LinkButton ID="lnkBtnReadMore" CommandArgument='<%#Eval("job_Id")%>' OnClick="lnkBtnReadMore_Click"  runat="server" CssClass="button button-3d green full-false medium square icon-true animate-false anim-type-ghost element-animate-false" style="background-color:#F0634C"><span class="txt">Read More</span><span class="btn-icon icon-arrow-right10"></span> </asp:LinkButton>
                                                                   </div>
                                                          </div>
                                                       </asp:Panel>
                                                      
                                              </div>
                                         </div>
                                     </div>
                                 </div>
                             </article>
                        </ItemTemplate>
                     </asp:DataList>

                                         <article data-grid="ninzio_01" class="post-194 post type-post status-publish format-aside has-post-thumbnail hentry category-marketing tag-design tag-eva tag-external tag-logo tag-marketing tag-ninzio-style tag-painting tag-smart post_format-post-format-aside" id="post-194">
                                             <asp:Panel ID="pnlPager" runat="server" Height="20px" Width="153px">
                                                    <asp:LinkButton ID="lnkPrev" runat="server" CommandName = "Previous" Text = "<< Previous" OnClick = "Pager_Click"></asp:LinkButton>&nbsp;
                                                    <asp:LinkButton ID="lnkNext" runat="server" CommandName = "Next" Text = "Next >>"  OnClick = "Pager_Click"></asp:LinkButton>
                                            </asp:Panel>
                                        </article>

                                        <asp:Literal ID="ltrJobList" Visible="false" runat="server"></asp:Literal>
                 </div>
              </section>
           </section>


                <aside class="sidebar">
              <uc1:Newregistration ID="Newregistration1" runat="server" />
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

                <div class="nz-row">
                                            <div class="col col12  element-animate-false valign-top"  data-effect="none" data-align="left">
                                                <div class="col-inner" >
													<h3 class="vc_custom_heading ninzio-latter-spacing">Top Jobs in Gwalior</h3>
												
												<div class="sep-wrap element-animate element-animate-false nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_6127_19">&nbsp;</div>
                                                    </div>
                                                    
                                                        <div  class="nz-column-text nz-clearfix  element-animate-false" data-effect="none" data-effect-speed="50"> <p>
                                                            ITS Gwalior is the top Jobs Provider in Gwalior. Our Job Portal is the best because we provide Free Job Posting and Hire Employee. We are Giving Opportunity to job Seeker and Company. Create Profile Win the Candidate or jobs For Part time, Full time, Freelancer, and Contract.

                                                                                                                                                                   </p></div>
                                                </div>
												<br>
												
                                            </div>
                                        </div>

                <div class="nz-row">
                                            <div class="col col12  element-animate-false valign-top"  data-effect="none" data-align="left">
                                                <div class="col-inner" >
													<h2 class="vc_custom_heading ninzio-latter-spacing">Find A Job Vacancies in Gwalior</h2>
												
												<div class="sep-wrap element-animate element-animate-false nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_6127_19">&nbsp;</div>
                                                    </div>
                                                    
                                                        <div  class="nz-column-text nz-clearfix  element-animate-false" data-effect="none" data-effect-speed="50"> <p>
                                                            ITS Gwalior Provide Free Find Job Vacancies in Gwalior. You can do free find a job by visiting our website. You can create a Job Profile. And you can apply for Multiple Job Postings. You can easily check the company according to your job Industries, job category, and Job Skills. And you can send a direct Job Proposal to the company. 

                                                                                                                                                                   </p>
                                                            <p>
                                                                The company linked to ITS Gwalior can contact you.Here the company sees your job profile, in which you see the feedback and work details from the companies you got.And this is the most important part of your profile. All the work you will do here, you will have to take feedback after giving their work, which will make your job profile strong.
                                                                </p>
                                                        </div>
                                                </div>
												<br>
												
                                            </div>
                                        </div>
                                     
       </div>
    </div>
  </div>
        </div>
</asp:Content>
