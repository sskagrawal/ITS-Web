<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ViewProposal.aspx.cs" Inherits="Client_Panel_ViewProposal" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hdfPslId" runat="server" />

      <asp:HiddenField ID="hdfjobId" runat="server" />
     <asp:HiddenField ID="hdfpartyid" runat="server" />
    <asp:HiddenField ID="hdfStatus" runat="server" />
     <asp:HiddenField ID="hdfCompPartyId" runat="server" />
     <asp:HiddenField ID="hdfRatingVal" runat="server" />

    <div class="content-w"> 
    
    <div class="content-i">
    <div class="content-box">
        <!--START - Control panel above projects-->
        
        <div class="os-tabs-w mx-4">
        <div class="os-tabs-controls">

          <%--  <div class="col-lg-12">--%>

            <%--    <h4>Job Post Detail</h4>--%>

             <%--   </div>--%>



            <ul class="nav nav-tabs upper">
            <li class="nav-item"><a aria-expanded="false" class="nav-link active" data-toggle="tab" href="#tab_overview">Job Post Detail</a></li>
          <%--  <li class="nav-item"><a aria-expanded="false" class="nav-link" data-toggle="tab" href="#tab_sales"> Overview</a></li>
            <li class="nav-item"><a aria-expanded="false" class="nav-link" data-toggle="tab" href="#tab_sales"> Closed</a></li>
            <li class="nav-item"><a aria-expanded="true" class="nav-link" data-toggle="tab" href="#tab_sales"> Required</a></li>--%>
            </ul>
            
           <%-- <ul class="nav nav-pills smaller hidden-md-down">
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
            <div class="padded-lg"><!--START - Projects list-->
    
    <div class="projects-list">
        
         <div class="project-box">
        <div class="project-head">
        
        <div class="project-title">
            
            <h5><asp:Label ID="lblJobtitle" runat="server" Text=""></asp:Label> </h5>
            </div>
        
        <div class="project-users">          
      
            
            </div>

        </div>
             
             
             <div class="project-info">
        
        <div class="row align-items-center">
        
        <div class="col-sm-12">
            <div class="row">
            <div class="col-12">
              <div class="el-tablo highlight">
                <div><strong> <i class="fa fa-calendar" aria-hidden="true"></i> Posted On: </strong><asp:Label ID="lbljobpostingDate" runat="server" Text=""></asp:Label> <strong> | </strong> <strong> <i class="fa fa-user" aria-hidden="true"></i> Posted By: </strong> <span class="message-content"> <asp:Label ID="lblPostedBy" runat="server" Text=""></asp:Label></span> <strong> | </strong> <strong> <i  class="fa fa-map-marker"></i> City :</strong> <asp:Label ID="lbljobCity" runat="server" Text=""></asp:Label> <br/>   <strong> <i class="fa fa-history" aria-hidden="true"></i> Experience : </strong> <asp:Label ID="lblJobExp" runat="server" Text=""></asp:Label> <strong>|</strong> <strong>  <i class="fa fa-users" aria-hidden="true"></i>  No.of Position: </strong> <asp:Label ID="lbljobposition" runat="server" Text=""></asp:Label> <strong>  | </strong>  <strong> <i class="fa fa-inr" aria-hidden="true"></i>  Price: </strong> <asp:Label ID="lblBudget" runat="server" Text=""></asp:Label> <br/>  <strong><i class="fa fa-graduation-cap" aria-hidden="true"></i> Qualification: </strong> <asp:Label ID="lbljobQualification" runat="server" Text=""></asp:Label> <strong>|</strong> <strong>  <i class="fa fa-tasks" aria-hidden="true"></i> Job Type: </strong> <asp:Label ID="lbljobType" runat="server" Text=""></asp:Label> <strong> | </strong> <strong> Job Field: </strong> <asp:Label ID="lblJobField" runat="server" Text=""></asp:Label> </div> 
                           
                </div>
                           
                <br />         
                <div class="message-content text-justify"> <asp:Label ID="lblJobDesc" runat="server" Text=""></asp:Label></div>            


                </div>   
                
                         
            
            </div>

        
        </div>      
        
        
        </div></div>

              <div class="project-head">
                <div class="project-title">
                    <h5>Proposal Detail</h5>
                </div>               
            </div>
            
            <div class="project-info">                
                <div class="row align-items-center">                    
                    <div class="col-sm-12">                        
                       <div class="table-responsive">
            <table class="table table-striped">
            <thead>
                <tr>

                  <td> <strong style="color:#000;"> <i class="fa fa-user" aria-hidden="true"></i> Employee Name:</strong> </td>  
                  <td><asp:Label ID="lblEmpName" runat="server" Text=""></asp:Label></td>  
                    </tr>

                 <tr style="background:darkseagreen" id="contRow" runat="server" visible="false">

                  <td> <strong style="color:#000;"> <i class="fa fa-phone" aria-hidden="true"></i> Contact No:</strong> </td>  
                  <td><asp:Label ID="lblContNo" runat="server" Text=""></asp:Label></td>  
                    </tr>

                     <tr>
                     <td> <strong style="color:#000;"> <i class="fa fa-history" aria-hidden="true"></i> Experience:</strong></td>  
                <td><asp:Label ID="lblExperience" runat="server" Text=""></asp:Label></td>  
                          </tr>

                     <tr>


                      <td> <strong style="color:#000;"> <i class="fa fa-history" aria-hidden="true"></i> Feedback :</strong></td>  

                           <td><asp:Label ID="lblFeedback" runat="server" Text=""></asp:Label></td>  
                    </tr>

                     <tr>
                         
                         
                          <td> <strong style="color:#000;"> <i class="fa fa-map-marker" aria-hidden="true"></i> City :</strong></td>  

                            <td><asp:Label ID="lblCityName" runat="server" Text=""></asp:Label> </td>  

                          </tr>                   
                                       
                           <tr>
                    
                     <td><strong style="color:#000;"> <i class="fa fa-inr" aria-hidden="true"></i> Price : </strong></td>

                               <td><asp:Label ID="lblPrice" runat="server" Text=""></asp:Label>/<asp:Label ID="lblUnit" runat="server" Text=""></asp:Label> </td>
                          </tr>                   
                           <tr>
                               
                               <td><strong style="color:#000;"> <i class="fa fa-inr" aria-hidden="true"></i> Required Deposit : </strong> </td>
                                <td> <asp:Label ID="lblReqDeposit" runat="server" Text=""></asp:Label> </td>
               
                               </tr>                   
                           <tr>
                               
                                <td><strong style="color:#000;"> <i class="fa fa-calendar" aria-hidden="true"></i> Proposal Date : </strong></td>
                                  <td> <asp:Label ID="lblProposalDate" runat="server" Text=""></asp:Label> </td>
                            </tr>

                           <tr>  

                                <td></td> <td></td>

                       </tr>
                </thead>
            </table>
        </div>



       
                <div class="message-content text-justify"><asp:Label ID="lblProposalDesc" runat="server" Text=""></asp:Label> </div>            


              


                      
          

                    </div>
                    



                </div>

                <div class="row">
                   
                 <div class="col-sm-12">   
                     <div class="clearfix"></div>   
                     <br />                     
                   <div id="alert" runat="server" visible="false" class="alert alert-success">
                                <asp:Label ID="lblMSG" runat="server" Text=""></asp:Label>
                            </div>
                     </div>
                </div>
                <div id="feedbkDiv" runat="server" visible="false">  
                    <h5>Feedback</h5> 
                   
                                    
                                                <div class="form-group">
                                                    <label for="">
                                                        Rating</label>
                                                   <div class="rating">
                                    <img class="starImg" src="" alt="1" />
                                    <img class="starImg" src="" alt="2" />
                                    <img class="starImg" src="" alt="3" />
                                    <img class="starImg" src="" alt="4" />
                                    <img class="starImg" src="" alt="5" />
                                </div>
                                                     <div style="text-align:center;margin:5px 0 0 0;"> 
                                    Avg. Rating: <span id="avgRate"><%#Eval("AverageRate")%></span>
                                </div>
                                <%-- SHOW TOTAL RATINGS --%>
                                <div style="text-align:center;margin:0 0 10px 0;"> 
                                    Based on <span id="totRatings" style="font-weight:bold;"><%#Eval("TotalRatings")%></span> Ratings
                                </div>
                                                </div>
                                          
                                                <div class="form-group">
                                                    <label for="">
                                                        Feedback</label>
                                                    <asp:TextBox ID="txtFeedbackDesc" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="10"></asp:TextBox>
                                                
                                    <asp:RequiredFieldValidator ID="rfvJobIndustry" runat="server" ControlToValidate="txtFeedbackDesc"
                                            ErrorMessage="Please Enter Feedack" InitialValue="0" ForeColor="Red" SetFocusOnError="True" ValidationGroup="fdVal"
                                            Display="None">*</asp:RequiredFieldValidator>

                                             <asp:ValidatorCalloutExtender ID="VCEJobIndustry" 
                                            runat="server" Enabled="True" TargetControlID="rfvJobIndustry" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
                                                </div>
                                          


                    </div>

                <div class="col-sm-12">                    
               
           
                  <div class="form-buttons-w text-right">                                      
                 <asp:button id="btnAcceptProp" OnClick="btnAcceptProp_Click" runat="server" class="btn btn-primary" text="Accept Proposal" UseSubmitBehavior="false" OnClientClick="ClientSideClick(this)" Visible="false" />

                         <asp:button id="btnView" OnClick="btnView_Click" runat="server" class="btn btn-info" text="View Profile" Visible="false" />
                       <asp:button id="btnApproveJob" runat="server" class="btn btn-primary" OnClientClick="ClientSideClick(this)" UseSubmitBehavior="false" text="Approve Job" Visible="false" OnClick="btnApproveJob_Click" />
                       <asp:button id="btnCompJob" runat="server" OnClientClick="ClientSideClick(this)" ValidationGroup="fdVal" class="btn btn-success" UseSubmitBehavior="false" text="Complete Job" Visible="false" OnClick="btnCompJob_Click" />
                  </div>        


                    </div>


            </div>

