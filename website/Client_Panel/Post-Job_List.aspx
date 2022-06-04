<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Post-Job_List.aspx.cs" Inherits="Client_Panel_Post_Job_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="content-w">
    
   <%-- <div class="top-menu-secondary">
  
    <div class="top-menu-controls">      
        
        
        <div class="logged-user-w">
        
        <div class="logged-user-i">
        <div class="avatar-w">
            <img alt="" src="img/avatar1.jpg">
            </div><div class="logged-user-menu">
            <div class="logged-user-avatar-info">
            <div class="avatar-w">
                <img alt="" src="img/avatar1.jpg"></div>
            <div class="logged-user-info-w">
                <div class="logged-user-name">Maria Gomez</div>
                <div class="logged-user-role">Administrator</div>
                </div>
            </div>
            
            <div class="bg-icon">
            <i class="os-icon os-icon-wallet-loaded"></i>
            </div>
            <ul>
            
            <li><a href="apps_email.html"><i class="os-icon os-icon-mail-01"></i><span>Incoming Mail</span></a></li>
            <li><a href="users_profile_big.html"><i class="os-icon os-icon-user-male-circle2"></i><span>Profile Details</span></a></li>
            <li><a href="users_profile_small.html"><i class="os-icon os-icon-coins-4"></i><span>Billing Details</span></a></li>
            <li><a href="#"><i class="os-icon os-icon-others-43"></i><span>Notifications</span></a></li>
            <li><a href="#"><i class="os-icon os-icon-signs-11"></i><span>Logout</span></a></li>
            </ul></div></div>
        </div>
        <!--------------------END - User avatar and menu in secondary top menu-------------------->
        </div>
    </div>
    --%>
    <div class="content-i">
    <div class="content-box">
        <!--START - Control panel above projects-->
        
        <div class="os-tabs-w mx-4">
        <div class="os-tabs-controls">
            <ul class="nav nav-tabs upper">
            <li class="nav-item"><a aria-expanded="false" class="nav-link active" data-toggle="tab" href="#tab_overview">Post Job List</a></li>
           <%-- <li class="nav-item"><a aria-expanded="false" class="nav-link" data-toggle="tab" href="#tab_sales"> Overview</a></li>
            <li class="nav-item"><a aria-expanded="false" class="nav-link" data-toggle="tab" href="#tab_sales"> Closed</a></li>
            <li class="nav-item"><a aria-expanded="true" class="nav-link active" data-toggle="tab" href="#tab_sales"> Required</a></li>--%>
            </ul>
            
         <%--   <ul class="nav nav-pills smaller hidden-md-down">
            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#"> Today</a></li>
            <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#"> 7 Days</a></li>
            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#"> 14 Days</a></li>
            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#"> Last Month</a></li>
            </ul>--%>
            </div>
        </div>
        <!--END - Control panel above projects-->
        
        <div class="row">
        <div class="col-lg-8">
            <div class="padded-lg">
    
    <div class="projects-list">

         <%  if (dt != null && dt.Rows.Count > 0)
             {
                 for (int i = 0; i < dt.Rows.Count; i = i + 1)

                 {%>    

    <div class="project-box">
        <div class="project-head">        
        <div class="project-title">


             <%                                                   
                 string t2 = dt.Rows[i]["job_Title"].ToString();
                 int headingLength1 = t2.Length;
                 if (headingLength1 > 30)
                 {
                     string str2 = t2.Substring(0, 30); %>
                   <h5> <%=str2 %> ...</h5>          
                
               <% } %>

              <%else
    { %>
                    <h5> <%= dt.Rows[i]["job_Title"].ToString()%></h5>

                 <%} %>






          


            </div>        
        <div class="project-users"> 
            
            <% if (dt.Rows[i]["View_Counter"].ToString() != string.Empty)
    { %>        
            
              <div class="more">+ <%= dt.Rows[i]["View_Counter"].ToString()%> View</div>  
            <%} %>         
            
            <% else
    { %>  
             <div class="more">+ 0 View</div>  

            <%} %>
                    
            </div> 

        </div>
        
        <div class="project-info">        
        <div class="row align-items-center">
        <div class="col-sm-12">
            <div class="row">
            <div class="col-12">
              <div class="el-tablo highlight">
                <div><strong> <i class="fa fa-calendar" aria-hidden="true"></i> Posted On </strong> : <%= Convert.ToDateTime(dt.Rows[i]["CreatedOn"]).ToString("dd-MM-yyyy") %> <strong> | </strong> <strong> <i class="fa fa-user" aria-hidden="true"></i> Posted By </strong> <span class="message-content"> <%= dt.Rows[i]["Party_name"].ToString()%></span> <strong> | </strong> <strong> <i  class="fa fa-map-marker"></i> City</strong> <%= dt.Rows[i]["CityID"].ToString()%> <br/> 
                      <strong> <i class="fa fa-history" aria-hidden="true"></i> Experience </strong> : 
                    <%if (dt.Rows[i]["Exp"].ToString() != string.Empty && dt.Rows[i]["Exp"].ToString() != "Select Experience")
                        { %>     
                    <%= dt.Rows[i]["Exp"].ToString()%> 

                    <%}

    else
    { %>
                    Not Required

                    <%} %>
                    
                    <strong>|</strong> <strong>  <i class="fa fa-users" aria-hidden="true"></i>  No.of Position: </strong> <%= dt.Rows[i]["Position"].ToString()%>   <strong>  | </strong>  <strong> <i class="fa fa-inr" aria-hidden="true"></i>  Price: </strong> 
                     <%if (dt.Rows[0]["Time_Unit"].ToString() == "Fix Price")
                                                                                    { %>
                      <%=dt.Rows[0]["FixPrice"].ToString() %> Fix Price

                    <%}
    else
    { %>
                    <%= dt.Rows[i]["MimiSalery"].ToString()%>
                      <%} %>
                    
                    
                     <br/> 
                     <strong><i class="fa fa-graduation-cap" aria-hidden="true"></i> Quali</strong> : 
                   <%if (dt.Rows[i]["job_Qulalification"].ToString() != string.Empty && dt.Rows[i]["job_Qulalification"].ToString() != "Select Qualification")
                       {
                        %>
                    
                     <%= dt.Rows[i]["job_Qulalification"].ToString()%>  
                    <%}
    else
    { %>
                    Not Required

                    <%} %>
                    
                    <strong>|</strong> <strong>  <i class="fa fa-tasks" aria-hidden="true"></i> Job Type: </strong>  <%= dt.Rows[i]["JobType"].ToString()%> 
                   <%-- <strong> | </strong> <strong> Job Field: </strong> <%= dt.Rows[i]["Industry"].ToString()%>--%>

                </div> 
                           
                </div>
                           
             

                  <%                                                   
                      string t = dt.Rows[i]["job_Desc"].ToString();
                      int headingLength = t.Length;
                      if (headingLength > 120)
                      {
                          string str1 = t.Substring(0, 120); %>
                <%--  <div class="message-content"><%= dt.Rows[i]["job_Desc"].ToString()%> </div>--%>
           <div class="message-content"><%=str1%> ....</div>
       
                   
               <% } %>

             <%else { %>
              
                <div class="message-content"><%= dt.Rows[i]["job_Desc"].ToString()%> </div>
                 <%} %>


                </div>   
                
                         
            
            </div>

         <br />
             <div class="os-tabs-controls">     
                   
            
            <ul class="nav nav-pills smaller hidden-md-down">
                                  <%
                    System.Data.DataTable dt3 = BindJobSkill(dt.Rows[i]["job_Id"].ToString());

                    if (dt3!=null && dt3.Rows.Count > 0)
                    { %> 

               
                         <%for (int k = 0; k<dt3.Rows.Count; k = k + 1)
                             { %>
                            
                       
                           <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#" aria-expanded="true"><%=dt3.Rows[k]["Skill_Name"].ToString()%></a></li>&nbsp;

                             <%} %>                  

                      <% } %>     


         <%--   <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#" aria-expanded="true"> Today</a></li>--%>
           
          
                  </ul>
            </div>

            <div class="project-users text-right">        
                    
            <div class="pt-btn"><a class="mr-2 mb-2 btn btn-success btn-rounded" href="Full_Job_Profile.aspx?JID=<%= dt.Rows[i]["job_Id"].ToString()%>">View More</a></div>    
            
            </div>
            
        </div>  
        
        </div></div></div>
        
        <%}
                       } %>
        
        
        
        <%--<div class="project-box">
            
            <div class="project-head">
                
                <div class="project-title">
                    
                    <h5>New Hiring</h5></div>
                
                <div class="project-users">
                    
                    <div class="avatar">
                        
                        <img alt="" src="img/avatar2.jpg">


                    </div><div class="avatar"><img alt="" src="img/avatar3.jpg"></div>
                    
                    <div class="avatar">
                        
                        <img alt="" src="img/avatar1.jpg"></div>
                    
                    <div class="avatar">
                        
                        <img alt="" src="img/avatar5.jpg"></div>
                    
                    <div class="more">+ 5 More</div></div></div>
            
            <div class="project-info">
                
                <div class="row align-items-center">
                    
                    <div class="col-sm-5"><div class="row">
                        
                        <div class="col-6"><div class="el-tablo highlight">
                            
                            <div class="label">Open tasks</div>
                            
                            <div class="value">32</div>

                                           </div>

                        </div><div class="col-6">
                            <div class="el-tablo highlight">
                                <div class="label">Contributors</div>
                                
                                <div class="value">17</div>

                            </div>

                              </div>

                                          </div>

                    </div>
                    
                    <div class="col-sm-5 offset-sm-2">
                        <div class="os-progress-bar primary">
                            <div class="bar-labels">
                                <div class="bar-label-left">
                                    <span>Progress</span><span class="positive">+10</span></div>
                                
                                <div class="bar-label-right">
                                    
                                    <span class="info">85/100</span></div></div>
                            
                            <div class="bar-level-1" style="width: 100%">
                                <div class="bar-level-2" style="width: 85%">
                                    
                                    <div class="bar-level-3" style="width: 42%">

                          </div></div></div></div></div>

                </div>


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           </div></div>--%>




    </div>
                
                
                
                <!--END - Projects list-->

            </div>

        </div>
        
        <div class="col-lg-4 b-l-lg">
            
            <div class="padded-lg"><!--START - Projects Statistics-->
            <div class="element-wrapper">
                <div class="element-actions">
                <form class="form-inline justify-content-sm-end">
                    <select class="form-control form-control-sm rounded">
                    <option value="Pending">Today</option>
                    <option value="Active">Last Week </option>
                    <option value="Cancelled">Last 30 Days</option>
                    </select>
                    </form>
                </div>
                
                <h6 class="element-header">Project Statistics</h6><div class="element-box"><div class="padded m-b"><div class="centered-header"><h6>Period Statistics</h6></div><div class="row"><div class="col-6 b-r b-b"><div class="el-tablo centered padded-v-big highlight bigger"><div class="label">Users</div><div class="value">24</div></div></div><div class="col-6 b-b"><div class="el-tablo centered padded-v-big highlight bigger"><div class="label">Tasks</div><div class="value">251</div></div></div></div></div><div class="padded m-b"><div class="centered-header"><h6>Completions</h6></div><div class="os-progress-bar primary"><div class="bar-labels"><div class="bar-label-left"><span>Progress</span><span class="positive">+12</span></div><div class="bar-label-right"><span class="info">72/100</span></div></div><div class="bar-level-1" style="width: 100%"><div class="bar-level-2" style="width: 72%"><div class="bar-level-3" style="width: 25%"></div></div></div></div><div class="os-progress-bar primary"><div class="bar-labels"><div class="bar-label-left"><span>Progress</span><span class="negative">-5</span></div><div class="bar-label-right"><span class="info">54/100</span></div></div><div class="bar-level-1" style="width: 100%"><div class="bar-level-2" style="width: 54%"><div class="bar-level-3" style="width: 25%"></div></div></div></div><div class="os-progress-bar primary"><div class="bar-labels"><div class="bar-label-left"><span>Progress</span><span class="positive">+5</span></div><div class="bar-label-right"><span class="info">86/100</span></div></div><div class="bar-level-1" style="width: 100%"><div class="bar-level-2" style="width: 86%"><div class="bar-level-3" style="width: 25%"></div></div></div></div></div><div class="padded"><div class="centered-header"><h6>Tasks Closed</h6></div><div class="el-chart-w"><canvas height="130" id="liteLineChart" width="300"></canvas></div></div></div></div><!--END - Projects Statistics-->
            </div>
            </div>
        </div>
        
        
        
        
        <!--------------------
