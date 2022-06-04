<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="TimesheetList.aspx.cs" Inherits="Admin_User_TimesheetList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hdfUserId" runat="server" />
    <asp:HiddenField ID="hdfUserTypeId" runat="server" />
<div class="content-w">
                <!--------------------
START - Breadcrumbs
-------------------->
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li><li class="breadcrumb-item">
                        <a href="index.html">Products</a></li><li class="breadcrumb-item"><span>Laptop with
                            retina screen</span></li></ul>
                <!--------------------
END - Breadcrumbs
-------------------->
                <div class="content-i">
                    <div class="content-box">
                        <div class="row">
                            
                            <div class="col-lg-12">
                                <div class="element-wrapper">
                                    <h6 class="element-header">
                                        Time Sheet</h6>
                                    <div class="element-box">
                                        <form>
                                        <h5 class="form-header">
                                            Time Sheet</h5>
                                        
                                       
                                      
                                    
                                    
                                        <fieldset class="form-group">
                                            <legend><span>Time Sheet</span></legend>

                                               <div class="form-group row">


                                                <label class="col-sm-4 col-form-label" for="">


                                                  </label>
                                                    
                                                    <div class="col-sm-12">



                                                     <asp:GridView ID="grvEmp"   AutoGenerateColumns="False" runat="server" >  

     
       <Columns>
             <asp:TemplateField HeaderText="User Name" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:Label ID="txtName" runat="server" Text='<%# Eval("Name") %>' />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Entry Date" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:Label ID="txtentrydate" runat="server" Text='<%# Eval("Entry_date","{0:dd/MM/yyyy}") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        
         <asp:TemplateField HeaderText="Entry Time" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:Label ID="txtentrytime" runat="server" Text='<%# Eval("Entry_time") %>' />
            </ItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Work Description" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:Label ID="txtwdescription" runat="server" Text='<%# Eval("Work_description") %>' />
            </ItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Extit  Date" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:Label ID="txtexitdate" runat="server" Text='<%# Eval("Exit_date","{0:dd/MM/yyyy}") %>' />
            </ItemTemplate>
        </asp:TemplateField>
           
            <asp:TemplateField HeaderText="Name" ItemStyle-Width="150">
            <ItemTemplate>
            <asp:Label ID="txtexittime" runat="server" Text='<%# Eval("Exit_time") %>' />
            </ItemTemplate>
            </asp:TemplateField>
            
     
            <asp:TemplateField ShowHeader="False">
            <ItemTemplate>

                 <asp:HiddenField ID="hdf_delete" runat="server"  Value='<%# Eval("Emp_id") %>' />

                <asp:Button ID="btndelete" runat="server"  Text="Delete"  OnClick="delete_Click" />
            </ItemTemplate>
        </asp:TemplateField>


            <asp:TemplateField ShowHeader="False">
            <ItemTemplate>

                 <asp:HiddenField ID="hdf_edit" runat="server"  Value='<%# Eval("Emp_id") %>' />

                <asp:Button ID="btnedit" runat="server" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" OnClick="edit_Click" Text="Edit" />
            </ItemTemplate>
        </asp:TemplateField>


      
    </Columns>

        </asp:GridView>  



                                                     
                                                   </div>
                                            </div>

                                          
                                         
                                            
                                        </fieldset>
                                    
                                     
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        

                    </div>
                </div>
            </div>

     <script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

