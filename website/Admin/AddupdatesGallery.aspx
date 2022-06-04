<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddupdatesGallery.aspx.cs" Inherits="Admin_AddupdatesGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hdfImage" runat="server" />
    <asp:HiddenField ID="hdfID" runat="server" />
  <!--------------------START - Breadcrumbs-------------------->
  <ul class="breadcrumb">
  <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
  <li class="breadcrumb-item"><a href="#">portfolio</a></li>
 <%-- <li class="breadcrumb-item">
  <span>Laptop with retina screen</span></li>--%>
  </ul>
  <!--------------------END - Breadcrumbs-------------------->
  <div class="content-i">
  <div class="content-box">
  <div class="row">
  
  <div class="col-lg-6">
  <div class="element-wrapper">
  <h6 class="element-header">Add Update portfolio</h6>
  <div class="element-box">

  <h5 class="form-header">Add Update portfolio</h5>

  <div class="alert alert-success alert-dismissible fade show" visible="false" runat="server" ID="alert">
 <button aria-label="Close" class="close" data-dismiss="alert" type="button">
 <span aria-hidden="true"> ×</span>
 </button>
     <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
 </div>
 <%-- <div class="form-desc">Discharge best employed your phase each the of shine. Be met even reason consider logbook redesigns. Never a turned interfaces among asking</div>--%>
 <div class="form-group row">
  <label class="col-form-label col-sm-4" for="">Portfolio Type</label>
  <div class="col-sm-8">
<%--  <select class="form-control">
  <option>Select State</option>
  <option>New York</option>
  <option>California</option>
  <option>Boston</option>
  <option>Texas</option>
  <option>Colorado</option>
  </select>--%>
<asp:DropDownList CssClass="form-control" ID="drdPortType"  runat="server">
<asp:ListItem Text="Select portfolio Type" Value="0"></asp:ListItem>
<asp:ListItem Text="E-commerce" Value="ecom"></asp:ListItem>
<asp:ListItem Text="Education" Value="edu"></asp:ListItem>
<asp:ListItem Text="Industry" Value="ind"></asp:ListItem>
    <asp:ListItem Text="International" Value="int"></asp:ListItem>
<asp:ListItem Text="Other" Value="oth"></asp:ListItem>
</asp:DropDownList>
  </div>
  </div>
   <div class="form-group row"><label class="col-form-label col-sm-4" for="">Portfolio Title</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtportfolio" class="form-control" placeholder="Enter Portfolio Title" runat="server"></asp:TextBox>
  </div>
  </div>

  <div class="form-group row"><label class="col-form-label col-sm-4" for="">Portfolio Sub Title</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtSubTitle" class="form-control" placeholder="Enter Portfolio Sub Title" runat="server"></asp:TextBox>
  </div>
  </div>

  <div class="form-group row"><label class="col-form-label col-sm-4" for="">City</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtCity" class="form-control" placeholder="Enter City" runat="server"></asp:TextBox>
  </div>
  </div>

        <div class="form-group row"><label class="col-form-label col-sm-4" for="">Sort Order</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtSortO" class="form-control" placeholder="Enter Sort Order" runat="server"></asp:TextBox>
  </div>
  </div>
  <div class="form-group row">
  <label class="col-form-label col-sm-4" for="">Portfolio Url</label>
  <div class="col-sm-8">
  <asp:TextBox ID="txtUrl" class="form-control" placeholder="Enter Portfolio Sub Title" runat="server"></asp:TextBox>
  </div>
  </div>
  <div class="form-group row">
  <label class="col-form-label col-sm-4" for="">Portfolio Image</label>
  <div class="col-sm-8">
      <asp:FileUpload ID="fluPorUpload" class="form-control" runat="server" />
  </div>
  </div>
  
   
  
  
  <div class="form-buttons-w"><%--<button class="btn btn-primary" type="submit"> Submit</button>--%><asp:Button ID="Button1"
          class="btn btn-primary"  runat="server" Text="submit" 
          onclick="Button1_Click" />
  </div>
  
  </div>
  </div></div>
  </div>
  
</div></div><script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

