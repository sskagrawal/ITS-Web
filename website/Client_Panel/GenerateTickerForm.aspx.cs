using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Drawing2D;
using System.Drawing;
using System.IO;
using System.Configuration;
using System.Net.Mail;
public partial class Client_Panel_GenerateTickerForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {


            //if (Session["sridd"] != null)
            //{
            //    hdfUserID.Value = Session["sridd"].ToString();

            //    BindService();

            //    GetSequenceNo();


            //}


            if (Session["partyid"] != null)
            {
                hdfUserID.Value = Session["partyid"].ToString();
                  BindService();
                GetSequenceNo();

                BindDetail();

            }






        }
    }

    public void BindDetail()
    {


        DataTable dt = DataAccess.GetData("Select [Contact_person_name],[Email]  from [PartyMaster] where [PartyID]=" + hdfUserID.Value + " ");
        if (dt.Rows.Count > 0)
        {
            txtFullName.Text = dt.Rows[0]["Contact_person_name"].ToString();
            txtemail.Text = dt.Rows[0]["Email"].ToString();
           
        }


    }

    public void BindService()
    {  

        drdRelatedService.Items.Clear();
        ListItem intItem = new ListItem("Select Services", "-1");
        drdRelatedService.Items.Add(intItem);
        DataTable dt = DataAccess.GetData("select * from [Category] ");
        foreach (DataRow dr in dt.Rows)
        {
            ListItem item = new ListItem(dr["CategoryName"].ToString().Trim(), dr["CatID"].ToString());
            drdRelatedService.Items.Add(item);
        }



    }


    private void GetSequenceNo()
    {

        string MaxID = string.Empty;

        try
        {

            MaxID = DataAccess.GetSingleValue("select top 1 [TicketNo] from [Client_Support] order by [Ticket_Id] desc ");

        }
        catch { }     

        int TicketNo = 0;
        if (MaxID != string.Empty)
        {
            TicketNo = Convert.ToInt32(MaxID) + 1;
        }

        else
        {
            TicketNo = 1;
        }
        lblMsg.Text = TicketNo.ToString();

       
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        

        string Result = string.Empty;

        try
        {
            if (fuFile.HasFile)
            {
                if (File.Exists(Server.MapPath("SupportFile/" + hdfFile.Value)))
                {
                    File.Delete(Server.MapPath("SupportFile/" + hdfFile.Value));
                }

                fuFile.SaveAs(Server.MapPath("../SupportFile/" + fuFile.FileName));
                hdfFile.Value = fuFile.FileName;
            }

            if (hdfTicketID.Value == string.Empty)
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO [Client_Support]([TicketNo],[Cust_Name],[Email],[Subject],[Department],[Services],[Message],[AttachFile],[CreatedOn]) VALUES(@TicketNo,@Cust_Name,@Email,@Subject,@Department,@Services,@Message,@AttachFile,@CreatedOn)");
                cmd.Parameters.AddWithValue("@TicketNo", lblMsg.Text);
                cmd.Parameters.AddWithValue("@Cust_Name", txtFullName.Text);
                cmd.Parameters.AddWithValue("@Email", txtemail.Text);
                cmd.Parameters.AddWithValue("@Subject", txtSubject.Text);
                cmd.Parameters.AddWithValue("@Department", drdDepartment.SelectedValue);
                cmd.Parameters.AddWithValue("@Services", drdRelatedService.SelectedValue);
                cmd.Parameters.AddWithValue("@Message", txtMessage.Text);
                cmd.Parameters.AddWithValue("@AttachFile", hdfFile.Value);
                cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
                DataAccess.InsertExecuteNonQuery(cmd);
                alert.Visible = true;
                lblMsg.Text = "Record Saved Successfully";


                SendMessage();
            }
           
        }
        catch(Exception ex)
        {

           

        }

        Clr();
    }

    public void SendMessage()
    {


        string _EmailBody = "Dear Mr/Miss Admin ";
        _EmailBody += "<br/> New Enquiry Its Gwalior";
        _EmailBody += "<br/><br/> Contact Details are given below";
        _EmailBody += "<br/><br/> Full Name: " + txtFullName.Text;     
        _EmailBody += "<br/><br/> E-mail :   " + txtemail.Text;
        _EmailBody += "<br/><br/> Subject:  " + txtSubject.Text;   
        _EmailBody += "<br/><br/> Message:  " + txtMessage.Text;

        string from = ConfigurationManager.AppSettings["MailUsername"].ToString();
        string To = ConfigurationManager.AppSettings["AdminMailID"].ToString();
      //  string To = txtemail.Text.ToString();
        string subject = "Thank you for contacting us. One of our agents will get back to you as soon as possible. When replying, please make sure that the ticket ID is kept in the subject line to ensure that your replies are tracked. <br/>If you wish to send additional comments, please don't open a new ticket. Simply login using the link above and update the ticket. <br/>Thanks & Regards";     
        SendMail.SendWebEmail(from, To, subject, _EmailBody);
        lblMsg.Text = "Successfully Sent";

        ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
      


    }

    private void Clr()
    {
        txtFullName.Text = string.Empty;
        txtemail.Text = string.Empty;
        txtSubject.Text = string.Empty;
        drdDepartment.ClearSelection();
        drdRelatedService.ClearSelection();
        txtMessage.Text = string.Empty;
        hdfFile.Value = string.Empty;       
       

    }

   
}