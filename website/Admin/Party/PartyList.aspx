<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="PartyList.aspx.cs" Inherits="Admin_Party_PartyList" EnableEventValidation="false"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<%@ Register src="../PagingControl.ascx" tagname="PagingControl" tagprefix="uc1" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<%--<style type="text/css">
      #topheading {
             border:2px solid #B2AEE2;
             text-align:center;
             padding:15px;
             border-radius:30px;
             color:#fff;
             background-color:#B2AEE2;
             width:50%;margin:auto;
             font-family:'Satisfy', cursive;
             margin-bottom:10px;
        }
</style>--%>

    <script type="text/javascript">
    $(document).ready(function() {
        $('#grdView').width($('#grdView').width());
    });
</script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Party List</a></li>
    </ul>
    <!--------------------END - Breadcrumbs-------------------->
    <div class="content-panel-toggler">
        <i class="os-icon os-icon-grid-squares-22"></i><span>Sidebar</span>
    </div>
    <div class="content-i">
        <div class="content-box">
            <div class="element-wrapper">
               <%-- <h6 class="element-header">
                    Party List</h6>--%>
                <div class="element-box">
                    <asp:HiddenField ID="Hdfparty" runat="server" />
                    <asp:HiddenField ID="hdfmsgCode" runat="server" />
                    <asp:HiddenField ID="Hdfpartyname" runat="server" />
                           
                                            <div>
                                                <asp:Button ID="Button1" onclick="btn_back" runat="server" style="border-radius: 16px;float:right;" class="btn btn-primary" 
                                                    Text="Back" />
                                            </div>
                                           
                    <h5 class="form-header" id="topheading">
                        Registered Party List</h5>
                    <div class="controls-above-table">
                        <div class="row"  style="border:1px solid grey;padding:20px;border-radius:20px;">

                            <div class="col-lg-2">
                                       

                                            <div class="form-group">
                                                <label>Party Type</label>
                            
                                <asp:DropDownList data-placeholder="Choose Party Type" runat="server" ID="DrdpartyType" class="form-control">
                                    
                                </asp:DropDownList>

                                 </div>
                                         
                                    </div>

                             <div class="col-lg-3">
                                       
                                            <div class="form-group" >
                                                <label>Search Type</label>
                            
                                <asp:DropDownList data-placeholder="Choose Party Type" runat="server" ID="ddlPartysearch" class="form-control">
                                    <asp:ListItem Value="0">Select Search Type</asp:ListItem>
                                    <asp:ListItem Value="1">Party Name</asp:ListItem>
                                     <asp:ListItem Value="2">Email</asp:ListItem>
                                     <asp:ListItem Value="3">Mobile-no</asp:ListItem>
                                     <asp:ListItem Value="4">Contact Person</asp:ListItem>
                                
                                </asp:DropDownList>
                                                </div>
                                         
                                    </div>


                           


                           

                            <div class="col-lg-2">
                                        <div class="form-group">
                                            <label for="">
                                                Search
                                            </label>
                                          
                                            <asp:TextBox ID="txtsearch" placeholder="Search" runat="server" CssClass="form-control"></asp:TextBox>

                                        </div></div>


                         


                              <div class="col-lg-2">
                                       
                                            <div class="form-group" >
                                                <label>Status</label>
                            
                                <asp:DropDownList data-placeholder="Choose Status" runat="server" ID="drdStatus" class="form-control" OnSelectedIndexChanged="drdStatus_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="-1">Select Status </asp:ListItem>
                                    <asp:ListItem Value="1" style="color:green;"> Active</asp:ListItem>
                                     <asp:ListItem Value="0" style="color: Red;">InActive</asp:ListItem>
                                    
                                 
                                
                                </asp:DropDownList>
                                                </div>
                                         
                                    </div>




                            <div class="col-lg-3">       
                                            <div class="form-group">
                                                <asp:Button ID="btnbtnSave" OnClick="btnbtnSave_Click" runat="server" style="margin-top: 31px;border-radius: 30px;" class="btn btn-primary"
                                                    Text="Search" />&nbsp;
                                                  <asp:Button ID="btnReset" OnClick="btnReset_Click" runat="server" style="margin-top: 31px;border-radius: 30px;" class="btn btn-danger"
                                                    Text="Reset" />
                                            </div>
                                           </div>

                        </div>
                    </div>


                      <div style="text-align:right">
                                <div class="btn-group">
                                    <button type="button" style="font-size:15px" class="btn btn-primary btn-xs dropdown-toggle" data-toggle="dropdown">
                                         <i class="fa fa-print fa-fw"></i>Print
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li>
                                            <asp:LinkButton ID="lnkExcel" runat="server" OnClick="ExportToExcel">Export to Excel</asp:LinkButton>
                                        
                                        </li>
                                       
                                    </ul>
                                </div>
                            </div>




                    <!----------kishan-------->

                    <div class="table-responsive">
                        <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px"
                            EmptyDataText="Result Not Found" Width="100%" CssClass="table table-lightborder table-bordered table-hover"
                            PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false"
                            OnRowDataBound="grideViewCatogry_RowDataBound" AllowPaging="true" PageSize="10">
                          
                             <AlternatingRowStyle BackColor="#F7F7F7"/>
                              <Columns>
                                <asp:TemplateField HeaderText="SNo.">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                   <asp:TemplateField HeaderText="Invoice">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                       <asp:LinkButton ID="linkVouvher" runat="server"  class="fa fa-plus" OnClick="linkVouvher_Click">Add</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                   

                                   <asp:TemplateField HeaderText="Service">
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnArrow2" runat="server" Visible="false" ImageAlign="Middle"  OnClick="Edit"
                                            ToolTip="Go" ImageUrl="~/Admin/img/arrow.png" />

                                         <asp:ImageButton ID="imgbtnAdd" runat="server" Visible="false" ImageAlign="Middle"  OnClick="Edit"
                                            ToolTip="Go" ImageUrl="~/Admin/img/add2.png" />

                                        <asp:LinkButton ID="LinkButton1" runat="server" Visible="false" class="fa fa-plus" OnClick="LinkButton1_Click">Add</asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton2" runat="server" Visible="false" class="fa fa-eye" OnClick="LinkButton1_Click">View</asp:LinkButton>

                                         <asp:ImageButton ID="imgbtnArrow" runat="server" Visible="false" ImageAlign="Middle"  OnClick="Edit"
                                            ToolTip="Go" ImageUrl="~/Admin/img/view.png" />
                                        
                                        
                                    </ItemTemplate>
                                    
                                </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Action">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                    <asp:HiddenField ID="hdfIsActive" runat="server" Value='<%#Eval("Is_active")%>' />
                                                <asp:ImageButton ID="imgbtnActive" runat="server" ImageAlign="Middle" OnClick="imgbtnActive_Click"
                                                    ToolTip="Active"/>


                                                  <asp:ImageButton ID="imgbtnUpdate" runat="server" ImageAlign="Middle" OnClick="Edit"
                                            ToolTip="Update" ImageUrl="~/Admin/img/pensil.png" />


                                                 <asp:ImageButton ID="imgbtnDelete" runat="server"  ImageAlign="Middle" OnClick="Edit"
                                            ToolTip="Delete" ImageUrl="~/Admin/img/Delete_Record.png" />

                                        <%--<asp:ConfirmButtonExtender ID="imgbtnactive_ConfirmButtonExtenderDelete" runat="server"
                                            TargetControlID="imgbtnDelete" ConfirmText="Are you sure you want to delete this record ?">
                                        </asp:ConfirmButtonExtender>--%>


                                         <div class="form-group input-group">

                                        <asp:TextBox ID="TxtdeleteCode" runat="server" visible="false" style="width:70px;height:35px;" ></asp:TextBox>
                                       
                                                <asp:Button ID="btndelete"  onclick="btndelete_Click" visible="false" runat="server" style="background-color:#047BF8;color:white;" class="btn-primary input-group-addon"
                                                    Text="Del" />
                                            </div>

                                            </ItemTemplate>
                                        </asp:TemplateField>




                              <%--   <asp:TemplateField HeaderText="Party Type">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("UserTypeName")%>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>

                                <asp:TemplateField HeaderText="PartyName">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                       
                                        <asp:Label ID="Lblpartyname" runat="server" Text='<%#Eval("Party_name")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                 <asp:TemplateField HeaderText="ContactDetail">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Contact_person_name")%><br />
                                          <%#Eval("mobile_no")%> <br />    
                                           <%#Eval("Email")%>

                                    </ItemTemplate>
                                </asp:TemplateField>


                                     <asp:TemplateField HeaderText="UserType Name">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>

                                          <%#Eval("UserTypeName")%>
                                   
                                    </ItemTemplate>
                                </asp:TemplateField>



                              <%--   <asp:TemplateField HeaderText="Email-ID">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Email")%>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>


                                     <asp:TemplateField HeaderText="Login Detail">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                      <%#Eval("mobile_no")%> <br />                                     
                                       <span class="txt text-primary">Pass:</span>  <asp:Label ID="lblPswd" runat="server" Text=" "></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>                     
                               
                               
                                <asp:TemplateField HeaderText="Reg-Date">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Createon","{0:dd/MM/yyyy}")%>
                                        <asp:HiddenField ID="hdfID" Value='<%#Eval("PartyID")%>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>

