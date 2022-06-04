<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PagingControl.ascx.cs"
    Inherits="Admin_PagingControl" %>
<table cellpadding="0" cellspacing="0" style="font-size: 8; font-weight: bold;">
    <tr>
        <td style="width: 60px;">
            <asp:DropDownList ID="ddlPageSize" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged" Width="50">
                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                <asp:ListItem Text="20" Value="20"></asp:ListItem>
                <asp:ListItem Text="30" Value="30"></asp:ListItem>
                <asp:ListItem Text="40" Value="40"></asp:ListItem>
                <asp:ListItem Text="50" Value="50"></asp:ListItem>
            </asp:DropDownList>
        </td>
        <td style="width: 20px;">
            <asp:ImageButton ID="imgbtnFirst" runat="server" ImageUrl="~/img/first.jpg" OnClick="imgbtn_Click" />
        </td>
        <td style="width: 20px;">
            <asp:ImageButton ID="imgbtnPerivious" runat="server" ImageUrl="~/img/previous.jpg"
                OnClick="imgbtn_Click" />
        </td>
        <td style="width: 50px;">
            <asp:DropDownList ID="ddlPageNumber" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlPageNumber_SelectedIndexChanged" Width="50">
            </asp:DropDownList>
        </td>
        <td style="width: 20px;">
            <asp:ImageButton ID="imgbtnNext" runat="server" ImageUrl="~/img/next.jpg" OnClick="imgbtn_Click" />
        </td>
        <td style="width: 20px;">
            <asp:ImageButton ID="imgbtnLast" runat="server" ImageUrl="~/img/last.jpg" OnClick="imgbtn_Click" />
        </td>
        <td>
            <asp:Label ID="lblPageIndex" runat="server" Text="Page : "></asp:Label>
        </td>
        <td>
            &nbsp;
            <asp:Label ID="lblTotalPage" runat="server"></asp:Label>
        </td>
        <td>
            &nbsp;of&nbsp;
            <asp:Label ID="lblShowRecords" runat="server"></asp:Label>
        </td>
        <td>
            &nbsp;&nbsp;&nbsp;Total Records :&nbsp;
            <asp:Label ID="lblTotalRecords" runat="server"></asp:Label>
        </td>
    </tr>
</table>
