<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Newregistration.ascx.cs" Inherits="Controle_WebUserControl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:HiddenField ID="hdfUserID" runat="server" />
<aside class='blog-widget-area widget-area'>

    <asp:HiddenField ID="hdfpartyid" runat="server" />

    <div id="Div1" runat="server" visible="false">
    <div id="respond" class="comment-respond">     
        <div class="col-inner">
            <h3 id="h3_01b4_1" class="vc_custom_heading ninzio-latter-spacing" style="text-align: left;">New Registration</h3>
            <div class="" style="text-align: left;" data-effect="none">
                <div class="nz-separator solid" id="div_01b4_21">&nbsp;</div>
            </div>
        </div>
        <div runat="server" id="alert" class="alert success" visible="false">
            <asp:Label ID="lblMSG" class="alert-message" runat="server" Text=""></asp:Label>
            <span class="close-alert">X</span>
        </div>
        <script type="text/javascript">
            function HideLabel() {
                var seconds = 5;
                setTimeout(function () {
                    document.getElementById("<%=alert.ClientID %>").style.display = "none";
                }, seconds * 1000);
            };
        </script>
        <div class="comment-form">

            <div class="nz-clearfix"></div> 
            <p class="comment-form-author">
                <label>Select User Type</label>
                <asp:DropDownList class="ninzio-placeholder" ID="drdIndustries" runat="server" onchange="getUserType()">
                    <asp:ListItem Text="Select User Type" Value="0"></asp:ListItem>
                </asp:DropDownList>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="drdIndustries"
                    ErrorMessage="Please Select Employee Type" ForeColor="Red" SetFocusOnError="True" ValidationGroup="svreg"
                    Display="None">*</asp:RequiredFieldValidator>

                <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1"
                    runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3" WarningIconImageUrl="~/images/wrning.gif">
                </asp:ValidatorCalloutExtender>

            </p>



            <p class="comment-form-author">
                <label>Enter Name</label>
                <asp:TextBox ID="txtName" class="ninzio-placeholder" placeholder="Enter Your Name *" runat="server"></asp:TextBox>
              
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                    ErrorMessage="Please Enter Your Name" ForeColor="Red" SetFocusOnError="True" ValidationGroup="svreg"
                    Display="None">*</asp:RequiredFieldValidator>

                <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2"
                    runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1" WarningIconImageUrl="~/img/wrning.gif">
                </asp:ValidatorCalloutExtender>
            </p>
            <p class="comment-form-author">
                <label>Enter Mobile no * (User Name)</label>
                <asp:TextBox ID="txtMobNo" class="ninzio-placeholder" placeholder="Enter Your Mobile No. *" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMobNo"
                    ErrorMessage="Please Enter Your Mobile No." ForeColor="Red" SetFocusOnError="True" ValidationGroup="svreg"
                    Display="None">*</asp:RequiredFieldValidator>

                <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender3"
                    runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2" WarningIconImageUrl="~/img/wrning.gif">
                </asp:ValidatorCalloutExtender>
            </p>
            <p class="comment-form-author">
                <label>Enter Email ID</label>
                <asp:TextBox ID="txtEmailID" class="ninzio-placeholder" placeholder="Enter Your Email-ID *" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmailID"
                    ErrorMessage="Please Enter Your Email ID" ForeColor="Red" SetFocusOnError="True" ValidationGroup="svreg"
                    Display="None">*</asp:RequiredFieldValidator>

                <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender4"
                    runat="server" Enabled="True" TargetControlID="RequiredFieldValidator4" WarningIconImageUrl="~/img/wrning.gif">
                </asp:ValidatorCalloutExtender>
            </p>
            <p class="comment-form-author">
                <label>Enter Password</label>
                <asp:TextBox ID="txtPSWD" class="ninzio-placeholder" TextMode="Password" placeholder="Enter Your Password *" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPSWD"
                    ErrorMessage="Please Enter Your Password" ForeColor="Red" SetFocusOnError="True" ValidationGroup="svreg"
                    Display="None">*</asp:RequiredFieldValidator>

                <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender5"
                    runat="server" Enabled="True" TargetControlID="RequiredFieldValidator5" WarningIconImageUrl="~/img/wrning.gif">
                </asp:ValidatorCalloutExtender>
            </p>
             <p class="comment-form-author" id="jobTitle">
                <label>Applied for Job</label>
                <asp:TextBox ID="txtJobTitle" class="ninzio-placeholder" placeholder="Enter Job Title" runat="server"></asp:TextBox>
                
                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtJobTitle"
                    ErrorMessage="Please Enter Job Title " ForeColor="Red" SetFocusOnError="True" ValidationGroup="svreg"
                    Display="None">*</asp:RequiredFieldValidator>

                <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender6"
                    runat="server" Enabled="True" TargetControlID="RequiredFieldValidator6" WarningIconImageUrl="~/img/wrning.gif">
                </asp:ValidatorCalloutExtender>--%>

            </p>
             <p class="comment-form-author" id="uplCV">
                <label>Upload Resume</label>
                 <asp:FileUpload ID="fuUploadResm" runat="server" />
                 <asp:HiddenField ID="hdfCV" runat="server" />
            </p>


            <p>
              <%--  <asp:Button ID="Button1" runat="server"  ValidationGroup="svreg" Text="Submit" OnClick="lbtnSubmit_Click" CssClass="button button-ghost blue full-false medium square icon-true animate-false anim-type-ghost hover-side element-animate-false" />--%>
               
                 <asp:LinkButton ID="lbtnSubmit"
                    class="button button-ghost blue full-false medium square icon-true animate-false anim-type-ghost hover-side element-animate-false"
                    ValidationGroup="svreg" runat="server" OnClick="lbtnSubmit_Click"><span class="txt">Submit</span><span class="btn-icon icon-arrow-right10"></span>

                 </asp:LinkButton>


            </p>
        </div>
    </div>
        </div>



   
   <%--  <div id="Div2" runat="server" visible="false">
    <div id="tag_cloud-2" class="widget widget_tag_cloud">
        <h6 class="widget_title">Advertisement</h6>
        <div class="tagcloud">
            <div class="tagcloud">
                <div class="row">
          <asp:Literal ID="ltrAdsImag" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
    </div>
         </div>--%>
</aside>

<script type="text/javascript">

    function getUserType()
    {
        var userType = document.getElementById('<%=drdIndustries.ClientID %>').options[document.getElementById('<%=drdIndustries.ClientID %>').selectedIndex].value;
        if(userType=="3")
        {
            uplCV.style.display = "block";
            jobTitle.style.display = "block";
        }
        else
        {
            uplCV.style.display = "none";
            jobTitle.style.display = "none";
        }

        
    }
    function getjobTitle()
    {
        
    }
</script>
