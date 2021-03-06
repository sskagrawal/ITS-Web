<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProductList.ascx.cs" Inherits="Controle_ProductList" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Admin/PagingControl.ascx" TagName="PagingControl" TagPrefix="uc1" %>


<asp:HiddenField ID="hdfClientId" runat="server" />


    <div class="content-w">
        <!--------------------
                START - Breadcrumbs
                -------------------->
        <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
            <li class="breadcrumb-item">Product Manager</li>
            <li class="breadcrumb-item"><span>Product List</span></li>
        </ul>
        <!--------------------
                END - Breadcrumbs 
                -------------------->
            <div class="content-panel-toggler"><i class="os-icon os-icon-grid-squares-22"></i><span>Sidebar</span></div><div class="content-i">
                <div class="content-box">
                    <div class="row">
                       <div class="col-lg-12">
                            <div class="element-wrapper">
                                <div class="element-box">

                                    <div class="alert alert-success" runat="server" id="divMsg" visible="false">

                                      <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                                   </div>

                               
                                

                                    <div class="content-box">

                                          <%-- Start Seraching --%> 
               
                      <fieldset class="form-group">
                        <legend><span>Search Profile </span></legend>  
                <div class="row">              
             
            <div class="col-md-3">
              <div class="form-group">
             

                 <asp:DropDownList ID="drdSearch" runat="server" class="form-control">   
                     <asp:ListItem Value="0" Selected="True">Select One</asp:ListItem>
                     <asp:ListItem Value="product_name">Product Name</asp:ListItem>
                   
                 </asp:DropDownList>
              </div>
            
            
            </div>

                    <div class="col-md-3">
              <div class="form-group">

                  <asp:TextBox ID="txtSearch" class="form-control" runat="server"></asp:TextBox>

                  </div>
                        </div>



                     <div class="col-md-2">
              <div class="form-group">
             

                 <asp:DropDownList ID="ddl_Category" runat="server" class="form-control" OnSelectedIndexChanged="ddl_Category_SelectedIndexChanged"  AutoPostBack="true">                   
                                <asp:ListItem Value="0" Selected="True">Select Category</asp:ListItem>
                                
                 </asp:DropDownList>


                
              </div>
            
            
            </div>

                    <div class="col-md-2">
              <div class="form-group">
             

                 <asp:DropDownList ID="ddlsubcategory" runat="server" class="form-control" OnSelectedIndexChanged="ddlsubcategory_SelectedIndexChanged" AutoPostBack="true">                   
                                <asp:ListItem Value="0" Selected="True">Subcategory</asp:ListItem>
                               

                 </asp:DropDownList>


                
              </div>
            
            
            </div>


                     <div class="col-md-2">
              <div class="form-group">            

                 <asp:DropDownList ID="ddlChildCategory" runat="server" class="form-control" OnSelectedIndexChanged="ddlChildCategory_SelectedIndexChanged"  AutoPostBack="true">                   
                                <asp:ListItem Value="0" Selected="True">Child Category</asp:ListItem>
                 </asp:DropDownList>                
              </div>           
            </div>


                     <div class="col-md-3">
              <div class="form-group">            

                 <asp:DropDownList ID="ddlStatus" runat="server" class="form-control" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged"  AutoPostBack="true">                   
                      <asp:ListItem  Selected="True">Select Status</asp:ListItem>
                      <asp:ListItem Value="1">Active</asp:ListItem>
                      <asp:ListItem Value="0">Inactive</asp:ListItem>
                 </asp:DropDownList>                
              </div>           
            </div>

         

                 <div class="col-md-4">
              <div class="form-group">
                   <asp:Button ID="btnSearch" OnClick="btnSearch_Click" class="btn btn-primary" runat="server" Text="Search" /> &nbsp;&nbsp;
                    <asp:Button ID="btnReset" OnClick="btnReset_Click"  class="btn btn-danger" runat="server" Text="Reset" />

                  </div>
                     </div>          
          </div>

                     </fieldset>
                      
               <%-- End Seraching --%>   



                                
                                    </div>


                                    <div class="table-responsive">
                                <asp:HiddenField ID="hdfid" runat="server" />
                                <asp:GridView ID="gv_product"  class="table table-bordered table-striped dataTable" runat="server" AutoGenerateColumns="false" PagerSettings-Visible="false" AllowPaging="true" PageSize="10" OnRowDataBound="gv_product_RowDataBound">

                                       <AlternatingRowStyle BackColor="#F7F7F7"/>
                                <Columns>
                                 
                    
                         <asp:TemplateField >
                            <HeaderTemplate>SN</HeaderTemplate>
                               <ItemTemplate>
                                 <asp:Label ID="Label18" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                               </ItemTemplate>
                          </asp:TemplateField>


                                       <asp:TemplateField HeaderText="ProdPhoto">
                               <ItemTemplate>
                         
                                    <img src='../../Product_image/<%#Eval("Mainproduct_image")%>' class="img-thumbnail" alt="image" style="width:70px;height:70px;"/>
                                  
                                   
                               </ItemTemplate>

                               </asp:TemplateField>


                           <asp:TemplateField HeaderText="ProductName">
                               <ItemTemplate>
                                    <asp:Label ID="lbltName17" runat="server" Text='<%#Eval("product_name")%>'></asp:Label>
                               </ItemTemplate>
                            </asp:TemplateField>


                                     <asp:TemplateField HeaderText="Category">
                               <ItemTemplate>
                              <asp:Label ID="lblCat_name" runat="server" Text='<%#Eval("CategoryName")%>'></asp:Label>
                               </ItemTemplate>
                               </asp:TemplateField>

                                

                                     <asp:TemplateField HeaderText="SubCategory">
                               <ItemTemplate>
                              <asp:Label ID="lblSubcat_name" runat="server" Text='<%#Eval("SubCategoryName")%>'></asp:Label>
                               </ItemTemplate>
                               </asp:TemplateField>
                                    

                                      <asp:TemplateField HeaderText="ChildCategory">
                               <ItemTemplate>
                              <asp:Label ID="lblChildcat_name" runat="server" Text='<%#Eval("ChildCategoryName")%>'></asp:Label>
                               </ItemTemplate>
                               </asp:TemplateField>

                                  <%--   <asp:TemplateField HeaderText="Weight_Price">
                               <ItemTemplate>

                                <asp:HyperLink ID="HyperLinkMember" runat="server" Text="Weight_Price" NavigateUrl='<%#Eval("Product_id", "Add_Updateproduct.aspx?PrdId={0}") %>'></asp:HyperLink><br />                  
                               </ItemTemplate>
                               </asp:TemplateField>--%>

