<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Upload_job.aspx.cs" Inherits="Admin_Career" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:HiddenField ID="hdfImage" runat="server" />

    <asp:HiddenField ID="hdfUserID" runat="server" />
    <asp:HiddenField ID="hdfPostID" runat="server" />

    <!--------------------START - Breadcrumbs-------------------->
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Job Post</a></li>
    </ul>
    <!--------------------END - Breadcrumbs-------------------->
    <div class="content-i">
        <div class="content-box">
            <div class="row">

                <div class="col-lg-8">
                    <div class="element-wrapper">
                        <h6 class="element-header">Jobs Post</h6>
                        <div class="element-box">

                            <h5 class="form-header">Jobs Post</h5>

                            <div id="alert" runat="server" visible="false" class="alert alert-success">
                                <asp:Label ID="lblMSG" runat="server" Text="Label"></asp:Label>
                            </div>

                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Select Company</label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="drdCom" CssClass="form-control" runat="server">
                                    </asp:DropDownList>


                                </div>
                                <div class="col-md-2">
                                    <a href="#" title="Add New Company" data-target="#exampleModal1" data-toggle="modal"><i class="icon-user-follow" style="font-size: 35px"></i></a>

                                </div>
                            </div>
                            <!-----Kishanmagic Model Popup--------->
                            <div aria-labelledby="exampleModalLabel" class="modal fade" id="exampleModal1" role="dialog" tabindex="-1" style="display: none;" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Add Company</h5>
                                            <button aria-label="Close" class="close" data-dismiss="modal" type="button"><span aria-hidden="true">×</span></button>
                                        </div>
                                        <div class="modal-body">
                                            <div>
                                                <div class="form-group">

                                                    <div class="row">
                                                      
                                                          
                                                            <div class="col-sm-6">  
                                                                <label for="">Name </label>
                                                                <asp:TextBox ID="txtName" class="form-control" placeholder="Enter Name" runat="server"></asp:TextBox>
                                                           
                                                          

                                                        </div>

                                                   
                                                          
                                                            <div class="col-sm-6">  <label for="">Mobile No.</label>
                                                                <asp:TextBox ID="txtMob" class="form-control" placeholder="Enter  Mobile No." runat="server"></asp:TextBox>
                                                           
                                                            </div>
                                                      

                                                       
                                                           
                                                            <div class="col-sm-6"> <label for="">Email ID</label>
                                                                <asp:TextBox ID="txtEmailID" class="form-control" placeholder="Enter Email ID" runat="server"></asp:TextBox>
                                                           
                                                            </div>
                                                      
                                                          
                                                            <div class="col-sm-6">  <label for="">Gendar</label>
                                                                <asp:RadioButtonList ID="rbtGendar" runat="server" RepeatDirection="Horizontal">
                                                                    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                                                    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                          
                                                            </div>
                                                     
                                                          
                                                            <div class="col-sm-6">  <label for="">Password</label>
                                                                <asp:TextBox ID="txtPSWD" class="form-control" placeholder="Enter Password" runat="server"></asp:TextBox>
                                                        
                                                            </div>
                                                     
                                                            
                                                            <div class="col-sm-6"><label for="">Company Name</label>
                                                                <asp:TextBox ID="txtCompanyName" class="form-control" placeholder="Enter  Company Name" runat="server"></asp:TextBox>

                                                            </div>
                                                        
                                                         
                                                            <div class="col-sm-6">   <label for="">Website</label>
                                                                <asp:TextBox ID="txtWebsite" class="form-control" placeholder="Enter Website Url" runat="server"></asp:TextBox>
                                                            </div>
                                                      
                                                           
                                                            <div class="col-sm-12"> <label for="">Address</label>
                                                                <asp:TextBox ID="txtAddress" TextMode="MultiLine" class="form-control" placeholder="Enter  Address" runat="server"></asp:TextBox>

                                                            </div>
                                                        </div>
    </div>

    </div>
                                        <div class="modal-footer">
                                            <asp:Button ID="btnSubmit" runat="server" Text="Save" OnClick="btnSubmit_Click" />
                                            <%--<button class="btn btn-primary" type="button">Save changes</button>--%> 
                                             <button class="btn btn-secondary" data-dismiss="modal" type="button">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                </div>
                            <!---------End Model Popuo------------->
                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Job Title</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtJobTitle" class="form-control" placeholder="Required Employee title" runat="server"></asp:TextBox>
                                </div>

                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Job Type</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="drdJobType" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Select Job Type" Value="0"></asp:ListItem>

                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Job Type</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtNoPosition" class="form-control" placeholder="Enter No. Of Position" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Experience</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="drdExp" CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>

                            </div>

                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">job Opening Date</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtOpeningDAte" class="form-control" placeholder="Select job Opening Date" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="caljobopenDate" runat="server" ClientIDMode="Static" TargetControlID="txtOpeningDAte" Format="dd/MM/yyyy"></asp:CalendarExtender>

                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">job Closing Date</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtClosingdate" class="form-control" placeholder="Select job Closing Date" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="caljobClosenDate" runat="server" ClientIDMode="Static" TargetControlID="txtClosingdate" Format="dd/MM/yyyy"></asp:CalendarExtender>

                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Qualification</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="drdQualification" CssClass="form-control" runat="server"></asp:DropDownList>

                                </div>
                            </div>


                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Mimimum Salery</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtMinimum" class="form-control" placeholder="Enter Mimimum Salery" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Maxmum Salery</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtMaxmum" class="form-control" placeholder="Enter Maxmum Salery" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Industry</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="drdIndustry" CssClass="form-control" runat="server"></asp:DropDownList>

                                </div>
                            </div>


                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">State</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="drdState" runat="server" CssClass="form-control" AutoPostBack="true"
                                        OnSelectedIndexChanged="drdState_SelectedIndexChanged">
                                        <asp:ListItem Text="Select Job Prepare State " Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>


                            </div>

                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">City</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="drdCity" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Select Job Prepare City" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Job Description</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtDes" TextMode="MultiLine" class="form-control" placeholder="Enter Job Description" runat="server"></asp:TextBox>
                                </div>


                            </div>
                            <div class="form-group row">


                                <asp:LinkButton ID="lbtnSubmit" class="btn btn-primary" runat="server" OnClick="lbtnSubmit_Click" ValidationGroup="sv"><span class="txt">Submit</span><span class="btn-icon fa fa-save"></span></asp:LinkButton>


                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
        <script src="../../js/jquery-1.12.4.js"></script>
        <asp:HiddenField ID="hdfID" runat="server" />
</asp:Content>

