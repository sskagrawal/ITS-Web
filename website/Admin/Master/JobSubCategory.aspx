<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="JobSubCategory.aspx.cs" Inherits="Admin_Master_JobSubCategory" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register src="../PagingControl.ascx" tagname="PagingControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <asp:HiddenField ID="hdfID" runat="server" />

  <!--------------------START - Breadcrumbs-------------------->
  <ul class="breadcrumb">
  <li class="breadcrumb-item"><a href="#">Home</a></li>
  <li class="breadcrumb-item"><a href="#">Add Job Sub Category</a></li>
  </ul>
  <!--------------------END - Breadcrumbs-------------------->
  <div class="content-i">
  <div class="content-box">
  <div class="row">
  
  <div class="col-lg-12">
  <div class="element-wrapper">
  <h6 class="element-header">Add Update Job Sub Category</h6>
  <div class="element-box">

  <h5 class="form-header">Add Update Job Sub Category</h5>
 <%-- <div class="form-desc">Discharge best employed your phase each the of shine. Be met even reason consider logbook redesigns. Never a turned interfaces among asking</div>--%>
  <div class="alert alert-success alert-dismissible fade show" visible="false" runat="server" ID="alert">
 <button aria-label="Close" class="close" data-dismiss="alert" type="button">
 <span aria-hidden="true"> ×</span>
 </button>
     <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
 </div>
  




      <div class="form-group row">
           <div class="col-sm-12">
            <div class="text-right">
          <a href="Add_Skill.aspx"  class="btn btn-success">Go To Skill Page</a>

           </div>
               </div>
          

  <label class="col-form-label col-sm-2" for="">Select Category</label>
  <div class="col-sm-4">

      <asp:DropDownList ID="ddlCategory" class="form-control" runat="server">


      </asp:DropDownList>

  
         <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ControlToValidate="ddlCategory"
                                            ErrorMessage="Select Category" InitialValue="0" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>

                                             <asp:ValidatorCalloutExtender ID="VCECategoty" 
                                            runat="server" Enabled="True" TargetControlID="rfvCategory" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
  </div>
  </div>
 
   

  <div class="form-group row">
  <label class="col-form-label col-sm-2" for="">Job Name</label>
  <div class="col-sm-4">
      <asp:TextBox ID="txtjobSubcatName" class="form-control" placeholder="Enter Job Name" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ID="rfvjobsubcatname" runat="server" ControlToValidate="txtjobSubcatName"
                                            ErrorMessage="Please Enter Job Name" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                             
      <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender11" 
                                            runat="server" Enabled="True" TargetControlID="rfvjobsubcatname" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
  </div>

      <div class="col-sm-2">
         <%-- <div class="form-buttons-w">--%>
  
  <asp:Button ID="btnAddArea" class="btn btn-primary"  ValidationGroup="sv" runat="server" Text="Submit" onclick="Button1_Click" />
          </div>
    

  </div>

  
  

  
  
  
  <div class="col-md-12">

       <h5 class="form-header" id="topheading">
                        Job Sub Category List</h5>
                    <div class="controls-above-table">
                        <div class="row"  style="border:1px solid grey;padding:20px;border-radius:20px;">

                         
                             <div class="col-lg-4">
                                       
                                            <div class="form-group" >
                                                <label>Search Type</label>
                            
                                <asp:DropDownList data-placeholder="Choose Categoty" runat="server" ID="ddlCategorySearch" class="form-control" OnSelectedIndexChanged="ddlCategorySearch_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="0">Select Search Type</asp:ListItem>
                                
                                 
                                
                                </asp:DropDownList>
                                                </div>
                                         
                                    </div>


                            <div class="col-lg-4">
                                       
                                            <div class="form-group" >
                                                <label>Search Categoty</label>
                            
                                <asp:DropDownList data-placeholder="Choose Party Type" runat="server" ID="ddlSubCategorySearch" class="form-control" OnSelectedIndexChanged="ddlSubCategorySearch_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="0">Select Search Type</asp:ListItem>
                                 <%--   <asp:ListItem Value="1">Sub Category </asp:ListItem>--%>
                                 
                                
                                </asp:DropDownList>
                                                </div>
                                         
                                    </div>                  


                            <div class="col-lg-4">       
                                            <div class="form-group">
                                                <asp:Button ID="btnbtnSearch" OnClick="btnbtnSearch_Click"  runat="server" style="margin-top: 31px;border-radius: 30px;" class="btn btn-primary"
                                                    Text="Search" />&nbsp;
                                                  <asp:Button ID="btnReset" OnClick="btnReset_Click"  runat="server" style="margin-top: 31px;border-radius: 30px;" class="btn btn-danger"
                                                    Text="Reset" />
                                            </div>
                                           </div>

                        </div>
                    </div>




  <br />
  
  <div class="table-responsive">
<asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px" EmptyDataText="Result Not Found" Width="100%" CssClass="table table-hover table-bordered table-condensed" PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" ><%--PagerSettings-Visible="false" AllowPaging="true" PageSize="10"--%>
                                    <Columns>
                                     
                                       
                                        <asp:TemplateField HeaderText="S No." HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>                                            
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                           <asp:TemplateField HeaderText="Caregory" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                             <%#Eval("Industry")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>



                                        <asp:TemplateField HeaderText="Job Name" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                             <%#Eval("JobSubCateName")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                          <asp:TemplateField HeaderText="Edit" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                            <HeaderStyle />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:HiddenField ID="hdfjobsubcatid" Value='<%#Eval("JobSubCat_Id")%>' runat="server" />                                                     
                                                <asp:ImageButton ID="imgbtnUpdate" runat="server" ImageAlign="Middle" OnClick="Edit" ToolTip="Update" ImageUrl="../img/icon_edit.gif" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                      
                                           <asp:TemplateField HeaderText="Delete" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                            <HeaderStyle />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                               <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle" OnClick="Edit"
                                                    ToolTip="Delete" ImageUrl="../img/icon_delete.gif" />
                                                <asp:ConfirmButtonExtender ID="imgbtnactive_ConfirmButtonExtenderDelete" runat="server" TargetControlID="imgbtnDelete"
                                                    ConfirmText="Are you sure you want to delete this record ?">
                                                </asp:ConfirmButtonExtender>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
       <uc1:PagingControl  ID="CustPager" OnPageChanged="CustPager_PageChanged" runat="server" />
</div>
  
  </div>


  </div>
  </div></div>
  </div>
  
</div></div>
 <script type="text/javascript">
     function HideLabel() {
         var seconds = 5;
         setTimeout(function () {
             document.getElementById("<%=alert.ClientID %>").style.display = "none";
         }, seconds * 1000);
     };
</script><script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

