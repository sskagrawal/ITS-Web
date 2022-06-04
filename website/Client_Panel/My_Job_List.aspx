<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="My_Job_List.aspx.cs" Inherits="Client_Panel_My_Job_List" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:HiddenField ID="hdfUserID" runat="server"></asp:HiddenField>
     <asp:HiddenField ID="hdfjobid" runat="server"></asp:HiddenField>


     <div class="content-i">
        <div class="content-box">
            <div class="element-wrapper">
                <h6 class="element-header">My Job List</h6>
                <div class="element-box">
                    
                    <h5 class="form-header">My Job List</h5>                  

                    
                    <div class="controls-above-table">
                        <div class="row">                        

                            <div class="col-sm-12">
                             <div id="alert" runat="server" visible="false" class="alert alert-success">
                                <asp:Label ID="lblMSG" runat="server" Text=""></asp:Label>
                            </div>

                                </div>

                        </div>


                    </div>
                    
                    <div class="table-responsive" style="overflow-x:auto;width:100%">           
                

                        <asp:GridView ID="gvMyJobList" runat="server" AutoGenerateColumns="false" Font-Size="12px" OnRowDataBound="gvMyJobList_RowDataBound"
                            EmptyDataText="Result Not Found" Width="100%" CssClass="table table-lightborder table-bordered table-hover"
                            PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="true">
                          
                            
                              <Columns>
                                <asp:TemplateField HeaderText="Sn" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate> 
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 

                                
                                  
                                   <asp:TemplateField HeaderText="Category" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Industry")%>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                  
                                   <asp:TemplateField HeaderText="SubCategory" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("JobSubCateName")%>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                      
                           
                                                               


                                    <asp:TemplateField HeaderText="JobTitle" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("job_Title")%>

                                    </ItemTemplate>
                                </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Post/Date " HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        Possition: <%#Eval("Position")%> <br />
                                           <%#Eval("CreatedOn","{0:dd/MM/yyyy}")%>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                   <asp:TemplateField HeaderText="Experience" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Exp")%>
                                    </ItemTemplate>
                                </asp:TemplateField>


                               

                                   <asp:TemplateField HeaderText="JobType" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("JobType")%>
                                    </ItemTemplate>
                                </asp:TemplateField>               


                                 
                                    <asp:TemplateField HeaderText="Budget" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                       <i class="fa fa-inr"></i> <%#Eval("MimiSalery")%> -  <%#Eval("MaxiMum")%> 
                                    </ItemTemplate>
                                </asp:TemplateField>
                                  

                                  <asp:TemplateField HeaderText="Duration/Quali." HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Time_Duration")%> <%#Eval("Time_Unit")%> <br />
                                           (<%#Eval("job_Qulalification")%>)

                                    </ItemTemplate>
                                </asp:TemplateField>

                                <%--   <asp:TemplateField HeaderText="Qualification" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("job_Qulalification")%>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>


                                    <asp:TemplateField HeaderText="Skills" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>                                    
                                        <asp:Label ID="lblSkill" runat="server" Text=""></asp:Label>
                                        <asp:Literal ID="ltrskill" runat="server"></asp:Literal>
                                    </ItemTemplate>
                                </asp:TemplateField>                                 

 <asp:TemplateField HeaderText="Proposals" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
           <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>                                    
               
                        <asp:Literal ID="ltrlProposals" runat="server"></asp:Literal>
                 </ItemTemplate>         
          </asp:TemplateField> 

         <asp:TemplateField HeaderText="Edit" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
           <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>                                    
               
                   <asp:ImageButton ID="imgbtnEdit" runat="server" ImageAlign="Middle" OnClick="Edit_Click"      ToolTip="Edit" ImageUrl="../img/icon_edit.gif" />

                 </ItemTemplate>         
          </asp:TemplateField> 

   
                             
            <asp:TemplateField HeaderText="Delete" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
              <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />                
                 <ItemTemplate>   
                               
                  <asp:HiddenField ID="hdfjobid" runat="server" Value ='<%#Eval("job_Id")%>' />                   
            
                

                      <asp:ImageButton ID="ImgbtnDelete" runat="server" ImageAlign="Middle" OnClientClick="return confirm('Are you sure to delete this record')" OnClick="Edit_Click"
                                                    ToolTip="Delete" ImageUrl="../img/icon_delete.gif" />
                     <asp:Label ID="lblsg" runat="server" Text=""></asp:Label>
                 </ItemTemplate>                                        
          </asp:TemplateField>

                             
                            </Columns>
                        </asp:GridView>



                    </div></div></div>
            
            
          
    
    
   
    
    
    
</div></div>
 
   <script src="../../js/jquery-1.12.4.js" type="text/javascript"></script>

</asp:Content>

