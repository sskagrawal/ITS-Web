<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Co-ordinator_List.aspx.cs" Inherits="Admin_Co_ordinator_List"  enableEventValidation="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="PagingControl.ascx" TagName="PagingControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hdfpartyId" runat="server" />

      <div class="content-w">
                <!--------------------
START - Breadcrumbs
-------------------->
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                       <li class="breadcrumb-item"><a href="index.html">Admin</a></li>
                        <li class="breadcrumb-item"><span>Co- Ordinator List</span></li>

                    </ul>
                <!--------------------
END - Breadcrumbs
-------------------->
                <div class="content-i">
                    <div class="content-box">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="element-wrapper">

                                 <%--   <h6 class="element-header">
                                        Default Form Layout</h6>--%>

                                    <div class="element-box">               



                                      
                                        <h5 class="form-header">
                                            Co-Ordinator List</h5>

                                         <div class="col-sm-12">
            <div class="text-right">
          <a href="Co-ordinator.aspx"  class="btn btn-success">Add Co-Ordinator</a>

           </div>
               </div>

                                      

                                        <div class="table-responsive">      

      <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px" EmptyDataText="Result Not Found" Width="100%" CssClass="table table-hover table-bordered table-condensed" PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false" AllowPaging="true" PageSize="10" OnRowDataBound="grdView_RowDataBound" >
                                   
     <Columns>
                                     
                                       
                                        <asp:TemplateField HeaderText="SN." HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>                                            
                                            </ItemTemplate>
                                        </asp:TemplateField>



                                <asp:TemplateField HeaderText="Co-Ordi.Photo" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                               <ItemTemplate>
                             
                             <%--   <asp:HiddenField ID="hdfCoPhotoImg" Value='<%#Eval("CoPhoto")%>' runat="server"></asp:HiddenField>--%>
                                   <asp:Literal ID="ltrPhoto" runat="server"></asp:Literal>
          
                               </ItemTemplate>
                                </asp:TemplateField>

        




                                          <asp:TemplateField HeaderText="Co-Ordinator" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                             <%#Eval("Contact_person_name")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                     <asp:TemplateField HeaderText="Mobile" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                             <%#Eval("mobile_no")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                               <asp:TemplateField HeaderText="Email" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                             <%#Eval("Email")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Login Detail" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>

                                                <asp:Label ID="lblUserName" ForeColor="IndianRed" runat="server" Text=""></asp:Label> <br />
                                                <asp:Label ID="lblPassword" ForeColor="IndianRed" runat="server" Text=""></asp:Label>
                                                
                                  



                                            </ItemTemplate>
                                        </asp:TemplateField>

                                   <asp:TemplateField HeaderText="Reg.Date" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                            
                                                   <%#Eval("Createon", "{0:dd-MM-yyyy}")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>                                


                                        <%--  <asp:TemplateField HeaderText="Edit" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                            <HeaderStyle />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                                                                
                                                <asp:ImageButton ID="imgbtnUpdate" runat="server" ImageAlign="Middle" OnClick="Edit" ToolTip="Update" ImageUrl="../img/icon_edit.gif" />
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>


                                           <asp:TemplateField HeaderText="Delete" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                            <HeaderStyle />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                 <asp:HiddenField ID="hdfparty_id" Value='<%#Eval("PartyID")%>' runat="server" />    
                                               <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle" OnClick="Edit"
                                                    ToolTip="Delete" ImageUrl="../img/icon_delete.gif" />
                                            
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                 <uc1:PagingControl  ID="CustPager" OnPageChanged="CustPager_PageChanged" runat="server" />


</div>


                                </div>
                            </div>
                            
                        </div>
                        

                    </div>
                </div>
            </div>
          </div>
    <script src="../../js/jquery-1.12.4.js"></script>




</asp:Content>

