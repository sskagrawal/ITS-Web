<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Advertisement.aspx.cs" Inherits="Admin_Advertisement" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="PagingControl.ascx" TagName="PagingControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:HiddenField ID="hdfImage" runat="server" />

    <asp:HiddenField ID="hdfUserId" runat="server" />
    <asp:HiddenField ID="hdfusertypeid" runat="server" />
    <asp:HiddenField ID="hdfAdId" runat="server" />


    <!--------------------START - Breadcrumbs-------------------->
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Advertisement Details</a></li>

    </ul>
    <!--------------------END - Breadcrumbs-------------------->
    <div class="content-i">
        <div class="content-box">
            <div class="row">

                <div class="col-lg-12">
                    <div class="element-wrapper">
                        <h6 class="element-header">Advertisement Details</h6>
                        <div class="element-box">
                            <h5 class="form-header">Advertisement Details</h5>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <div class="alert alert-success alert-dismissable" id="divMsg" runat="server" visible="false">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                                            &times;</button>&nbsp;
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                                    </div>
                                </div>
                                  <div class="col-md-8">
                           
                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Ad Title</label>
                                <div class="col-sm-8">


                                    <asp:TextBox ID="txtAdtitle" class="form-control" placeholder="Enter Ad Title" runat="server"></asp:TextBox>

                                    <asp:RequiredFieldValidator ID="rfvAdtitle" runat="server" ControlToValidate="txtAdtitle"
                                        ErrorMessage="Enter Ad Title" ForeColor="Red" SetFocusOnError="True" ValidationGroup="svv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                  
                                      <asp:ValidatorCalloutExtender ID="VCEAdTirle" runat="server" Enabled="True"
                                        TargetControlID="rfvAdtitle" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>


                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Ad Link</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtAdLink" class="form-control" placeholder="Enter Ad Link " runat="server"></asp:TextBox>
                                  
                                      <asp:RequiredFieldValidator ID="rfvadLink" runat="server" ControlToValidate="txtAdLink"
                                        ErrorMessage="Please Enter Ad Link" ForeColor="Red" SetFocusOnError="True" ValidationGroup="svv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" Enabled="True"
                                        TargetControlID="rfvadLink" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
                                </div>
                            </div>






                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Job Opening Date</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtjobsOpenDate" class="form-control" placeholder="Enter Opening Date" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="caljobopenDate" runat="server" ClientIDMode="Static" TargetControlID="txtjobsOpenDate" Format="dd/MM/yyyy"></asp:CalendarExtender>
                                  
                                      <asp:RequiredFieldValidator ID="rfvJobOpenDate" runat="server" ControlToValidate="txtjobsOpenDate"
                                        ErrorMessage="Please Select Opening Date" ForeColor="Red" SetFocusOnError="True" ValidationGroup="svv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="VCE_JobOpendate" runat="server" Enabled="True"
                                        TargetControlID="rfvJobOpenDate" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
                                </div>
                            </div>


                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Job Closing Date</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtjobClosingDate" class="form-control" placeholder="Enter Closing Date" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="caljobclosingDate" runat="server" ClientIDMode="Static" TargetControlID="txtjobClosingDate" Format="dd/MM/yyyy"></asp:CalendarExtender>
                                  
                                      <asp:RequiredFieldValidator ID="rfvJobCloseDate" runat="server" ControlToValidate="txtjobClosingDate"
                                        ErrorMessage="Please Select Closing Date" ForeColor="Red" SetFocusOnError="True" ValidationGroup="svv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                   
                                     <asp:ValidatorCalloutExtender ID="VCE_JobCloseDate" runat="server" Enabled="True"
                                        TargetControlID="rfvJobCloseDate" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>

                                </div>
                            </div>                           


                            <div class="form-group row">
                                <label class="col-form-label col-sm-4" for="">Ads Image</label>
                                <div class="col-sm-8">
                                    <asp:FileUpload ID="fluPorUpload" class="form-control" runat="server" />

                                    <asp:RequiredFieldValidator ID="rfvAdImage" runat="server" ControlToValidate="fluPorUpload"
                                        ErrorMessage="Please Enter Ads Image" ForeColor="Red" SetFocusOnError="True" ValidationGroup="svv"
                                        Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="VCErfvAdImage" runat="server" Enabled="True"
                                        TargetControlID="rfvAdImage" WarningIconImageUrl="~/img/wrning.gif">
                                    </asp:ValidatorCalloutExtender>
                                </div>
                            </div>

                            <asp:HiddenField ID="hdfID" runat="server" />

                            <div class="form-buttons-w">
                                <asp:Button ID="btnSubmit" ValidationGroup="svv" class="btn btn-primary" OnClick="btnSubmit_Click1" runat="server" Text="Submit" />


                            </div>

                            </div>
                                </div>
                            

                        </div>
                    </div>
                </div>
            </div>

             <div class="row">

                    <!----------Surendra Goyal-------->
                    <div class="table-responsive">
                        <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px"
                            EmptyDataText="Result Not Found" Width="100%" CssClass="table table-lightborder table-bordered table-hover"
                            PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false"
                            AllowPaging="true" PageSize="10">
                            <Columns>
                                <asp:TemplateField HeaderText="Sn." HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="AdTitle" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("AdTitle")%>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                                  
    

     

                          <asp:TemplateField HeaderText=" Open Date" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Add_Date", "{0:dd-MMM-yyyy}")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText=" Close Date" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Last_Date", "{0:dd-MMM-yyyy}")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                

                              <asp:TemplateField HeaderText="AdLink" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("AdLink")%>
                                    </ItemTemplate>
                                </asp:TemplateField>                                    

                                                               
                                   <asp:TemplateField HeaderText="Advetise Image" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <img src='../AdsImage/<%#Eval("Ads_Image")%>' class="img-thumbnail" alt="ad banner" style="width: 100px" />
                                    </ItemTemplate>
                                </asp:TemplateField>                             
                                    
                                 



                                <asp:TemplateField HeaderText="Edit" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                      <asp:HiddenField ID="hdfAdsID" Value='<%#Eval("AdvertiseId")%>' runat="server" />
                                        <asp:ImageButton ID="imgbtnUpdate" runat="server" ImageAlign="Middle" OnClick="Edit"
                                            ToolTip="Update" ImageUrl="img/icon_edit.gif" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                               
                                <asp:TemplateField HeaderText="Delete" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle" OnClick="Edit"
                                            ToolTip="Delete" ImageUrl="img/icon_delete.gif" />
                                        <asp:ConfirmButtonExtender ID="imgbtnactive_ConfirmButtonExtenderDelete" runat="server"
                                            TargetControlID="imgbtnDelete" ConfirmText="Are you sure you want to delete this record ?">
                                        </asp:ConfirmButtonExtender>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <div style="text-align: center;">
                            <uc1:PagingControl ID="CustPager" OnPageChanged="CustPager_PageChanged" runat="server" />
                        </div>
                    </div>
                    <!----------End----------->


                 </div>


        </div>
    </div>
    <script src="../../js/jquery-1.12.4.js"></script>

</asp:Content>