<%--Proposal --%>

             
           


         </div>   
       

    </div><!--END - Projects list--></div></div>
        
        <div class="col-lg-4 b-l-lg">

                        <div class="">
                            <!--START - Projects Statistics-->
                            <div class="element-wrapper" style="padding-bottom:1rem">

                                <div class="element-box">
                                    <div class="padded m-b">
                                        <div class="centered-header">
                                            <h6>Sent Proposal</h6>

                                        </div>
                                        <div class="row">
                                            <div class="col-12 b-r b-b">
                                                <div class="el-tablo centered padded-v-big highlight bigger">
                                                    <%--<div class="label">Users</div>--%>
                                                    <div class="value">
                                                        <asp:Label ID="lblProposalCount" runat="server"></asp:Label>
                                                    </div>

                                                </div>

                                            </div>
                                            <%--   <div class="col-6 b-b">
                                                <div class="el-tablo centered padded-v-big highlight bigger">
                                                    <div class="label">Tasks</div>
                                                    <div class="value">251</div>

                                                </div>
                                            </div>--%>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                            
                      

                        <!--END - Projects Statistics-->
                    </div>
                        <div class="element-wrapper">
                                <h6 class="element-header">Recent Proposal(s)
                                    <span style="text-align:right"><a href="HireEmployee.aspx?jid=<%=jobid %>">View All Proposals</a></span>
                                </h6>
                                <div class="element-box-tp">
                                    <asp:Literal ID="ltrlProposals" runat="server"></asp:Literal>
                                   <%--<div class="profile-tile">
                            <div class="profile-tile-box">
                                <div class="pt-avatar-w">
                                    <img alt="" src="../Admin/img/avatar1.jpg" /></div>
                                <div class="pt-user-name">Mark Parson</div>
                            </div>
                            <div class="profile-tile-meta">
                                <ul>
                                    <li>Last Login:<strong>Online Now</strong></li>
                                    <li>Tickets:<strong>12</strong></li>
                                    <li>Response Time:<strong>2 hours</strong></li>
                                </ul>
                                <div class="pt-btn"><a class="btn btn-success btn-sm" href="#">Send Message</a></div>
                            </div>
                        </div>--%>
                        
                                </div>
                            </div>
                </div>
        </div>
        
        
        
        
        <!--------------------
