<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="cart-list.aspx.cs" Inherits="Client_Panel_WorkStreamList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        textarea#ContentPlaceHolder1_txtMsgRpl {
    width: 100%;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdfCompPartyId" runat="server" />
    <asp:HiddenField ID="hdfJobId" runat="server" />
    <div class="content-i">
        <div class="content-box">
            <div class="app-email-w">
                <div class="app-email-i">
                      <div class="ae-content-w">
                           <div class="ae-content">
                                <div class="alert alert-success" role="alert" runat="server" visible="false" id="alertDiv">
                                                <asp:Label ID="lblMsg" runat="server"></asp:Label></div>
                                  <div class="aec-reply" id="replyBx" runat="server">
                        <div class="reply-header">
                            <h5>Reply to <asp:Label ID="lblReplyTo" runat="server"></asp:Label></h5>
                        </div>
                                      <asp:TextBox ID="txtMsgRpl" runat="server" TextMode="MultiLine" Columns="80" Rows="5"></asp:TextBox>
                       <%-- <textarea cols="80" id="ckeditorEmail" name="ckeditor1" rows="5"></textarea>--%>
                                      <div class="buttons-w">
                                           <div class="actions-left">
                                               <asp:RadioButtonList ID="rblStatus" runat="server" RepeatDirection="Horizontal" Width="200">
                                                   <asp:ListItem>Work Done</asp:ListItem>
                                                   <asp:ListItem>Reject</asp:ListItem>
                                               </asp:RadioButtonList>
                                               </div>
                            <div class="actions-left">
                                <label>
                                Attachments</label>
                                <asp:FileUpload ID="fuAttachment" runat="server" />
                                <asp:HiddenField ID="hdfFile" runat="server" />
                                <%--<a class="btn btn-link" href="#"><i class="os-icon os-icon-ui-51"></i><span>Add Attachment</span></a>--%>

                            </div>
                                          
                            <div class="actions-right">
                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-success" runat="server" OnClick="LinkButton1_Click"><i class="os-icon os-icon-mail-18"></i><span>Send</span></asp:LinkButton>
                               <%-- <a class="btn btn-success" href="#"><i class="os-icon os-icon-mail-18"></i><span>Send Message</span></a>--%>

                            </div>
                        </div>
                    </div>
                               </div>
                          </div>
                    <div class="clearfix"></div>
                    <div class="ae-list-w" id="msgList" runat="server">
                        <div class="ael-head">
                            <div class="actions-left">
                                <select>
                                    <option>Sort by date</option>
                                </select>
                            </div>
                            <div class="actions-right">
                                <asp:Button ID="btnComplPrj" OnClick="btnComplPrj_Click" Visible="false" runat="server" CssClass="btn btn-rounded btn-success" Text="Complete Project" />
                             <%--   <a href="#" class="btn btn-rounded btn-success">Complete Project</a>--%>
                                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"><i class="os-icon os-icon-grid-18"></i></asp:LinkButton>
                                <%--<a href="#"><i class="os-icon os-icon-grid-18"></i></a>--%>

                            </div>
                        </div>
                        <div class="ae-list">
                            <asp:DataList ID="DataList1" runat="server" Width="100%" OnItemDataBound="DataList1_ItemDataBound">
                                <ItemTemplate>
                                    <br />
                                    <div class="ae-item with-status active status-green">
                                       <%-- <div class="aei-image">
                                            <div class="user-avatar-w">
                                                <img alt="" src="img/avatar1.jpg">
                                            </div>
                                        </div>--%>
                                        <div class="aei-content">
                                            <div class="aei-timestamp"><%# Eval("AddedOn","{0:dd/MM/yyyy HH:MM}")%></div>
                                            <h6 class="aei-title"><%# Eval("Contact_person_name")%> &nbsp;&nbsp;&nbsp;&nbsp;
                                                
                                                <asp:Label ID="lblReplSt" runat="server" Font-Bold="true" Text='<%# Eval("ReplyStatus")%>'></asp:Label>
                                            </h6>
                                            <div class="aei-sub-title"><%# Eval("job_Title")%></div>
                                            <div class="aei-text"><%# Eval("Messagedet")%></div>
                                            <a href="<%# Eval("AttachmentFile")%>"><%# Eval("AttachmentFile")%></a>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                               

                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
    

</asp:Content>

