<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Full_Job_Profile.aspx.cs" Inherits="Client_Panel_Full_Job_Profile" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="jobid" runat="server" />
    <%-- <asp:HiddenField ID="hdfClientId" runat="server" />
     <asp:HiddenField ID="hdfusertypeid" runat="server" />--%>
    <asp:HiddenField ID="hdfPartyid" runat="server" />

    <asp:HiddenField ID="hdfusertypeid" runat="server" />

    <div class="content-w">
        <div class="top-menu-secondary">
            <div class="top-menu-controls">
                <div class="logged-user-w">
                    <div class="logged-user-i">
                        <div class="avatar-w">
                            <img alt="" src="img/avatar1.jpg" />
                        </div>
                        <div class="logged-user-menu">
                            <div class="logged-user-avatar-info">
                                <div class="avatar-w">
                                    <img alt="" src="img/avatar1.jpg">
                                </div>
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
                            </ul>


                        </div>
                    </div>
                </div>
                <!--------------------END - User avatar and menu in secondary top menu-------------------->
            </div>
        </div>

        <div class="content-i">
            <div class="content-box">
                <!--START - Control panel above projects-->

                <div class="os-tabs-w mx-4">
                    <div class="os-tabs-controls">
                        <ul class="nav nav-tabs upper">
                            <li class="nav-item">
                                 <a aria-expanded="false" class="nav-link  active"" data-toggle="tab" href="#tab_overview">Full Job Profile</a></li>
                                <%--  <li class="nav-item"><a aria-expanded="false" class="nav-link" data-toggle="tab" href="#tab_sales"> Overview</a></li>
            <li class="nav-item"><a aria-expanded="false" class="nav-link" data-toggle="tab" href="#tab_sales"> Closed</a></li>
            <li class="nav-item"><a aria-expanded="true" class="nav-link data-toggle="tab" href="#tab_sales"> Required</a></li>--%>
                        </ul>

                        <%--  <ul class="nav nav-pills smaller hidden-md-down">
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
                            <!--START - Projects list-->

                            <div class="projects-list">



                                <%  if (dt != null && dt.Rows.Count > 0)
                                    {
                                %>

                                <div class="project-box">
                                    <div class="project-head">

                                        <div class="project-title">
                                            <h5><%= dt.Rows[0]["job_Title"].ToString()%></h5>
                                        </div>

                                        <div class="project-users">



                                            <div class="more">+ <%= dt.Rows[0]["View_Counter"].ToString()%> Count View</div>

                                        </div>
                                    </div>
                                    <div class="project-info">

                                        <div class="row align-items-center">
                                            <div class="col-sm-12">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="el-tablo highlight">
                                                            <div>
                                                                <strong><i class="fa fa-calendar" aria-hidden="true"></i>Posted On: </strong><%= Convert.ToDateTime(dt.Rows[0]["CreatedOn"]).ToString("dd-MM-yyyy") %> <strong>| </strong><strong><i class="fa fa-user" aria-hidden="true"></i>Posted By : </strong><span class="message-content"><%= dt.Rows[0]["Party_name"].ToString()%></span> <strong>| </strong><strong><i class="fa fa-map-marker"></i>City</strong> <%= dt.Rows[0]["CityID"].ToString()%>
                                                                <br />
                                                                <strong><i class="fa fa-history" aria-hidden="true"></i>Experience </strong>:  
                    <%if (dt.Rows[0]["Exp"].ToString() != string.Empty && dt.Rows[0]["Exp"].ToString() != "Select Experience")
                        { %>
                                                                <%= dt.Rows[0]["Exp"].ToString()%>
                                                                <%}
                                                                    else
                                                                    { %>
                    Not Required

                    <%} %>

                                                                <strong>|</strong> <strong><i class="fa fa-users" aria-hidden="true"></i>No.of Position: </strong><%= dt.Rows[0]["Position"].ToString()%>   <strong>| </strong><strong><i class="fa fa-inr" aria-hidden="true"></i>Price: </strong>

                                                                <%if (dt.Rows[0]["Time_Unit"].ToString() == "Fix Price")
                                                                    { %>
                                                                <%=dt.Rows[0]["FixPrice"].ToString() %> Fix Price

                    <%}
                        else
                        { %>
                                                                <%= dt.Rows[0]["MimiSalery"].ToString()%>

                                                                <%} %>

                                                                <br />
                                                                <strong><i class="fa fa-graduation-cap" aria-hidden="true"></i>Quali</strong> : 
                   <% if (dt.Rows[0]["job_Qulalification"].ToString() != string.Empty && dt.Rows[0]["job_Qulalification"].ToString() != "Select Qualification")
                       { %>
                                                                <%= dt.Rows[0]["job_Qulalification"].ToString()%>
                                                                <%}
                                                                    else
                                                                    { %>
                    Not Required
                    <%} %>
                                                                <strong>|</strong> <strong><i class="fa fa-tasks" aria-hidden="true"></i>Job Type: </strong><%= dt.Rows[0]["JobType"].ToString()%>
                                                            </div>

                                                        </div>


                                                        <div class="message-content text-justify"><%= dt.Rows[0]["job_Desc"].ToString()%></div>

                                                    </div>



                                                </div>

                                                <br />
                                                <div class="os-tabs-controls">


                                                    <ul class="nav nav-pills smaller hidden-md-down">
                                                        <%
                                                            System.Data.DataTable dt3 = BindJobSkill(dt.Rows[0]["job_Id"].ToString());

                                                            if (dt3 != null && dt3.Rows.Count > 0)
                                                            { %>


                                                        <%for (int k = 0; k < dt3.Rows.Count; k = k + 1)
                                                            { %>


                                                        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#" aria-expanded="true"><%=dt3.Rows[k]["Skill_Name"].ToString()%></a></li>
                                                        &nbsp;

                             <%} %>

                                                        <% } %>
                                                    </ul>
                                                </div>

                                                <div class="project-users text-right" runat="server" id="divProposalBtn">

                                                    <div class="pt-btn"><a class="mr-2 mb-2 btn btn-success btn-rounded" onclick="show()" href="#divProposal">Send Proposal</a></div>

                                                </div>
                                                <div class="project-users text-right" runat="server" id="divProposalBtn2" visible="false">

                                                    <div class="pt-btn"><a class="mr-2 mb-2 btn btn-success btn-rounded" href="javascript:void(0)" id="proposalStatus" runat="server">Proposal Sent</a></div>

                                                </div>
                                            </div>


                                            <div class="project-title">
                                                <h5>Job Details</h5>
                                            </div>

                                            <br />

                                            <div class="table-responsive">


                                                <table class="table table-striped">

                                                    <%-- <tr>
                    <td><strong>EMPLOYMENT TYPE:</strong> </td>
                <td><%= dt.Rows[0]["JobType"].ToString()%></td>

                    </tr>--%>

                                                    <tr>
                                                        <td><strong>INDUSTRY:</strong> </td>
                                                        <td><%= dt.Rows[0]["Industry"].ToString()%></td>

                                                    </tr>


                                                    <tr>
                                                        <td><strong>JOB CATEGORY:</strong></td>
                                                        <td><%= dt.Rows[0]["JobSubCateName"].ToString()%></td>

                                                    </tr>

                                                    <%-- <tr>
                <td><strong>QUALIFICATION:</strong></td>
                <td ><%= dt.Rows[0]["job_Qulalification"].ToString()%></td>
                
                </tr>--%>





                                                    <tr>
                                                        <td><strong>JOB POSTED BY COMPANY:</strong> </td>
                                                        <td><%= dt.Rows[0]["Party_name"].ToString()%></td>

                                                    </tr>

                                                      <tr style="background:darkseagreen" id="compContName" runat="server" visible="false">
                                                        <td><strong>CONTACT PERSON NAME:</strong></td>
                                                        <td><%= dt.Rows[0]["Name"].ToString()%></td>

                                                    </tr>


                                                    <tr style="background:darkseagreen" id="compContNo" runat="server" visible="false">
                                                        <td><strong>MOBILE NO:</strong> </td>
                                                        <td><%= dt.Rows[0]["MobileNo"].ToString()%></td>

                                                    </tr>

                                                    <tr>
                                                        <td><strong>PROJECT FILE:</strong> </td>

                                                        <% if (dt.Rows[0]["Project_File"].ToString() != string.Empty)
                                                            { %>

                                                        <td><%=dt.Rows[0]["Project_File"].ToString()%>     <span style="margin-left: 10px;"><a href="../post_job_doc/<%= dt.Rows[0]["Project_File"].ToString()%>">
                                                            <img src="../img/Download.gif" alt="Projet File" /></a> </span></td>

                                                        <%} %>

                                                        <%else
                                                            { %>
                                                        <td>Not Available </td>

                                                        <%} %>
                                                    </tr>



                                                    <tr>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>

                                                    <%--  </thead>--%>
                                                </table>
                                            </div>

                                            <div class="table-responsive" id="proposalDiv" runat="server" visible="false">

                                                <h5>Proposal Detail</h5>
                                                <table class="table table-striped">
                                                    <tr>
                                                        <td>Price</td>
                                                        <td>
                                                            <asp:Label ID="lblPrice" runat="server" Text=""></asp:Label>/<asp:Label ID="lblUnit" runat="server" Text=""></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Deposite Required</td>
                                                        <td>
                                                            <asp:Label ID="lblReqDeposit" runat="server" Text=""></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <asp:Label ID="lblProposalDesc" runat="server" Text="Label"></asp:Label>
                                                        </td>
                                                    </tr>

                                                </table>

                                            </div>

                                            <%-- New Proposal--%>

                                            <div class="table-responsive" id="divProposal" style="display: none;">

                                                <div class="project-title">
                                                    <h5>New Proposal</h5>
                                                </div>




                                                <div class="form-group">


                                                    <asp:TextBox runat="server" ID="txtProposal_Desc" TextMode="Multiline" class="form-control" placeholder="New Proposal Description"></asp:TextBox>



                                                </div>


                                                <div class="row">
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label for="">
                                                                Select Unit</label>



                                                            <asp:DropDownList ID="ddlUnit" CssClass="form-control" runat="server">
                                                                <asp:ListItem Selected="True" Value="0">Select Unit</asp:ListItem>
                                                                <asp:ListItem Value="month">Month</asp:ListItem>
                                                                <asp:ListItem Value="day">Day</asp:ListItem>
                                                                <asp:ListItem Value="hour">Hour</asp:ListItem>
                                                                <asp:ListItem Value="Fix Price">Fix Price</asp:ListItem>
                                                            </asp:DropDownList>


                                                        </div>
                                                    </div>




                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label for="">Price</label>
                                                            <asp:TextBox ID="txtFixPrice" class="form-control" placeholder="Enter Price" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label for="">Deposite Required</label>
                                                            <asp:TextBox ID="txtDepositRequired" class="form-control" placeholder="Enter Deposite Required" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>



                                                </div>







                                                <div class="form-buttons-w">

                                                    <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" OnClientClick="ClientSideClick(this)" UseSubmitBehavior="false" runat="server" class="btn btn-primary" Text="Send Proposal" />

                                                </div>

                                            </div>

                                            <div class="table-responsive" id="divSendMsg" runat="server">
                                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-success" runat="server" OnClick="LinkButton1_Click"><i class="os-icon os-icon-mail-18"></i><span>Send Message</span></asp:LinkButton>
                                               <%-- <div class="project-title">
                                                    <h5>Send Working Detail</h5>
                                                </div>




                                                <div class="form-group">


                                                    <asp:TextBox runat="server" ID="txtMsg" TextMode="Multiline" class="form-control" placeholder="Working Detail" Rows="10" Columns="10" ></asp:TextBox>



                                                </div>--%>


                                                







                                              <%--  <div class="form-buttons-w">

                                                    <asp:Button ID="btnSendMsg" OnClick="btnSendMsg_Click" OnClientClick="ClientSideClick(this)" UseSubmitBehavior="false" runat="server" class="btn btn-primary" Text="Send" />

                                                </div>--%>

                                            </div>

                                            <div class="col-sm-12">
                                                <div id="alert" runat="server" visible="false" class="alert alert-success">
                                                    <asp:Label ID="lblMSG" runat="server" Text=""></asp:Label>
                                                </div>

                                            </div>

                                          


                                        </div>


                                    </div>
                                </div>


                                <%}
                                %>
                            </div>
                            <!--END - Projects list-->
                        </div>
                    </div>

                    <div class="col-lg-4 b-l-lg">

                        <div class="padded-lg">
                            <!--START - Projects Statistics-->
                            <div class="element-wrapper">

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
                                <h6 class="element-header">Recent Proposal(s)</h6>
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
-------------------->
            <div class="floated-chat-btn"><i class="os-icon os-icon-mail-07"></i><span>Demo Chat</span></div>
            <div class="floated-chat-w">
                <div class="floated-chat-i">
                    <div class="chat-close"><i class="os-icon os-icon-close"></i></div>
                    <div class="chat-head">
                        <div class="user-w with-status status-green">
                            <div class="user-avatar-w">
                                <div class="user-avatar">
                                    <img alt="" src="img/avatar1.jpg">
                                </div>
                            </div>
                            <div class="user-name">
                                <h6 class="user-title">John Mayers</h6>
                                <div class="user-role">Account Manager</div>
                            </div>
                        </div>
                    </div>
                    <div class="chat-messages">
                        <div class="message">
                            <div class="message-content">Hi, how can I help you?</div>
                        </div>
                        <div class="date-break">Mon 10:20am</div>
                        <div class="message">
                            <div class="message-content">Hi, my name is Mike, I will be happy to assist you</div>
                        </div>
                        <div class="message self">
                            <div class="message-content">Hi, I tried ordering this product and it keeps showing me error code.</div>
                        </div>
                    </div>
                    <div class="chat-controls">
                        <input class="message-input" placeholder="Type your message here..." type="text"><div class="chat-extra"><a href="#"><span class="extra-tooltip">Attach Document</span><i class="os-icon os-icon-documents-07"></i></a><a href="#"><span class="extra-tooltip">Insert Photo</span><i class="os-icon os-icon-others-29"></i></a><a href="#"><span class="extra-tooltip">Upload Video</span><i class="os-icon os-icon-ui-51"></i></a></div>
                    </div>
                </div>
            </div>
            <!--------------------
END - Chat Popup Box
-------------------->
        </div>
    </div>
    </div>

    <script src="../../js/jquery-1.12.4.js"></script>


    <script type="text/javascript">
        function changDiv() {
            var dUnit = document.getElementById('<%=ddlUnit.ClientID %>').options[document.getElementById('<%=ddlUnit.ClientID %>').selectedIndex].value;
            if (dUnit == "Fix Price") {
                document.getElementById('FixPriceDiv').style.display = 'block';
                //document.getElementById('timeDuraionDiv').style.display = 'none';
                //document.getElementById('minBudgtDiv').style.display = 'none'; 
                //document.getElementById('maxBudetDiv').style.display = 'none';

            }
            else {
                document.getElementById('FixPriceDiv').style.display = 'none';
                //document.getElementById('timeDuraionDiv').style.display = 'block';
                //document.getElementById('minBudgtDiv').style.display = '';
                //document.getElementById('maxBudetDiv').style.display = '';
            }
        }
    </script>


    <script>


        function show() {
            var currentDiv = document.getElementById('divProposal');
            currentDiv.style.display = "block";



        }
        function hide() {
            var currentDiv = document.getElementById('divProposal');
            currentDiv.style.display = "none";



        }

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