START - Chat Popup Box
--------------------><div class="floated-chat-btn"><i class="os-icon os-icon-mail-07"></i><span>Demo Chat</span></div><div class="floated-chat-w"><div class="floated-chat-i"><div class="chat-close"><i class="os-icon os-icon-close"></i></div><div class="chat-head"><div class="user-w with-status status-green"><div class="user-avatar-w"><div class="user-avatar"><img alt="" src="img/avatar1.jpg"></div></div><div class="user-name"><h6 class="user-title">John Mayers</h6><div class="user-role">Account Manager</div></div></div></div><div class="chat-messages"><div class="message"><div class="message-content">Hi, how can I help you?</div></div><div class="date-break">Mon 10:20am</div><div class="message"><div class="message-content">Hi, my name is Mike, I will be happy to assist you</div></div><div class="message self"><div class="message-content">Hi, I tried ordering this product and it keeps showing me error code.</div></div></div><div class="chat-controls"><input class="message-input" placeholder="Type your message here..." type="text"><div class="chat-extra"><a href="#"><span class="extra-tooltip">Attach Document</span><i class="os-icon os-icon-documents-07"></i></a><a href="#"><span class="extra-tooltip">Insert Photo</span><i class="os-icon os-icon-others-29"></i></a><a href="#"><span class="extra-tooltip">Upload Video</span><i class="os-icon os-icon-ui-51"></i></a></div></div></div></div><!--------------------
END - Chat Popup Box
--------------------></div></div></div>
<script src="../js/jquery-1.10.2.min.js"></script>
    <%-- <script type="text/javascript" src="../../js/jquery-1.12.4.js"></script>--%>

    <%-- <script type="text/javascript">
        function changDiv()
        {
            var dUnit = document.getElementById('<%=ddlUnit.ClientID %>').options[document.getElementById('<%=ddlUnit.ClientID %>').selectedIndex].value;
            if (dUnit == "Fix Price")
            {
            document.getElementById('FixPriceDiv').style.display = 'block';
           
            
            }
            else
            {
                document.getElementById('FixPriceDiv').style.display = 'none';
               
            }
        }
    </script>--%>
    <script type="text/javascript">
        function bindStar()
        {
            if (document.getElementById('<%= hdfStatus.ClientID %>').value == "Complete") {

                var pID = document.getElementById('<%= hdfPslId.ClientID %>').value;
                var userRating = document.getElementById('<%= hdfRatingVal.ClientID %>').value;
                $('.rating > img').each(function () {
                    if ($(this).attr('alt') <= userRating) {
                        $(this).attr('src', '../images/filled_star.png');
                    }
                    else $(this).attr('src', '../images/star_empty.png');
                })
            }
        }
        $(document).ready(function () {
            $('.starImg').attr('src', '../images/star_empty.png');
            bindStar();

                //$.ajax({
                //    type: "POST",
                //    url: "ViewProposal.aspx/getTotalRatings",
                //    data: "{'iPId': '" + pID + "'}",
                //    contentType: "application/json; charset=utf-8",
                //    dataType: "json",
                //    success: function (data) {
                //        $.map(data, function () {
                //            //alert(data.d[0].AvgRatings);
                //            // REFRESH AVERAGE AND TOTAL RATINGS FOR THE ROW.
                //            $('#avgRate').text(data.d[0].AvgRatings);
                //            $('#totRatings').text(data.d[0].TotalRatings);

                //            // UPDATE STARS RATING.
                //            $('.rating > img').each(function () {
                //                if ($(this).attr('alt') <= data.d[0].AvgRatings) {
                //                    $(this).attr('src', '../images/filled_star.png');
                //                }
                //                else $(this).attr('src', '../images/star_empty.png');
                //            });
                //        });
                //    },
                //    error: function (XMLHttpRequest, textStatus, errorThrown) {
                //        alert(textStatus);
                //    }
                //});
            //}
            $('.starImg').click(function (e) {
                //var baseURL = window.location.protocol + "//" + window.location.host + "//";
                var stats = document.getElementById('<%= hdfStatus.ClientID %>').value;
                if (stats == "Approved") {
                    var userRating = $(this).attr('alt');
                    var pID = document.getElementById('<%= hdfPslId.ClientID %>').value;
                    $('.rating > img').each(function () {
                        if ($(this).attr('alt') <= userRating) {
                            $(this).attr('src', '../images/filled_star.png');
                        }
                        else $(this).attr('src', '../images/star_empty.png');
                    })
                    document.getElementById('<%= hdfRatingVal.ClientID %>').value = userRating;
                   // e.preventDefault();
                //    $.ajax({
                //    type: "POST",
                //    url: baseURL + "WebMethod/Autocomplete.asmx/test",
                //    //data: "{'iPId':'" + pID + "','iUserRating':'" + userRating + "'}",
                //        data:"",
                //    contentType: "application/json; charset=utf-8",
                //    dataType: "json",
                //    success: function (msg) { 
                //        var j = jQuery.parseJSON(msg.d);
                       
                //    },
                //    error: function (XMLHttpRequest, textStatus, errorThrown) {
                //        alert(textStatus);
                //    }
                    //});
                //    var classVal = "a";
                //    $.ajax({
                //    type: "POST",
                //    url: baseURL + "WebMethod/Autocomplete.asmx/test",
                //    data: "{'classId':'" + classVal + "'}",
                //    contentType: "application/json; charset=utf-8",
                //    dataType: "json",
                //    success: function (msg) { 
                //        var j = jQuery.parseJSON(msg.d);
                //        var options;
                //        for (var i = 0; i < j.length; i++) {
                //            options += '<option value="' + j[i].optionValue + '">' + j[i].optionDisplay + '</option>'
                //        }
                        
                //    },
                //    error: function (data) {
                //        alert('Something Went Wrong');
                //    }
                //});

                    //$.ajax({
                    //    type: "POST",
                    //    url: baseURL + "Client_Panel/ViewProposal.aspx/saveratigg",
                    //    data: "{'iPId': '" + pID + "','iUserRating':'" + userRating + "'}",
                    //    contentType: "application/json; charset=utf-8",
                    //    dataType: "json",
                    //    success: function (data) {
                    //        alert(data.d);
                    //        $('#avgRate').text(data.d.AvgRatings);
                    //        $('#totRatings').text(data.d[0].TotalRatings);

                    //        // UPDATE STARS RATING.
                    //        $('.rating > img').each(function () {
                    //            if ($(this).attr('alt') <= data.d[0].AvgRatings) {
                    //                $(this).attr('src', '../images/filled_star.png');
                    //            }
                    //            else $(this).attr('src', '../images/star_empty.png');
                    //        });
                            
                    //    },
                    //    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    //        alert(textStatus);
                    //    }
                    //});
                }
            });
        });
        function ClientSideClick(myButton) {
            // Client side validation
            if (typeof (Page_ClientValidate) == 'function') {
                if (Page_ClientValidate() == false)
                { return false; }
            }

            //make sure the button is not of type "submit" but "button"
            if (myButton.getAttribute('type') == 'button') {
                // disable the button
                myButton.disabled = true;
                myButton.className = "btn btn-info disabled";
                myButton.value = "processing...";
            }
            return true;
        }
    </script>

</asp:Content>

