<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Add_Skill.aspx.cs" Inherits="Admin_Master_Add_Skill" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:HiddenField ID="hdfID" runat="server" />

  <!--------------------START - Breadcrumbs-------------------->
  <ul class="breadcrumb">
  <li class="breadcrumb-item"><a href="#">Home</a></li>
  <li class="breadcrumb-item"><a href="#">Add Job Skill</a></li>
  </ul>
  <!--------------------END - Breadcrumbs-------------------->
  <div class="content-i">
  <div class="content-box">
  <div class="row">
  
  <div class="col-lg-12">
  <div class="element-wrapper">
  <h6 class="element-header">Add Update Job Skill</h6>
  <div class="element-box">

  <h5 class="form-header">Add Update Job Skill</h5>
 <%-- <div class="form-desc">Discharge best employed your phase each the of shine. Be met even reason consider logbook redesigns. Never a turned interfaces among asking</div>--%>
  <div class="alert alert-success alert-dismissible fade show" visible="false" runat="server" ID="alert">
 <button aria-label="Close" class="close" data-dismiss="alert" type="button">
 <span aria-hidden="true"> ×</span>
 </button>
     <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
 </div>


       <div class="form-group row">
  <label class="col-form-label col-sm-2" for="">Select Category</label>
  <div class="col-sm-5">

      <asp:DropDownList ID="ddlCategory" class="form-control" runat="server" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true">


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
  <label class="col-form-label col-sm-2" for="">Select SubCategory</label>
  <div class="col-sm-5">

      <asp:DropDownList ID="ddljobSubCategory" class="form-control" runat="server">


      </asp:DropDownList>

  
         <asp:RequiredFieldValidator ID="rfvjobSubCategory" runat="server" ControlToValidate="ddljobSubCategory"
                                            ErrorMessage="Select Category" InitialValue="0" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>

                                             <asp:ValidatorCalloutExtender ID="VCEjobsubCategory" 
                                            runat="server" Enabled="True" TargetControlID="rfvjobSubCategory" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
  </div>
  </div>
 
   

  <div class="form-group row">
  <label class="col-form-label col-sm-2" for="">Skill Name</label>
  <div class="col-sm-5">
      <asp:TextBox ID="txtskillName" class="form-control" placeholder="Enter Skill Name" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ID="rfvskillname" runat="server" ControlToValidate="txtskillName"
                                            ErrorMessage="Please Enter Skill Name" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                             
      <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender11" 
                                            runat="server" Enabled="True" TargetControlID="rfvskillname" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
  </div>
  </div>

  
  

  
  <div class="form-buttons-w">
  
  <asp:Button ID="btnAddArea" class="btn btn-primary"  ValidationGroup="sv" runat="server" Text="Submit" onclick="Button1_Click" />

      
  </div>
  
  <div class="col-md-12">
  <br />
  
  <div class="table-responsive">
<asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px" EmptyDataText="Result Not Found" Width="100%" CssClass="table table-hover table-bordered table-condensed" PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" ><%--PagerSettings-Visible="false" AllowPaging="true" PageSize="10"--%>
                                    <Columns>
                                     
                                       
                                        <asp:TemplateField HeaderText="SNo.">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>                                            
                                            </ItemTemplate>
                                        </asp:TemplateField>



                                          <asp:TemplateField HeaderText="Caregory">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                             <%#Eval("Industry")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>




                                           <asp:TemplateField HeaderText="Sub Caregory">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                             <%#Eval("JobSubCateName")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>



                                        <asp:TemplateField HeaderText="Skill Name">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                             <%#Eval("Skill_Name")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                          <asp:TemplateField HeaderText="Edit">
                                            <HeaderStyle />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:HiddenField ID="hdfskillid" Value='<%#Eval("Skill_id")%>' runat="server" />                                                     
                                                <asp:ImageButton ID="imgbtnUpdate" runat="server" ImageAlign="Middle" OnClick="Edit" ToolTip="Update" ImageUrl="../img/icon_edit.gif" />
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                           <asp:TemplateField HeaderText="Delete">
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

