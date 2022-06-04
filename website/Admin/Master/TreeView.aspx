<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="TreeView.aspx.cs" Inherits="Admin_Master_TreeView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>  
  
        <%--Jquery Code For Check/UnCheck the Checkboxes of Treeview--%>  
  
            <script type="text/javascript">  
                $(function()  
                  {  
                    $("[id*=treeview1] input[type=checkbox]").bind("click", function()  
                        {  
                        var table = $(this).closest("table");  
                        if (table.next().length > 0 && table.next()[0].tagName == "DIV")  
                        {  
                            var childDiv = table.next();  
                            var isChecked = $(this).is(":checked");  
                            $("input[type=checkbox]", childDiv).each(function()  
                                {  
                                if (isChecked)  
                                {  
                                    $(this).attr("checked", "checked");  
                                } else   
                                {  
                                    $(this).removeAttr("checked");  
                                }  
                            });  
                        } else   
                        {  
                            var parentDIV = $(this).closest("DIV");  
                            if ($("input[type=checkbox]", parentDIV).length == $("input[type=checkbox]:checked", parentDIV).length) {  
                                $("input[type=checkbox]", parentDIV.prev()).attr("checked", "checked");  
                            } else  
                            {  
                                $("input[type=checkbox]", parentDIV.prev()).removeAttr("checked");  
                            }  
                        }  
                    });  
                })  
            </script>
<h3>
    Vehicle Details</h3>
<hr />
<asp:TreeView ID="TreeView1" runat="server"  ShowCheckBoxes="All" NodeIndent="15">
    <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
    <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
        NodeSpacing="0px" VerticalPadding="2px"></NodeStyle>
    <ParentNodeStyle Font-Bold="False" />
    <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
        VerticalPadding="0px" />
</asp:TreeView>

</asp:Content>

