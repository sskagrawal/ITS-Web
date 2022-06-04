<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Resume-List.aspx.cs" Inherits="Client_Panel_Resume_List" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%--<%@ Register src="../PagingControl.ascx" tagname="PagingControl" tagprefix="uc1" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <asp:HiddenField ID="hdfUserID" runat="server" />

       <div class="content-w">
     <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Resume List</a></li>
    </ul>
    <!--------------------END - Breadcrumbs-------------------->
    <div class="content-panel-toggler">
        <i class="os-icon os-icon-grid-squares-22"></i><span>Sidebar</span>
    </div>
    <div class="content-i">
        <div class="content-box">
            <div class="element-wrapper">
              
                <div class="element-box">
                  
                    <h5 class="form-header" id="topheading">
                        Resume List</h5>
                   
                    <!----------kishan-------->
                    <div class="table-responsive">
                        <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px" OnRowDataBound="grdView_RowDataBound"
                            EmptyDataText="Result Not Found" Width="100%" CssClass="table table-lightborder table-bordered table-hover"
                            PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false"
                             AllowPaging="true" PageSize="10">
                          
                             <AlternatingRowStyle BackColor="#F7F7F7"/>
                              <Columns>
                                <asp:TemplateField HeaderText="SNo.">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="job Apply for">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("job_Title")%>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Experience">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Exp")%>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Job Type">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("JobType")%>
                                    </ItemTemplate>
                                </asp:TemplateField>



                                    <asp:TemplateField HeaderText="Salary">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Salary")%>
                                    </ItemTemplate>
                                </asp:TemplateField>                               
                                  


                                <asp:TemplateField HeaderText="Qulalification">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>                                       
                                        <asp:Label ID="lbljob_Qulalification" runat="server" Text='<%#Eval("job_Qulalification")%>'></asp:Label> <br />
                                      <%#Eval("OtherEducation")%>
                                    
                                    </ItemTemplate>
                                </asp:TemplateField>


                               <%--  <asp:TemplateField HeaderText="OtherEducation">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("OtherEducation")%>
                                    </ItemTemplate>
                                </asp:TemplateField>   --%>                      


                                   <%--  <asp:TemplateField HeaderText="job Desc.">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("job_Desc")%>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>



                                    <asp:TemplateField HeaderText="City">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("CityID")%> <br />
                                          <%#Eval("StateID")%> 
                                    </ItemTemplate>
                                </asp:TemplateField>


                                <%--   <asp:TemplateField HeaderText="State">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                      
                                    </ItemTemplate>
                                </asp:TemplateField>--%>


                                    <asp:TemplateField HeaderText="ApplyDate">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("CreatedOn", "{0:dd-MMM-yyyy}")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                           
                               
                                          <asp:TemplateField HeaderText="Resume">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                    

                                        <asp:Literal ID="ltrCV" runat="server"></asp:Literal>
                                       
                                           <asp:HiddenField ID="hdfID" Value='<%#Eval("UserID")%>' runat="server" />
                                    

                                    </ItemTemplate>
                                </asp:TemplateField>

                               
                                  


                                <%--  <asp:TemplateField HeaderText="Resume">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>                                   
                                        <a href="../../CV/<%#Eval("CvName")%>" target="_blank">Download</a>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                               
                               
                             


                            </Columns>

                            <FooterStyle BackColor="#B5C7DE" ForeColor="#2cabe3" />
                                            <HeaderStyle BackColor="#2cabe3" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <PagerSettings Visible="False"></PagerSettings>
                                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                            <SelectedRowStyle BackColor="#738A9C"  ForeColor="#F7F7F7" />
                                            <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                            <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                            <SortedDescendingHeaderStyle BackColor="#3E3277" /> 



                        </asp:GridView>
                      <%--  <div style="text-align: center;">                        
                            <uc1:PagingControl  ID="CustPager" OnPageChanged="CustPager_PageChanged" runat="server" />
                        </div>--%>
                    </div>
                    <!----------End----------->
                </div>
            </div>
            
            
            
        </div>
        <!--------------------START - Sidebar-------------------->
        
        <!--------------------END - Sidebar-------------------->
    </div>
           </div>
      <script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

