﻿<%@ Page Title="Hire Employee in Gwalior, Job Seeker in Gwalior |ITS Gwalior" MetaDescription="ITS Gwalior Provide Free Hire Employee Services in Gwalior. Job Seeker find a job and Send Job Proposal." Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="hire-employees.aspx.cs" Inherits="Job_hire_employees" %>
<%@ Register src="../Controle/Newregistration.ascx" tagname="Newregistration" tagprefix="uc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <meta itemprop="name" content="Send Free Job Proposal: ITS Gwalior">
<meta property="profile:username" content="ITS Gwalior">
<meta itemprop="description" content="Hire Employee: ITS Gwalior">
    <link rel="canonical" href="https://www.itsgwalior.com/Job/hire-employees" />

<meta property="og:title" content="Hire Employee in Gwalior, Job Seeker in Gwalior |ITS Gwalior"/>
<meta property="og:site_name" content="ITS Gwalior" />
<meta property="og:locale" content="en_US">
<meta property="og:url" content="https://www.itsgwalior.com/Job/hire-employees" />
<meta property="og:description" content="ITS Gwalior Provide Free Hire Employee Services in Gwalior. Job Seeker find a job and Send Job Proposal." />
<meta property="og:type" content="article" />
<meta property="og:image" content="https://www.itsgwalior.com/ClientContractDoc/sandeepdg.jpg" />
<meta name="twitter:title" content="Hire Employee in Gwalior, Job Seeker in Gwalior |ITS Gwalior" />
<meta name="twitter:description" content="contentITS Gwalior Provide Free Hire Employee Services in Gwalior. Job Seeker find a job and Send Job Proposal." />






