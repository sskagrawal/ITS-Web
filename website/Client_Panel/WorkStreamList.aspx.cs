using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Client_Panel_WorkStreamList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["partyid"] != null)
            {
                if (Request.QueryString["jID"] != null)
                {
                    hdfCompPartyId.Value = Session["partyid"].ToString();
                    hdfJobId.Value = Request.QueryString["jID"].ToString();
                    BindGrid();
                }
            }
            else
            {
                Response.Redirect("~/Admin/Login.aspx");
            }
            
        }
    }
    private void BindGrid()
    {
        
        DataTable dt = DataAccess.GetData("select * from [View_JobWorkDetails] where [JobId]=" + hdfJobId.Value+ " order by [ID] desc");
        if (dt.Rows.Count > 0 && dt != null)
        {
            DataList1.DataSource = dt;

            DataList1.DataBind();
            msgList.Visible = true;

           
           
        }
        else
        {
            msgList.Visible = false;
        }
        if (Session["ttppd"] != null)
        {
            if (Session["ttppd"].ToString() == "3")
            {
               DataTable dt1 = DataAccess.GetData("Select Name from [View_FindJob] Where [job_Id] =" + hdfJobId.Value + "");
                if(dt1.Rows.Count>0)
                {
                    lblReplyTo.Text = dt1.Rows[0]["Name"].ToString();
                }
                rblStatus.Visible = false;
            }
            else
            {
                if (Request.QueryString["pid"] != null)
                {
                    DataTable dt2 = DataAccess.GetData("select Contact_person_name from View_ProposalParty where [job_Id]=" + hdfJobId.Value + " and [Proposal_Id]=" + Request.QueryString["pid"].ToString() + "");
                    if(dt2.Rows.Count>0)
                    {
                        lblReplyTo.Text = dt2.Rows[0]["Contact_person_name"].ToString();
                    }
                }
                rblStatus.Visible = true;
            }
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtMsgRpl.Text != string.Empty)
            {
                if(fuAttachment.HasFile)
                {
                    if (File.Exists(Server.MapPath("~/WorkAttachment/" + hdfFile.Value)))
                    {
                        File.Delete(Server.MapPath("~/WorkAttachment/" + hdfFile.Value));
                    }
                    fuAttachment.SaveAs(Server.MapPath("~/WorkAttachment/" + fuAttachment.FileName));
                    hdfFile.Value = fuAttachment.FileName;
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO [JobWorkingDetail]([PartyId],[Messagedet],[JobId],[IsReplied],[AddedOn],[AttachmentFile],[ReplyStatus])VALUES(@PartyId,@Messagedet,@JobId,@IsReplied,@AddedOn,@AttachmentFile,@ReplyStatus)");
                cmd.Parameters.AddWithValue("@PartyId", hdfCompPartyId.Value);
                cmd.Parameters.AddWithValue("@Messagedet", txtMsgRpl.Text);
                cmd.Parameters.AddWithValue("@JobId", hdfJobId.Value);
                cmd.Parameters.AddWithValue("@IsReplied", false);
                cmd.Parameters.AddWithValue("@AttachmentFile",hdfFile.Value);
                cmd.Parameters.AddWithValue("@AddedOn", DateTime.Now);
                cmd.Parameters.AddWithValue("@ReplyStatus", rblStatus.SelectedValue);
                DataAccess.InsertExecuteNonQuery(cmd);
                alertDiv.Visible = true;
                lblMsg.Text = "Your Message Sent Successfully";
                BindGrid();
            }
            else
            {
                alertDiv.Visible = true;
                lblMsg.Text = "Please Enter Message";
            }
        }
        catch(Exception ex)
        {
            alertDiv.Visible = true;
            lblMsg.Text = "Error : "+ex.Message;
        }
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        BindGrid();
    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //HiddenField hdfJOBID1 = e.Item.FindControl("hdfJOBID") as HiddenField;
        Label lblReplSt = e.Item.FindControl("lblReplSt") as Label;
        if(lblReplSt.Text== "Work Done")
        {
            lblReplSt.ForeColor = System.Drawing.Color.Green;
            
            replyBx.Visible = false;
            if (Session["ttppd"] != null)
            {
                if (Session["ttppd"].ToString() == "3")
                {
                    //btnComplPrj.Visible = true;
                }
                else
                {
                    btnComplPrj.Visible = true;
                }
            }
        }
        else
        {
            lblReplSt.ForeColor = System.Drawing.Color.Red;
            //btnComplPrj.Visible = false;
            //replyBx.Visible = true;
        }
    }

    protected void btnComplPrj_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewProposal.aspx?PSLID=" + Request.QueryString["pid"].ToString() + "");
    }
}