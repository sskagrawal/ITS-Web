<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Product.ascx.cs" Inherits="Controle_Product" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Admin/PagingControl.ascx" TagName="PagingControl" TagPrefix="uc1" %>

 <script type="text/javascript">

         function showimagepreview(input) {
            if (input.files && input.files[0]) {
                var filerdr = new FileReader();
                filerdr.onload = function (e) {
                    $('#<%=imgMainProduct.ClientID %>').attr('src', e.target.result);
                }
                filerdr.readAsDataURL(input.files[0]);
                }
         }


      function showimagepreview1(input) {
            if (input.files && input.files[0]) {
                var filerdr = new FileReader();
                filerdr.onload = function (e) {
                    $('#<%=imgShowcase.ClientID %>').attr('src', e.target.result);
                }
                filerdr.readAsDataURL(input.files[0]);
                }
         }


     

    </script>

  <asp:HiddenField ID="hdfProdSpfID" runat="server" />
 <asp:HiddenField ID="hdfPrdSpfID" runat="server" />    
<asp:HiddenField ID="hdfSizeID" runat="server" />
<asp:HiddenField ID="hdfUserID" runat="server" />
<asp:HiddenField ID="hdfShowCaseId" runat="server" />
    <div class="content-w">
        <!--------------------
                START - Breadcrumbs
                -------------------->
        <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item">Product Manager</li>
            <li class="breadcrumb-item"><span>Add New Product</span></li>
        </ul>
        <!-------------------- 
                END - Breadcrumbs
                --------------------> 
        <div class="content-panel-toggler"><i class="os-icon os-icon-grid-squares-22"></i><span>Sidebar</span></div>
        <div class="content-i">
            <div class="content-box">
                <div class="element-wrapper">
                    <div class="element-box"><h5 class="form-header">Add Update Product</h5>
                         <div class="alert alert-success" runat="server" id="divMsg" visible="false">
                                      <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                           </div>
                        <div>
                            <asp:HiddenField ID="hdfProductId" runat="server" />
                            <div class="steps-w">


                                <div class="step-triggers">                                    
                                    <a class="step-trigger active" href="#stepContent1" id="tab1">Product Basic Information</a>
                                    <a class="step-trigger" href="#stepContent2" id="tab2">Size and Quantity</a>
                                    <a class="step-trigger" href="#stepContent3" id="tab3">Product Specification</a>
                                    <a class="step-trigger" href="#stepContent4" id="tab4">Product Images</a>

                                </div>


                                <div class="step-contents">
                                    <div class="step-content active" id="stepContent1">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">Product Name</label><%--<input class="form-control" placeholder="First Name" type="text">--%>
                                                    <asp:TextBox ID="TxtprodctN" class="form-control" placeholder="Product Name"  runat="server"></asp:TextBox></div>
                                              
                                                  <asp:RequiredFieldValidator ID="rfvProductName" runat="server" ControlToValidate="TxtprodctN"
                                             Display="None" ErrorMessage="Product Name" ForeColor="Red" SetFocusOnError="True"
                                            ValidationGroup="sv">*****</asp:RequiredFieldValidator>

                                           <asp:ValidatorCalloutExtender ID="VCErfvProductName"
                                            runat="server" Enabled="True" TargetControlID="rfvProductName" WarningIconImageUrl="../img/wrning.gif">
                                        </asp:ValidatorCalloutExtender>
                                            </div>
                                                                                                          
                                            <div class="col-sm-6">
                                                <div class="form-group">



                                                  <label for="">Category</label><%--<input class="form-control" placeholder="First Name" type="text">--%>
                                                    <asp:DropDownList ID="Drdcategory" class="form-control" runat="server" OnSelectedIndexChanged="Drdcategory_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>


                                               
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">

                                                       <label for="">Sub Category</label><%--<input class="form-control" placeholder="First Name" type="text">--%>
                                                    <asp:DropDownList ID="DrdSubcat" class="form-control" runat="server" OnSelectedIndexChanged="DrdSubcat_SelectedIndexChanged" AutoPostBack="true">
                                                             <asp:ListItem Selected="True" Value="0">Select Sub Category</asp:ListItem>
                                                    </asp:DropDownList>
                                                    
                                                    
                                                </div>
                                            </div>



                                             <div class="col-sm-6">
                                                <div class="form-group">
                                                   <label for="">Child Category</label><%--<input class="form-control" placeholder="First Name" type="text">--%>
                                                    <asp:DropDownList ID="ddlChildCategory" class="form-control" runat="server">

                                                        <asp:ListItem Selected="True" Value="0">Select Child Category</asp:ListItem>

                                                    </asp:DropDownList>

                                                </div>
                                            </div>




                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                   <label for="">Home Category</label><%--<input class="form-control" placeholder="First Name" type="text">--%>
                                                    <asp:DropDownList ID="DrdHomecat" class="form-control" runat="server"></asp:DropDownList>

                                                </div>
                                            </div>

                                              <div class="col-sm-6">
                                                <div class="form-group">
                                                  <label for="">Meta Title</label>
                                                    <asp:TextBox ID="Txtmetakey" MaxLength="60" class="form-control" runat="server"></asp:TextBox>
                                                  
                                                    </div>

                                                 </div>
                                                



                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">

                                                     <label for="">Full Description</label>
                                                      <asp:TextBox ID="txtFullDescription" runat="server" class="form-control" TextMode="MultiLine"
                                            Height="100px" placeholder="Enter Description"></asp:TextBox>


                                                  
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                  
                                                      <label for="">Meta Description</label><%--<input class="form-control" placeholder="Last Name" type="text">--%>
                                                    <asp:TextBox ID="Txtmeta" TextMode="MultiLine" MaxLength="150"  Height="100px" class="form-control" runat="server"></asp:TextBox>
                                                                                                                                                       

                                                    
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                  <label for="">Shipping Type</label>
                                                    <asp:DropDownList ID="ddlShipType" runat="server" onchange="changShip()" CssClass="form-control">
                                                        <asp:ListItem Value="Free">Free</asp:ListItem>
                                                        <asp:ListItem Value="Chargable">Chargable</asp:ListItem>
                                                    </asp:DropDownList>
                                                    </div>

                                                 </div>
                                             <div class="col-sm-6" id="shipChargeDiv" style="display:none">
                                                <div class="form-group">
                                                  <label for="">Shipping Charge</label>
                                                    <asp:TextBox ID="txtShipCharg" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>

                                                 </div>
                                        </div>


