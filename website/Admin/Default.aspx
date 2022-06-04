﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-i">
        <div class="content-box">
            <div class="element-wrapper compact pt-4">
                <div class="element-actions">
                    <a class="btn btn-primary btn-sm" href="#"><i class="os-icon os-icon-ui-22"></i><span> Add Party</span></a>
                    <a class="btn btn-primary btn-sm" href="#"><i class="fa fa-inr"></i><span>   Make Payment</span></a>
                    <a class="btn btn-primary btn-sm" href="#"><i class="fa fa-wrench"></i><span>   Add Service</span></a>
                    <a class="btn btn-primary btn-sm" href="#"><i class="fa fa-search"></i><span>   View Party</span></a>
                    <a class="btn btn-primary btn-sm" href="#"><i class="fa fa-bars"></i><span>   Add Category</span></a>
                    <a class="btn btn-primary btn-sm" href="#"><i class="fa fa-print"></i><span>    Print Invoice</span></a>
                </div>
                <h6 class="element-header">Financial Overview</h6> 
                <div class="element-box-tp">
                    <div class="row">


                          <div class="col-lg-12 col-xxl-11">
                              <div class="section-header">                               

                              <h2 class="section-title text-primary">Web Services</h2>                           
                              </div>
                              </div>

                        <div class="col-lg-12 col-xxl-11">
                            <!--START - BALANCES-->
                            <div class="element-balances">
                                <div class="balance hidden-mobile">
                                    <div class="balance-title">Total Balance</div>
                                    <div class="balance-value"><span><i class="fa fa-inr"></i>350</span><span class="trending trending-down-basic"><span>%12</span><i class="os-icon os-icon-arrow-2-down"></i></span></div>
                                    <div class="balance-link"><a class="btn btn-link btn-underlined" href="#"><span>View Statement</span><i class="os-icon os-icon-arrow-right4"></i></a></div>
                                </div>
                                <div class="balance">
                                    <div class="balance-title">Credit Available</div>
                                    <div class="balance-value"><i class="fa fa-inr"></i>17,800</div>
                                    <div class="balance-link"><a class="btn btn-link btn-underlined" href="#"><span>Request Increase</span><i class="os-icon os-icon-arrow-right4"></i></a></div>
                                </div>
                                <div class="balance">
                                    <div class="balance-title">Due Today</div>
                                    <div class="balance-value danger"><i class="fa fa-inr"></i>180</div>
                                    <div class="balance-link"><a class="btn btn-link btn-underlined btn-gold" href="#"><span>Pay Now</span><i class="os-icon os-icon-arrow-right4"></i></a></div>
                                </div>
                                <div class="balance">
                                    <div class="balance-title">Total Party</div>
                                    <div class="balance-value danger">180</div>
                                    <div class="balance-link"><a class="btn btn-link btn-underlined btn-gold" href="#"><span>Add Party Now</span><i class="os-icon os-icon-arrow-right4"></i></a></div>
                                </div>
                            </div>
                            <!--END - BALANCES-->
                        </div>


                         <div class="col-lg-12 col-xxl-11">
                              <div class="section-header">                               

                              <h2 class="section-title text-primary">Job Services</h2>                           
                              </div>
                              </div>




                        <%--<div class="col-lg-5 col-xxl-6">
                            <!--START - MESSAGE ALERT-->
                            <div class="alert alert-warning borderless">
                                <h5 class="alert-heading">Refer Friends. Get Rewarded</h5>
                                <p>You can earn: 15,000 Membership Rewards points for each approved referral – up to 55,000 Membership Rewards points per calendar year.</p>
                                <div class="alert-btn"><a class="btn btn-white-gold" href="#"><i class="os-icon os-icon-ui-92"></i><span>Send Referral</span></a></div>
                            </div>
                            <!--END - MESSAGE ALERT-->
                        </div>--%>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-xxl-11">
                    <!--START - CHART-->
                    <div class="element-wrapper">
                        <div class="element-box">
                            <div class="element-actions">
                                <div class="form-group">
                                    <select class="form-control form-control-sm">
                                        <option selected="true">Last 30 days</option>
                                        <option>This Week</option>
                                        <option>This Month</option>
                                        <option>Today</option>
                                    </select></div>
                            </div>
                            <h5 class="element-box-header">Balance History</h5>
                            <div class="el-chart-w">
                                <canvas data-chart-data="13,28,19,24,43,49,40,35,42,46" height="90" id="liteLineChartV2" width="300"></canvas>
                            </div>
                        </div>
                    </div>
                    <!--END - CHART-->
                </div>
               <%-- <div class="col-lg-5 col-xxl-6">
                    <!--START - Money Withdraw Form-->
                    <div class="element-wrapper">
                        <div class="element-box">
                            <form>
                                <h5 class="element-box-header">Withdraw Money</h5>
                                <div class="row">
                                    <div class="col-sm-5">
                                        <div class="form-group">
                                            <label class="lighter" for="">Select Amount</label><div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                                <input class="form-control" placeholder="Enter Amount..." type="text" value="0"><div class="input-group-addon">USD</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-7">
                                        <div class="form-group">
                                            <label class="lighter" for="">Transfer to</label><select class="form-control"><option value="">Citibank *6382</option>
                                                <option value="">Chase *8372</option>
                                                <option value="">Bank of America *7363</option>
                                            </select></div>
                                    </div>
                                </div>
                                <div class="form-buttons-w text-right compact"><a class="btn btn-grey" href="#"><i class="os-icon os-icon-ui-22"></i><span>Add Account</span></a><a class="btn btn-primary" href="#"><span>Transfer</span><i class="os-icon os-icon-grid-18"></i></a></div>
                            </form>
                        </div>
                    </div>
                    <!--END - Money Withdraw Form-->
                </div>--%>
            </div>
            <!--START - Transactions Table-->
            <div class="element-wrapper">
                <h6 class="element-header">Recent Renew</h6>
                <div class="element-box-tp">
                    <div class="table-responsive">
                        <table class="table table-padded">
                            <thead>
                                <tr>
                                    <th>Status</th>
                                    <th>Date</th>
                                    <th>Description</th>
                                    <th class="text-center">Category</th>
                                    <th class="text-right">Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="nowrap"><span class="status-pill smaller green"></span><span>Complete</span></td>
                                    <td><span>Today</span><span class="smaller lighter">1:52am</span></td>
                                    <td class="cell-with-media">
                                        <img alt="" src="img/company1.png" style="height: 25px;"><span>Banana Shakes LLC</span></td>
                                    <td class="text-center"><a class="badge badge-success" href="#">Shopping</a></td>
                                    <td class="text-right bolder nowrap"><span class="text-success">+ 1,250 USD</span></td>
                                </tr>
                                <tr>
                                    <td class="nowrap"><span class="status-pill smaller red"></span><span>Declined</span></td>
                                    <td><span>Jan 19th</span><span class="smaller lighter">3:22pm</span></td>
                                    <td class="cell-with-media">
                                        <img alt="" src="img/company2.png" style="height: 25px;"><span>Stripe Payment Processing</span></td>
                                    <td class="text-center"><a class="badge badge-danger" href="#">Cafe</a></td>
                                    <td class="text-right bolder nowrap"><span class="text-success">+ 952.23 USD</span></td>
                                </tr>
                                <tr>
                                    <td class="nowrap"><span class="status-pill smaller yellow"></span><span>Pending</span></td>
                                    <td><span>Yesterday</span><span class="smaller lighter">7:45am</span></td>
                                    <td class="cell-with-media">
                                        <img alt="" src="img/company3.png" style="height: 25px;"><span>MailChimp Services</span></td>
                                    <td class="text-center"><a class="badge badge-warning" href="#">Restaurants</a></td>
                                    <td class="text-right bolder nowrap"><span class="text-danger">- 320 USD</span></td>
                                </tr>
                                <tr>
                                    <td class="nowrap"><span class="status-pill smaller yellow"></span><span>Pending</span></td>
                                    <td><span>Jan 23rd</span><span class="smaller lighter">2:12pm</span></td>
                                    <td class="cell-with-media">
                                        <img alt="" src="img/company1.png" style="height: 25px;"><span>Starbucks Cafe</span></td>
                                    <td class="text-center"><a class="badge badge-primary" href="#">Shopping</a></td>
                                    <td class="text-right bolder nowrap"><span class="text-success">+ 17.99 USD</span></td>
                                </tr>
                                <tr>
                                    <td class="nowrap"><span class="status-pill smaller green"></span><span>Complete</span></td>
                                    <td><span>Jan 12th</span><span class="smaller lighter">9:51am</span></td>
                                    <td class="cell-with-media">
                                        <img alt="" src="img/company4.png" style="height: 25px;"><span>Ebay Marketplace</span></td>
                                    <td class="text-center"><a class="badge badge-danger" href="#">Groceries</a></td>
                                    <td class="text-right bolder nowrap"><span class="text-danger">- 244 USD</span></td>
                                </tr>
                                <tr>
                                    <td class="nowrap"><span class="status-pill smaller yellow"></span><span>Pending</span></td>
                                    <td><span>Jan 9th</span><span class="smaller lighter">12:45pm</span></td>
                                    <td class="cell-with-media">
                                        <img alt="" src="img/company2.png" style="height: 25px;"><span>Envato Templates Inc</span></td>
                                    <td class="text-center"><a class="badge badge-primary" href="#">Business</a></td>
                                    <td class="text-right bolder nowrap"><span class="text-success">+ 340 USD</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--END - Transactions Table-->
            <!--------------------
                        START - Chat Popup Box
                        -------------------->
           <%-- <div class="floated-chat-btn"><i class="os-icon os-icon-mail-07"></i><span>Demo Chat</span></div>
            <div class="floated-chat-w">
                <div class="floated-chat-i">
                    <div class="chat-close"><i class="os-icon os-icon-close"></i></div>
                    <div class="chat-head">
                        <div class="user-w with-status status-green">
                            <div class="user-avatar-w">
                                <div class="user-avatar">
                                    <img alt="" src="img/avatar1.jpg"></div>
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
            </div>--%>
            <!--------------------
                        END - Chat Popup Box
                        -------------------->
        </div>
    </div>
    <script src="bower_components/jquery/dist/jquery.min.js"></script>
</asp:Content>

