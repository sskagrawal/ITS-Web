using System.Net;
using System.Net.Mail;
using System;
using System.Data.SqlClient;
using System.Data;
using System.Threading;
using System.Configuration;

using System.Web;


public static class SendMail
    {
        static SendMail()
        {
            //
            // TODO: Add constructor logic here
            //
        }


    public static void SendWebEmail(string From, string To, string subject, string Body)
    {
        try
        {
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.To.Add(To);
            mail.From = new MailAddress(From, "itsgwalior.com", System.Text.Encoding.UTF8);
            mail.Subject = subject;
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = Body;
            mail.BodyEncoding = System.Text.Encoding.UTF8;

            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;
            SmtpClient client = new SmtpClient();
            client.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["MailUsername"].ToString(), ConfigurationManager.AppSettings["MailPassword"].ToString());
            client.Port = 25;
            client.Host = "mail.itsgwalior.com";
            client.Send(mail);
        }
        catch (Exception ex)
        {

        }



    }

    public static void SendEmail(MailMessage E_mail)
        {
            //try
            //{
                SmtpClient smtp = new SmtpClient();
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                NetworkCredential UserDetails = new NetworkCredential(ConfigurationManager.AppSettings["MailUsername"].ToString(), ConfigurationManager.AppSettings["MailPassword"].ToString());
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = UserDetails;
                
                smtp.Host = "mail.shakyasamaj.com";
                smtp.Port = 25;
                smtp.EnableSsl = true;
                smtp.Send(E_mail);
            //}
            //catch (Exception ex) { }
        }

    public static void SendEmail(string From, string To, string subject, string Body, string AttchFile)
    {
        System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
        mail.To.Add(To);
        mail.From = new MailAddress(From, "ITS Gwalior Web Services", System.Text.Encoding.UTF8);
        mail.Subject = subject;
        mail.SubjectEncoding = System.Text.Encoding.UTF8;
        mail.Body = Body;
        mail.BodyEncoding = System.Text.Encoding.UTF8;
        if (AttchFile.Length > 0)
        {
            Attachment att = new Attachment(HttpContext.Current.Server.MapPath(VirtualPathUtility.ToAbsolute("~/CV/" + AttchFile)));
            mail.Attachments.Add(att);
        }

        //if (AttchFile.Length > 0)
        //{
        //    Attachment att = new Attachment(HttpContext.Current.Server.MapPath(VirtualPathUtility.ToAbsolute("~/ClientContractDoc/" + AttchFile)));
        //    mail.Attachments.Add(att);
        //}


        mail.IsBodyHtml = true;
        mail.Priority = MailPriority.High;
        SmtpClient client = new SmtpClient();
        client.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["MailUsername"].ToString(), ConfigurationManager.AppSettings["MailPassword"].ToString());
        client.Port = 25;
        client.Host = "mail.itsgwalior.com";
        client.Send(mail);

      

    }


    public static void SendEmailClient(string From, string To, string subject, string Body,string AttchFile, string AttchFile1, string AttchFile2)
        {
        System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
        mail.To.Add(To);
        mail.From = new MailAddress(From, "ITS Gwalior Web Services", System.Text.Encoding.UTF8);
        mail.Subject = subject;
        mail.SubjectEncoding = System.Text.Encoding.UTF8;
        mail.Body = Body;
        mail.BodyEncoding = System.Text.Encoding.UTF8;     

        if (AttchFile.Length > 0)
        {
            Attachment att = new Attachment(HttpContext.Current.Server.MapPath(VirtualPathUtility.ToAbsolute("~/ClientContractDoc/" + AttchFile)));
            mail.Attachments.Add(att);
        }


        if (AttchFile1.Length > 0)
        {
            Attachment att1 = new Attachment(HttpContext.Current.Server.MapPath(VirtualPathUtility.ToAbsolute("~/ClientContractDoc/" + AttchFile1)));
            mail.Attachments.Add(att1);
        }

        if (AttchFile2.Length > 0)
        {
            Attachment att2 = new Attachment(HttpContext.Current.Server.MapPath(VirtualPathUtility.ToAbsolute("~/ClientContractDoc/" + AttchFile2)));
            mail.Attachments.Add(att2);
        }



        mail.IsBodyHtml = true;
        mail.Priority = MailPriority.High;
        SmtpClient client = new SmtpClient();
        client.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["MailUsername"].ToString(), ConfigurationManager.AppSettings["MailPassword"].ToString());
        client.Port = 25;
        client.Host = "mail.itsgwalior.com";
        client.Send(mail);     

    }

    public static void SendEmailTicket(string From, string To, string subject, string Body, string AttchFile)
    {

        //SqlCommand cmd = new SqlCommand("INSERT INTO [SYS_Emails] ([Email_To] ,[Email_Body] ,[Email_Subject] ,[Email_From] ,[Email_Status] ,[Sent_Time] ,[Created_On]) VALUES (@Email_To ,@Email_Body ,@Email_Subject ,@Email_From ,@Email_Status ,@Sent_Time ,@Created_On)");
        //cmd.Parameters.AddWithValue("@Email_To", To);
        //cmd.Parameters.AddWithValue("@Email_Body", Body);
        //cmd.Parameters.AddWithValue("@Email_Subject", subject);
        //cmd.Parameters.AddWithValue("@Email_From", From);
        //cmd.Parameters.AddWithValue("@Email_Status", "NotSent");
        //cmd.Parameters.AddWithValue("@Sent_Time", "");
        //cmd.Parameters.AddWithValue("@Created_On", DateTime.Now);
        //DataAccess.InsertExecuteNonQuery(cmd);


        //Thread t = new Thread(ProcessEmails);          // Kick off a new thread
        //t.Start();    
        ////ProcessEmails();

        MailMessage mail = new MailMessage(From, To);
        mail.SubjectEncoding = System.Text.Encoding.UTF8;
        mail.Subject = subject;
        mail.BodyEncoding = System.Text.Encoding.UTF8;
        if (AttchFile.Length > 0)
        {
            Attachment att = new Attachment(HttpContext.Current.Server.MapPath(VirtualPathUtility.ToAbsolute("~/Ticket/" + AttchFile)));
            mail.Attachments.Add(att);
        }
        mail.IsBodyHtml = true;
        mail.Body = Body;

        SendEmail(mail);

    }

    private static void ProcessEmails()
        {

            DataTable dt = DataAccess.GetData("SELECT * FROM [SYS_Emails] WHERE Email_Status = 'NotSent'");
            foreach (DataRow Row in dt.Rows)
            {
                try
                {
                    //Make EMail
                    MailMessage mail = new MailMessage(Row["Email_From"].ToString(), Row["Email_To"].ToString());
                    mail.SubjectEncoding = System.Text.Encoding.UTF8;
                    mail.Subject = Row["Email_Subject"].ToString();
                    mail.BodyEncoding = System.Text.Encoding.UTF8;
                    mail.IsBodyHtml = true;
                    mail.Body = Row["Email_Body"].ToString();
                   
                    SendEmail(mail);
                   
                    //UpdateStatus
                    SqlCommand cmdupdate = new SqlCommand("UPDATE [SYS_Emails] SET [Email_Status] = @Email_Status ,[Sent_Time] = @Sent_Time WHERE [Email_ID] = @Email_ID");
                    cmdupdate.Parameters.AddWithValue("@Email_Status", "Sent");
                    cmdupdate.Parameters.AddWithValue("@Sent_Time", DateTime.Now);
                    cmdupdate.Parameters.AddWithValue("@Email_ID", Row["Email_ID"].ToString());
                    DataAccess.InsertExecuteNonQuery(cmdupdate);
                }
                catch(Exception ex)
                {
                    //UpdateStatus
                    SqlCommand cmdupdate = new SqlCommand("UPDATE [SYS_Emails] SET [Email_Status] = @Email_Status ,[Sent_Time] = @Sent_Time WHERE [Email_ID] = @Email_ID");
                    cmdupdate.Parameters.AddWithValue("@Email_Status", "Fail");
                    cmdupdate.Parameters.AddWithValue("@Sent_Time", DateTime.Now);
                    cmdupdate.Parameters.AddWithValue("@Email_ID", Row["Email_ID"].ToString());
                    DataAccess.InsertExecuteNonQuery(cmdupdate);
                }
            }
        }

        public static void ProcessFailEmails()
        {

            DataTable dt = DataAccess.GetData("SELECT * FROM [SYS_Emails] WHERE Email_Status = 'Fail'");
            foreach (DataRow Row in dt.Rows)
            {
                try
                {
                    //Make EMail
                    MailMessage mail = new MailMessage(Row["Email_From"].ToString(), Row["Email_To"].ToString());
                    mail.SubjectEncoding = System.Text.Encoding.UTF8;
                    mail.Subject = Row["Email_Subject"].ToString();
                    mail.BodyEncoding = System.Text.Encoding.UTF8;
                    mail.IsBodyHtml = true;
                    mail.Body = Row["Email_Body"].ToString();
                    SendEmail(mail);

                    //UpdateStatus
                    SqlCommand cmdupdate = new SqlCommand("UPDATE [SYS_Emails] SET [Email_Status] = @Email_Status ,[Sent_Time] = @Sent_Time WHERE [Email_ID] = @Email_ID");
                    cmdupdate.Parameters.AddWithValue("@Email_Status", "Sent");
                    cmdupdate.Parameters.AddWithValue("@Sent_Time", DateTime.Now);
                    cmdupdate.Parameters.AddWithValue("@Email_ID", Row["Email_ID"].ToString());
                    DataAccess.InsertExecuteNonQuery(cmdupdate);
                }
                catch
                {
                    //UpdateStatus
                    SqlCommand cmdupdate = new SqlCommand("UPDATE [SYS_Emails] SET [Email_Status] = @Email_Status ,[Sent_Time] = @Sent_Time WHERE [Email_ID] = @Email_ID");
                    cmdupdate.Parameters.AddWithValue("@Email_Status", "Fail");
                    cmdupdate.Parameters.AddWithValue("@Sent_Time", DateTime.Now);
                    cmdupdate.Parameters.AddWithValue("@Email_ID", Row["Email_ID"].ToString());
                    DataAccess.InsertExecuteNonQuery(cmdupdate);
                }
            }
        }

        //private void SendMail()
        //{
        //    System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage();

        //    mailMessage.From = new MailAddress("YOUR EMAIL ADDRESS HERE");
        //    mailMessage.To.Add(new MailAddress("YOUR EMAIL ADDRESS HERE"));

        //    mailMessage.Subject = txtSubject.Text.Trim();
        //    mailMessage.Body = txtBody.Text.Trim();

        //    SmtpClient smtpClient = new SmtpClient();
        //    Object userState = mailMessage;

        //    //Attach event handler for async callback
        //    smtpClient.SendCompleted += new SendCompletedEventHandler(smtpClient_SendCompleted);

        //    try
        //    {
        //        //Send the email asynchronously
        //        smtpClient.SendAsync(mailMessage, userState);
        //    }
        //    catch (SmtpException smtpEx)
        //    {
        //        //Error handling here
        //    }
        //    catch (Exception ex)
        //    {
        //        //Error handling here
        //    }
        //}

        ///// <summary>
        ///// Event handler for processing completion information after asynchronous email sent.
        ///// </summary>
        //void smtpClient_SendCompleted(object sender, System.ComponentModel.AsyncCompletedEventArgs e)
        //{

        //    //Get UserState as MailMessage instance from SendMail()
        //    MailMessage mailMessage = e.UserState as MailMessage;

        //    if (e.Cancelled)
        //    {
        //      //  labMessage.Text = "Sending of email message was cancelled. Address=" + mailMessage.To[0].Address;
        //    }

        //    if (e.Error != null)
        //    {
        //      //  labMessage.Text = "Error occured, info=" + e.Error.Message;
        //    }
        //    else
        //    {
        //        //labMessage.Text = "Mail sent successfully";
        //    }

        //}

    }
