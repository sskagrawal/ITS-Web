<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="HireEmployee.aspx.cs" Inherits="Client_Panel_HireEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">

        function characterCounter(controlId, countControlId, maxCharlimit) {

            if (controlId.value.length > maxCharlimit)
                controlId.value = controlId.value.substring(0, maxCharlimit);
            else
                countControlId.value = maxCharlimit - controlId.value.length;
        }

</script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:HiddenField ID="hdfpartyid" runat="server" />

     <div class="content-w">
         <div class="top-menu-secondary color-scheme-dark">
           <%--  <ul>
                 <li class="active"><a href="#">Home</a></li>
                 <li><a href="#">Projects</a></li>
                 <li><a href="#">Customers</a></li>
                 <li><a href="#">Reports</a></li>

             </ul>--%>
             <%--<div class="top-menu-controls">
                 <div class="element-search hidden-lg-down">
                     <input placeholder="Start typing to search..." type="text"></div>
                 <div class="top-icon top-search hidden-xl-up"><i class="os-icon os-icon-ui-37"></i></div><!--------------------
START - Messages Link in secondary top menu
--------------------><div class="messages-notifications os-dropdown-trigger os-dropdown-center"><i class="os-icon os-icon-mail-14"></i><div class="new-messages-count">12</div><div class="os-dropdown light message-list"><div class="icon-w"><i class="os-icon os-icon-mail-14"></i></div><ul><li><a href="#"><div class="user-avatar-w"><img alt="" src="img/avatar1.jpg"></div><div class="message-content"><h6 class="message-from">John Mayers</h6><h6 class="message-title">Account Update</h6></div></a></li><li><a href="#"><div class="user-avatar-w"><img alt="" src="img/avatar2.jpg"></div><div class="message-content"><h6 class="message-from">Phil Jones</h6><h6 class="message-title">Secutiry Updates</h6></div></a></li><li><a href="#"><div class="user-avatar-w"><img alt="" src="img/avatar5.jpg"></div><div class="message-content"><h6 class="message-from">Bekky Simpson</h6><h6 class="message-title">Vacation Rentals</h6></div></a></li><li><a href="#"><div class="user-avatar-w"><img alt="" src="img/avatar4.jpg"></div><div class="message-content"><h6 class="message-from">Alice Priskon</h6><h6 class="message-title">Payment Confirmation</h6></div></a></li></ul></div></div><!--------------------
END - Messages Link in secondary top menu
--------------------><!--------------------
START - Settings Link in secondary top menu
--------------------><div class="top-icon top-settings os-dropdown-trigger os-dropdown-center"><i class="os-icon os-icon-ui-46"></i><div class="os-dropdown"><div class="icon-w"><i class="os-icon os-icon-ui-46"></i></div><ul><li><a href="#"><i class="os-icon os-icon-ui-49"></i><span>Profile Settings</span></a></li><li><a href="#"><i class="os-icon os-icon-grid-10"></i><span>Billing Info</span></a></li><li><a href="#"><i class="os-icon os-icon-ui-44"></i><span>My Invoices</span></a></li><li><a href="#"><i class="os-icon os-icon-ui-15"></i><span>Deactivate Account</span></a></li></ul></div></div><!--------------------
END - Settings Link in secondary top menu
--------------------><!--------------------
START - User avatar and menu in secondary top menu
-------------------->
    
    <div class="logged-user-w"><div class="logged-user-i"><div class="avatar-w"><img alt="" src="../Admin/img/avatar1.jpg"></div><div class="logged-user-menu"><div class="logged-user-avatar-info"><div class="avatar-w"><img alt="" src="img/avatar1.jpg"></div><div class="logged-user-info-w"><div class="logged-user-name">Maria Gomez</div><div class="logged-user-role">Administrator</div></div></div><div class="bg-icon"><i class="os-icon os-icon-wallet-loaded"></i></div><ul><li><a href="apps_email.html"><i class="os-icon os-icon-mail-01"></i><span>Incoming Mail</span></a></li><li><a href="users_profile_big.html"><i class="os-icon os-icon-user-male-circle2"></i><span>Profile Details</span></a></li><li><a href="users_profile_small.html"><i class="os-icon os-icon-coins-4"></i><span>Billing Details</span></a></li><li><a href="#"><i class="os-icon os-icon-others-43"></i><span>Notifications</span></a></li><li><a href="#"><i class="os-icon os-icon-signs-11"></i><span>Logout</span></a></li></ul></div></div></div><!--------------------
END - User avatar and menu in secondary top menu
--------------------></div>--%>




         </div>
