<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddKeywordByExcel.aspx.cs" Inherits="Admin_Master_AddKeywordByExcel" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register src="../PagingControl.ascx" tagname="PagingControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <asp:HiddenField ID="hdfkywrd_id" runat="server" />

     <!--------------------START - Breadcrumbs-------------------->
  <ul class="breadcrumb">
  <li class="breadcrumb-item"><a href="#">Home</a></li>
  <li class="breadcrumb-item"><a href="#">Add Keyword by Excelsheet</a></li>
  </ul>
  <!--------------------END - Breadcrumbs-------------------->
  <div class="content-i">
  <div class="content-box">
  <div class="row">
  
  <div class="col-lg-12">
  <div class="element-wrapper">
  <h6 class="element-header">Add Keyword by Excelsheet</h6>
  <div class="element-box">

 <%-- <h5 class="form-header">Add Update Job Skill</h5>--%>
 <%-- <div class="form-desc">Discharge best employed your phase each the of shine. Be met even reason consider logbook redesigns. Never a turned interfaces among asking</div>--%>
  <div class="alert alert-success alert-dismissible fade show" visible="false" runat="server" ID="alert">
 <button aria-label="Close" class="close" data-dismiss="alert" type="button">
 <span aria-hidden="true"> ×</span>
 </button>
     <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
 </div>


       <div class="form-group row">

        
         

  <label class="col-form-label col-sm-2" for="">Select Category</label>
  <div class="col-sm-4">

      <asp:DropDownList ID="ddlCategory" class="form-control" runat="server">


      </asp:DropDownList>

  
         <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ControlToValidate="ddlCategory"
                                            ErrorMessage="Select Category" InitialValue="0" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>

                                             <asp:ValidatorCalloutExtender ID="VCECategoty" 
                                            runat="server" Enabled="True" TargetControlID="rfvCategory" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 
  </div>


          

  </div>     


      
                   <div class="col-md-12">
                       <div class="row">
                        <div class="col-sm-4">
                             <div style="width:200px;margin:0 auto;">
                                 
                                 <a href="../../KeywordExcelFile/KeywordSheet.xlsx" class="btn btn-primary btn-rounded waves-effect waves-light" style="color:white;" >

                                     <span class="btn-label" style="color:white;"><i class="fas fa-download"></i>
                                          </span> Download Excel Format </a>
                                    
                              </div><br />
                      </div>


                       

                             <div class="col-md-3">
                                           <div class="input-group m-b-10">
                                                <span >Browse Excel File</span>
                                                <asp:FileUpload ID="fuFile" runat="server" />
                                            </div>
                                       </div>



                  </div>
                       </div>



                  
                    <div class="clearfix"></div>
                                  
                                       <div class="col-md-12 text-center">
                                            <asp:LinkButton ID="btnUploadData" runat="server" OnClick="btnUploadData_Click" CssClass="btn btn-success waves-effect waves-light" ValidationGroup="saveBasic">
                                                <span class="btn-label"><i class="fa fa-upload"></i></span>Upload</asp:LinkButton>
                                        </div> 
  
  
  <div class="col-md-12">
  <br />                       
            


  
  <div class="table-responsive">      

      <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" Font-Size="12px" EmptyDataText="Result Not Found" Width="100%" CssClass="table table-hover table-bordered table-condensed" PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false" AllowPaging="true" PageSize="10" ><%--PagerSettings-Visible="false" AllowPaging="true" PageSize="10"--%>
                                   
     <Columns>
                                     
                                       
                                        <asp:TemplateField HeaderText="SNo." HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>                                            
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                          <asp:TemplateField HeaderText="Caregory" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                             <%#Eval("Industry")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>                                    


                                        <asp:TemplateField HeaderText="Keyword" HeaderStyle-BackColor="#047BF8" HeaderStyle-ForeColor="white">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                             <%#Eval("Keyword")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                    </Columns>
                                </asp:GridView>
         <uc1:PagingControl  ID="CustPager" OnPageChanged="CustPager_PageChanged" runat="server" />


</div>
  
  </div>

     
  </div>
  </div></div>
  </div>


     

  
</div></div>
 <script type="text/javascript">
     function HideLabel() {
         var seconds = 5;
         setTimeout(function () {
             document.getElementById("<%=alert.ClientID %>").style.display = "none";
         }, seconds * 1000);
     };
</script><script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

