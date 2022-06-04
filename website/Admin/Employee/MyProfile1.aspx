<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="MyProfile1.aspx.cs" Inherits="MyProfile1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">






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


                                              <div class="alert alert-success alert-dismissable" id="divMsg" runat="server" visible="false">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                        &times;</button>&nbsp;
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                </div>
                                        
                                        <asp:HiddenField ID="hdfupdate" runat="server" />
                                      
                                    
                                    
                                        <fieldset class="form-group">
                                            <legend><span>Time Sheet</span></legend>

                                               <div class="form-group row">


                                                <label class="col-sm-4 col-form-label" for="">


                                                  </label>






                              <div class="form-group">
                <label for="">
                    Full Name</label>
                    
                  <%--  <input class="form-control" placeholder="Enter your username" type="text">--%>
                    
                <asp:TextBox ID="txtFname" runat="server" ></asp:TextBox>




                   
            </div>



             <div class="form-group">
                <label for="">
                    Father Name</label>
                    
                  <%--  <input class="form-control" placeholder="Enter your username" type="text">--%>
                    
                <asp:TextBox ID="txtfather" runat="server"  ></asp:TextBox>



                   
            </div>


             <div class="form-group">
                <label for="">
                    Date Of Birth</label>
                    
                  <%--  <input class="form-control" placeholder="Enter your username" type="text">--%>
                    
             <asp:TextBox ID="txtdob" runat="server" Cssclass="single-daterange form-control" placeholder="Enter Date"></asp:TextBox>

                       <asp:Calendar ID="Calendar1" runat="server" visible="false" ControlToValidate="txtdob"></asp:Calendar>
                   
            </div>



             <div class="form-group">
                <label for="">
                    Mobile no.</label>
                    
                  <%--  <input class="form-control" placeholder="Enter your username" type="text">--%>
                    
                <asp:TextBox ID="txtMob" runat="server"  ></asp:TextBox>
                   
            </div>

             <div class="form-group">
                <label for="">
                    Email</label>
                    
                  <%--  <input class="form-control" placeholder="Enter your username" type="text">--%>
                    
                <asp:TextBox ID="txtEmail" runat="server"  ></asp:TextBox>
                   
            </div>



             <div class="form-group">
                <label for="">
                    Password</label>
                    
                  <%--  <input class="form-control" placeholder="Enter your username" type="text">--%>
                    
                <asp:TextBox ID="txtPassword" runat="server"  ></asp:TextBox>
                   
            </div>


             <div class="form-group">
                <label for="">
                    Address</label>
                    
                  <%--  <input class="form-control" placeholder="Enter your username" type="text">--%>
                    
                <asp:TextBox ID="txtAddress" runat="server"  ></asp:TextBox>
                   
            </div>

             <div class="form-group">
                <label for="">
                    Zipcode</label>
                    
                  <%--  <input class="form-control" placeholder="Enter your username" type="text">--%>
                    
                <asp:TextBox ID="txtZipcode" runat="server"  ></asp:TextBox>
                   
            </div>    

            <div class="buttons-w">

                <asp:Button ID="btnRegistration" runat="server" Text="Update" 
                    onclick="Update_Click" />
                <asp:Label ID="Label1" runat="server"   Text="Label"></asp:Label>


               <%-- <button class="btn btn-primary">
                    Log me in</button>--%>
                    
                   
            </form>
        </div>
    </div>





           
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





                                                    
</asp:Content>

