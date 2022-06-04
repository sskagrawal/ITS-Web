<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Proposal_List.aspx.cs" Inherits="Client_Panel_Proposal_List" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hdfUserID" runat="server"></asp:HiddenField>
     <asp:HiddenField ID="hdfjobid" runat="server"></asp:HiddenField>
   

     <div class="content-i">
        <div class="content-box">
            <div class="element-wrapper">
                <h6 class="element-header"> Job Proposal  List</h6>
                <div class="element-box">
                    
                    <h5 class="form-header"> Job Proposal  List</h5>                  
                    
                    <div class="controls-above-table">
                        <div class="row">                        

                            <div class="col-sm-12">
                             <div id="alert" runat="server" visible="false" class="alert alert-success">
                                <asp:Label ID="lblMSG" runat="server" Text=""></asp:Label>
                            </div>

                                </div>

                        </div>


                    </div>
                    
                    <div class="table-responsive">           
                

                        <asp:GridView ID="gvProposlList" runat="server" AutoGenerateColumns="false" Font-Size="12px" OnRowDataBound="gvProposlList_RowDataBound" EmptyDataText="Result Not Found" Width="100%" CssClass="table table-lightborder table-bordered table-hover"
                            PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="true">
                          
                            
                              <Columns>
                                <asp:TemplateField HeaderText="Sn" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate> 
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 

                                
                                  
                                   <asp:TemplateField HeaderText="Job_Title" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("job_Title")%>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                  
                                   <asp:TemplateField HeaderText="ApplicantName" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Contact_person_name")%>
                                    </ItemTemplate>
                                </asp:TemplateField>


                             
                              
                                    <asp:TemplateField HeaderText="Proposal Description" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <asp:HiddenField ID="hdfProposalDesc" Value='<%#Eval("Proposal_Desc")%>' runat="server" />
                                        <asp:Label ID="lblJobProposal" runat="server" Text='<%#Eval("Proposal_Desc")%>' ></asp:Label>
                                   
                                    </ItemTemplate>
                                </asp:TemplateField>
     
                             <asp:TemplateField HeaderText="Proposal_Price" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Time_Unit")%> : <%#Eval("Price")%> <br />
                                       <%-- <span>Advane:</span> --%>
                                        <asp:Literal ID="ltrDepReq" runat="server"></asp:Literal>
                                        <asp:Label ID="lblDepostReq" runat="server" Text='<%#Eval("DepositRequired")%>'></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>



                                    <asp:TemplateField HeaderText="ProposalDate" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                       
                                           <%#Eval("CreatedOn","{0:dd/MM/yyyy}")%>
                                    </ItemTemplate>
                                </asp:TemplateField>     
                                  
                                  

                                   <asp:TemplateField HeaderText="Status" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>


                                     

                       <%-- <ul class="nav nav-pills smaller hidden-sm-down">                    
                          
                        <li class="nav-item">
                            <a class="nav-link active" style="text-decoration:none;">
                            <asp:Label ID="lblStatus"  runat="server" Text='<%#Eval("Status")%>' ></asp:Label></a>

                        </li>

                        </ul>--%>

                                         <%--<div class="value-pair">                                                   
                                                    <div class="value badge badge-pill badge-success">
                                                   

                                                    </div>
                                                </div>--%>
                                        <asp:Literal ID="ltrStatus" runat="server"></asp:Literal>
                                        <asp:HiddenField ID="hdfStatus" Value='<%#Eval("Status")%>' runat="server" />
                                      
                                       

                                    </ItemTemplate>
                                </asp:TemplateField>
                                  
                                                                     



         <asp:TemplateField HeaderText="View" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
           <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>                   
                         
                         <asp:HiddenField ID="hdfProposalid" runat="server" Value ='<%#Eval("Proposal_Id")%>' />                 
                                                 <asp:HiddenField ID="hdfJobID" runat="server" Value ='<%#Eval("job_Id")%>' /> 
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                         <asp:Literal ID="ltrlWrkStream" runat="server"></asp:Literal>
                        <%--<asp:ImageButton ID="imgbtnView" runat="server" ImageAlign="Middle" OnClick="Edit_Click"      ToolTip="View" ImageUrl="../img/preview.png" />--%>
                <%--   <asp:ImageButton ID="imgbtnEdit" runat="server" ImageAlign="Middle" OnClick="Edit_Click"      ToolTip="Edit" ImageUrl="../img/icon_edit.gif" />--%>

                 </ItemTemplate>         
          </asp:TemplateField> 

   
                             
           <%-- <asp:TemplateField HeaderText="Delete" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
              <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />                
                 <ItemTemplate>   
                               
                                    
            
                

                      <asp:ImageButton ID="ImgbtnDelete" runat="server" ImageAlign="Middle" OnClientClick="return confirm('Are you sure to delete this record')" OnClick="Edit_Click"
                                                    ToolTip="Delete" ImageUrl="../img/icon_delete.gif" />
                     <asp:Label ID="lblsg" runat="server" Text=""></asp:Label>
                 </ItemTemplate>                                        
          </asp:TemplateField>--%>

                             
                            </Columns>
                        </asp:GridView>



                    </div></div></div>
            
            
          
    
    
   
    
    
    
</div></div>
 
   <script src="../../js/jquery-1.12.4.js" type="text/javascript"></script>

</asp:Content>

