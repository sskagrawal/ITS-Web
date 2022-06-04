<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="job-apply-now.aspx.cs" Inherits="Client_Panel_job_apply_now" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hdfjobid" runat="server" />
     <asp:HiddenField ID="hdfUserID" runat="server" />
    

    <div class="content-w">     
    <div class="content-i">
    <div class="content-box">
        <!--START - Control panel above projects-->
        
        <div class="os-tabs-w mx-4">
        <div class="os-tabs-controls">
            <ul class="nav nav-tabs upper">
          <%--  <li class="nav-item"><a aria-expanded="false" class="nav-link" data-toggle="tab" href="#tab_overview"> Active</a></li>
            <li class="nav-item"><a aria-expanded="false" class="nav-link" data-toggle="tab" href="#tab_sales"> Overview</a></li>
            <li class="nav-item"><a aria-expanded="false" class="nav-link" data-toggle="tab" href="#tab_sales"> Closed</a></li>--%>
            <li class="nav-item"><a aria-expanded="true" class="nav-link active" data-toggle="tab" href="#tab_sales">Apply Now</a></li>
            </ul>
            
            <ul class="nav nav-pills smaller hidden-md-down">
            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#"> Today</a></li>
            <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#"> 7 Days</a></li>
            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#"> 14 Days</a></li>
            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#"> Last Month</a></li>
            </ul>
            </div>
        </div>
        <!--END - Control panel above projects-->
        
        <div class="row">
        <div class="col-lg-8">
            <div class="padded-lg"><!--START - Projects list-->


                  <div id="alert" runat="server" visible="false" class="alert success">
                                                      
                  <asp:Label ID="lblMSG" runat="server" Text=""></asp:Label>
                   <span class="close-alert">X</span>
                    </div>
    
    <div class="projects-list">      
        <div class="project-box">           
            
            <asp:Literal ID="ltrApplyJob" runat="server"></asp:Literal>

           <%-- <div class="project-head">
                <div class="project-title">
                    <h5>Company Name : Priya Soft</h5>

                </div>               
            
            </div>--%>

            <%--<div class="project-info" style="padding-top:0px!important;">
                <div class="row align-items-center">
                    <div class="col-sm-12">
                        <div class="row">
                            <div class="col-12">

                                 <table class="table">                  


                            <tr>
                                <td><span style="color:#000000;">Contact Info Name:</span>  </td>
                                <td><span class="text-primary"> Surendra Kumar</span></td>
                            </tr>

                         <tr>
                                <td><span style="color:#000000;">Mobile:</span>  </td>
                                <td><span class="text-primary"> 9098902547</span></td>
                            </tr>
               

                          <tr>
                                <td><span style="color:#000000;">Email ID:</span>  </td>
                                <td><span class="text-primary"> surendragoyal2547@gmail.com </span></td>
                            </tr>

                            <tr>
                                <td><span style="color:#000000;">Website:</span>  </td>
                                <td><span class="text-primary"> priyasoft.com </span></td>
                            </tr>


                           <tr>
                                <td><span style="color:#000000;">Address:</span>  </td>
                                <td><span class="text-primary"> Morar Gwalior </span></td>
                            </tr>

                                     </table>




                            </div>
                             <div class="text-right">
                            <a href=""  class='nav-link text-primary'>Back </a>
                            </div>

                        </div>

                    </div>
                    
                    </div></div>--%>


        </div>
        
        
      <%--  <div class="project-box"><div class="project-head"><div class="project-title"><h5>New Hiring</h5></div><div class="project-users"><div class="avatar"><img alt="" src="img/avatar2.jpg"></div><div class="avatar"><img alt="" src="img/avatar3.jpg"></div><div class="avatar"><img alt="" src="img/avatar1.jpg"></div><div class="avatar"><img alt="" src="img/avatar5.jpg"></div><div class="more">+ 5 More</div></div></div><div class="project-info"><div class="row align-items-center"><div class="col-sm-5"><div class="row"><div class="col-6"><div class="el-tablo highlight"><div class="label">Open tasks</div><div class="value">32</div></div></div><div class="col-6"><div class="el-tablo highlight"><div class="label">Contributors</div><div class="value">17</div></div></div></div></div><div class="col-sm-5 offset-sm-2"><div class="os-progress-bar primary"><div class="bar-labels"><div class="bar-label-left"><span>Progress</span><span class="positive">+10</span></div><div class="bar-label-right"><span class="info">85/100</span></div></div><div class="bar-level-1" style="width: 100%"><div class="bar-level-2" style="width: 85%"><div class="bar-level-3" style="width: 42%"></div></div></div></div></div></div></div>


        </div>--%>



    </div><!--END - Projects list--></div>



        </div>
            
            
            
            
            <div class="col-lg-4 b-l-lg"><div class="padded-lg"><!--START - Projects Statistics--><div class="element-wrapper"><div class="element-actions"><form class="form-inline justify-content-sm-end"><select class="form-control form-control-sm rounded"><option value="Pending">Today</option><option value="Active">Last Week </option><option value="Cancelled">Last 30 Days</option></select></form></div><h6 class="element-header">Project Statistics</h6><div class="element-box"><div class="padded m-b">
                
                <div class="centered-header">
                    <h6>Period Statistics</h6>

                </div>
                <div class="row">
                    <div class="col-6 b-r b-b">
                        <div class="el-tablo centered padded-v-big highlight bigger">
                            <div class="label">Users</div><div class="value">24</div>

                        </div>

                    </div><div class="col-6 b-b"><div class="el-tablo centered padded-v-big highlight bigger"><div class="label">Tasks</div><div class="value">251</div></div></div></div></div><div class="padded m-b"><div class="centered-header"><h6>Completions</h6></div><div class="os-progress-bar primary"><div class="bar-labels"><div class="bar-label-left"><span>Progress</span><span class="positive">+12</span></div><div class="bar-label-right"><span class="info">72/100</span></div></div><div class="bar-level-1" style="width: 100%"><div class="bar-level-2" style="width: 72%"><div class="bar-level-3" style="width: 25%"></div></div></div></div><div class="os-progress-bar primary"><div class="bar-labels"><div class="bar-label-left"><span>Progress</span><span class="negative">-5</span></div><div class="bar-label-right"><span class="info">54/100</span></div></div><div class="bar-level-1" style="width: 100%"><div class="bar-level-2" style="width: 54%"><div class="bar-level-3" style="width: 25%"></div></div></div></div><div class="os-progress-bar primary"><div class="bar-labels"><div class="bar-label-left"><span>Progress</span><span class="positive">+5</span></div><div class="bar-label-right"><span class="info">86/100</span></div></div><div class="bar-level-1" style="width: 100%"><div class="bar-level-2" style="width: 86%"><div class="bar-level-3" style="width: 25%"></div></div></div></div></div><div class="padded"><div class="centered-header"><h6>Tasks Closed</h6></div><div class="el-chart-w"><canvas height="130" id="liteLineChart" width="300"></canvas></div></div></div></div><!--END - Projects Statistics--></div></div></div><!--------------------
