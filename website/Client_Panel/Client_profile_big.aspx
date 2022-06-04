<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Client_profile_big.aspx.cs" Inherits="Client_Panel_Client_profile_big" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Admin/AdminControl/AdsControl.ascx" TagPrefix="uc1" TagName="AdsControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        a {
            cursor: default;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdfClientId" runat="server" />
    <asp:HiddenField ID="hdfusertypeid" runat="server" />
     <asp:HiddenField ID="hdfjobCatId" runat="server" />

    <div class="content-w">
        <!--------------------START - Breadcrumbs-------------------->

        <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
            <li class="breadcrumb-item"><a href="index.html">Products</a></li>
            <li class="breadcrumb-item"><span>Laptop with retina screen</span></li>

        </ul>
        <!--------------------END - Breadcrumbs-------------------->


        <div class="content-panel-toggler">
            <i class="os-icon os-icon-grid-squares-22"></i><span>Sidebar</span>
        </div>
        <div class="content-i">
            <div class="content-box">
                <div class="element-wrapper">
                    <div class="user-profile">

                        <%--<asp:Literal ID="ltrProfile" runat="server"></asp:Literal>--%>
                        <div class="up-head-w" style="background-image: url(<%= coverPhoto %>)">
                            <div class="up-social">
                                <a href="#"><i class="os-icon os-icon-twitter"></i></a>
                                <a href="#"><i class="os-icon os-icon-facebook"></i></a>
                            </div>
                            <div class="up-main-info">
                                <div class="user-avatar-w">
                                    <div class="user-avatar">
                                        <img alt="" src="" runat="server" id="imgLogo" />

                                    </div>
                                </div>
                                <h1 class="up-header" style="font-size: 2.75rem !important">
                                    <asp:Label ID="lbl1" runat="server" Text="Label"></asp:Label>
                                </h1>
                                <h5 class="up-sub-header">
                                    <asp:Label ID="lbl2" runat="server" Text="Label"></asp:Label>
                                </h5>
                            </div>
                            <svg class="decor" width="842px" height="219px" viewBox="0 0 842 219" preserveAspectRatio="xMaxYMax meet" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                <g transform="translate(-381.000000, -362.000000)" fill="#FFFFFF">
                                    <path class="decor-path" d="M1223,362 L1223,581 L381,581 C868.912802,575.666667 1149.57947,502.666667 1223,362 Z"></path>
                                </g></svg>

                        </div>





                        <div class="up-controls">

                            <div class="row">

                                <div class="col-lg-6">
                                    <div class="value-pair">
                                        <div class="label">Status:</div>
                                        <div class="value badge badge-pill badge-success">Online </div>
                                    </div>

                                    <div class="value-pair">
                                        <div class="label">Experience:</div>
                                        <div class="value badge badge-pill badge-success">
                                            <asp:Label ID="lbljobExp" runat="server" Text=""></asp:Label>

                                        </div>

                                    </div>


                                </div>

                                <div class="col-lg-6 text-right">
                                    <asp:Literal ID="ltrlCatBudjt" runat="server"></asp:Literal>
                                    <%-- <button class="btn btn-primary btn-sm"><i class="os-icon os-icon-link-3"></i><span>Category</span>  <asp:Label ID="lblBudget" runat="server" Text="IT"></asp:Label>   </button>--%>
                                    <%--  
                                    <i class="fa fa-inr" aria-hidden="true"></i>
                                     <asp:Label ID="lblbudgetMin" runat="server" Text=""></asp:Label> -
                                     <asp:Label ID="lblbudgetMax" runat="server" Text=""></asp:Label>--%>
                                    <asp:Literal ID="ltrlHireFollow" runat="server"></asp:Literal>

                                    <%-- <a class="btn btn-secondary btn-sm" href=""> <i class="fa fa-user" aria-hidden="true"></i>   <span>Follow Me</span></a>--%>
                                </div>




                            </div>



                        </div>
                        <div class="up-controls" id="shortDescDiv" runat="server">
                            <div class="row">
                                <div class="col-sm-12">
                                    <h2>
                                        <asp:Label ID="lblJobTitle" runat="server"></asp:Label>
                                    </h2>
                                    <br />
                                    <div class="value-pair">
                                        <div class="value badge badge-pill badge-success">
                                            Short Description
                                        </div>
                                    </div>

                                    <div class="el-tablo padded-v text-justify">
                                        <label>
                                            <asp:Label ID="lblShortDesc1" runat="server" Text=""></asp:Label>
                                        </label>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="up-contents">

                            <h5 class="element-header">
                                <asp:Label runat="server" Text="" ID="Heading1"></asp:Label>
                            </h5>

                            <div class="row m-b">

                                <div class="col-lg-6">

                                    <div class="row">

                                        <div class="col-sm-6 b-r b-b">
                                            <div class="el-tablo centered padded">
                                                <asp:Literal ID="ltrlCont1" runat="server"></asp:Literal>
                                                <%--<div class="value">3814</div>
                                                <div class="label">Total Earning</div>--%>
                                            </div>

                                        </div>

                                        <div class="col-sm-6 b-b b-r">
                                            <div class="el-tablo centered padded">
                                                <asp:Literal ID="ltrlCont2" runat="server"></asp:Literal>
                                                <%--<div class="value">47.5K</div>
                                                <div class="label">Job Completed</div>--%>
                                            </div>

                                        </div>

                                    </div>



                                </div>



                                <div class="col-lg-6">

                                    <div class="row">

                                        <div class="col-sm-6 b-r b-b">
                                            <div class="el-tablo centered padded">
                                                <asp:Literal ID="ltrlCont3" runat="server"></asp:Literal>
                                                <%--<div class="value">3814</div>
                                                <div class="label">No of Feedback</div>--%>
                                            </div>

                                        </div>

                                        <div class="col-sm-6 b-b b-r">
                                            <div class="el-tablo centered padded">
                                                <asp:Literal ID="ltrlCont4" runat="server"></asp:Literal>
                                                <%--<div class="value">47.5K</div>
                                                <div class="label">Cancelled</div>--%>
                                            </div>

                                        </div>

                                    </div>



                                    <%-- <div class="padded"><div class="element-info-with-icon smaller">
                                        <div class="element-info-icon">
                                            <div class="os-icon os-icon-bar-chart-stats-up"></div></div>
                                        <div class="element-info-text">
                                            <h5 class="element-inner-header">Monthly Revenue</h5>
                                            <div class="element-inner-desc">Calculated every month</div></div></div>
                                        <div class="el-chart-w">
                                            <canvas height="130" id="liteLineChart" width="300"></canvas>

                                        </div>

                                    </div>--%>
                                </div>

                            </div>

                            <div class="os-tabs-w">
                                <%--<div class="os-tabs-controls">
                                            <ul class="nav nav-tabs bigger">
                                                <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#tab_overview">Contact</a></li>
                                                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab_sales">Business</a></li>

                                            </ul>
                                            
                                            <ul class="nav nav-pills smaller hidden-sm-down">                                                
                                                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#">Today</a></li>
                                                <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#">7 Days</a></li>
                                                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#">14 Days</a></li>
                                                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#">Last Month</a></li>

                                            </ul>

                                        </div>--%>

                                <%--<div class="tab-content">
                                            
                                            <div class="tab-pane active" id="tab_overview">
                                                <div class="timed-activities padded">
                                                    <div class="timed-activity">         



                                                    </div>                                                  
                                                    
                                                  
                                                    
                                                   


                                                </div>


                                            </div>                                            
                                            
                                            
                                            <div class="tab-pane" id="tab_sales"><div class="el-tablo"><div class="label">Unique Visitors</div><div class="value">12,537</div></div><div class="el-chart-w"><canvas height="150px" id="lineChart" width="600px"></canvas></div></div><div class="tab-pane" id="tab_conversion"></div></div>--%>
                            </div>



                        </div>



                        <div class="row">

                            <div class="col-lg-12">
                                <div class="element-box">



                                    <div class="steps-w">
                                        <div class="step-triggers">
                                            <a class="step-trigger active" href="#stepContent2" id="BusJobTab" runat="server">Business</a>

                                         

                                        </div>

                                        <div class="step-contents">
                                            <%--<div class="step-content active" id="stepContent1">                                              
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="">Full Name</label>
                                                            <asp:Label ID="lblFullName" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>

                                                           
                                                        </div>
                                                    </div>


                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="">Mobile</label>
                                                            <asp:Label ID="lblMobile" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>

                                                        </div>
                                                    </div>

                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="">Whatsapp</label>
                                                            <asp:Label ID="lblWhatsapp" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>

                                                        </div>

                                                    </div>


                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="">Email</label>
                                                            <asp:Label ID="lblEmail" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>

                                                        </div>
                                                    </div>
                                                </div>


                                              
                                            </div>--%>


                                            <div class="step-content active" id="stepContent2">

                                              
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="">Industry</label>
                                                            <asp:Label ID="lblJobCategory" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>

                                                        </div>
                                                    </div>


                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="">Job Category</label>
                                                            <asp:Label ID="lbljobSubCategory" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>

                                                        </div>
                                                    </div>
                                                </div>




                                                <div class="clearfix"></div>
                                               

                                                    <%--<div class="col-sm-12" id="divjobTitle" runat="server" visible="false">
                            <div class="form-group">
                                <label for="">Job Title</label>
                              <asp:Label ID="lblJobTitle" style="font:15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>

                            </div>
                        </div>--%>



                                                  

                                                 
                                                       

                                                        <div class="row" id="divCompnay" runat="server" visible="false">
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label for="">Tagline</label>
                                                                <asp:Label ID="lblTagline" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row">
                                                         <div class="col-sm-6" id="divCompGST" runat="server" visible="false">
                                                        <div class="form-group">
                                                            <label for="">Company GST No</label>
                                                            <asp:Label ID="lblComGST" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>

                                                        </div>
                                                    </div>
                                                        <div class="col-sm-6" id="divDesignation" runat="server" visible="false">
                                                        <div class="form-group">
                                                            <label for="">Designation</label>
                                                            <asp:Label ID="lblDesignation" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>

                                                        </div>
                                                    </div>

                                                
                                                        </div>
                                                        <div class="row">


                                                             <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label for="">Company Name</label>
                                                                <asp:Label ID="lblCompanyName" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>

                                                            </div>
                                                        </div>

                                                    

                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="">Website</label>
                                                            <asp:Label ID="lblwebsite" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>

                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6" id="establisedDiv" runat="server" visible="false">
                                                        <div class="form-group">
                                                            <label for="">Established On</label>
                                                            <asp:Label ID="lblEstablishdDt" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>

                                                        </div>
                                                    </div>
                                                             <div class="col-sm-6" id="divQualification" runat="server" visible="false">
                                                        <div class="form-group">
                                                            <label for="">Qualification</label>
                                                            <asp:Label ID="lblQualification" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>

                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6" id="expDiv" runat="server" visible="false">
                                                        <div class="form-group">
                                                            <label for="">Experience</label>
                                                            <asp:Label ID="lblExperience" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>

                                                        </div>
                                                    </div>




                                                </div>
                                                <div class="row" id="divJobType" runat="server" visible="false">

                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="">Job Type</label>
                                                            <asp:Label ID="lbljobtype" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>

                                                        </div>
                                                    </div>


                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="">Job Time Period</label>
                                                            <asp:Label ID="lblJobPeriod" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>

                                                        </div>
                                                    </div>

                                                       <div class="col-sm-6" id="divMinBudget" runat="server" visible="false">
                                                        <div class="form-group">
                                                            <label for="">Budget</label>
                                                            <asp:Label ID="lblminbudget" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>

                                                        </div>
                                                    </div>


                                                    <div class="col-sm-12">
                                                <div class="form-group">
                                      <label>Keyword</label>                    

                             <asp:DropDownList ID="ddlKeyword" runat="server" class="form-control select2" multiple="true" style="width:100%">


                              </asp:DropDownList>

                               <asp:HiddenField ID="hfSelected" runat="server" />
                                                                  
                               <ul class="nav nav-pills smaller hidden-md-down" style="padding:5px;">                                
                               <asp:Literal ID="ltrSeletedkeywrd" runat="server"></asp:Literal>
                                             
                                  </ul>

                               </div>


                              </div>



                                                </div>


                                             <%--   <div class="row" id="budgetDiv" runat="server" visible="false">--%>

                                                 

                  

                          


                    
                                                  <%--  <div class="col-sm-6" runat="server">
                                                        <div class="form-group">
                                                            <label for="">Max Budget</label>
                                                            <asp:Label ID="lblmaxgudget" CssClass="form-control" runat="server" Text=""></asp:Label>

                                                        </div>
                                                    </div>--%>



                                              <%--  </div>--%>


                                                <%--  <div class="form-group">

                                <div class="value-pair">                                                   
                                   <div class="value badge badge-pill badge-success">
                                    Short Description</div>
                                </div>

                               <div class="el-tablo padded-v text-justify">                                                                                                          
                                
                               <asp:label ID="lblshortDesc"  runat="server" text=""></asp:label> 
                                 </div>

                            </div> --%>








                                                <div class="form-group">
                                                    <%-- <div class="col-sm-12 b-r b-b">--%>
                                                    <div class="value-pair">

                                                        <div class="value badge badge-pill badge-success">
                                                            Long Description
                                                        </div>
                                                    </div>


                                                    <%--  </div>--%>

                                                    <div class="el-tablo padded-v text-justify">

                                                        <label>
                                                            <asp:Label ID="lblLongDesc" runat="server" Text=""></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <%--  <label for="">Job Skill</label>--%>
                                                    <div class="os-tabs-controls">


                                                        <ul class="nav nav-pills smaller hidden-sm-down" style="border-bottom: none!important;">
                                                            <asp:Literal ID="ltrskill" runat="server"></asp:Literal>

                                                            <%--   <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#">Today</a></li>
                        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#">7 Days</a></li>
                        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#">14 Days</a></li>
                        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#">Last Month</a></li>--%>
                                                        </ul>
                                                    </div>
                                                </div>



                                                <div class="element-wrapper">
                        
                       <%-- <h6 class="element-header">Work Details</h6>--%>
                        <%--<div class="element-box-tp">--%>
                 <%--   <div class="input-search-w">
                            <input class="form-control rounded bright" placeholder="Search team members..." type="search">
                            </div>--%>
                   <%-- <div class="users-list-w">--%>



                        <asp:Literal ID="ltrProject" runat="server"></asp:Literal>

                           <%-- <div class="user-w with-status">
                        <div class="user-avatar-w" style="width:120px!important;">
                            <div class="user-avatar" style="border-radius:0px!important;">                           
                                <img src="../Admin/img/avatar1.jpg" />
                            </div>
                        </div>
                        <div class="user-name"><h6 class="user-title">Project Title</h6>
                                <div class="user-role">Account Manager</div></div>
                                <div class="user-action"><div class="os-icon os-icon-email-forward"></div></div>
                            </div>--%>
                      

                          <%--  <div class="user-w with-status status-green">
                        <div class="user-avatar-w">
                                <div class="user-avatar">
                            <img alt="" src="img/avatar1.jpg"></div></div>
                        <div class="user-name"><h6 class="user-title">Ben Gossman</h6>
                                <div class="user-role">Administrator</div>
                                </div>
                                
                                <div class="user-action">
                                <div class="os-icon os-icon-email-forward"></div>

                                </div>

                            </div>
                            --%>
                            
                           <%-- </div>--%>
                  <%--  </div>--%>
                        </div>





                                                <%-- <div class="form-buttons-w text-right"><a class="btn btn-primary step-trigger-btn" href="#stepContent3"> Continue</a></div>--%>
                                            </div>




                                            <%--<div class="step-content" id="stepContent3" runat="server">

                                                <asp:Literal ID="ltrContact" runat="server"></asp:Literal>

                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="">Country</label>
                                                            <asp:Label ID="lblCountry" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>

                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="">State</label>
                                                            <asp:Label ID="lblState" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>

                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="">City</label>
                                                            <asp:Label ID="lblCity" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>

                                                        </div>
                                                    </div>

                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="">PinCode</label>

                                                            <asp:Label ID="lblPinCode" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Full Address</label>

                                                    <asp:Label ID="lblFullAddress" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>


                                                </div>

                                                
                                            </div>--%>



                                            <div class="step-content" id="stepContent4" runat="server">




                                                <div class="row">


                                                    <div style="width: 100%; overflow-x: auto">
                                                        <asp:GridView ID="gvFileDetails" runat="server" Width="100%" OnRowDataBound="gvFileDetails_RowDataBound"
                                                            CssClass="table table-bordered table-striped" AutoGenerateColumns="False"
                                                            RowStyle-HorizontalAlign="Center" HorizontalAlign="Center">

                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        Sno
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblSRNO" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>


                                                                <asp:BoundField DataField="Document_Name" HeaderText="FileName " />
                                                                <asp:BoundField DataField="Upload_File" HeaderText="UploadFile " />


                                                                <asp:TemplateField HeaderText="Download">

                                                                    <ItemTemplate>

                                                                        <asp:HiddenField ID="hdfDocId" Value='<%# Eval("Document_Id") %>' runat="server" />
                                                                        <asp:Literal ID="ltrDoc" runat="server"></asp:Literal>

                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" Width="60px" />
                                                                </asp:TemplateField>



                                                            </Columns>

                                                        </asp:GridView>
                                                    </div>


                                                </div>




                                                <%-- <div class="form-buttons-w text-right">

                               <a class="btn btn-primary step-trigger-btn" href="#stepContent5"> Continue</a> 
                            



                        </div>--%>
                                            </div>

                                            <div class="step-content" id="stepContent5">

                                                <asp:Literal ID="ltrbank" runat="server"></asp:Literal>

                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="">Bank Name</label>
                                                            <asp:Label ID="lblBankName" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>

                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="">Account Holder Name</label>
                                                            <asp:Label ID="lblAccHolder" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>

                                                        </div>
                                                    </div>
                                                    <div class="col-sm-12">
                                                        <div class="form-group">
                                                            <label for="">Branch Name</label>
                                                            <asp:Label ID="lblBranchName" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>

                                                        </div>
                                                    </div>

                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="">Account Number</label>
                                                            <asp:Label ID="lblAccNumber" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>


                                                        </div>

                                                    </div>
                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="">IFSC Code</label>
                                                            <asp:Label ID="lblIFSCCode" Style="font: 15px/20px cursive;" CssClass="form-control" runat="server" Text=""></asp:Label>


                                                        </div>

                                                    </div>


                                                </div>

                                                <%--      <div class="form-buttons-w text-right">
                         <a class="btn btn-primary step-trigger-btn" href="#stepContent4">Back</a>                   


                        </div>--%>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="form-buttons-w text-right" id="editPrflDiv" runat="server">
                                        <a class="btn btn-primary" href="ClientPrf.aspx">Edit Profile</a>
                                    </div>
                                </div>

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
                                        <img alt="" src="../Admin/img/avatar1.jpg"></div>
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
            <!--------------------
