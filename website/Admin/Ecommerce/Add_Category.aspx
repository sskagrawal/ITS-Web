<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Add_Category.aspx.cs" Inherits="Admin_Ecommerce_Add_Category" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Admin/PagingControl.ascx" TagName="PagingControl" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <asp:HiddenField ID="HdfcheckId" runat="server" />
      <asp:HiddenField ID="hdfImage" runat="server" />
    <asp:HiddenField ID="hdfID" runat="server" />
  <!--------------------START - Breadcrumbs-------------------->


  <ul class="breadcrumb">
  <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
  <li class="breadcrumb-item"><a href="#">Add Category</a></li>
 <%-- <li class="breadcrumb-item">
  <span>Laptop with retina screen</span></li>--%>
  </ul>
  <!--------------------END - Breadcrumbs-------------------->
  <div class="content-i">
  <div class="content-box">
  <div class="row">
  
  <div class="col-lg-12">
  <div class="element-wrapper">
  <h6 class="element-header">Add Update Category</h6>
  <div class="element-box">

  <h5 class="form-header">Add Update Category</h5>

  <div class="alert alert-success alert-dismissible fade show" visible="false" runat="server" ID="alert">
 <button aria-label="Close" class="close" data-dismiss="alert" type="button">
 <span aria-hidden="true"> ×</span>
 </button>
     <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
 </div>

      <div class="row">
      <div class="col-sm-8">
   <div class="form-group row">
       
       <label class="col-form-label col-sm-4" for="">Category Name</label>

  <div class="col-sm-8">

      <asp:TextBox ID="txtCategoryName" class="form-control" placeholder="Enter Category Name" runat="server"></asp:TextBox>

       <asp:RequiredFieldValidator ID="rfvcategory" runat="server" ControlToValidate="txtCategoryName"
                                            ErrorMessage="Enter category Name" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sv"
                                            Display="None">*</asp:RequiredFieldValidator>
                                             <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender11" 
                                            runat="server" Enabled="True" TargetControlID="rfvcategory" WarningIconImageUrl="~/img/wrning.gif">
                                        </asp:ValidatorCalloutExtender> 

  </div>
  </div>

      <div class="form-group row"><label class="col-form-label col-sm-4" for="">Sequence No</label>
  <div class="col-sm-8">
      <asp:TextBox ID="TxtSequence"   class="form-control" placeholder="Enter Sequence No" runat="server"></asp:TextBox>
  </div>
  </div>

         <div class="form-group row"><label class="col-form-label col-sm-4" for="">Description</label>
  <div class="col-sm-8">
      <asp:TextBox ID="txtDescription" TextMode="MultiLine"  class="form-control" placeholder="Enter Description" runat="server"></asp:TextBox>
  </div>
  </div>

    
       


       <div class="form-group row"><label class="col-form-label col-sm-4" for="">Icon Image</label>
   <div class="col-sm-8">
      <asp:FileUpload ID="fluPorUpload" class="form-control" runat="server" />
                         
  </div>
  </div>  
  
  <div class="form-buttons-w">
      
      <asp:Button ID="Button1" class="btn btn-primary" OnClick="BtnSubmit" ValidationGroup="sv"  runat="server" Text="Submit"/>
        <asp:Button ID="btnreset" class="btn btn-danger" OnClick="btnreset_Click"  runat="server" Text="Reset"/>
  </div>

  </div>

            <div class="col-sm-1"> </div>

           <div class="col-sm-3">
                                        <div class="element-box el-tablo bg-primary">
                                            <div class="label" style="color:#fff;font-size:16px;">Total Category</div>
                                           
                                          
                                            <div class="trending trending-up" style="margin-left:50px;">
                                             <div class="value">  
                                               <asp:Label ID="lblCategory" runat="server" Text=""></asp:Label> 

                                             </div>
                                            <%-- <i class="os-icon os-icon-arrow-up2"></i>--%>

                                            </div>
                                            
                                            </div>
                                        </div>

</div>

     




        
      <br />
       <h5 class="form-header">View Category</h5>

       <div class="table-responsive">
                        <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" 
                            EmptyDataText="Result Not Found" Width="100%" CssClass="table table-lightborder table-bordered table-hover"
                            PagerStyle-CssClass="odd gradeA" AlternatingRowStyle-CssClass="even gradeC" PagerSettings-Visible="false" OnRowDataBound="grideViewCatogry_RowDataBound"
                            AllowPaging="true" PageSize="10">


                              <AlternatingRowStyle BackColor="#F7F7F7"/>

                            <Columns>



                                


                                <asp:TemplateField HeaderText="SNo.">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>    
                                
                                
                                 <asp:TemplateField HeaderText="MenuIcon">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <img src='../../Cat_menu_icon/<%#Eval("Icon_img")%>' alt="" />
                                    </ItemTemplate>
                                </asp:TemplateField>            


                                <asp:TemplateField HeaderText="Seq.No">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("Sequence_no")%>
                                    </ItemTemplate>
                                </asp:TemplateField>   




                                <asp:TemplateField HeaderText="Category">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("CategoryName")%>
                                    </ItemTemplate>
                                </asp:TemplateField>   
   
   
                                             



                              
                                     <asp:TemplateField HeaderText="Description">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle />
                                    <ItemTemplate>
                                        <%#Eval("CategoryDescription")%>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Edit">
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>


                                          <asp:HiddenField ID="hdfID" Value='<%#Eval("CategoryID")%>' runat="server" />



                                        <asp:ImageButton ID="imgbtnUpdate" runat="server" ImageAlign="Middle" OnClick="Edit"
                                            ToolTip="Update" ImageUrl="~/Admin/img/pensil.png" />
                                    </ItemTemplate>
                                </asp:TemplateField>


                              <%--  <asp:TemplateField HeaderText="Delete">
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnDelete" runat="server" ImageAlign="Middle" OnClick="Edit"
                                            ToolTip="Delete" ImageUrl="~/Admin/img/Delete_Record.png" />
                                        <asp:ConfirmButtonExtender ID="imgbtnactive_ConfirmButtonExtenderDelete" runat="server"
                                            TargetControlID="imgbtnDelete" ConfirmText="Are you sure you want to delete this record ?">
                                        </asp:ConfirmButtonExtender>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>


                                <asp:TemplateField HeaderText="Action">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                    <asp:HiddenField ID="hdfIsActive" runat="server" Value='<%#Eval("Is_active")%>' />
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
                                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                            <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                            <SortedDescendingHeaderStyle BackColor="#3E3277" /> 
                           </asp:GridView>

                      
                        <div style="text-align: center;">
                            <uc1:PagingControl ID="CustPager" OnPageChanged="CustPager_PageChanged" runat="server" />
                        </div>
                    </div>
 
  </div>
 
  </div>
  
</div>


  </div>

      </div>


  </div>
</script><script src="../../js/jquery-1.12.4.js"></script>

</asp:Content>