<%--                                     <asp:TemplateField HeaderText="ProductSpecification">
                               <ItemTemplate>
                                 <asp:HyperLink ID="HyperLink1" runat="server" Text="Product Specification" NavigateUrl='<%#Eval("Product_id", "~/Admin/Ecommerce/AppUpdate_Product.aspx?PrdId={0}") %>'></asp:HyperLink><br />                  
                               </ItemTemplate>
                               </asp:TemplateField>
                                    --%>

                                
                             

<%--                                    <asp:TemplateField HeaderText="FullDescription">
                               <ItemTemplate>
                              <asp:Label ID="lbltName7" runat="server" Text='<%#Eval("Full_description")%>'></asp:Label>
                               </ItemTemplate>
                               </asp:TemplateField>         --%>        
                                                                   
                                                                      

                                     <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>

                                   <asp:ImageButton ID="imgbtnEdit" runat="server" ImageAlign="Middle" OnClick="imgbtnEdit_Click"  ToolTip="Edit" ImageUrl="../img/icon_edit.gif" /></button>
                            
                               </ItemTemplate>
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Delete">
                               <ItemTemplate>

                                 

                                 <asp:HiddenField ID="hdf_ID"  runat="server" Value='<%#Eval("Product_id")%>' ></asp:HiddenField>

                              <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle" 
                                                    ToolTip="Delete" OnClick="Delete" ImageUrl="../img/icon_delete.gif"/>
                                 
                                  
                            
                               </ItemTemplate>
                                </asp:TemplateField>



                                         <asp:TemplateField HeaderText="Action">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                    <asp:HiddenField ID="hdfIsActive" runat="server" Value='<%#Eval("Status")%>' />
                                                <asp:ImageButton ID="imgbtnActive" runat="server" ImageAlign="Middle" OnClick="imgbtnActive_Click"
                                                    ToolTip="Active"/>
                                              
                                      

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
  
   
        
        
    
    </div></div>
                       

                        </div>

                            </div>

                        </div>

                 <%--   </div>--%>
                 <%--   </div>--%>
                     <!--------------------
                    START - Chat Popup Box
                    -------------------->
                    <!--------------------
                    END - Chat Popup Box
                    -------------------->

                <!--------------------
                START - Sidebar
                -------------------->
                <!--------------------
                END - Sidebar
                -------------------->

            </div>
   
      <script src="../../js/jquery-1.12.4.js" type="text/javascript"></script>