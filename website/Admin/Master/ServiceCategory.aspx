<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ServiceCategory.aspx.cs" Inherits="Admin_Master_ServiceCategory" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:HiddenField ID="hdfID" runat="server" />

  <!--------------------START - Breadcrumbs-------------------->
  <ul class="breadcrumb">
  <li class="breadcrumb-item"><a href="#">Home</a></li>
  <li class="breadcrumb-item"><a href="#">Service Category</a></li>
  </ul>
  <!--------------------END - Breadcrumbs-------------------->
  <div class="content-i">
  <div class="content-box">
  <div class="row">
  
  <div class="col-lg-12">
  <div class="element-wrapper">
  <h6 class="element-header">Service Category</h6>
  <div class="element-box">

  <h5 class="form-header">Service Category</h5>
 <%-- <div class="form-desc">Discharge best employed your phase each the of shine. Be met even reason consider logbook redesigns. Never a turned interfaces among asking</div>--%>
  <div class="alert alert-success alert-dismissible fade show" visible="false" runat="server" ID="alert">
 <button aria-label="Close" class="close" data-dismiss="alert" type="button">
 <span aria-hidden="true"> ×</span>
 </button>
     <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
 </div>
  

 
   

  <div class="form-group row">
  <label class="col-form-label col-sm-2" for="">Category</label>
  <div class="col-sm-5">
      <asp:TextBox ID="txtCategory" class="form-control" placeholder="Enter Category" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ID="rfvCatrgory" runat="server" ControlToValidate="txtCategory"
                                            ErrorMessage="Please Enter Category" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                             <asp:ValidatorCalloutExtender ID="VCE_category" 
                                            runat="server" Enabled="True" TargetControlID="rfvCatrgory" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
  </div>
  </div>

      
  <div class="form-group row">
  <label class="col-form-label col-sm-2" for="">GST in (%)</label>
  <div class="col-sm-5">
      <asp:TextBox ID="txtGST" class="form-control" placeholder="Enter GST" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ID="rfvgst" runat="server" ControlToValidate="txtGST"
                                            ErrorMessage="Please Enter Gst" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                             <asp:ValidatorCalloutExtender ID="VCEgst" 
                                            runat="server" Enabled="True" TargetControlID="rfvgst" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
  </div>
  </div>

  
  <div class="form-group row">
  <label class="col-form-label col-sm-2" for="">Description</label>
  <div class="col-sm-5">
      <asp:TextBox ID="txtDes" class="form-control" TextMode="MultiLine" placeholder="Enter Description" runat="server"></asp:TextBox>
       <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDes"
                                            ErrorMessage="Please Enter Description" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender> --%>
  </div>
  </div>

  
  <div class="form-buttons-w">
  <%--<button class="btn btn-primary" type="submit"> Submit</button>--%>
  <asp:Button ID="btnAddArea" class="btn btn-primary"  ValidationGroup="sv" runat="server" Text="Submit" OnClick="btnAddArea_Click" />
<%-- <span>Availabil Point:<asp:Label ID="lblPoint" runat="server" Text=""></asp:Label></span>--%> 
      
  </div>
  
  <div class="col-md-12">
  <br />
  
  <div class="table-responsive">
<asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px" EmptyDataText="Result Not Found" Width="100%" CssClass="table table-hover table-bordered table-condensed" PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false">
                                    <Columns>
                                     
                                       
                                        <asp:TemplateField HeaderText="S No." HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white" >
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>                                            
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Category Name" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                             <%#Eval("CategoryName")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="GST (%)" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                             <%#Eval("Gst")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Discription" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                             <%#Eval("Discription")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Edit" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                            <HeaderStyle />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:HiddenField ID="hdfbranchID" Value='<%#Eval("CatID")%>' runat="server" />                                                     
                                                <asp:ImageButton ID="imgbtnUpdate" runat="server" ImageAlign="Middle" OnClick="Edit" ToolTip="Update" ImageUrl="../img/icon_edit.gif" />
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                           <asp:TemplateField HeaderText="Delete" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                            <HeaderStyle />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                               <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle" OnClick="Edit"
                                                    ToolTip="Delete" ImageUrl="~/admin/img/Delete_Record.png" />
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