<fieldset>
    <legend>Upload Product Images</legend>

                                        <div class="row">
                                          
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <h6 class="form-header">Main Product Image</h6>       
                                                    
                                         <div id="UplFromComp" style="padding:5px;">
                                        <asp:FileUpload ID="FileUpload1" runat="server"  onchange="showimagepreview(this)"/>
                                               </div>                                                                                               
                                                                                                 
                                              <asp:HiddenField ID="hdfUpload1" runat="server" />                                                        
                                                    
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="FileUpload1"
                                            Display="None" ErrorMessage="Please Upload File" ForeColor="Red" SetFocusOnError="True"
                                            ValidationGroup="sv1">*</asp:RequiredFieldValidator>

                                                 
                                                                                      
                                               

                                                </div>
                                            </div>


                                             <div class="col-sm-4">     

                                                   <div class="form-group">


                                                         <asp:Image ID="imgMainProduct" runat="server" Width="110px" Height="120px" BorderColor="#333333"
                                                            BorderStyle="Solid" BorderWidth="1px" EnableViewState="False" ViewStateMode="Disabled" />


                                                          <br />
                                                          <p class="help-block">Image Size:(370px X 370px)</p>
                                                    
                                                       </div>


                                                 </div>




                                            <div class="col-sm-4">
                                            <div class="form-group">                                                   
                                            <label for="">Status</label>
                                            <asp:RadioButtonList ID="rdbStatus" RepeatDirection="Horizontal" runat="server">
                                            <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                                            <asp:ListItem Text="In-Active" Value="In-Active"></asp:ListItem>
                                           </asp:RadioButtonList>
                                              </div>

                                            </div>

                                        </div>                                                      
                                        <div class="form-buttons-w text-left"><%--<a class="btn btn-primary step-trigger-btn" href="#stepContent2">Continue</a>--%>
                                            <asp:Button ID="Button1"  OnClick="btnSubmit_Click" runat="server" class="btn btn-primary" ValidationGroup="sv" Text="Save & Continue " />
                                         
                                              <%-- <input id="btnNextprd" type="button" value="Next" onclick="tab2()" class="btn btn-success" />--%>
                                            
                                               <asp:HiddenField ID="hdfid" runat="server" />                                      
                                         <%--<a class="btn btn-primary step-trigger-btn" href="#stepContent2">Continue</a>--%>
                                         <%--   <asp:Button ID="Button2" class="btn btn-primary step-trigger-btn"  runat="server" Text="Save & View " />--%>
                                        
                                         <%--<a class="btn btn-primary step-trigger-btn" href="#stepContent2">Continue</a>--%>
                                         <%--   <asp:Button ID="Button3" class="btn btn-primary step-trigger-btn"  runat="server" Text="Reset " />--%>
                                         </div>
                                     </fieldset>           

                                    </div>


                   

                                      <div class="step-content" id="stepContent2">
                                        <h5 class="form-header">Size and Quantity</h5>
                                             <div class="row">
                                                   <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">Select Size</label>
                                                    <asp:DropDownList ID="ddlSize" class="form-control" runat="server">

                                                    </asp:DropDownList>                                             
                                                    
                                                </div>
                                            </div>
                                       
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                   <label for="">Selling Price</label>
                                                        <div class="input-group">
                                                            <div class="input-group-addon">
                                                                    Rs.</div>
                                                    <asp:TextBox ID="txtSellingPrice"  class="form-control" runat="server"></asp:TextBox>

                                                            </div>

                                                </div>
                                            </div>
                                        </div>



                                          <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="">Stocks</label>
                                                        <div class="input-group">
                                                            <div class="input-group-addon">
                                                                    Stocks in Number</div>                              

                                                    <asp:TextBox ID="txtStocks"  class="form-control" placeholder="Products Stocks" runat="server"></asp:TextBox>
                                                       </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                        <label for="">MRP Price</label>
                                                     <div class="input-group">
                                                            <div class="input-group-addon">
                                                                    Rs.</div>                                               
                                                    <asp:TextBox ID="txtMrpPrice" placeholder="MRP Price" class="form-control" runat="server"></asp:TextBox>
                                                         </div>

                                                </div>
                                            </div>
                                        </div>

                                          

                                          <div class="form-buttons-w">
                                                <asp:Button ID="btnSave"  OnClick="btnSave_Click" CssClass="btn btn-primary" runat="server" Text="Save" />

                                                   <input id="btnNext3" type="button" value="Back" onclick="tab1()" class="btn btn-info" />
                                                    <input id="btnNext" type="button" value="Next" onclick="tab3()" class="btn btn-success" />

                                           
                                            
                                          </div>




                                          <hr />
                                            <div class="row">
                                               
                                                <div class="table-responsive">

                                <asp:GridView ID="gvSize" runat="server" AutoGenerateColumns="false" EmptyDataText="Result Not Found"
                                    Width="100%" CssClass="table full-color-table full-info-table hover-table" PagerStyle-CssClass="odd gradeA"
                                    AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false" AllowPaging="true"
                                    PageSize="10">
                                     <AlternatingRowStyle BackColor="#F7F7F7"/>
                                    <Columns>

                                    
                                      <asp:TemplateField HeaderText="SNo">
                                            <HeaderStyle HorizontalAlign="Center"/>
                                            <ItemStyle />
                                            <ItemTemplate>
                               <asp:Label ID="lblSRNO" runat="server" Text='<%#Container.DataItemIndex+1 %>'>
                               </asp:Label>

                                              </ItemTemplate>
                                        </asp:TemplateField>



                                     <asp:TemplateField HeaderText="Size Name">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                                <%#Eval("Size_name")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                          <asp:TemplateField HeaderText="Selling">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                                <%#Eval("SellingPrice")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="MRP">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                                <%#Eval("MrpPrice")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                   
                                        <asp:TemplateField HeaderText="Stocks">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                                <%#Eval("Stocks")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                          <asp:TemplateField HeaderText="Remain Stocks">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                                <%#Eval("RemainingStocks")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Edit">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" /> 
                                            <ItemTemplate>
                                                <asp:HiddenField ID="hdfSizeID" runat="server" Value='<%#Eval("ProductSize_id")%>' />
                                               <asp:ImageButton ID="imgbtnEdit" runat="server" ImageAlign="Middle" OnClick="Edit_Click" ToolTip="Edit" ImageUrl ="../img/icon_edit.gif" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                      
                                        <asp:TemplateField HeaderText="Delete">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>                                                 
                                                <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle"  OnClick ="Edit_Click"   ToolTip="Delete Record" ImageUrl="../img/icon_delete.gif" />
                                              
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>

                                     <FooterStyle BackColor="#B5C7DE" ForeColor="#2cabe3" />
                                            <HeaderStyle BackColor="#2cabe3" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <PagerSettings Visible="False"></PagerSettings>
                                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                            <SelectedRowStyle BackColor="#738A9C"  ForeColor="#F7F7F7" />
                                            <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                            <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                            <SortedDescendingHeaderStyle BackColor="#3E3277" />  

                                </asp:GridView>
                                  <uc1:PagingControl ID="CustPager" runat="server" OnPageChanged="CustPager_PageChanged" />
      </div>




                                                </div>



                                     </div>



                                      <div class="step-content" id="stepContent3">
                                        <h5 class="form-header">Product Specification</h5>

                                            <fieldset>
                                    <legend>Product Specification</legend>


                                                
                                          <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">

                                                    <label for=""> Product Specification</label>

                                                        <div class="input-group">

                                                            <div class="input-group-addon">
                                                                   </div>
                                               

                                                    <asp:TextBox ID="txtProductSpecification"  class="form-control" placeholder="Product Specification" runat="server"></asp:TextBox>
                                                       </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">

                                                        <label for="">Specification Value</label>
                                                     <div class="input-group">

                                                            <div class="input-group-addon">
                                                                    </div>
                                               
                                                    <asp:TextBox ID="txtSpecifValue" placeholder="Specification Value" class="form-control" runat="server"></asp:TextBox>
                                                         </div>

                                                </div>
                                            </div>
                                        </div>



                                          
                                                 <div class="form-buttons-w">
                                                       <asp:Button ID="btnSpeci" OnClick="btnSpeci_Click"  CssClass="btn btn-primary" runat="server" Text="Save" />
                                                 <%--   <asp:Button ID="btnSpeciCancel" OnClick="btnSpeciCancel_Click" CssClass="btn btn-danger" runat="server" Text="Cancel" />--%>
                                                      <%-- <asp:Button ID="btnprdSpecNext" OnClick="btnprdSpecNext_Click" CssClass="btn btn-success" runat="server" Text="Next" />--%>

                                                     <input id="btnNextspe" type="button" value="Back" onclick="tab2()" class="btn btn-info" />
                                                    <input id="btnNextsep" type="button" value="Next" onclick="tab4()" class="btn btn-success" />


                                                     </div>




                                          <hr />



                        <div class="row">
                                               
                             <div class="table-responsive">
                                <asp:GridView ID="gvSpecification" runat="server" AutoGenerateColumns="false" EmptyDataText="Result Not Found"
                                    Width="100%" CssClass="table full-color-table full-info-table hover-table" PagerStyle-CssClass="odd gradeA"
                                    AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false" AllowPaging="true"
                                    PageSize="10">
                                     <AlternatingRowStyle BackColor="#F7F7F7"/>
                                    <Columns>

                                    
                                      <asp:TemplateField HeaderText="SNo">
                                            <HeaderStyle HorizontalAlign="Center"/>
                                            <ItemStyle />
                                            <ItemTemplate>
                               <asp:Label ID="lblSRNO" runat="server" Text='<%#Container.DataItemIndex+1 %>'>
                               </asp:Label>

                                              </ItemTemplate>
                                        </asp:TemplateField>



                                     <asp:TemplateField HeaderText="Specification">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                                <%#Eval("Specification_name")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                          <asp:TemplateField HeaderText="Specification_value">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle />
                                            <ItemTemplate>
                                                <%#Eval("Specification_value")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>                                  
                                                         
                                                                              
                                          
                                        <asp:TemplateField HeaderText="Edit">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" /> 
                                            <ItemTemplate>

                                                <asp:HiddenField ID="hdfSpeciId" runat="server" Value='<%#Eval("Prod_Specification_ID")%>' />

                                               <asp:ImageButton ID="imgbtnEdit1" runat="server" ImageAlign="Middle" OnClick="Edit_Click1" ToolTip="Edit" ImageUrl ="../img/icon_edit.gif" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                      
                                        <asp:TemplateField HeaderText="Delete">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>

                                                 
                                                <asp:ImageButton ID="imgbtnDelete1" runat="server" ImageAlign="Middle"  OnClick ="Edit_Click1"   ToolTip="Delete Record" ImageUrl="../img/icon_delete.gif" />
                                              
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       
                                    </Columns>

                                     <FooterStyle BackColor="#B5C7DE" ForeColor="#2cabe3" />
                                            <HeaderStyle BackColor="#2cabe3" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <PagerSettings Visible="False"></PagerSettings>
                                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                            <SelectedRowStyle BackColor="#738A9C"  ForeColor="#F7F7F7" />
                                            <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                            <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                            <SortedDescendingHeaderStyle BackColor="#3E3277" />  

                                </asp:GridView>
                                <%--  <uc1:PagingControl ID="PagingControl1" runat="server" OnPageChanged="PagingControl1_PageChanged"  />--%>
      </div>




                                                </div>
                                   
                                        </fieldset>        



                                        </div>



                                    <div class="step-content" id="stepContent4">
                                        <h5 class="form-header">Product Show Case Images</h5>
                                             <div class="row">

                                                    <div class="col-sm-6">
                                                <div class="form-group">
                                                    <h6 class="form-header">Show Case Image</h6>                                                    
                                        <div id="UplFromComp1" style="padding:5px;">
                                        <asp:FileUpload ID="fuShowCase" runat="server"  onchange="showimagepreview1(this)"/>
                                               </div>                                                                                               
                                                                                                 
                                              <asp:HiddenField ID="hdfShowcase" runat="server" />     
                                                    
                                            <asp:RequiredFieldValidator ID="tfrvShowCase" runat="server" ControlToValidate="fuShowCase"
                                            Display="None" ErrorMessage="Please Upload File" ForeColor="Red" SetFocusOnError="True"
                                            ValidationGroup="sv1">*</asp:RequiredFieldValidator>

                                                  
                                               

                                                </div>
                                            </div>


                                             <div class="col-sm-6"> 

                                                   <div class="form-group">
                                                         <asp:Image ID="imgShowcase" runat="server" Width="110px" Height="120px" BorderColor="#333333"
                                                            BorderStyle="Solid" BorderWidth="1px" EnableViewState="False" ViewStateMode="Disabled" />

                                                         <br />
                                                             <p class="help-block">Image Size:(370px X 370px)</p>                                        

                                                       </div>
                                                 </div>
                                                  </div>

                        <div class="form-buttons-w">        

                     <asp:Button ID="btnSubmitPhoto" OnClick="btnSubmitPhoto_Click" CssClass="btn btn-primary" runat="server" Text="Save Photo " />
                          <input id="btnNextphoto" type="button" value="Back" onclick="tab3()" class="btn btn-success" />
                        <%--    <asp:Button ID="btnPhotoBack" OnClick="btnPhotoBack_Click"  CssClass="btn btn-success" runat="server" Text="Back" />--%>
                            
                       </div>       
                                        
                                        
                                        
                                                           
                                          <hr class="h-50" />
                                            <div class="row">
                                               
                                                <div class="table-responsive">

                                <asp:GridView ID="gvProductImage" runat="server" AutoGenerateColumns="false" EmptyDataText="Result Not Found"
                                    Width="100%" CssClass="table full-color-table full-info-table hover-table" PagerStyle-CssClass="odd gradeA"
                                    AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false" AllowPaging="true"
                                    PageSize="10">
                                     <AlternatingRowStyle BackColor="#F7F7F7"/>
                                    <Columns>

                                    
                                      <asp:TemplateField HeaderText="SNo">
                                            <HeaderStyle HorizontalAlign="Center"/>
                                            <ItemStyle />
                                            <ItemTemplate>
                               <asp:Label ID="lblSRNO" runat="server" Text='<%#Container.DataItemIndex+1 %>'>
                               </asp:Label>

                                              </ItemTemplate>
                                        </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Show Case Images">
                               <ItemTemplate>                         
                                    <img src='../../Product_image/<%#Eval("Product_Photo")%>' class="img-thumbnail" alt="image" style="width:70px;height:70px;"/>
                                                                     
                               </ItemTemplate>
                               </asp:TemplateField>                               

                                        <asp:TemplateField HeaderText="Edit">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" /> 
                                            <ItemTemplate>

                                                <asp:HiddenField ID="hdfPrd_Photoid" runat="server" Value='<%#Eval("Prd_PhotoId")%>' />

                                               <asp:ImageButton ID="imgbtnEdit" runat="server" ImageAlign="Middle" OnClick="Edit_Photo_Click" ToolTip="Edit Photo" ImageUrl ="../img/icon_edit.gif" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                      
                                        <asp:TemplateField HeaderText="Delete">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>

                                                 
                                                <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle"  OnClick ="Edit_Photo_Click"   ToolTip="Delete Photo" ImageUrl="../img/icon_delete.gif" />
                                              
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>

                                     <FooterStyle BackColor="#B5C7DE" ForeColor="#2cabe3" />
                                            <HeaderStyle BackColor="#2cabe3" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <PagerSettings Visible="False"></PagerSettings>
                                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                            <SelectedRowStyle BackColor="#738A9C"  ForeColor="#F7F7F7" />
                                            <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                            <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                            <SortedDescendingHeaderStyle BackColor="#3E3277" />  

                                </asp:GridView>
                                  <uc1:PagingControl ID="PagingControl1" runat="server" OnPageChanged="CustPager_PageChanged" />
      </div>




                                                </div>



                                     </div>

                                     
                                        
                                    </div>
                              



                                     </div>

                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
     
        <div class="display-type"></div>
      
