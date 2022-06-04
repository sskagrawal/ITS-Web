<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Update_timesheet.aspx.cs" Inherits="Admin_Employee_Update_timesheet"  enableEventValidation="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


      <div class="content-w">
                <!--------------------
START - Breadcrumbs
-------------------->
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li><li class="breadcrumb-item">
                        <a href="index.html">Products</a></li><li class="breadcrumb-item"><span>Laptop with
                            retina screen</span></li></ul>
                <!--------------------<a href="Update_timesheet.aspx">Update_timesheet.aspx</a>
END - Breadcrumbs
-------------------->
                <div class="content-i">


                     <asp:HiddenField ID="Hdf_eid" runat="server" />


                    <div class="content-box">
                        <div class="row">
                            
                            <div class="col-lg-12">
                                <div class="element-wrapper">
                                    <h6 class="element-header">
                                        Time Sheet</h6>
                                    <div class="element-box">
                                        <form>
                                        <h5 class="form-header">
                                            Time Sheet</h5>
                                        
                                       
                                       
                                    
                                    
                                        <fieldset class="form-group">
                                            <legend><span>Time Sheet</span></legend>

                                               <div class="form-group row">
                                                <label class="col-sm-4 col-form-label" for="">
                                                    Entry Date</label><div class="col-sm-8">
                                                        <%--<input class="single-daterange form-control" placeholder="Date of birth" type="text"
                                                            value="04/12/1978">--%>
                                                        <asp:TextBox ID="TxtEntryDate" runat="server" class="form-control"  Cssclass="single-daterange form-control"  placeholder="Enter Entry Date"></asp:TextBox>
                                                         <asp:Calendar ID="Calendar2" runat="server" Visible="false"  ControlToValidate="TxtEntryDate"></asp:Calendar>

                                                                      </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-4 col-form-label" for="">
                                                 Entry Time</label><div class="col-sm-8">
                                                
                                                    <link href="../../timepick/Timepicker/timepicker/bootstrap-timepicker.min.css" rel="stylesheet"
                                                        type="text/css" />
                            
                                                    <script src="../../timepick/Timepicker/timepicker/bootstrap-timepicker.min.js" type="text/javascript"></script>
                                                   
                                                    <script src="../../timepick/Timepicker/jquery.min.js" type="text/javascript"></script>


                                                   
                                                        <%--<input class="form-control" placeholder="Last Name" type="text">--%>
                                                        <asp:TextBox ID="TxtEntryTime" data-provide="timepicker"  data-provider="timepicker"   runat="server" cssclass="form-control" placeholder="Entry Time"></asp:TextBox>
                                                        

                                           
                                   <script>
                                       $(function () {    //Timepicker
                                           $(".timepicker").timepicker({
                                               showInputs: false
                                           });
                                       });
                                     </script>
                                                                      </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-4 col-form-label" for="">
                                                   Work Description</label><div class="col-sm-8">
                                                       <%-- <input class="form-control" placeholder="First Name" type="text">--%>
                                                       <asp:TextBox ID="txtWorkDescription" runat="server" TextMode="MultiLine" placeholder="Work Description" CssClass="form-control"></asp:TextBox>
                                                                     </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-4 col-form-label" for="">
                                                    Exit Date</label><div class="col-sm-8">
                                                        <%--<input class="single-daterange form-control" placeholder="Date of birth" type="text" value="04/12/1978">--%>
                                                        <asp:TextBox ID="TxtExitDate" runat="server" Cssclass="single-daterange form-control" placeholder="Enter Date"></asp:TextBox>

                                                         <asp:Calendar ID="Calendar1" runat="server" Visible="false" ControlToValidate="TxtExitDate"></asp:Calendar>
                                                                     </div>
                                            </div>
                                            

                                            <div class="form-group row">
                                                <label class="col-sm-4 col-form-label" for="">
                                                    Exit Time</label><div class="col-sm-8">
                                                       <%-- <input class="form-control" placeholder="Last Name" type="text">--%>
                                                        <asp:TextBox ID="TxtExitTime" runat="server" cssclass="form-control" placeholder="Exit Time"></asp:TextBox>
                                                       


                                                                     </div>
                                            </div>
                                           
                                         
                                            
                                        </fieldset>
                                    
                                        <div class="form-buttons-w">
                                            <%--<button class="btn btn-primary" type="submit">--%>
                                            <asp:Button ID="btnupdate" runat="server" Text="Update" 
                                                Cssclass="btn btn-primary" onclick="update_Click" />
                                                <%--Submit</button>--%>

                                        </div>



                                        

                                         


                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!--------------------
START - Chat Popup Box
-------------------->
                        <div class="floated-chat-btn">
                            <i class="os-icon os-icon-mail-07"></i><span>Demo Chat</span></div>
                        <div class="floated-chat-w">
                            <div class="floated-chat-i">
                                <div class="chat-close">
                                    <i class="os-icon os-icon-close"></i>
                                </div>
                                <div class="chat-head">
                                    <div class="user-w with-status status-green">
                                        <div class="user-avatar-w">
                                            <div class="user-avatar">
                                                <img alt="" src="img/avatar1.jpg"></div>
                                        </div>
                                        <div class="user-name">
                                            <h6 class="user-title">
                                                John Mayers</h6>
                                            <div class="user-role">
                                                Account Manager</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="chat-messages">
                                    <div class="message">
                                        <div class="message-content">
                                            Hi, how can I help you?</div>
                                    </div>
                                    <div class="date-break">
                                        Mon 10:20am</div>
                                    <div class="message">
                                        <div class="message-content">
                                            Hi, my name is Mike, I will be happy to assist you</div>
                                    </div>
                                    <div class="message self">
                                        <div class="message-content">
                                            Hi, I tried ordering this product and it keeps showing me error code.</div>
                                    </div>
                                </div>
                                <div class="chat-controls">
                                    <input class="message-input" placeholder="Type your message here..." type="text"><div
                                        class="chat-extra">
                                        <a href="#"><span class="extra-tooltip">Attach Document</span><i class="os-icon os-icon-documents-07"></i></a><a
                                            href="#"><span class="extra-tooltip">Insert Photo</span><i class="os-icon os-icon-others-29"></i></a><a
                                                href="#"><span class="extra-tooltip">Upload Video</span><i class="os-icon os-icon-ui-51"></i></a></div>
                                </div>
                            </div>
                        </div>
                        <!--------------------
END - Chat Popup Box
-------------------->
                    </div>
                </div>
            </div>
</asp:Content>

