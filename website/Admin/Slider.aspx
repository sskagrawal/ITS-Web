<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Slider.aspx.cs" Inherits="Admin_Slider" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:HiddenField ID="hdfImage" runat="server" />
    <asp:HiddenField ID="hdfID" runat="server" />
    <!--------------------START - Breadcrumbs-------------------->
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Slider Manager</a></li>
        <%-- <li class="breadcrumb-item">
  <span>Laptop with retina screen</span></li>--%>
    </ul>
    <!--------------------END - Breadcrumbs-------------------->
    <div class="content-i">
        <div class="content-box">
            <div class="row">

                <div class="col-lg-8">
                    <div class="element-wrapper">
                        <h6 class="element-header">Banner Slider</h6>
                        <div class="element-box">

                            <h5 class="form-header">Banner Slider</h5>

                            <div class="alert alert-success alert-dismissible fade show" visible="false" runat="server" id="alert">
                                <button aria-label="Close" class="close" data-dismiss="alert" type="button">
                                    <span aria-hidden="true">×</span>
                                </button>
                                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                            </div>

                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Slider Title</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtSliderTitle" class="form-control" placeholder="Enter Slider Title" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for=""> Alt Name</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtAlt_Name" Class="form-control" placeholder="Enter Alt Name" runat="server"></asp:TextBox>
                                 </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Description</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtSliderSubTitle" class="form-control" placeholder="Enter Slider Sub Title" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Sort No.</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtSort" class="form-control" placeholder="Enter Sort No" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Slider Image</label>
                                <div class="col-sm-8">
                                    <asp:FileUpload ID="fluSlideUpload" class="form-control" runat="server" />
                                </div>
                            </div>

                            <div class="form-buttons-w">
                                <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="submit" OnClick="Button1_Click" />
                            </div>


                            <div class="col-md-12">
                                <br />
                                <div class="table-responsive">
                                    <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px"
                                        EmptyDataText="Result Not Found" Width="100%" CssClass="table table-lightborder table-bordered table-hover"
                                        PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false"
                                        AllowPaging="true" PageSize="10">
                                        <Columns>
                                            <asp:TemplateField HeaderText="SrNo.">
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle />
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Title">
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle />
                                                <ItemTemplate>
                                                    <%#Eval("SliderTitle")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Description">
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle />
                                                <ItemTemplate>
                                                    <%#Eval("Slider_SubTitle")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Alt Name">
                                                <HeaderStyle HorizontalAlign="Left"/>
                                                <ItemTemplate>
                                                    <%#Eval("Alt_Name") %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sort No.">
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle />
                                                <ItemTemplate>
                                                    <%#Eval("Sort")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>


                                            <asp:TemplateField HeaderText="Slider Image">
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle />
                                                <ItemTemplate>
                                                    <img src='../SliderImage/<%#Eval("SliderImg")%>' style="width: 100px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Edit">
                                                <HeaderStyle />
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <asp:HiddenField ID="hdfID" Value='<%#Eval("SliderId")%>' runat="server" />
                                                    <asp:ImageButton ID="imgbtnUpdate" runat="server" ImageAlign="Middle" OnClick="Edit"
                                                        ToolTip="Update" ImageUrl="~/Admin/img/pensil.png" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Delete">
                                                <HeaderStyle />
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle" OnClick="Edit"
                                                        ToolTip="Delete" ImageUrl="~/Admin/img/Delete_Record.png" />
                                                    <asp:ConfirmButtonExtender ID="imgbtnactive_ConfirmButtonExtenderDelete" runat="server"
                                                        TargetControlID="imgbtnDelete" ConfirmText="Are you sure you want to delete this record ?"></asp:ConfirmButtonExtender>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Download">
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemTemplate>
                                                    <a href='../SliderImage/<%#Eval("SliderImg")%>' target="_blank" /> 

                                                       <asp:HiddenField ID="hdfSliderImage" value='<%#Eval("SliderImg")%>' runat="server"></asp:HiddenField>
                                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/SliderImage/Download.gif" /></a>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                           
                                            
                                        </Columns>
                                    </asp:GridView>
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