<script src="../../js/jquery-1.12.4.js"></script>

<script type="text/javascript">
           function tab1() {
               $("#tab1").addClass('active');
              $("#stepContent1").addClass('active');
              $("#tab2").removeClass('active');
              $("#stepContent2").removeClass('active');
              $("#tab3").removeClass('active');
              $("#stepContent3").removeClass('active');
              $("#tab4").removeClass('active');
              $("#stepContent4").removeClass('active');
             

           }
           function tab2() {
               $("#tab1").removeClass('active');
               $("#stepContent1").removeClass('active');
               $("#tab2").addClass('active');
               $("#stepContent2").addClass('active');
               $("#tab3").removeClass('active');
               $("#stepContent3").removeClass('active');
               $("#tab4").removeClass('active');
               $("#stepContent4").removeClass('active');

           }
           function tab3() {
               $("#tab1").removeClass('active');
               $("#stepContent1").removeClass('active');
               $("#tab2").removeClass('active');
               $("#stepContent2").removeClass('active');
               $("#tab3").addClass('active');
               $("#stepContent3").addClass('active');
               $("#tab4").removeClass('active');
               $("#stepContent4").removeClass('active');

           }

           function tab4() {
               $("#tab1").removeClass('active');
               $("#stepContent1").removeClass('active');
               $("#tab2").removeClass('active');
               $("#stepContent2").removeClass('active');
               $("#tab3").removeClass('active');
               $("#stepContent3").removeClass('active');
               $("#tab4").addClass('active');
               $("#stepContent4").addClass('active');

           }
           function changShip()
           {
               if ($('#<%=ddlShipType.ClientID%>').val() == "Chargable")
               {
                   document.getElementById("shipChargeDiv").style.display = "block";
               }
               else
               {
                   document.getElementById("shipChargeDiv").style.display = "none";
               }
               
               
           }

      </script>