<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="UserParmition.aspx.cs" Inherits="Admin_User_UserParmition" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("[id*=TreeView1] input[type=checkbox]").bind("click", function () {
            var table = $(this).closest("table");
            if (table.next().length > 0 && table.next()[0].tagName == "DIV") {
                //Is Parent CheckBox
                var childDiv = table.next();
                var isChecked = $(this).is(":checked");
                $("input[type=checkbox]", childDiv).each(function () {
                    if (isChecked) {
                        $(this).attr("checked", "checked");
                    } else {
                        $(this).removeAttr("checked");
                    }
                });
            } else {
                //Is Child CheckBox
                var parentDIV = $(this).closest("DIV");
                if ($("input[type=checkbox]", parentDIV).length == $("input[type=checkbox]:checked", parentDIV).length) {
                    $("input[type=checkbox]", parentDIV.prev()).attr("checked", "checked");
                } else {
                    $("input[type=checkbox]", parentDIV.prev()).removeAttr("checked");
                }
            }
        });
    })
 
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hdfImage" runat="server" />
 <!--------------------START - Breadcrumbs-------------------->
  <ul class="breadcrumb">
  <li class="breadcrumb-item"><a href="#">Home</a></li>
  <li class="breadcrumb-item"><a href="#">User Role</a></li>
  </ul>
  <!--------------------END - Breadcrumbs-------------------->
  <div class="content-i">
  <div class="content-box">
  <div class="row">
  
  <div class="col-lg-8">
  <div class="element-wrapper">
  <h6 class="element-header">Add User Role</h6>
  <div class="element-box">

  <h5 class="form-header">Add User Role</h5>
<div class="alert alert-success alert-dismissible fade show" visible="false" runat="server" ID="alert">
 <button aria-label="Close" class="close" data-dismiss="alert" type="button">
 <span aria-hidden="true"> ×</span>
 </button>
     <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
 </div>
 <div class="form-group row">

  <label class="col-form-label col-sm-4" for="">User Role</label>
  <div class="col-sm-8">
   
      <asp:DropDownList ID="drdUserRole" CssClass="form-control" runat="server">
      <asp:ListItem Text="Select User Role" Value="0"></asp:ListItem> 
      </asp:DropDownList>
    
  </div>

  </div> 
 <div class="form-group row" style="width: 100%; height:400px; overflow-y: scroll;">

  <label class="col-form-label col-sm-4" for="">Select Menu</label>
  <div class="col-sm-8">
      <asp:TreeView ID="TreeView1" runat="server"  ShowCheckBoxes="All" NodeIndent="15">
    <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
    <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
        NodeSpacing="0px" VerticalPadding="2px"></NodeStyle>
    <ParentNodeStyle Font-Bold="False" />
    <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
        VerticalPadding="0px" />
</asp:TreeView>
      </div>
     </div>
     <asp:HiddenField ID="hdfID" runat="server" />

  <div class="form-buttons-w">
  <asp:Button ID="btnSubmit"  class="btn btn-primary" runat="server" Text="submit" OnClick="btnSubmit_Click"/><%-- onclick="btnSubmit_Click" --%>
  </div>
  
  </div>
  </div></div>
  </div>
  
</div></div>
    <script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

