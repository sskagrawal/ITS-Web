<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="post-joblist.aspx.cs" Inherits="PostJobList" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <asp:HiddenField ID="hdfUserID" runat="server"> </asp:HiddenField>
  <asp:HiddenField ID="hdfPostID" runat="server"> </asp:HiddenField>
                <header class="rich-header page-header version1" data-parallax="true" id="header_d901_0">
                    <div class="parallax-container" id="div_d901_0">&nbsp;</div>

                    <div class="container nz-clearfix">
                        <div class="rh-content">

                            <h1>Post Job</h1>

                            <div class="rh-separator">&nbsp;</div>
                            <div id="div_d901_1" class="nz-breadcrumbs nz-clearfix"><a href="default.aspx"  property="v:title">Home</a><span class="current">Post Job</span></div>
                        </div>
                    </div>
                    <div id="slider-arrow" data-target="#nz-target" data-from="90" data-offset="90" class="i-separator animate nz-clearfix"><i class="icon-arrow-down10"></i></div>
                </header>

                <div class="blog-layout-wrap standard sidebar-true" id="nz-target">

                    <div id="loop" class="loop">
                        <div class="container nz-clearfix">

                            <section class="main-content left">
                                <section class="content lazy blog-layout nz-clearfix">
                                    <div class="blog-post blog-post-1 nz-clearfix">
                                    <div class="column-12" style="text-align:center;">

                                    <div class="col-inner">
                                                    <h3 id="h3_01b4_1" class="vc_custom_heading ninzio-latter-spacing">Post Job</h3>
                                                    <div class="sep-wrap element-animate element-animate-false center nz-clearfix" data-effect="none">
                                                        <div class="nz-separator solid" id="div_01b4_21">&nbsp;</div>
                                                    </div>
                                                   
                                                </div>
                                
                                   <br />
                                   <div id="alert" runat="server" visible="false" class="alert success">
                                                       
<asp:Label ID="lblMSG" runat="server" Text=""></asp:Label>
                                                        <span class="close-alert">X</span>
                                                        </div>

                                                        <script type="text/javascript">
                                                            function HideLabel() {
                                                                var seconds = 5;
                                                                setTimeout(function () {
                                                                    document.getElementById("<%=alert.ClientID %>").style.display = "none";
                                                                }, seconds * 1000);
                                                            };
</script>  
<div class="table-responsive">
<asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px" EmptyDataText="Result Not Found" Width="100%" CssClass="table table-lightborder table-bordered table-hover" PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false" AllowPaging="true" PageSize="10">
                                    <Columns>
                                     
                                       
                                        <asp:TemplateField HeaderText="SrNo.">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>                                            
                                            </ItemTemplate>
                                        </asp:TemplateField>



                                        <%--  <asp:TemplateField HeaderText="JobImage">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                           <img src='../News_Image/<%#Eval("job_Image")%>'  style="width:100px"/>
                                            
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>



                                     
   
    
    
    
    
      



                                           <asp:TemplateField HeaderText="Job Title">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                             <%#Eval("job_Title")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>    
                                        
                                                                  
                                           
                                           <asp:TemplateField HeaderText="Description">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                            <%#Eval("job_Desc")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                          <asp:TemplateField HeaderText="Qualification">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                            <%#Eval("job_Qulalification")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>




                                     
                                           <asp:TemplateField HeaderText=" Open Date">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>                                        

                                                <%#Eval("jobopen_Date", "{0:dd-MMM-yyyy}")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                           <asp:TemplateField HeaderText=" Close Date">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>                                        

                                                <%#Eval("jobClose_Date", "{0:dd-MMM-yyyy}")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                         <%--<asp:TemplateField HeaderText="job Fees">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                            <%#Eval("job_Fees")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                     <asp:TemplateField HeaderText="web Link">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                            <%#Eval("job_weblink")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        
                                         <asp:TemplateField HeaderText="Edit">
                                            <HeaderStyle />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>

    
                                             <asp:HiddenField ID="hdfID" Value='<%#Eval("job_Id")%>' runat="server" />
                                           <asp:LinkButton runat="server" ID="lnkEdit" OnClick="Edit_click" ><span class="fa fa-pencil"></span></asp:LinkButton>
<%--<asp:ImageButton ID="imgbtnUpdate" runat="server" ImageAlign="Middle" OnClick="Edit" ToolTip="Edit" ImageUrl="~/Admin/img/pensil.png" /> --%>                                            
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                           <asp:TemplateField HeaderText="Delete">
                                            <HeaderStyle />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                       <%--         <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle" OnClick="Edit"
                                                    ToolTip="Delete" ImageUrl="~/Admin/img/Delete_Record.png" />--%>
                                                <asp:LinkButton runat="server" ID="imgbtnDelete" OnClick="Edit_click" ><span class="fa fa-trash"></span></asp:LinkButton>
                                                <asp:ConfirmButtonExtender ID="imgbtnactive_ConfirmButtonExtenderDelete" runat="server" TargetControlID="imgbtnDelete"   ConfirmText="Are you sure you want to delete this record ?">
                                              
                                                </asp:ConfirmButtonExtender>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
</div>


                                      

                                        
                                    </div>
                                </section>
                                
                            </section>
                            <aside class="sidebar">
                                <aside class='blog-widget-area widget-area'>

                                   
                                          <div id="tag_cloud-2" class="widget widget_tag_cloud">
                                        <h6 class="widget_title">Shortcut</h6>
                                        <div class="tagcloud">

                                            <%--<a runat="server" href="~/FindJob.aspx" class='tag-link-108 tag-link-position-1' title='Find Job' id="a_f795_0">Find Job</a>--%>
                                              <a runat="server" href="~/find-resumes.aspx" class='tag-link-108 tag-link-position-1' title='Find Job' id="a1">Find Resumes</a>
                                              <a runat="server" href="~/Employer/job-post.aspx" class='tag-link-108 tag-link-position-1' title='Find Job' id="a2">Post Job</a>
                                              <a runat="server" href="~/Employer/post-joblist.aspx" class='tag-link-108 tag-link-position-1' title='Find Job' id="a3">Post Job List</a>
                                              <a runat="server" href="~/Employer/my-profile.aspx" class='tag-link-108 tag-link-position-1' title='Find Job' id="a4">Profile</a>
                                              <a runat="server" href="~/change-password.aspx" class='tag-link-108 tag-link-position-1' title='Find Job' id="a5">Change Password</a>
                                         
                                           </div>
                                    </div>
                                </aside>
                            </aside>

                        </div>
                    </div>

                </div>

 
</asp:Content>