START - Chat Popup Box
--------------------><div class="floated-chat-btn"><i class="os-icon os-icon-mail-07"></i><span>Demo Chat</span></div><div class="floated-chat-w"><div class="floated-chat-i"><div class="chat-close"><i class="os-icon os-icon-close"></i></div><div class="chat-head"><div class="user-w with-status status-green"><div class="user-avatar-w"><div class="user-avatar"><img alt="" src="img/avatar1.jpg"></div></div><div class="user-name"><h6 class="user-title">John Mayers</h6><div class="user-role">Account Manager</div></div></div></div><div class="chat-messages"><div class="message"><div class="message-content">Hi, how can I help you?</div></div><div class="date-break">Mon 10:20am</div><div class="message"><div class="message-content">Hi, my name is Mike, I will be happy to assist you</div></div><div class="message self"><div class="message-content">Hi, I tried ordering this product and it keeps showing me error code.</div></div></div><div class="chat-controls"><input class="message-input" placeholder="Type your message here..." type="text"><div class="chat-extra"><a href="#"><span class="extra-tooltip">Attach Document</span><i class="os-icon os-icon-documents-07"></i></a><a href="#"><span class="extra-tooltip">Insert Photo</span><i class="os-icon os-icon-others-29"></i></a><a href="#"><span class="extra-tooltip">Upload Video</span><i class="os-icon os-icon-ui-51"></i></a></div></div></div></div><!--------------------
END - Chat Popup Box
--------------------></div></div></div>
     <script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