<%-- new field--%>
                                     <asp:TemplateField HeaderText="Address">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                          <%#Eval("City")%> <br />
                                        <%#Eval("address")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
    
     <%-- <asp:TemplateField HeaderText="PAN No.">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                          <%#Eval("pancardno")%>                                       
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
     
    
      <asp:TemplateField HeaderText="Bank Name">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                          <%#Eval("Bank_Name")%> <br />
                                       <%#Eval("BranceName")%> <br />
                                     <%#Eval("IFSCCoad")%> 
                                    </ItemTemplate>
                                </asp:TemplateField>


                                     <asp:TemplateField HeaderText="Account Info">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                         <%#Eval("AccountHname")%> <br />
                                          <%#Eval("AccountNo")%> 
                                      
                                   
                                    </ItemTemplate>
                                </asp:TemplateField>
  
    
                                  
     
                            <asp:TemplateField HeaderText="GST No">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                          <%#Eval("Gst_no")%>                                   
                                 
                                    </ItemTemplate>
                                </asp:TemplateField>
    
     
    
                                <%--<asp:TemplateField HeaderText="Edit">
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnUpdate" runat="server" ImageAlign="Middle" OnClick="Edit"
                                            ToolTip="Update" ImageUrl="~/Admin/img/pensil.png" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                --%>
                              



                               <%-- <asp:TemplateField HeaderText="Delete">
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnDelete" runat="server"  ImageAlign="Middle" OnClick="Edit"
                                            ToolTip="Delete" ImageUrl="~/Admin/img/Delete_Record.png" />

                                        <asp:ConfirmButtonExtender ID="imgbtnactive_ConfirmButtonExtenderDelete" runat="server"
                                            TargetControlID="imgbtnDelete" ConfirmText="Are you sure you want to delete this record ?">
                                        </asp:ConfirmButtonExtender>
                                         <div class="form-group input-group">

                                        <asp:TextBox ID="TxtdeleteCode" runat="server" visible="false" style="width:70px;height:35px;" ></asp:TextBox>
                                       
                                                <asp:Button ID="btndelete"  onclick="btndelete_Click" visible="false" runat="server" style="background-color:#047BF8;color:white;" class="btn-primary input-group-addon"
                                                    Text="Del" />
                                            </div>
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
                        <div style="text-align: center;">
                            <%--<uc1:pagingcontrol ID="CustPager" OnPageChanged="CustPager_PageChanged" runat="server" />--%>
                            <uc1:PagingControl  ID="CustPager" OnPageChanged="CustPager_PageChanged" runat="server" />
                        </div>
                    </div>
                    <!----------End----------->
                </div>
            </div>
            
            
            
        </div>
        <!--------------------START - Sidebar-------------------->
        
        <!--------------------END - Sidebar-------------------->
    </div><script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

