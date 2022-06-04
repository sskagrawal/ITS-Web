<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Post-Resume.aspx.cs" Inherits="Client_Panel_Post_Job" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

      <script type="text/javascript">
             function HideLabel() {
            var seconds = 5;
        setTimeout(function () {
   document.getElementById("<%=alert.ClientID %>").style.display = "none";
      }, seconds * 1000);
          };
</script>  




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

     <asp:HiddenField ID="hdfUserName" runat="server"></asp:HiddenField>
     <asp:HiddenField ID="hdfUserMob" runat="server"></asp:HiddenField>
    <asp:HiddenField ID="hdfUserID" runat="server"></asp:HiddenField>
    

    

        <div class="content-w">

    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
        <li class="breadcrumb-item">
            <a href="index.html">Client Panel</a></li>
        <li class="breadcrumb-item"><span>Post-Resume</span></li>

    </ul>
    <!--------------------END - Breadcrumbs-------------------->
    <div class="content-i">
        <div class="content-box">
            <div class="row">
                <div class="col-lg-12">
                    <div class="element-wrapper">
                        <h6 class="element-header">Post-Resume</h6>
                        <div class="element-box">
                            <div>
                                <h5 class="form-header">Post Resume</h5>                         
                                
                                                        
                                                


                                <div class="row">

                                    
                                               <div id="alert" runat="server" visible="false" class="alert success">
                                                        <%--<div class="alert-message">Your Profile Updated Successfully
                                                        </div>--%>
                                                     <asp:Label ID="lblMSG" runat="server" Text=""></asp:Label>
                                                        <span class="close-alert">X</span>
                                                        </div>



                                </div>
                                                      




                               
                                <div class="form-group">
                                    <label for="">
                                        Job Title</label>
                                   <%-- <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>--%>
                                    <asp:TextBox ID="txtJobTitle" runat="server" class="form-control" placeholder="Enter job title"></asp:TextBox>



                                </div>

                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="">
                                                Experience</label>
                                            <asp:dropdownlist ID="drdExp" class="form-control select2" runat="server">
<asp:ListItem Text="Select Experience" Value="0"></asp:ListItem>
</asp:dropdownlist>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="">
                                                Expected Salary</label>
                                            <asp:TextBox ID="txtSalary" runat="server" class="form-control" placeholder="Enter job title"></asp:TextBox>


                                        </div>
                                    </div>
                                </div>

                                  <div class="row">
                                 <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="">
                                        Select Qualification</label>



                                <asp:DropDownList ID="drdQualification" class="form-control" runat="server">
<asp:ListItem Text="Select Qualification" Value="0"></asp:ListItem>
</asp:DropDownList>


                                     </div>
                                </div>


                               <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="">
                                                Other Education</label>
                                            <asp:TextBox ID="txtEducation" runat="server" class="form-control" placeholder="Enter Other Education"></asp:TextBox>


                                        </div>
                                    </div>

                                      </div>

                                
                                  <div class="row">
                                         <div class="col-sm-6">

                                <div class="form-group">
                                    <label for="">
                                        Job Preferred State</label>
                                    
                                    <asp:DropDownList ID="drdState" runat="server" class="form-control" AutoPostBack="true" 
            onselectedindexchanged="drdState_SelectedIndexChanged">
<asp:ListItem Text="Select Job Preferred State " Value="0"></asp:ListItem>
</asp:DropDownList>
                                   </div>
                                </div>

                                  <div class="col-sm-6">
                                 <div class="form-group">
                                    <label for="">Job Preferred City</label>
                                <asp:DropDownList ID="drdCity" class="form-control" runat="server">
<asp:ListItem Text="Select Job Preferred City" Value="0"></asp:ListItem>
</asp:DropDownList>
</div>
                                      </div>

                                      </div>


                                 <div class="row">


                                      <div class="col-sm-6">
                                <div class="form-group">
                                    <label for=""> Job Type</label>
                                    
                                      <asp:DropDownList ID="drdJobType" class="form-control" runat="server">
                                        <asp:ListItem Text="Select Job Type" Value="0"></asp:ListItem>
                                                                           
                                 </asp:DropDownList>
                                   </div>
                                </div>


                                      <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="">
                                                    Description</label>
                                                
                                               <asp:TextBox ID="txtDes" TextMode="MultiLine" class="form-control" placeholder="Enter Your Description" runat="server"></asp:TextBox>


                                            </div>
                                        </div>


                                      <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="">
                                                    Upload CV</label>
                                                
                      <asp:FileUpload ID="fileUpCV" ToolTip="Upload Your CV" runat="server"></asp:FileUpload>
               <asp:Label ID="lblfup" runat="server"></asp:Label>
                   <asp:HiddenField ID="hdfCV" runat="server"></asp:HiddenField>

                                            </div>
                                        </div>
                                     

                                     </div>


                                
                           
                                <div class="form-buttons-w">
                             
                                    <asp:button Id="btnSubmit" Onclick="btnSubmit_Click" runat="server" class="btn btn-primary" text="Submit" />

                                </div>
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