<div class="content-i">
    <div class="content-box">
        <div class="control-header">
            <div class="row align-items-center">                
                <div class="col-7">
                    <form action="" class="form-inline">
                        <div class="form-group mr-4">
                            <label class="mr-2" for="">Employee Job Profile</label>
                          <%--  <select class="form-control-sm">
                                <option>Management</option>
                                <option>Sales Team</option>

                            </select>--%>

                        </div>
    
   

                                                                                                                                                                    </form></div>
                
                <div class="col-5 text-right">
                   <%-- <a class="btn btn-sm btn-link btn-upper mr-4 hidden-md-down" href="#"><i class="os-icon os-icon-ui-44"></i><span>Download CSV</span></a>
                    <a class="btn btn-sm btn-primary btn-upper" href="#"><i class="os-icon os-icon-ui-22"></i><span>Add New Lead</span></a>--%>
</div></div></div>
        
        
        <div class="pipelines-w">
            <div class="row">
                
     <div class="col-lg-8 col-xxl-6">                                                                                                                                                                        
    <div class="pipeline white lined-primary">
    <div class="pipeline-header">
        <h5 class="pipeline-name">Employee Job Profile</h5>
        <div class="pipeline-header-numbers">
            <div class="pipeline-value">
                <asp:Label ID="lblPrfCount" runat="server"></asp:Label>
            </div>
            <%--<div class="pipeline-count">14 leads</div>--%>

        </div>
        
        <div class="pipeline-settings os-dropdown-trigger">
            <i class="os-icon os-icon-hamburger-menu-1"></i>
            <div class="os-dropdown">
                <div class="icon-w"><i class="os-icon os-icon-ui-46"></i>

                </div>
                <ul>
                    <li><a href="#"><i class="os-icon os-icon-ui-49"></i><span>Edit Record</span></a></li>
                    <li><a href="#"><i class="os-icon os-icon-grid-10"></i><span>Duplicate Item</span></a></li>
                    <li><a href="#"><i class="os-icon os-icon-ui-15"></i><span>Remove Item</span></a></li>
                    <li><a href="#"><i class="os-icon os-icon-ui-44"></i><span>Archive Project</span></a></li>


                </ul>
            </div>
        </div>
    </div>
        
        
        <div class="pipeline-body">

        <%  if (dt!=null && dt.Rows.Count > 0)
         {
             for (int i = 0; i <dt.Rows.Count; i = i+1)
         
             {%>

            <div class="pipeline-item" >
                <div class="pi-controls">            
                    <div class="status status-green" data-placement="top" data-toggle="tooltip" title="Active Status">
                                 
                        
                       
                         </div>          

                </div>               
                
                <div class="pi-body"><div class="avatar" style="width:97px!important;">

                    <%
                        System.Data.DataTable dt2 = bind_ProfilePhoto(dt.Rows[i]["PartyID"].ToString());
                        if(dt2!=null && dt2.Rows.Count > 0 && dt2.Rows[0]["Upload_File"].ToString()!=string.Empty)
                        { %> 
                        <img style="width:100px;height:100px;" alt="client Photo"  src="../ClientContractDoc/<%=dt2.Rows[0]["Upload_File"].ToString()%>"/>
                                

                      <% } %>

                  <%  else { %>                          
                    <img style="width:100px;height:100px;" alt="client Photo" src="../images/dummy.jpg" />
                   <%  }%>



                      </div>    
                <div class="pi-info">


                      <%                                                   
                          string t2 =dt.Rows[i]["job_Title"].ToString();
                          int headingLength1 = t2.Length;
                          if (headingLength1 > 60)
                          {
                              string str2 = t2.Substring(0, 60); %>
                   <%--   <div class="message-content" style="margin-top:1px;"><%=str1%>....</div>--%>
               <div class="h6 pi-name" style="padding:2px;"><%=str2 %> ...</div> 
                   <%-- <div class="h6 pi-name" style="padding:2px;"><%= dt.Rows[i]["job_Title"].ToString()%></div> --%>
               <% } %>

              <%else
               { %>
                    <div class="h6 pi-name" style="padding:2px;"><%= dt.Rows[i]["job_Title"].ToString()%></div>

                 <%} %>
                





                <div class="pi-sub"><i class="fa fa-user" aria-hidden="true"></i>  <%= dt.Rows[i]["Contact_person_name"].ToString()%>   <i class="fa fa-history" aria-hidden="true"></i> <span class="text-gray-dark">Exp  </span> <%= dt.Rows[i]["Exp"].ToString()%>      <span class="text-gray-dark"> <i class="fa fa-inr" aria-hidden="true"></i> Price : </span>  <span>   <%= dt.Rows[i]["Min_Salary"].ToString()%></span>  <span class="text-gray-dark"> <span> <i  class="fa fa-map-marker"></i> City : </span>  <%= dt.Rows[i]["City"].ToString()%></span>  </div>
              <%-- <br />--%>


                      <%                                                   
                 string t =dt.Rows[i]["ShortDescription"].ToString();
                int headingLength = t.Length;
                if (headingLength > 120)
                {
                    string str1 = t.Substring(0, 145); %>
                      <div class="message-content" style="margin-top:1px;"><%=str1%>....</div>
              <%-- <div class="post-excerpt"><%=str1%>. [...]</div>--%>
                   
               <% } %>
                                              



               



                </div></div>
                
                <div class="pi-foot">                
           <div class="tags"> 
                <%
                    System.Data.DataTable dt3 = BindJobSkill(dt.Rows[i]["PartyID"].ToString());

                    if (dt3!=null && dt3.Rows.Count > 0)
                    { %> 
                         <%for (int k = 0; k<dt3.Rows.Count; k = k + 1)
                             { %>
                            
                        <a class="tag" href="#"><%=dt3.Rows[k]["Skill_Name"].ToString()%></a>

                             <%} %>                  

                      <% } %>        
                                       

           </div>
               <%-- <a class="extra-info" href="#"><i class="os-icon os-icon-mail-12"></i><span>8 Notes</span></a>--%>
                     <div class="pt-btn"><a class="btn btn-success btn-sm" href="Client_profile_big.aspx?uTp=3&pId=<%=dt.Rows[i]["PartyID"].ToString() %>">View Profile</a></div>

                </div>

            </div>
            
                   <%  }
         }
          %>


         

        </div>

    </div>

      </div>
                
                
                
             
                
                <div class="col-lg-4 col-xxl-3">
                    
                    <div class="pipeline white lined-success">
              <div class="pipeline-header">
        <h5 class="pipeline-name">Approved Lead</h5>
        <div class="pipeline-header-numbers">
            <div class="pipeline-value">$12,574</div>
            <div class="pipeline-count">3 leads</div>

        </div>
        <div class="pipeline-settings os-dropdown-trigger">
            <i class="os-icon os-icon-hamburger-menu-1"></i>
            <div class="os-dropdown">
                <div class="icon-w">
                    <i class="os-icon os-icon-ui-46"></i>

                </div>
                <ul>
                    <li><a href="#"><i class="os-icon os-icon-ui-49"></i><span>Edit Record</span></a></li>
                    <li><a href="#"><i class="os-icon os-icon-grid-10"></i><span>Duplicate Item</span></a></li>
                    <li><a href="#"><i class="os-icon os-icon-ui-15"></i><span>Remove Item</span></a></li>
                    <li><a href="#"><i class="os-icon os-icon-ui-44"></i><span>Archive Project</span></a></li>

                </ul>

            </div>

        </div></div>
                        
    <div class="pipeline-body">
        <div class="pipeline-item">
            <div class="pi-controls">
                <div class="pi-settings os-dropdown-trigger"><i class="os-icon os-icon-ui-46"></i><div class="os-dropdown"><div class="icon-w"><i class="os-icon os-icon-ui-46"></i></div><ul><li><a href="#"><i class="os-icon os-icon-ui-49"></i><span>Edit Record</span></a></li><li><a href="#"><i class="os-icon os-icon-grid-10"></i><span>Duplicate Item</span></a></li><li><a href="#"><i class="os-icon os-icon-ui-15"></i><span>Remove Item</span></a></li><li><a href="#"><i class="os-icon os-icon-ui-44"></i><span>Archive Project</span></a></li></ul></div></div><div class="status status-green" data-placement="top" data-toggle="tooltip" title="Active Status"></div></div><div class="pi-body"><div class="avatar"><img alt="" src="../Admin/img/avatar2.jpg"></div><div class="pi-info"><div class="h6 pi-name">Corpus Comp</div><div class="pi-sub">John Mayers</div></div></div><div class="pi-foot"><div class="tags"><a class="tag" href="#">Master Sonic</a></div><a class="extra-info" href="#"><i class="os-icon os-icon-mail-12"></i><span>1 Notes</span></a></div>


        </div>
        
        <div class="pipeline-item">
            
            <div class="pi-controls">
                <div class="pi-settings os-dropdown-trigger">
                    <i class="os-icon os-icon-ui-46"></i>
                    <div class="os-dropdown">
                        <div class="icon-w">
                            <i class="os-icon os-icon-ui-46"></i>

                        </div>
                        
                        <ul><li><a href="#"><i class="os-icon os-icon-ui-49"></i><span>Edit Record</span></a></li><li><a href="#"><i class="os-icon os-icon-grid-10"></i><span>Duplicate Item</span></a></li><li><a href="#"><i class="os-icon os-icon-ui-15"></i><span>Remove Item</span></a></li><li><a href="#"><i class="os-icon os-icon-ui-44"></i><span>Archive Project</span></a></li></ul></div></div><div class="status status-green" data-placement="top" data-toggle="tooltip" title="Active Status"></div></div><div class="pi-body"><div class="avatar"><img alt="" src="../Admin/img/avatar4.jpg"></div><div class="pi-info"><div class="h6 pi-name">Boiling Roast</div><div class="pi-sub">John Mayers</div></div></div><div class="pi-foot"><div class="tags"><a class="tag" href="#">Clip</a><a class="tag" href="#">Movie</a></div><a class="extra-info" href="#"><i class="os-icon os-icon-mail-12"></i><span>5 Notes</span></a></div>


        </div>
        
        
        <div class="pipeline-item">
            
            <div class="pi-controls">
                <div class="pi-settings os-dropdown-trigger">
                    <i class="os-icon os-icon-ui-46"></i>
                    <div class="os-dropdown">
                        
                        <div class="icon-w">
                        <i class="os-icon os-icon-ui-46"></i></div>
                        <ul>
                            <li><a href="#"><i class="os-icon os-icon-ui-49"></i><span>Edit Record</span></a></li><li><a href="#"><i class="os-icon os-icon-grid-10"></i><span>Duplicate Item</span></a></li><li><a href="#"><i class="os-icon os-icon-ui-15"></i><span>Remove Item</span></a></li><li><a href="#"><i class="os-icon os-icon-ui-44"></i><span>Archive Project</span></a></li></ul></div></div>
                
                <div class="status status-green" data-placement="top" data-toggle="tooltip" title="Active Status"></div></div>
            <div class="pi-body">
                <div class="avatar">
                    <img alt="" src="img/avatar5.jpg"></div>
                <div class="pi-info">
                    <div class="h6 pi-name">Ketchup Farm</div>
                    <div class="pi-sub">John Mayers</div>

                </div>

            </div>
            <div class="pi-foot">
                <div class="tags">
                    <a class="tag" href="#">Coins</a>
                    <a class="tag" href="#">Keys</a></div>
                    <a class="extra-info" href="#"><i class="os-icon os-icon-mail-12"></i><span>3 Notes</span></a>

            </div>


        </div>
        
        
      

    </div>

