<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" EnableEventValidation="false" Inherits="Client_Panel_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:HiddenField ID="hdfpartyid" runat="server" />
     <div class="content-w">
    
     


    <div class="content-i">
                    <div class="content-box">
                        <div class="row"> 
                            <div class="col-sm-12">
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

                                    <h6 class="element-header">Dashboard</h6>
                                    
                                    <div class="element-content">

                                    <div class="row">
                                        <div class="col-sm-4">
                                        <div class="element-box el-tablo bg-success text-white">
                                            <div class="label text-white" style="font-size: 0.70rem!important;"> Total Services</div>
                                            <div class="value">  <i class="fa fa-server" aria-hidden="true"></i> 
                                              <asp:label Id="lbltotalService" runat="server" text=""></asp:label>
                                            </div>
                                          <%--  <div class="trending trending-up"><span>12%</span><i class="os-icon os-icon-arrow-up2"></i></div>--%>
                                            
                                            </div>
                                        </div>


                                        <div class="col-sm-4">
                                        <div class="element-box el-tablo bg-primary text-white">
                                            
                                            <div class="label text-white" style="font-size: 0.70rem!important;">Total Invoice</div>
                                            <div class="value ">
                                         <i class="fa fa-money" aria-hidden="true"></i>  <asp:label Id="lbltotalInvoice" runat="server" text=""></asp:label>

                                            </div>
                                           <%-- <div class="trending trending-down-basic"><span>12%</span><i class="os-icon os-icon-arrow-2-down"></i></div>--%>

                                        </div>


                                        </div>
                                        <div class="col-sm-4">
                                            
                                            <div class="element-box el-tablo bg-danger text-white">
                                                <div class="label text-white" style="font-size: 0.70rem!important;">Renew Date</div>
                                                <div class="value" style="font-size:23px;">
                                                    <i class="fa fa-calendar" aria-hidden="true"></i>  <asp:label Id="lblRenewDate" runat="server" text=""></asp:label>

                                                </div>
                                                <div class="trending trending-down-basic"><span>9%</span><i class="os-icon os-icon-graph-down"></i>

                                                </div>

                                            </div>
                                        </div>
                                    </div>


                                    </div>


                                </div>
                            </div>

                        </div>
                        
                        <div class="row">
                            
                            
                            <div class="col-sm-12">
                                <div class="element-wrapper">
                                    
                                    <h6 class="element-header">Web Services</h6>
                                    
                                    <div class="element-box">
                                        
                                        <div class="table-responsive">


   <!----------Surendra-------->
                    <div class="table-responsive" style="overflow:auto;">
                        <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px" showfooter="true"  OnRowDataBound="grdView_RowDataBound"
                            EmptyDataText="Result Not Found" Width="100%" CssClass="table table-lightborder"
                            PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="true">
                          
                            
                              <Columns>
                                <asp:TemplateField HeaderText="SN" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate> 
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 

                                  
                                   <asp:TemplateField HeaderText="ServiceName" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                      <strong> <%#Eval("CategoryName")%>:</strong> <%#Eval("DomainName")%>     <%#Eval("SubCategoryN")%>
                                    </ItemTemplate>

                                              <FooterTemplate>
                                                          <strong> Total Price:-</strong> 
                                              </FooterTemplate>

                                </asp:TemplateField>


                                 <%--  <asp:TemplateField HeaderText="Service" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                       
                                    </ItemTemplate>
                                </asp:TemplateField>--%>


                               


                                   <%-- <asp:TemplateField HeaderText="Service Name" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                    
                                    </ItemTemplate>

                                           


                                </asp:TemplateField>--%>



                                   <asp:TemplateField HeaderText="PurchasePrice" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                 
                                          <span> <i class="fa fa-inr"></i></span> <asp:Label ID="lblAmt" runat="server" Text='<%#Eval("PurchasePrice") %>'></asp:Label>
                                    </ItemTemplate>

                                         <FooterTemplate>
                                                           
                                        <span> <i class="fa fa-inr"></i></span> <asp:Label ID="lblPriceP" runat="server" Text=""></asp:Label>
                                        </FooterTemplate>


                                </asp:TemplateField>


                                   <asp:TemplateField HeaderText="PurchaseDate" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("PurCahseDate","{0:dd/MM/yyyy}")%>
                                    </ItemTemplate>
                                </asp:TemplateField>  




                                   <asp:TemplateField HeaderText="RenewPrice" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <span> <i class="fa fa-inr"></i></span> <%#Eval("NextRenewPrice")%>
                                    </ItemTemplate>
                                </asp:TemplateField>       

                                
                                                              
                                  
                                  
                                    <asp:TemplateField HeaderText="RenewDate" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("NextReNewdate","{0:dd/MM/yyyy}")%>
                                    </ItemTemplate>
                                </asp:TemplateField>     
                           
                                  
                                  
                                    <asp:TemplateField HeaderText="Status" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                     <span class="status-pill green"></span>   <%#Eval("Status")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                             


                             
                            </Columns>
                        </asp:GridView>
                       
                    </div>
                    <!----------End----------->

                                            
                                            <%--<table class="table table-lightborder">                                               
                                                
                         <thead><tr><th>Customer Name</th><th>Products Ordered</th>                        
                        <th class="text-center">Status</th>
                        <th class="text-right">Order Total</th>
                        </tr>
                        </thead>
                        <tbody>
                        
                        <tr>
                            <td class="nowrap">John Mayers</td>
                            <td><div class="cell-image-list">
                                <div class="cell-img" style="background-image: url(img/portfolio9.jpg)">
                                </div>
                                <div class="cell-img" style="background-image: url(img/portfolio2.jpg)">
                                </div>
                                <div class="cell-img" style="background-image: url(img/portfolio12.jpg)">
                                </div>
                                <div class="cell-img-more">+ 5 more</div>
                                </div>
                            </td>
                            <td class="text-center">
                            <div class="status-pill green" data-title="Complete" data-toggle="tooltip">
                            </div>
                            </td>
                            <td class="text-right">$354</td>
                            </tr>
                        <tr>
                            <td class="nowrap">Kelly Brans</td>
                            <td><div class="cell-image-list">
                                <div class="cell-img" style="background-image: url(img/portfolio14.jpg)">

                                </div>
                                
                                <div class="cell-img" style="background-image: url(img/portfolio8.jpg)">

                                </div>

                                </div>

                            </td>
                            
                            <td class="text-center">
                                
                                <div class="status-pill red" data-title="Cancelled" data-toggle="tooltip">

                                </div>


                            </td>
                            <td class="text-right">$94</td></tr>
                            <tr><td class="nowrap">Tim Howard</td><td>
                                
                                <div class="cell-image-list">
                                    
                                    <div class="cell-img" style="background-image: url(img/portfolio16.jpg)">

                                    </div>
                                    <div class="cell-img" style="background-image: url(img/portfolio14.jpg)"></div><div class="cell-img" style="background-image: url(img/portfolio5.jpg)"></div></div></td><td class="text-center"><div class="status-pill green" data-title="Complete" data-toggle="tooltip"></div></td><td class="text-right">$156</td></tr><tr><td class="nowrap">Joe Trulli</td><td><div class="cell-image-list"><div class="cell-img" style="background-image: url(img/portfolio1.jpg)"></div><div class="cell-img" style="background-image: url(img/portfolio5.jpg)"></div><div class="cell-img" style="background-image: url(img/portfolio6.jpg)"></div><div class="cell-img-more">+ 2 more</div></div></td><td class="text-center"><div class="status-pill yellow" data-title="Pending" data-toggle="tooltip"></div></td><td class="text-right">$1,120</td></tr><tr><td class="nowrap">Jerry Lingard</td><td><div class="cell-image-list"><div class="cell-img" style="background-image: url(img/portfolio9.jpg)"></div></div></td><td class="text-center"><div class="status-pill green" data-title="Complete" data-toggle="tooltip"></div></td><td class="text-right">$856</td></tr></tbody></table>--%>


                                        </div>


                                    </div>

                                </div></div>
                            
                       


                        </div>
                        
                        
                  

                        <!--------------------
                        START - Chat Popup Box
                        -------------------->
                        <div class="floated-chat-btn">
                            <i class="os-icon os-icon-mail-07"></i>
                            <span>Demo Chat</span>
                        </div><div class="floated-chat-w">
                            <div class="floated-chat-i">
                                <div class="chat-close"><i class="os-icon os-icon-close"></i></div>
                                <div class="chat-head">
                                    <div class="user-w with-status status-green">
                                        <div class="user-avatar-w">
                                            <div class="user-avatar"><img alt="" src="img/avatar1.jpg"></div>
                                        </div><div class="user-name">
                                            <h6 class="user-title">John Mayers</h6><div class="user-role">
                                                Account Manager
                                            </div>
                                        </div>
                                    </div>
                                </div><div class="chat-messages">
                                    <div class="message">
                                        <div class="message-content">Hi, how can I help you?</div>
                                    </div>
                                    <div class="date-break">Mon 10:20am</div>
                                    <div class="message">
                                        <div class="message-content">Hi, my name is Mike, I will be happy to assist you</div>
                                    </div><div class="message self">
                                        <div class="message-content">Hi, I tried ordering this product and it keeps showing me error code.</div>
                                    </div>
                                </div>
                                <div class="chat-controls">
                                    <input class="message-input" placeholder="Type your message here..." type="text">
                                    <div class="chat-extra"><a href="#"><span class="extra-tooltip">Attach Document</span><i class="os-icon os-icon-documents-07"></i></a><a href="#"><span class="extra-tooltip">Insert Photo</span><i class="os-icon os-icon-others-29"></i></a><a href="#"><span class="extra-tooltip">Upload Video</span><i class="os-icon os-icon-ui-51"></i></a></div>
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
                    <div class="content-panel"><div class="content-panel-close"><i class="os-icon os-icon-close"></i></div><div class="element-wrapper"><h6 class="element-header">Quick Links</h6><div class="element-box-tp"><div class="el-buttons-list full-width"><a class="btn btn-white btn-sm" href="#"><i class="os-icon os-icon-delivery-box-2"></i><span>Create New Product</span></a><a class="btn btn-white btn-sm" href="#"><i class="os-icon os-icon-window-content"></i><span>Customer Comments</span></a><a class="btn btn-white btn-sm" href="#"><i class="os-icon os-icon-wallet-loaded"></i><span>Store Settings</span></a></div></div></div>
                        
                        <div class="element-wrapper">
                            
                            <h6 class="element-header">Hired Co-ordinator</h6>
                            <div class="element-box-tp">
                                <div class="profile-tile">
                                    <div class="profile-tile-box">
                                        
                                        <div class="pt-avatar-w">
                                        
                                        <img alt="" src="../img/avatar1.jpg">

                                        </div>
                                        <div class="pt-user-name">Mark Parson</div></div>
                                    
                                    <div class="profile-tile-meta">
                                        
                                        <ul>
                                            <li>Last Login:<strong>Online Now</strong></li>
                                            <li>Tickets:<strong>12</strong></li>
                                            <li>Response Time:<strong>2 hours</strong></li>

                                        </ul>
                                        
                                        <div class="pt-btn">
                                            
                                            <a class="btn btn-success btn-sm" href="#">Send Message</a>

                                        </div></div></div>
                                
                                <div class="profile-tile">
                                    <div class="profile-tile-box">
                                        <div class="pt-avatar-w">
                                            <img alt="" src="../img/avatar3.jpg"></div><div class="pt-user-name">John Mayers</div></div><div class="profile-tile-meta"><ul><li>Last Login:<strong>Online Now</strong></li><li>Tickets:<strong>9</strong></li><li>Response Time:<strong>3 hours</strong></li></ul><div class="pt-btn"><a class="btn btn-secondary btn-sm" href="#">Send Message</a></div></div></div></div></div>
                        
                        
                     
                
                



                </div>
                    <!--------------------
                    END - Sidebar
                    -------------------->
                </div>


         </div>
    


    <script src="../js/jquery-1.12.4.js"></script>
</asp:Content>