START - Sidebar
-------------------->
            <div class="content-panel">
                <div class="content-panel-close"><i class="os-icon os-icon-close"></i></div>


            <%--    <uc1:SupportControl runat="server" ID="SupportControl" />--%>


                <div class="element-wrapper">
                    <h6 class="element-header">Support Agents</h6>
                    <div class="element-box-tp">
                        <div class="profile-tile">
                            <div class="profile-tile-box">
                                <div class="pt-avatar-w">
                                     <%-- <img src="../Admin/img/avatar3.jpg"  alt="Support Agent" />--%>
                                      <img src="../img/sandeepdg.jpg" alt="Support Agent" />

                                </div>
                                <div class="pt-user-name text-danger">Mr. Sandeep </div>
                            </div>
                            <div class="profile-tile-meta">
                                <ul>
                                    <li><strong>Digital Marketing Expert</strong></li>
                                    <li><strong>Exp:5-10 Year</strong></li>
                                    <li><strong> <i class="fa fa-map-marker" style="font-size:12px"></i> Gwalior</strong></li>
                                </ul>
                                <div class="pt-btn">
                                    <a class="btn btn-success btn-sm" title="call to support" href="tel:+91 8989024130">+91 8989024130 </a>

                                </div>
                            </div>
                        </div>



                        <div class="profile-tile">
                            <div class="profile-tile-box">
                                <div class="pt-avatar-w">
                                   <%-- <img src="../Admin/img/avatar4.jpg" alt="Support Agent" />--%>
                                 
                                <%--    <img src="../img/dummyMam.png" />--%>
                                    <img src="../img/dummy2.png" />
                                <%--    <img alt="" src="../Admin/img/avatar2.jpg"/>--%>

                                </div>
                                <div class="pt-user-name text-danger">Mrs. Shilpa </div>
                            </div>
                            <div class="profile-tile-meta">
                                <ul>
                                    <li><strong>Web Developer</strong></li>
                                    <li><strong>Exp: 9-10 Year</strong></li>
                                    <li><strong><i class="fa fa-map-marker" style="font-size:12px"></i>  Gwalior</strong></li>
                                </ul>
                                <div class="pt-btn">
                                    <a class="btn btn-success btn-sm" title="call to support" href="tel:+91 8989024130">+91 8989024130</a>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <uc1:AdsControl runat="server" ID="AdsControl" />
           <%--     <div class="element-wrapper">
                    <h6 class="element-header">Team Members</h6>
                      <img src="../AdsImage/AdBanner.jpg" alt="banner" style="width:100%;" />                  

                </div>--%>
    </div>

    <script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