</div>
                    <!--------------------END - Pipeline--------------------></div>
                
                <div class="col-lg-4 col-xxl-3 hidden-xl-down"><!--------------------
START - Pipeline
--------------------><div class="pipeline white lined-warning"><div class="pipeline-header"><h5 class="pipeline-name">Contracts</h5><div class="pipeline-header-numbers"><div class="pipeline-value">$2,447</div><div class="pipeline-count">6 leads</div></div><div class="pipeline-settings os-dropdown-trigger"><i class="os-icon os-icon-hamburger-menu-1"></i><div class="os-dropdown"><div class="icon-w"><i class="os-icon os-icon-ui-46"></i></div><ul><li><a href="#"><i class="os-icon os-icon-ui-49"></i><span>Edit Record</span></a></li><li><a href="#"><i class="os-icon os-icon-grid-10"></i><span>Duplicate Item</span></a></li><li><a href="#"><i class="os-icon os-icon-ui-15"></i><span>Remove Item</span></a></li><li><a href="#"><i class="os-icon os-icon-ui-44"></i><span>Archive Project</span></a></li></ul></div></div></div><div class="pipeline-body"><div class="pipeline-item"><div class="pi-controls"><div class="pi-settings os-dropdown-trigger"><i class="os-icon os-icon-ui-46"></i><div class="os-dropdown"><div class="icon-w"><i class="os-icon os-icon-ui-46"></i></div><ul><li><a href="#"><i class="os-icon os-icon-ui-49"></i><span>Edit Record</span></a></li><li><a href="#"><i class="os-icon os-icon-grid-10"></i><span>Duplicate Item</span></a></li><li><a href="#"><i class="os-icon os-icon-ui-15"></i><span>Remove Item</span></a></li><li><a href="#"><i class="os-icon os-icon-ui-44"></i><span>Archive Project</span></a></li></ul></div></div><div class="status status-green" data-placement="top" data-toggle="tooltip" title="Active Status"></div></div><div class="pi-body"><div class="avatar"><img alt="" src="../Admin/img/avatar5.jpg"></div><div class="pi-info"><div class="h6 pi-name">Borgia Lime</div><div class="pi-sub">John Mayers</div></div></div><div class="pi-foot"><div class="tags"><a class="tag" href="#">Production</a><a class="tag" href="#">Sales</a></div><a class="extra-info" href="#"><i class="os-icon os-icon-mail-12"></i><span>15 Notes</span></a></div></div><div class="pipeline-item"><div class="pi-controls"><div class="pi-settings os-dropdown-trigger"><i class="os-icon os-icon-ui-46"></i><div class="os-dropdown"><div class="icon-w"><i class="os-icon os-icon-ui-46"></i></div><ul><li><a href="#"><i class="os-icon os-icon-ui-49"></i><span>Edit Record</span></a></li><li><a href="#"><i class="os-icon os-icon-grid-10"></i><span>Duplicate Item</span></a></li><li><a href="#"><i class="os-icon os-icon-ui-15"></i><span>Remove Item</span></a></li><li><a href="#"><i class="os-icon os-icon-ui-44"></i><span>Archive Project</span></a></li></ul></div></div><div class="status status-green" data-placement="top" data-toggle="tooltip" title="Active Status"></div></div><div class="pi-body"><div class="avatar"><img alt="" src="../Admin/img/avatar2.jpg"></div><div class="pi-info"><div class="h6 pi-name">Key Stone</div><div class="pi-sub">John Mayers</div></div></div><div class="pi-foot"><div class="tags"><a class="tag" href="#">Gold</a><a class="tag" href="#">Paste</a></div><a class="extra-info" href="#"><i class="os-icon os-icon-mail-12"></i><span>7 Notes</span></a></div></div><div class="pipeline-item"><div class="pi-controls"><div class="pi-settings os-dropdown-trigger"><i class="os-icon os-icon-ui-46"></i><div class="os-dropdown"><div class="icon-w"><i class="os-icon os-icon-ui-46"></i></div><ul><li><a href="#"><i class="os-icon os-icon-ui-49"></i><span>Edit Record</span></a></li><li><a href="#"><i class="os-icon os-icon-grid-10"></i><span>Duplicate Item</span></a></li><li><a href="#"><i class="os-icon os-icon-ui-15"></i><span>Remove Item</span></a></li><li><a href="#"><i class="os-icon os-icon-ui-44"></i><span>Archive Project</span></a></li></ul></div></div><div class="status status-green" data-placement="top" data-toggle="tooltip" title="Active Status"></div></div><div class="pi-body"><div class="avatar"><img alt="" src="img/avatar3.jpg"></div><div class="pi-info"><div class="h6 pi-name">Faradey Corp</div><div class="pi-sub">John Mayers</div></div></div><div class="pi-foot"><div class="tags"><a class="tag" href="#">Meat Supply</a></div><a class="extra-info" href="#"><i class="os-icon os-icon-mail-12"></i><span>4 Notes</span></a></div></div></div></div><!--------------------
END - Pipeline
--------------------></div></div></div><!--------------------
START - Chat Popup Box
--------------------><div class="floated-chat-btn"><i class="os-icon os-icon-mail-07"></i><span>Demo Chat</span></div><div class="floated-chat-w"><div class="floated-chat-i"><div class="chat-close"><i class="os-icon os-icon-close"></i></div><div class="chat-head"><div class="user-w with-status status-green"><div class="user-avatar-w"><div class="user-avatar"><img alt="" src="img/avatar1.jpg"></div></div><div class="user-name"><h6 class="user-title">John Mayers</h6><div class="user-role">Account Manager</div></div></div></div><div class="chat-messages"><div class="message"><div class="message-content">Hi, how can I help you?</div></div><div class="date-break">Mon 10:20am</div><div class="message"><div class="message-content">Hi, my name is Mike, I will be happy to assist you</div></div><div class="message self"><div class="message-content">Hi, I tried ordering this product and it keeps showing me error code.</div></div></div><div class="chat-controls"><input class="message-input" placeholder="Type your message here..." type="text"><div class="chat-extra"><a href="#"><span class="extra-tooltip">Attach Document</span><i class="os-icon os-icon-documents-07"></i></a><a href="#"><span class="extra-tooltip">Insert Photo</span><i class="os-icon os-icon-others-29"></i></a><a href="#"><span class="extra-tooltip">Upload Video</span><i class="os-icon os-icon-ui-51"></i></a></div></div></div></div><!--------------------
END - Chat Popup Box
--------------------></div></div></div>
       <script src="../../js/jquery-1.12.4.js"></script>

</asp:Content>

