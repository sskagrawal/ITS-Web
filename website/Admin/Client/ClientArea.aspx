<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ClientArea.aspx.cs" Inherits="Admin_Client_ClientArea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="content-i">
        <div class="content-box">
            <div class="element-wrapper compact pt-4">
             
                <h6 class="element-header">Dashboard</h6>
                <div class="element-box-tp">
                    <div class="row">
                        <div class="col-lg-12 col-xxl-11">
                            <!--START - BALANCES-->
                            <div class="element-balances">
                                <div class="balance hidden-mobile">
                                    <div class="balance-title">Services</div>
                                    <div class="balance-value"><span><i class="fa fa-inr"></i>350</span><span class="trending trending-down-basic"><span>%12</span><i class="os-icon os-icon-arrow-2-down"></i></span></div>
                                    <div class="balance-link"><a class="btn btn-link btn-underlined" href="#"><span>View Statement</span><i class="os-icon os-icon-arrow-right4"></i></a></div>
                                </div>
                                <div class="balance">
                                    <div class="balance-title">Tickets</div>
                                    <div class="balance-value"><i class="fa fa-inr"></i>17,800</div>
                                    <div class="balance-link"><a class="btn btn-link btn-underlined" href="#"><span>Request Increase</span><i class="os-icon os-icon-arrow-right4"></i></a></div>
                                </div>
                                <div class="balance">
                                    <div class="balance-title">Invoices</div>
                                    <div class="balance-value danger"><i class="fa fa-inr"></i>180</div>
                                    <div class="balance-link"><a class="btn btn-link btn-underlined btn-gold" href="#"><span>Pay Now</span><i class="os-icon os-icon-arrow-right4"></i></a></div>
                                </div>
                                <div class="balance">
                                    <div class="balance-title">Renew Services</div>
                                    <div class="balance-value danger">180</div>
                                    <div class="balance-link"><a class="btn btn-link btn-underlined btn-gold" href="#"><span>Add Party Now</span><i class="os-icon os-icon-arrow-right4"></i></a></div>
                                </div>
                            </div>
                            <!--END - BALANCES-->
                        </div>
                        
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
           
            <!--------------------
                        END - Chat Popup Box
                        -------------------->
        </div>
    </div>
    <script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

