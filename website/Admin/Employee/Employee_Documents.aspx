<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Employee_Documents.aspx.cs" Inherits="Admin_Employee_Employee_Documents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <asp:HiddenField ID="hdfImage" runat="server" />
      <asp:HiddenField ID="hdfID" runat="server" />
      <asp:HiddenField ID="hdfUserID" runat="server" />
  <!--------------------START - Breadcrumbs-------------------->
  <ul class="breadcrumb">
  <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
  <li class="breadcrumb-item"><a href="#">Enroll Student Form</a></li>
 <%-- <li class="breadcrumb-item">
  <span>Laptop with retina screen</span></li>--%>
  </ul>
  <!--------------------END - Breadcrumbs-------------------->
  <div class="content-i">
  <div class="content-box">
  <div class="row">
  
  <div class="col-lg-12">
  <div class="element-wrapper">
  <h6 class="element-header">Employee Documents Form</h6>
  <div class="element-box">

  <h5 class="form-header">Employee Documents Form</h5>



       <script type="text/javascript">
                             function HideLabel() {
                                 var seconds = 5;
                                 setTimeout(function () {
                                     document.getElementById("<%=alert.ClientID %>").style.display = "none";
                                 }, seconds * 1000);
                             };
                            </script> 



  <div class="alert alert-success alert-dismissible fade show" visible="false" runat="server" ID="alert">
 <button aria-label="Close" class="close" data-dismiss="alert" type="button">
 <span aria-hidden="true"> ×</span>
 </button>


     <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
 </div>




       
                                                                          
            <fieldset class="form-group">
            <legend><span>Upload Documents</span></legend>   
                
                 <div class="row">    
                                
                   
                    
                      <div class="col-lg-4">  
                  <div class="form-group">
                  <label for="exampleInputEmail1">Employee Name:</label>

                      <asp:DropDownList ID="drdEmployee"  class="form-control" runat="server">
                            
              
                          </asp:DropDownList>
                     </div>

                      </div> 



                   



                      <div class="col-lg-4">  
                  <div class="form-group">
                  <label for="exampleInputEmail1">Documents:</label>
              
                     <asp:DropDownList ID="drdDocument" class="form-control" runat="server" AutoPostBack="true">
                         
                             <asp:ListItem Value="0">Select Document</asp:ListItem>
                             <asp:ListItem Value="1 Semester">Aadhar Card</asp:ListItem>
                             <asp:ListItem Value="2 Semester"> Pan Card </asp:ListItem> 
                             <asp:ListItem Value="3 Semester">3 Voter Id</asp:ListItem>  
                             <asp:ListItem Value="4 Semester">4 Passport</asp:ListItem>  
                         
                            
                          </asp:DropDownList>
                        
     
                      
                      
                       </div>

                      </div>  
                     
                                <div class="col-lg-4">  
                  <div class="form-group">
                  <label for="exampleInputEmail1">upload Docuemnt:</label>


                <asp:FileUpload ID="fluPorUpload" class="form-control" runat="server" />
                    
                       </div>

                      </div>  
                     
                        
                     
                     </div> 

                 <div class="form-buttons-w">
      
     <asp:Button ID="btnSubmit"    class="btn btn-primary"  runat="server" Text="Submit" onClick="btnSubmit_Click" />
    
      
  </div>


                </fieldset>

               <br />   <br />

  

                 <h5 class="form-header">Uploaded Document</h5>

      


      
                     <%-- <fieldset class="form-group">
                                    <legend><span>Search</span></legend>
                                    <div class="row">
                                   
                                      
                                        <div class="col-md-3">
                                            <label for="exampleInputEmail1">
                                                Select Option</label>
                                            <div class="form-group">
                                                <asp:DropDownList ID="drdmultisearch" CssClass="form-control" runat="server">
                                                   
                                                     <asp:ListItem Text="Select Search" Value="0"></asp:ListItem>
                                                  
                                                    
                                                      <asp:ListItem Text="Enrollment_No" Value="Enrollment_No">Enrollment No.</asp:ListItem>
                                                      <asp:ListItem Text="Semester" Value="Semester">Semester</asp:ListItem>
                                                   

                                                   
                                               
                                                    
                                                     </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <label for="exampleInputEmail1">
                                                Select Search</label>
                                            <div class="form-group">
                                                <asp:TextBox ID="txtSearch" CssClass="form-control" placeholder="Enter Search Value"
                                                    runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-2" style="padding-top: 24px">
                                            <div class="form-group">
                                                <asp:Button ID="btnbtnSearch"  runat="server" class="btn btn-primary" OnClick="btnbtnSearch_Click"
                                                    Text="Search" />
                                            </div>
                                        </div>


                                         <div class="col-md-2" style="padding-top: 24px">
                                            <div class="form-group">
                                                <asp:Button ID="btnReset"  runat="server" class="btn btn-primary" OnClick="btnReset_Click"
                                                    Text="Reset" />
                                            </div>
                                        </div>




                                    </div>
                                </fieldset>--%>



                 <div class="table-responsive">
                        <asp:GridView ID="grdDocument" runat="server" AutoGenerateColumns="false" Font-Size="12px"
                            EmptyDataText="Result Not Found" Width="100%" CssClass="table table-lightborder table-bordered table-hover"
                            PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false"
                            AllowPaging="true" PageSize="10">
                            <Columns>
                                <asp:TemplateField HeaderText="S No.">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>                                    

                                   <asp:TemplateField HeaderText="Document">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>

                                         <img src='../../Employee_Document_File/<%#Eval("Upload_Document")%>' style="width:50px;height:50px;" alt="image" />
                                          
                                             
                              
                                    </ItemTemplate>
                                </asp:TemplateField>                             



                              
                                     <asp:TemplateField HeaderText="Employee Name">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Employee_Name")%>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Document Name">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Document_Name")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                          
                              





                                <asp:TemplateField HeaderText="Edit">
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>


                                          <asp:HiddenField ID="hdfEdit" Value='<%#Eval("Employee_Document_ID")%>' runat="server" />



                                        <asp:ImageButton ID="imgbtnUpdate" runat="server" ImageAlign="Middle" onClick="imgbtnUpdate_Click"
                                            ToolTip="Update" ImageUrl="~/Admin/img/pensil.png" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete">
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>

                                         <asp:HiddenField ID="hdfDel" Value='<%#Eval("Employee_Document_ID")%>' runat="server" />
                                        <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle" onClick="imgbtnDelete_Click"
                                            ToolTip="Delete" ImageUrl="~/Admin/img/Delete_Record.png" />
                                       
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>


                     </div>
  </div>
  </div></div>
  </div>
  
</div>
      </div>
    
     <script src="../../js/jquery-1.12.4.js"></script>
</asp:Content>

