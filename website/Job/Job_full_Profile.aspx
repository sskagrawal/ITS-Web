﻿<%@ Page Title="" Language="C#" MetaDescription="Its Gwalior provide job post and hire employee according to your requirments" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Job_full_Profile.aspx.cs" Inherits="Job_Job_full_Profile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Controle/Newregistration.ascx" TagName="Newregistration" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
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

.many-skills a{
    margin-top: 10px;
}

.job-apply{
    float: right;
    margin-top: 20px;
}

@media only screen and (max-width:375px) {
    .job-apply{
        float: none;
        text-align: right;
    }
    /*.col12.col-second {
        margin-left: -28px !important;
        margin-right: -28px !important;
    }*/
    .post-body-in {
        margin-left: -37px;
        margin-right: -37px;
    }
    h3#h3_01b4_1 {
        font-size: 21px;
    }
    table.shop_attributes p {
        margin: 0;
    }
}
@media only screen and (max-width:479px) {
    .job-apply{
        float: none;
    }
}


    </style>
   


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <asp:HiddenField ID="hdfjobid" runat="server" />   
    <asp:HiddenField ID="hdfPostedOn" runat="server" />   

  <%-- 
    <asp:HiddenField ID="hdfpartyid" runat="server"> </asp:HiddenField>--%>
     <asp:HiddenField ID="hdfUserID" runat="server"> </asp:HiddenField>
    <asp:HiddenField ID="hdfJTtle" runat="server"> </asp:HiddenField>





     <header class="rich-header page-header version1" data-parallax="true" id="header_bd96_0">
                    <div class="parallax-container" id="div_bd96_0">&nbsp;</div>
                    <div class="container nz-clearfix">
                        <div class="rh-content">
                            <h1>Job Full Profile</h1>
                            <div class="rh-separator">&nbsp;</div>
                            <div id="div_bd96_1" class="nz-breadcrumbs nz-clearfix"><a href="index.html">Home</a><span class="current">Job Profile</span></div>
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
                   
                                     <article data-grid="ninzio_01" class="post-194 post type-post status-publish format-aside has-post-thumbnail hentry category-marketing tag-design tag-eva tag-external tag-logo tag-marketing tag-ninzio-style tag-painting tag-smart post_format-post-format-aside" id="post-194" style="position:absolute;left:0px; top:0px;">
                                                              
                                                                  
                                 
                                   <%  if (dt!=null && dt.Rows.Count > 0)
                                 {%>   
                                 
                                 
                                 
                                 <div class="post-date-custom"><span><asp:Label id="lblCounter" runat="server" Text=""></asp:Label></span><span>View</span></div>

                                       
                                 
                                 
                                  
                                    <div class="post-body">
                                        <div class="post-body-in">
                                            <div class="format-wrapper nz-clearfix">

                                                 
                                              

                                                 <div class="col12" style="margin:0;"> 
                                                    <div class="col-inner">                                                 


                                                        <h3 id="h3_01b4_1" class="vc_custom_heading ninzio-latter-spacing" style="text-align:left;"><%= dt.Rows[0]["job_Title"].ToString()%></h3>
                                                        <div class="" style="text-align:left;" data-effect="none">
                                                        <div class="nz-separator solid" id="div_01b4_21">&nbsp;</div></div>
                                                       </div>                              
                                                      
                                                            <%--  <asp:HiddenField ID="hdfJobOpDate" Value='<%# Eval("jobopen_Date") %>' runat="server"> 
                                                                </asp:HiddenField>--%>
                                                            <p> <i class="fa fa-calendar" aria-hidden="true"></i> <strong>Posted On: </strong> <asp:Label ID="lblPostDay" runat="server" Text=''></asp:Label> <strong>|</strong> <strong>Posted By : </strong> <%=dt.Rows[0]["Party_name"].ToString()%>   <strong>|</strong> <strong> <i class="fa fa-map-marker"></i><span> Location: </strong><%=dt.Rows[0]["CityID"].ToString()%></p>
                                                             
                                                                            <p><strong> <i class="fa fa-history" aria-hidden="true"></i> Experience: </strong>
                                                                                <%if (dt.Rows[0]["Exp"].ToString() != string.Empty && dt.Rows[0]["Exp"].ToString() != "Select Experience")
                                                                                    { %>
                                                                                   <%= dt.Rows[0]["Exp"].ToString()%>  
                                                                                <%}
    else
    { %>
                                                                                Not Required
                                                                                <%} %>
                                                                                
                                                                               &nbsp;   <strong>|</strong> &nbsp;&nbsp;<strong>No. of Position: </strong><%=dt.Rows[0]["Position"].ToString() %> &nbsp;&nbsp;<strong>|</strong> &nbsp;&nbsp;<strong> Budget: <i class="fa fa-inr"></i> </strong>  
                                                                                <% if (dt.Rows[0]["Time_Unit"].ToString() == "Fix Price")
                                                                                    { %>
                                                                                  <%=dt.Rows[0]["FixPrice"].ToString() %> Fix Price
                                                                                <%}
    else
    { %>
                                                                                <%=dt.Rows[0]["MimiSalery"].ToString() %> -   <%=dt.Rows[0]["MaxiMum"].ToString() %>

                                                                                <%} %>
                                                                                
                                                                                 <br /> 
                                                            <p><strong> <i class="fa fa-graduation-cap" aria-hidden="true"></i> Quali: </strong>
                                                                <%if (dt.Rows[0]["job_Qulalification"].ToString() != string.Empty && dt.Rows[0]["job_Qulalification"].ToString() != "Select Qualification")
                                                                    { %>
                                                                  <%= dt.Rows[0]["job_Qulalification"].ToString()%> 
                                                                <%}
    else
    { %>
                                                                Not Required

                                                                <%} %>
                                                                
                                                                    &nbsp;<strong>|</strong> &nbsp;<strong>Job Type: </strong> <%= dt.Rows[0]["JobType"].ToString()%> &nbsp;<strong>|</strong> &nbsp;<strong>Job Field: </strong> <%= dt.Rows[0]["Industry"].ToString()%> </p>
                                                           
                                                            <div class="post-excerpt" style="font-size: 14px; margin-bottom: 22px;  line-height: 25px;  font-family: Open Sans;    font-style: normal;">
                                                              <strong>  Description: </strong>
                                                                  
                                                                <asp:Label ID="lblDesc" runat="server"></asp:Label>                                                   
                                                               
                                                            </div>

                                                    
                                                  




                                                <hr> 
                                                 <asp:Panel ID="pRMore" visible="true" runat="server">
                                                          <div class="col12">
                                                              <div class="job-apply" <%--style="float:right; margin-top:20px;"--%> >                                                          
                                                          
                                                             
                                                              <a  href="../Client_Panel/Full_Job_Profile.aspx?JID=<%= dt.Rows[0]["job_Id"].ToString()%>&m=1" class="button button-3d green full-false medium square icon-true animate-false anim-type-ghost element-animate-false" style="background-color:#F0634C"><span class="txt">Apply Now</span><span class="btn-icon icon-arrow-right10"></span></a>
                                                                  
                                                           
                                                                  
                                                                   </div>

                                                                <a href="javascript:void(0)" class="detail-more" onclick="getClick(<%= dt.Rows[0]["job_Id"].ToString()%>,'<%= dt.Rows[0]["job_Title"].ToString()%>')">Read Moree</a>
                                                               <asp:LinkButton ID="LinkButton1" class="detail-more" runat="server" OnClick="LinkButton1_Click" style="display:none">Read more</asp:LinkButton>
                                                               



                                                          </div>
                                                       </asp:Panel>
                                                       
                                                            
                                                                
                                                    
                                                     
                                              </div>
                                           
                                              

                                                 <div class="col12 col-second" style="margin:0;"> 
                                                    <a class="col-inner">                                                 

                                                          <h3 id="h3_01b4_1" class="vc_custom_heading ninzio-latter-spacing" style="text-align:left;">Contact Details</h3>
                                                         <div class="" style="text-align:left;" data-effect="none">
                                                        <div class="nz-separator solid" id="div_01b4_21">&nbsp;</div></div>
                                                        
                                                         <table class="shop_attributes">
                                                              <tr >
                                                    <th>Mobile:</th>
                                                  

                                                    <td><a href="tel:<%= dt.Rows[0]["mobile_no"].ToString()%>" onclick="gtclToaction(<%= dt.Rows[0]["mobile_no"].ToString()%>,<%= dt.Rows[0]["job_Id"].ToString()%>)"><%= dt.Rows[0]["mobile_no"].ToString()%></a></td>



                                                </tr>



                                         
                                                  <% if(dt.Rows[0]["phone_no"].ToString()!=string.Empty)
                                                      { %>

                                                       <tr>
                                                    <th>Whatsapp:</th>                                            


                                                  <td><a href="https://api.whatsapp.com/send?phone=+91<%= dt.Rows[0]["phone_no"].ToString()%>"  onclick="gtclToaction(<%= dt.Rows[0]["phone_no"].ToString()%>,<%= dt.Rows[0]["job_Id"].ToString()%>)"><%= dt.Rows[0]["phone_no"].ToString()%></a> </td>



                                                </tr>
                                                      <%  }
                                                           %>
                                                    


                                                   <% if(dt.Rows[0]["Email"].ToString()!=string.Empty)
                                                      { %>

                                                             <tr >
                                                    <th>Email:</th>
                                                     <td><a href="mailto:<%= dt.Rows[0]["Email"].ToString()%>" onclick="gtclToaction('<%= dt.Rows[0]["Email"].ToString()%>',<%= dt.Rows[0]["PartyID"].ToString()%>)"><%= dt.Rows[0]["job_Id"].ToString()%></a></td>
                                                    <%--<td><a href="mailto:<%= dt.Rows[0]["Email"].ToString()%>"> <%= dt.Rows[0]["Email"].ToString()%> </a></td>--%>
                                                </tr>

                                                       <%  }
                                                           %>


                                                    <tr>
                                                    <th></th>
                                                    <td>
                                                        <p></p>
                                                    </td>
                                                </tr>

                                                             </table>



                                                        <h3 id="h3_01b4_1" class="vc_custom_heading ninzio-latter-spacing" style="text-align:left;">Job Details</h3>
                                                         <div class="" style="text-align:left;" data-effect="none">
                                                        <div class="nz-separator solid" id="div_01b4_21">&nbsp;</div></div>
                                                        </div>
                                                     <table class="shop_attributes">

                                               <%-- <tr >
                                                    <th>EMPLOYMENT TYPE:</th>
                                                    <td class="product_weight"> <%= dt.Rows[0]["JobType"].ToString()%></td>
                                                </tr>--%>

                                                          <tr >
                                                    <th>INDUSTRY:</th>
                                                    <td>
                                                        <%= dt.Rows[0]["Industry"].ToString()%>
                                                    </td>
                                                </tr>


                                                <tr class="alt">
                                                    <th>JOB CATEGORY</th>
                                                    <td><%= dt.Rows[0]["JobSubCateName"].ToString()%></td>
                                                </tr>

                                             

                                                 <tr >
                                                    <th>PROJECT FILE:</th>
                                                    <td>

                                                        <%if (dt.Rows[0]["Project_File"].ToString() != string.Empty)
                                                            { %>
                                                       <%=dt.Rows[0]["Project_File"].ToString()%>     <span style="margin-left:10px;">   <a href="../post_job_doc/<%= dt.Rows[0]["Project_File"].ToString()%>"><img src="../img/Download.gif" /></a> </span> 
                                                        <%} %>

                                                        <%else
    {%>
                                                            Not Available 
                                                        <%} %>



                                                    </td>
                                                </tr>
                                                         <tr>
                                                             <th>Skills:</th>
                                                             <td>
 <div class="many-skills">



                                                  <%
                    System.Data.DataTable dt4 = BindJobSkill(dt.Rows[0]["job_Id"].ToString());

                    if (dt4!=null && dt4.Rows.Count > 0)
                    { %> 
                           
                         <%for (int k = 0; k<dt4.Rows.Count; k = k + 1)
                             { %>
                            
                                                            
               
                     <a href="#"><%=dt4.Rows[k]["Skill_Name"].ToString()%></a>

              

                             <%} %>                  

                      <% } %>                                     
                     </div>
                                                             </td>
                                                         </tr>


                                                 

                                            </table>
                                                       <br />



                                            




                                            

                                                      <div class="col-inner">                                                 


                                                        <h3 id="h3_01b4_1" class="vc_custom_heading ninzio-latter-spacing" style="text-align:left;">Job Description</h3>
                                                         <div class="" style="text-align:left;" data-effect="none">
                                                        <div class="nz-separator solid" id="div_01b4_21">&nbsp;</div></div>
                                                        </div>
                                                     <p><span id="span_6510_1"><%= dt.Rows[0]["job_Desc"].ToString()%></span></p>
                                     
                                                     <div class="job-apply">                                                                                                           
                                                        <a  href="../Client_Panel/Full_Job_Profile.aspx?JID=<%= dt.Rows[0]["job_Id"].ToString()%>&m=1" class="button button-3d green full-false medium square icon-true animate-false anim-type-ghost element-animate-false" style="background-color:#F0634C"><span class="txt">Apply Now</span><span class="btn-icon icon-arrow-right10"></span></a>
                                                       </div>


                                                    
                                                     </div>
                                                </div>
                                            </div>
                                                 </div>


                                         

                                          <%  }
                   
               %>    
                                             </article>
                                        
                                          
                     </div>
                                      
                
              </section>

                    
                                
                            </section>
               
            
            <%--  //Secrion 2--%>


                              

                            <aside class="sidebar">

                                <uc1:Newregistration ID="Newregistration1" runat="server" />
                                
                            </aside>

                        </div>
                    </section>
                </div>

         <script type="text/javascript">
        function gtclToaction(mono,jobid)
        {
            var baseURL = window.location.protocol + "//" + window.location.host + "//";
            //alert(vPincodeid);
            $.ajax({
                type: "POST",
                url: "" + baseURL + "WebMethod/AutoComplete.asmx/SaveCalltoAction1",
                data: "{'mno':'" + mono + "','jobid':'" + jobid + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    //document.getElementById("cart_num1").innerHTML = data.d;
                    
                },
                error: function () {

                }
            });
            return false;

        }
    </script>
</asp:Content>

