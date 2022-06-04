<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AdvertisementList.aspx.cs" Inherits="Admin_AdvertisementList" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="PagingControl.ascx" TagName="PagingControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <ul class="breadcrumb"> 
        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Advertisement List</a></li>
        <%--<li class="breadcrumb-item"><span>Laptop with retina screen</span></li>--%>
    </ul>
    <!--------------------END - Breadcrumbs-------------------->
    <div class="content-panel-toggler">
        <i class="os-icon os-icon-grid-squares-22"></i><span>Sidebar</span>
    </div>
    <div class="content-i">
        <div class="content-box">
            <div class="element-wrapper">
                <h6 class="element-header">
                    Advertisement List</h6>
                <div class="element-box">
                    <h5 class="form-header">
                        Advertisement List</h5>
                    <div class="controls-above-table">
                        <div class="row">
                   
                        </div>
                    </div>
                    <!----------Surendra Goyal-------->
                    <div class="table-responsive">
                        <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px"
                            EmptyDataText="Result Not Found" Width="100%" CssClass="table table-lightborder table-bordered table-hover"
                            PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false"
                            AllowPaging="true" PageSize="10">
                            <Columns>
                                <asp:TemplateField HeaderText="S No.">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Customer">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Customer")%>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Comapny">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Comapny")%>
                                    </ItemTemplate>
                                </asp:TemplateField>                       
    

     

                          <asp:TemplateField HeaderText=" Open Date">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Add_Date", "{0:dd-MMM-yyyy}")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText=" Close Date">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Last_Date", "{0:dd-MMM-yyyy}")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                

                                <asp:TemplateField HeaderText="Company Link">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("ComLink")%>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                   <%--<asp:TemplateField HeaderText="Position">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Img_Position")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
--%>





                                
                                   <asp:TemplateField HeaderText="Advetise Image">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <img src='../AdsImage/<%#Eval("Ads_Image")%>' style="width: 100px" />
                                    </ItemTemplate>
                                </asp:TemplateField>


                                
                                    
                                 



                                <asp:TemplateField HeaderText="Edit">
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                      <asp:HiddenField ID="hdfAdsID" Value='<%#Eval("AdvertiseId")%>' runat="server" />
                                        <asp:ImageButton ID="imgbtnUpdate" runat="server" ImageAlign="Middle" OnClick="Edit"
                                            ToolTip="Update" ImageUrl="~/Admin/img/pensil.png" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Delete">
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle" OnClick="Edit"
                                            ToolTip="Delete" ImageUrl="~/Admin/img/Delete_Record.png" />
                                        <asp:ConfirmButtonExtender ID="imgbtnactive_ConfirmButtonExtenderDelete" runat="server"
                                            TargetControlID="imgbtnDelete" ConfirmText="Are you sure you want to delete this record ?">
                                        </asp:ConfirmButtonExtender>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <div style="text-align: center;">
                            <uc1:PagingControl ID="CustPager" OnPageChanged="CustPager_PageChanged" runat="server" />
                        </div>
                    </div>
                    <!----------End----------->
                </div>
            </div>
            
            
            
        </div>
        <!--------------------START - Sidebar-------------------->
        
        <!--------------------END - Sidebar-------------------->
    </div>

</asp:Content>

