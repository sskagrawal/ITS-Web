<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CourseEnquiryControl.ascx.cs" Inherits="Controle_CourseEnquiryControl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:HiddenField ID="hdfUserID" runat="server" />
<aside class='blog-widget-area widget-area'>

    <asp:HiddenField ID="hdfCourse" runat="server" />

    <div id="Div1" runat="server">
    <div id="respond" class="comment-respond">     
     
        <div runat="server" id="alert" class="alert success" visible="false">
            <asp:Label ID="lblMSG" class="alert-message" runat="server" Text=""></asp:Label>
            <span class="close-alert">X</span>
        </div>


        <script type="text/javascript">
            function HideLabel() {
                var seconds = 9;
                setTimeout(function () {
                    document.getElementById("<%=alert.ClientID %>").style.display = "none";
                }, seconds * 1000);
            };
        </script>

        <div class="comment-form">
             <div class="row">
                 <div class="col-sm-6" >
                  <div class="form-group">

                        <label>Select Course *</label>
           <asp:DropDownList ID="ddlCourse" class="ninzio-placeholder" runat="server">
           <asp:ListItem Value="0" Selected="True">Select Course</asp:ListItem>
           <asp:ListItem Value="Digital-Marketing">Digital Marketing Course</asp:ListItem>
           <asp:ListItem Value="WebDesigning-SEO-Marketing">WebDesigning SEO-Marketing Course</asp:ListItem>
           <asp:ListItem Value="Web-Development-SEO">Web Development SEO Course</asp:ListItem>
           <asp:ListItem Value="Search-Engine-Optimization">Search Engine Optimization Course</asp:ListItem>
           <asp:ListItem Value="Social-Media-Marketing">Social Media Marketing Course</asp:ListItem>
           <asp:ListItem Value="Google-Digital-Marketing">Google Digital Marketing Course</asp:ListItem>
           <asp:ListItem Value="Sales-Lead-Generation">Sales Lead Generation Course</asp:ListItem>
           <asp:ListItem Value="Web-Design">Web Design Course</asp:ListItem>
           <asp:ListItem Value="UI-UX-Design">UI-UX Design Course</asp:ListItem>
           <asp:ListItem Value="WordPress web Design">WordPress web Design Course</asp:ListItem> 
                          
           <asp:ListItem Value="Dot-Net-Developer">Dot Net-Developer Course </asp:ListItem>
           <asp:ListItem Value="PHP-Developer">PHP Developer Course</asp:ListItem>
           <asp:ListItem Value="WordPress-web-Design">WordPress web-Design Course</asp:ListItem>
           <asp:ListItem Value="Web-Development">Web Development Course</asp:ListItem>
              
           <asp:ListItem Value="Photoshop">Photoshop Course</asp:ListItem>
           <asp:ListItem Value="Corel-Draw">Corel-Draw Course</asp:ListItem>
           <asp:ListItem Value="Graphic-Design">Graphic-Design Course</asp:ListItem>
           <asp:ListItem Value="Project-Based-Training">Project Based Training Course</asp:ListItem>          
           <asp:ListItem Value="Job-Based-Training">Job Based Training Course</asp:ListItem>
           <asp:ListItem Value="Certificate-Training">Certificate Training Course</asp:ListItem>
           <asp:ListItem Value="Full-Stack-Web-Designer-Course">Full Stack Web Designer Course</asp:ListItem>             
        
            </asp:DropDownList>


               <%--  <asp:RequiredFieldValidator ID="rfvCourse" runat="server" ControlToValidate="ddlCourse"
                    ErrorMessage="Select Course" ForeColor="Red" InitialValue="0" SetFocusOnError="True" ValidationGroup="svreg"
                    Display="None">*</asp:RequiredFieldValidator>

                <asp:ValidatorCalloutExtender ID="VCECourse"
                    runat="server" Enabled="True" TargetControlID="rfvCourse" WarningIconImageUrl="~/img/wrning.gif">
                </asp:ValidatorCalloutExtender>--%>

                   </div>

                   </div>


                 <div class="col-sm-6" >
                  <div class="form-group">

                        <label>Who is *</label>
                  <asp:DropDownList ID="ddlAppStatus" class="ninzio-placeholder" runat="server">
             <asp:ListItem Value="0" Selected="True">Select Status</asp:ListItem>
             <asp:ListItem Value="Students">Students</asp:ListItem>
             <asp:ListItem Value="College">College</asp:ListItem>
             <asp:ListItem Value="Company">Company</asp:ListItem>            
             </asp:DropDownList>

                    <asp:RequiredFieldValidator ID="rfvStatus" runat="server" ControlToValidate="ddlAppStatus"
                    ErrorMessage="Select  Status" ForeColor="Red" InitialValue="0" SetFocusOnError="True" ValidationGroup="svreg"
                    Display="None">*</asp:RequiredFieldValidator>

                <asp:ValidatorCalloutExtender ID="VCEStatus"
                    runat="server" Enabled="True" TargetControlID="rfvStatus" WarningIconImageUrl="../img/wrning.gif">
                </asp:ValidatorCalloutExtender>


                      </div>
                     </div>


                 </div>
         
       
       </div>        
       
         
            <p class="comment-form-author">
                <label>Enter Full Name *</label>
                <asp:TextBox ID="txtName" class="ninzio-placeholder" placeholder="Enter Full Name" runat="server"></asp:TextBox>
              
                  <asp:RequiredFieldValidator ID="rfvfullName" runat="server" ControlToValidate="txtName"
                    ErrorMessage=" Enter full Name" ForeColor="Red" SetFocusOnError="True" ValidationGroup="svreg"
                    Display="None">*</asp:RequiredFieldValidator>

                <asp:ValidatorCalloutExtender ID="VCEFullName"
                    runat="server" Enabled="True" TargetControlID="rfvfullName" WarningIconImageUrl="../img/wrning.gif">
                </asp:ValidatorCalloutExtender>
            </p>


            <p class="comment-form-author">
                <label>Enter Mobile *</label>
                <asp:TextBox ID="txtMobNo" class="ninzio-placeholder" placeholder="Enter Your Mobile No." runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobNo"
                    ErrorMessage="Enter Your Mobile No." ForeColor="Red" SetFocusOnError="True" ValidationGroup="svreg"
                    Display="None">*</asp:RequiredFieldValidator>

                <asp:ValidatorCalloutExtender ID="VCEMobile"
                    runat="server" Enabled="True" TargetControlID="rfvMobile" WarningIconImageUrl="../img/wrning.gif">
                </asp:ValidatorCalloutExtender>
            </p>
            <p class="comment-form-author">
                <label>Enter Email Address</label>
                <asp:TextBox ID="txtEmailID" class="ninzio-placeholder" placeholder="Enter Email Address" runat="server"></asp:TextBox>
              
            </p>

            <p class="comment-form-author">
                <label>Enter City Name*</label>
                <asp:TextBox ID="txtCity" class="ninzio-placeholder" placeholder="Enter City Name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity"
                    ErrorMessage="Enter City Name" ForeColor="Red" SetFocusOnError="True" ValidationGroup="svreg"
                    Display="None">*</asp:RequiredFieldValidator>

                <asp:ValidatorCalloutExtender ID="VCECity"
                    runat="server" Enabled="True" TargetControlID="rfvCity" WarningIconImageUrl="../img/wrning.gif">
                </asp:ValidatorCalloutExtender>
            </p>

      

             <p class="comment-form-author" id="jobTitle">
                <label>Course Training Mode </label>
              
                 <asp:DropDownList ID="ddlCouseMode" class="ninzio-placeholder" runat="server">
                     <asp:ListItem Value="0" Selected="True">Course Training Mode</asp:ListItem>
                     <asp:ListItem Value="Online">Online</asp:ListItem>
                      <asp:ListItem Value="Offline">Offline</asp:ListItem>
                 </asp:DropDownList>


                   <asp:RequiredFieldValidator ID="rfvCourseMode" InitialValue="0" runat="server" ControlToValidate="ddlCouseMode"
                    ErrorMessage="Select Course Training Mode" ForeColor="Red" SetFocusOnError="True" ValidationGroup="svreg"
                    Display="None">*</asp:RequiredFieldValidator>

                <asp:ValidatorCalloutExtender ID="VCEcourseTrainingMode"
                    runat="server" Enabled="True" TargetControlID="rfvCourseMode" WarningIconImageUrl="../img/wrning.gif">
                </asp:ValidatorCalloutExtender>



            </p>
           
         <p class="comment-form-author" id="CourseTerm">
                <label>Course Terms </label>
              
                 <asp:DropDownList ID="ddlCourseTerm" class="ninzio-placeholder" runat="server">
                     <asp:ListItem Value="0" Selected="True">Select Course Terms</asp:ListItem>
                     <asp:ListItem Value="Short Term Course">Short Term Course</asp:ListItem>
                     <asp:ListItem Value="Certification Course">Certification Course</asp:ListItem>
                     <asp:ListItem Value="Professional Course">Professional Course</asp:ListItem>

                 </asp:DropDownList>

                 <asp:RequiredFieldValidator ID="rfvCourseTerm" InitialValue="0" runat="server" ControlToValidate="ddlCourseTerm"
                    ErrorMessage="Select Course Training Mode" ForeColor="Red" SetFocusOnError="True" ValidationGroup="svreg"
                    Display="None">*</asp:RequiredFieldValidator>

                <asp:ValidatorCalloutExtender ID="VCECourseTerms"
                    runat="server" Enabled="True" TargetControlID="rfvCourseTerm" WarningIconImageUrl="../img/wrning.gif">
                </asp:ValidatorCalloutExtender>                 

            </p>
       

            <p>
       
               
                 <asp:LinkButton ID="lbtnSubmit"
                    class="button button-ghost blue full-false medium square icon-true animate-false anim-type-ghost hover-side element-animate-false"
                    ValidationGroup="svreg" runat="server" OnClick="lbtnSubmit_Click"><span class="txt">Submit</span><span class="btn-icon icon-arrow-right10"></span>

                 </asp:LinkButton>


            

            </p>
        </div>
    </div>
   
  
</aside>