<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Article",
  "mainEntityOfPage": {
    "@type": "WebPage",
    "@id": "https://www.itsgwalior.com/Job/hire-employees"
  },
  "headline": "Hire Employee in Gwalior, Job Seeker in Gwalior | ITS Gwalior",
  "description": "content ITS Gwalior Provide Free Hire Employee Services in Gwalior. Job Seeker find a job and Send Job Proposal.",
  "image": "https://www.itsgwalior.com/ClientContractDoc/sandeepdg.jpg",  
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
  "datePublished": "2021-08-06",
  "dateModified": "2021-08-06"
}
</script>

 
    <link href="../css/custom.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <asp:HiddenField ID="hdfPlanID" runat="server"> </asp:HiddenField>
    <asp:HiddenField ID="hdfpartyid" runat="server"> </asp:HiddenField>
     <asp:HiddenField ID="hdfUserID" runat="server"> </asp:HiddenField>
    <asp:HiddenField ID="hdfJTtle" runat="server"> </asp:HiddenField>

      <header class="rich-header page-header version1" data-parallax="true" id="header_4129_0">
                    <div class="parallax-container" id="div_4129_0">&nbsp;</div>
                    <div class="container nz-clearfix">
                        <div class="rh-content">
                            <h1>Hire Employee in Gwalior</h1>
                            <div class="rh-separator">&nbsp;</div>
                            <div id="div_4129_1" class="nz-breadcrumbs nz-clearfix"><a href="index.html">ITS Gwalior</a><span class="current">Free Hire Employee online in Gwalior</span></div>
                        </div>
                    </div>
                    <div id="slider-arrow" data-target="#nz-target" data-from="90" data-offset="90" class="i-separator animate nz-clearfix"><i class="icon-arrow-down10"></i></div>
                </header>
                <div class="blog-layout-wrap list sidebar-false" id="nz-target">

                    <div id="loop" class="loop">
                        <div class="container nz-clearfix my-container">
                           <div class="nz-row">
                                            <div class="col col12  element-animate-false valign-top"  data-effect="none" data-align="left">
                                                <div class="col-inner" >
													<h2 id="h3_6127_3" class="vc_custom_heading ninzio-latter-spacing">Free Hire Employee online in Gwalior</h2>
												
												<div class="sep-wrap element-animate element-animate-false center nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_6127_19">&nbsp;</div>
                                                    </div>
                                                    
                                                        <div  class="nz-column-text nz-clearfix  element-animate-false" data-effect="none" data-effect-speed="50"> <p id="p_6127_3">
                                                            ITS Gwalior is the Local Find job & Hire Employee Search Engine Portal. ITS Gwalior Provide Services Free Hire Employee online in Gwalior. You find best candidate according to your work. We Provide Employees Part time, Full time, Freelancer, Fixed Time, and Contract base for Companies.

                                                                                                                                                                   </p></div>
                                                </div>
												<br>
												
                                            </div>
                                        </div>
                            <section class="content lazy blog-layout nz-clearfix">
                                <div class="blog-post blog-post-1 nz-clearfix">

                                    

                   <%  if (dt!=null && dt.Rows.Count > 0)
                 {
                   for (int i = 0; i <dt.Rows.Count; i = i+1)
         
                   {%>                   

               <article data-grid="ninzio_01" class="detail" id="detail-195">
                                        <div class="sp-thumbnail">


                                            <%
                        System.Data.DataTable dt2 = bind_ProfilePhoto(dt.Rows[i]["PartyID"].ToString());
                        if(dt2!=null && dt2.Rows.Count > 0 && dt2.Rows[0]["Upload_File"].ToString()!=string.Empty)
                        { %> 
                        <img width="440" height="400" alt="client Photo"  src="../ClientContractDoc/<%=dt2.Rows[0]["Upload_File"].ToString()%>" class="attachment-Montserrat-Ninzio-Square size-Montserrat-Ninzio-Square wp-post-image"/>
                                

                      <% } %>

                  <%  else { %>                          
                    <img alt="client Photo" src="../images/dummy.jpg" />
                   <%  }%>

                                          
                                       <%--     <img width="440" height="400" src="../upload/blog1-440x400.jpg" class="attachment-Montserrat-Ninzio-Square size-Montserrat-Ninzio-Square wp-post-image" alt="blog1" />--%>
                                           
                                            
                                            
                                             <div class="ninzio-overlay">
                                                <a class="nz-overlay-before" title="View details" href="#"></a>
                                            </div>
                                        </div>
                                        <div class="detail-body">
                                            <div class="detail-body-in">
                                              <%--  <span class="sticky-ind"></span>--%>


                                                <%                                                   
                                                    string t2 =dt.Rows[i]["job_Title"].ToString();
                                                    int headingLength1 = t2.Length;
                                                    if (headingLength1 > 45)
                                                    {
                                                        string str2 = t2.Substring(0, 45); %>
             <h3 class="post-title"><a href="#" title="job Title" rel="bookmark"> <%=str2%>. [...]</a></h3>
            
                   
               <% }
   %>
                                               

             <% else
    { %>
            <h3 class="detail-title"><a href="#" title="job title" rel="bookmark"> <%= dt.Rows[i]["job_Title"].ToString()%></a></h3>
             <%} %>



                                              <%--  <h3 class="detail-title"><a href="#" title="job title" rel="bookmark"> <%= dt.Rows[i]["job_Title"].ToString()%></a></h3>--%>
                                               
                                                
                                                 <div class="detail-date-full">
                                                    <i class="fa fa-user" aria-hidden="true"></i> <span><%= dt.Rows[i]["Contact_person_name"].ToString()%></span>
                                                     <%if (dt.Rows[i]["Exp"].ToString() != string.Empty)
                                                        { %>
                                                       <i class="fa fa-history" aria-hidden="true"></i>  <span>Exp:<%= dt.Rows[i]["Exp"].ToString()%></span>
                                                    <%} %>

                                                    <%else
                                                  { %>
                                                    <i class="fa fa-history" aria-hidden="true"></i>  <span>Experience:0 </span>
                                                   <%} %>
                                                     <i class="fa fa-inr"></i> <span>Price:  <%= dt.Rows[i]["Min_Salary"].ToString()%> </span>
                                                     <i class="fa fa-map-marker"></i><span> City: <%= dt.Rows[i]["City"].ToString()%></span>
                                                </div>






                                               <%                                                   
                                                   string t =dt.Rows[i]["ShortDescription"].ToString();
                                                   int headingLength = t.Length;
                                                   if (headingLength > 170)
                                                   {
                                                       string str1 = t.Substring(0, 170); %>

             <%--  <div class="post-excerpt"><%=str1%>. [...]</div>--%>
             <div class="post-excerpt text-left"><%=str1%> .... </div>
                   
               <% }
    else
    { %>
                                                 <div class="post-excerpt text-left"><%= dt.Rows[i]["ShortDescription"].ToString() %></div>

                                                <%} %>
                                               
                                               <%--  <div class="post-excerpt text-left"><%=dt.Rows[i]["ShortDescription"].ToString()%>. </div>--%>
                                                
                                                 <div class="many-skills">

                                                   <%
                    System.Data.DataTable dt3 = BindJobSkill(dt.Rows[i]["PartyID"].ToString());

                    if (dt3!=null && dt3.Rows.Count > 0)
                    { %> 
                         <%for (int k = 0; k<dt3.Rows.Count; k = k + 1)
                             { %>
                            
                        <a href="#"><%=dt3.Rows[k]["Skill_Name"].ToString()%></a>

                             <%} %>                  

                      <% } %>     



                                                </div> 
                                                <div class="clear"></div><br /><br />
                                                <% prtId = dt.Rows[i]["ShortDescription"].ToString(); %>
                                                <%--<a class="detail-more" href="../Client_Panel/Client_profile_big.aspx?uTp=3&pId=<%=dt.Rows[i]["PartyID"].ToString() %>">Read more<span class="screen-reader-text">ITS Gwalior</span></a>--%>
                                                 <a href="javascript:void(0)" class="detail-more" onclick="getClick(<%=dt.Rows[i]["PartyID"].ToString() %>,'<%=dt.Rows[i]["job_Title"].ToString() %>')">Read Moree</a>
                                                <asp:LinkButton ID="LinkButton1" class="detail-more" runat="server" OnClick="LinkButton1_Click" style="display:none">Read more</asp:LinkButton>
                                                <%-- <a class="detail-more" href="fullProfile.aspx?pId=<%=dt.Rows[i]["PartyID"].ToString() %>">Read more<span class="screen-reader-text">ITS Gwalior</span></a>--%>
                                            </div>
                                        </div>
                                    </article>

                          <%  }
                    }
               %>






                                    <%--<article data-grid="ninzio_01" class="detail" id="detail-195">
                                        <div class="sp-thumbnail">
                                            <div class="detail-category">
                                                <ul class="detail-categories">
                                                    <li><a href="#" rel="category tag">Design</a></li>
                                                </ul>
                                            </div><img width="440" height="400" src="../upload/blog1-440x400.jpg" class="attachment-Montserrat-Ninzio-Square size-Montserrat-Ninzio-Square wp-post-image" alt="blog1" />
                                            <div class="ninzio-overlay">
                                                <a class="nz-overlay-before" title="View details" href="#"></a>
                                            </div>
                                        </div>
                                        <div class="detail-body">
                                            <div class="detail-body-in">
                                                <span class="sticky-ind"></span>
                                                <h3 class="detail-title">
                                                    <a href="#" title="Read more about Welcome to Responsive Retina-Ready WP Theme" rel="bookmark">
                                                        Welcome to Responsive Retina-Ready WP Theme
                                                    </a>
                                                </h3>
                                                <div class="detail-date-full">
                                                    <span>8 Sep 2015</span>
                                                    <span>2 hours ago</span>
                                                    <span>Indore, India</span>
                                                </div>
                                                <div class="detail-excerpt">Who can forget the GIFs of the ‘90s, or the more up-to-date focus on flat design? Recently, we’ve seen a surge in popularity of responsive web design. [...]</div>
                                                <div class="many-skills">
                                                    <a href="#">HTML</a>
                                                    <a href="#">CSS</a>
                                                    <a href="#">JS</a>
                                                    <a href="#">SASS</a>
                                                    <a href="#">LESS</a>
                                                </div>
                                                <a class="detail-more" href="#">Read more<span class="screen-reader-text"> Welcome to Responsive Retina-Ready WP Theme</span></a>
                                            </div>
                                        </div>
                                    </article>--%>

                                    

                                </div>
                              <%--  <nav class=ninzio-navigation>
                                    <ul class='page-numbers'>
                                        <li><span class='page-numbers current'>1</span></li>
                                        <li><a class='page-numbers' href='page/2/indexed65ed65.html?blog_layout=list'>2</a></li>
                                        <li><a class="next page-numbers" href="page/2/indexed65ed65.html?blog_layout=list"><span class="icon icon-arrow-right8"></span></a></li>
                                    </ul>
                                </nav>--%>
                            </section>


                            
                            <aside class="sidebar">

                                  
                                
                                <uc1:Newregistration ID="Newregistration1" runat="server" />

                                  
                                
                            </aside>
                            <div class="nz-row">
                                            <div class="col col12  element-animate-false valign-top"  data-effect="none" data-align="left">
                                                <div class="col-inner" >
													<h2 class="vc_custom_heading ninzio-latter-spacing">how to join hire employee services in Gwalior</h2>
												
												<div class="sep-wrap element-animate element-animate-false nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_6127_19">&nbsp;</div>
                                                    </div>
                                                    
                                                        <div  class="nz-column-text nz-clearfix  element-animate-false" data-effect="none" data-effect-speed="50"> <p>
                                                            Are You Looking Hire Employee Services in Gwalior? We Provide Hire Employees Services in Free. It’s Very Simple Way.
                                                            <br />
                                                            <i class='fa fa-hand-o-right'></i><span>  First Easy Company Registration.</span> 
                                                            <br />
                                                             <i class='fa fa-hand-o-right'></i><span>  Create Company Profile with Job Industries, Category, Skill and More.</span>
                                                            <br />
                                                              <i class='fa fa-hand-o-right'></i><span>  Create Multiple Job Post for Hire Employees.</span>
                                                            <br />
                                                             <i class='fa fa-hand-o-right'></i><span>  Get Notification by Candidate Send Proposal.</span>
                                                            <br />
                                                             <i class='fa fa-hand-o-right'></i><span>  You can select Multiple Candidate and View Candidate job Profile.</span>
                                                            <br />
                                                             <i class='fa fa-hand-o-right'></i><span>  One Job Profile Approved and finally hire Employees.</span>
                                                            <br />
                                                             <i class='fa fa-hand-o-right'></i><span>  It’s Very Simple to Best Hire Employees in Free.</span>

                                                                                                                                                                   </p></div>
                                                </div>
												<br>
												
                                            </div>
                                        </div>
                            
                        </div>
                    </div>

                </div>

    <script type="text/javascript">
        function getClick(x,t)
        {
            // alert(x);
            document.getElementById('<%= hdfpartyid.ClientID %>').value = x;
            document.getElementById('<%= hdfJTtle.ClientID %>').value = t;
            var btn = document.getElementById('<%=LinkButton1.ClientID%>');
btn.click();

        }
    </script>
</asp:Content>