START - Chat Popup Box
--------------------><div class="floated-chat-btn"><i class="os-icon os-icon-mail-07"></i><span>Demo Chat</span></div><div class="floated-chat-w"><div class="floated-chat-i"><div class="chat-close"><i class="os-icon os-icon-close"></i></div><div class="chat-head"><div class="user-w with-status status-green"><div class="user-avatar-w"><div class="user-avatar"><img alt="" src="img/avatar1.jpg"></div></div><div class="user-name"><h6 class="user-title">John Mayers</h6><div class="user-role">Account Manager</div></div></div></div><div class="chat-messages"><div class="message"><div class="message-content">Hi, how can I help you?</div></div><div class="date-break">Mon 10:20am</div><div class="message"><div class="message-content">Hi, my name is Mike, I will be happy to assist you</div></div><div class="message self"><div class="message-content">Hi, I tried ordering this product and it keeps showing me error code.</div></div></div><div class="chat-controls"><input class="message-input" placeholder="Type your message here..." type="text"><div class="chat-extra"><a href="#"><span class="extra-tooltip">Attach Document</span><i class="os-icon os-icon-documents-07"></i></a><a href="#"><span class="extra-tooltip">Insert Photo</span><i class="os-icon os-icon-others-29"></i></a><a href="#"><span class="extra-tooltip">Upload Video</span><i class="os-icon os-icon-ui-51"></i></a></div></div></div></div><!--------------------
END - Chat Popup Box
--------------------></div></div></div>
      <script src="../../js/jquery-1.12.4.js"></script>




</asp:Content>

