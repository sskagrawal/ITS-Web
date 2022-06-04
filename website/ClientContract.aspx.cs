using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using Amity.ERP_Utilities;
using System.Configuration;

public partial class ClientContract : System.Web.UI.Page
{

    
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            FillCountry();
            BindPayMode();
            string script = "$(document).ready(function () { $('[id*=lbtnSubmit]').click(); });";
            ClientScript.RegisterStartupScript(this.GetType(), "load", script, true);
        }
    }
    private void FillCountry()
    {
        ListItem item = new ListItem();
        item.Value = "";
        item.Text = "Select";
        ddlCountry.Items.Add(item);



        DataTable dt = DataAccess.GetData("SELECT  [Country_Id],[Country_Code],[Country_Name],[Country_Call_Code] FROM [Mst_Country_Master]");
        foreach (DataRow row in dt.Rows)
        {
            ListItem item1 = new ListItem();
            item1.Value = row["Country_Id"].ToString();
            item1.Text = row["Country_Name"].ToString();
            ddlCountry.Items.Add(item1);


        }

        ddlCountry.SelectedValue = "India";
    }

    protected void lbtnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            DataTable dtChkMob = DataAccess.GetData("select [PartyID] from [PartyMaster] where mobile_no='" + txtMobNo.Text + "' ");
            if (dtChkMob.Rows.Count > 0)
            {
                alert.Visible = true;
                lblMSG.Text = "This Mobile No is already reistred with us";
            }
            else
            {
                string MaxID = string.Empty;
                string ID_Format = string.Empty;
                ID_Generator ID_Gen = new ID_Generator();

                try
                {
                    MaxID = DataAccess.GetSingleValue("select top 1 PartyCode from PartyMaster  order by PartyID desc");
                }
                catch { }


                ID_Format = "PT-000";
                string var = ID_Gen.GenrateProductID(MaxID, ID_Format);
                string uerPswd = ID_Gen.CreateRandomPassword(6);
                hdfUserPass.Value = uerPswd.ToString();

                SqlCommand cmd = new SqlCommand("INSERT INTO [PartyMaster]([CompanyID],[PartyCode],[Party_Type],[Party_name],[address],[country],[state],[City],[Contact_person_name],[Email],[mobile_no],[phone_no],[UserID],[Createon],[pincode],[cheque_printing_name],[Gst_no],[Party_Category],[Is_active],[PrjDesc],[PrjAmount],[PrjAdvAmt],[PrjDueAmt],[PayMode]) VALUES(@CompanyID,@PartyCode,@Party_Type,@Party_name,@address,@country,@state,@City,@Contact_person_name,@Email,@mobile_no,@phone_no,@UserID,@Createon,@pincode,@cheque_printing_name,@Gst_no,@Party_Category,@Is_active,@PrjDesc,@PrjAmount,@PrjAdvAmt,@PrjDueAmt,@PayMode) select scope_Identity()");
                cmd.Parameters.AddWithValue("@CompanyID", " ");
                cmd.Parameters.AddWithValue("@PartyCode", var);
                cmd.Parameters.AddWithValue("@Party_Type", "4");
                cmd.Parameters.AddWithValue("@Party_name", txtCustName.Text);
                cmd.Parameters.AddWithValue("@address", txtAddr.Text);
                cmd.Parameters.AddWithValue("@country", ddlCountry.SelectedValue);
                cmd.Parameters.AddWithValue("@state", DBNull.Value);
                cmd.Parameters.AddWithValue("@City", string.Empty);
                cmd.Parameters.AddWithValue("@Contact_person_name", txtContPersn.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmailID.Text);
                cmd.Parameters.AddWithValue("@mobile_no", txtMobNo.Text);
                cmd.Parameters.AddWithValue("@phone_no", string.Empty);
                cmd.Parameters.AddWithValue("@UserID", " ");
                cmd.Parameters.AddWithValue("@Createon", DateTime.Now);
                cmd.Parameters.AddWithValue("@pincode", txtZipCode.Text);
                cmd.Parameters.AddWithValue("@cheque_printing_name", string.Empty);
                cmd.Parameters.AddWithValue("@Gst_no", txtgstNumber.Text);
                cmd.Parameters.AddWithValue("@Party_Category", string.Empty);
                cmd.Parameters.AddWithValue("@Is_active", false);
                cmd.Parameters.AddWithValue("@PrjDesc", txtPrjDesc.Text);
              //  cmd.Parameters.AddWithValue("@PrjDocFile", hdfPrjDocFile.Value);
                if (txtPrjAmt.Text != string.Empty)
                {
                    cmd.Parameters.AddWithValue("@PrjAmount", txtPrjAmt.Text);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@PrjAmount", "0");
                }
                if (txtPrjAdvAmt.Text != string.Empty)
                {
                    cmd.Parameters.AddWithValue("@PrjAdvAmt", txtPrjAdvAmt.Text);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@PrjAdvAmt", "0");
                }

                if (txtDueAmt.Text != string.Empty)
                {
                    cmd.Parameters.AddWithValue("@PrjDueAmt", txtDueAmt.Text);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@PrjDueAmt", "0");
                }                    
                //cmd.Parameters.AddWithValue("@ClientAddrProof", hdfClntAddrPrf.Value);
                cmd.Parameters.AddWithValue("@CompReg", hdfCompReg.Value);
                cmd.Parameters.AddWithValue("@PayMode", ddlPayMode.SelectedItem.Text);
                string PartyID = DataAccess.InsertExecuteScalar(cmd);

                hdfPartyId.Value = PartyID.ToString();
                if (PartyID != string.Empty)
                {
                    SqlCommand cmdP = new SqlCommand("INSERT INTO [UserDetails] ([MobileNo],[PassWord],[InActive],[UserTypeID],[Createon],[PartyID],[UserRoleID],[UserName],[Name]) VALUES(@MobileNo,@PassWord,@InActive,@UserTypeID,@Createon,@PartyID,@UserRoleID,@UserName,@Name)");
                    cmdP.Parameters.AddWithValue("@MobileNo", txtMobNo.Text);
                    cmdP.Parameters.AddWithValue("@PassWord", uerPswd);
                    cmdP.Parameters.AddWithValue("@InActive", "True");
                    cmdP.Parameters.AddWithValue("@UserTypeID", "4");
                    cmdP.Parameters.AddWithValue("@Createon", DateTime.Now);
                    cmdP.Parameters.AddWithValue("@PartyID", PartyID);
                    cmdP.Parameters.AddWithValue("@UserRoleID", "4");
                    cmdP.Parameters.AddWithValue("@UserName", txtMobNo.Text);
                    cmdP.Parameters.AddWithValue("@Name", txtContPersn.Text);
                    DataAccess.InsertExecuteNonQuery(cmdP);
                }


                if (fuPrjDocFile.HasFile)
                {
                    if (File.Exists(Server.MapPath("ClientContractDoc/" + hdfPrjDocFile.Value)))
                    {
                        File.Delete(Server.MapPath("ClientContractDoc/" + hdfPrjDocFile.Value));
                    }
                    fuPrjDocFile.SaveAs(Server.MapPath("~/ClientContractDoc/" + fuPrjDocFile.FileName));
                    hdfPrjDocFile.Value = fuPrjDocFile.FileName;
                    SqlCommand cmdPrjFile = new SqlCommand("Insert into [PartyDocument_Master] ([Document_Name],[Upload_File],[PartyID],[CreatedOn]) Values (@Document_Name,@Upload_File,@PartyID ,@CreatedOn) ");
                    cmdPrjFile.Parameters.AddWithValue("@Document_Name", "Project File");
                    cmdPrjFile.Parameters.AddWithValue("@Upload_File", hdfPrjDocFile.Value);
                    cmdPrjFile.Parameters.AddWithValue("@PartyID", PartyID);
                    cmdPrjFile.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
                    DataAccess.InsertExecuteNonQuery(cmdPrjFile);
                }






                



                if (fuClntAddrProof.HasFile)
                {                    
                    if (File.Exists(Server.MapPath("~/ClientContractDoc/" + hdfClntAddrPrf)))
                    {
                        File.Delete(Server.MapPath("~/ClientContractDoc/" + hdfClntAddrPrf));
                    }

                    fuClntAddrProof.SaveAs(Server.MapPath("~/ClientContractDoc/" + fuClntAddrProof.FileName));
                    hdfClntAddrPrf.Value = fuClntAddrProof.FileName;

                    SqlCommand cmdAddP = new SqlCommand("Insert into [PartyDocument_Master] ([Document_Name],[Upload_File],[PartyID],[CreatedOn]) Values (@Document_Name,@Upload_File,@PartyID ,@CreatedOn) ");
                    cmdAddP.Parameters.AddWithValue("@Document_Name", "Client Address Proof");
                    cmdAddP.Parameters.AddWithValue("@Upload_File", hdfClntAddrPrf.Value);
                    cmdAddP.Parameters.AddWithValue("@PartyID", PartyID);
                    cmdAddP.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
                    DataAccess.InsertExecuteNonQuery(cmdAddP);
                }


                




                if (fuCompReNo.HasFile)
                {
                  
                    if (File.Exists(Server.MapPath("~/ClientContractDoc/" + hdfCompReg)))
                    {
                        File.Delete(Server.MapPath("~/ClientContractDoc/" + hdfCompReg));
                    }

                    fuCompReNo.SaveAs(Server.MapPath("~/ClientContractDoc/" + fuCompReNo.FileName));
                    hdfCompReg.Value = fuCompReNo.FileName;

                    SqlCommand cmdCompR = new SqlCommand("Insert into [PartyDocument_Master] ([Document_Name],[Upload_File],[PartyID],[CreatedOn]) Values (@Document_Name,@Upload_File,@PartyID ,@CreatedOn) ");
                    cmdCompR.Parameters.AddWithValue("@Document_Name", "Company Registration");
                    cmdCompR.Parameters.AddWithValue("@Upload_File", hdfCompReg.Value);
                    cmdCompR.Parameters.AddWithValue("@PartyID", PartyID);
                    cmdCompR.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
                    DataAccess.InsertExecuteNonQuery(cmdCompR);

                }




                
           //     string msg = " Hi  " + txtContPersn.Text + " , Welcome to ITS Gwalior, Your user id:-  " + txtMobNo.Text + "   and  Password:-  " + uerPswd + "   Url:- https://itsgwalior.com/ .Your advance amount  " + txtPrjAdvAmt.Text + "  received.";
           ////     string msg = "Hi " + txtContPersn.Text + ", Welcome to ITS Gwalior, Your user id:-" + txtMobNo.Text + " and Password:-" + uerPswd + " Url:- https://itsgwalior.com/ .Your advance amount " + txtPrjAdvAmt.Text + " received.";
           //     if (txtMobNo.Text != string.Empty)
           //     {
           //         SendSMS.ProcessSMS(txtMobNo.Text, msg,"");
           //     }

                //SaveUploadFile(PartyID); 
                            


                string msgCont = "Congratulation!Sir / Mam "+ txtContPersn.Text + ", You are successfully registered with ITS Gwalior, User Name: " + txtMobNo.Text + " ad Password: " + uerPswd + ", For login click here : https://itsgwalior.com.";

                // string msgCont = "Congratualation! You are successfully Registred with us. Your User Name - " + txtMobNo.Text + " and Password - " + uerPswd + ". For Login please contact administrator.";
                SendSMS.ProcessSMS(txtMobNo.Text, msgCont, "1207162460292631960");
                SendMessageClient();
                SendMessage();

                if (ddlPayMode.SelectedItem.Text == "Online" && txtPrjAdvAmt.Text!=string.Empty)
                {
                    string transactionId = String.Format("{0:ddMMyyyyhhmmss}", DateTime.Now);
                    SqlCommand cmd2 = new SqlCommand("INSERT INTO [OnlinePaymentDetail]([TransactionID],[PayAmount],[Currency],[PBillName],[PBillAddr],[PBillCity],[PBillState],[PBillCountry],[PBillMobile],[PBillEmailID],[CreatedOn],[CustPinCode],[PartyID])VALUES(@TransactionID,@PayAmount,@Currency,@PBillName,@PBillAddr,@PBillCity,@PBillState,@PBillCountry,@PBillMobile,@PBillEmailID,@CreatedOn,@CustPinCode,@PartyID);select scope_identity();");
                    //cmd.Parameters.AddWithValue("@OnlinePaymentID",);
                    cmd2.Parameters.AddWithValue("@TransactionID", transactionId);
                    cmd2.Parameters.AddWithValue("@PayAmount", txtPrjAdvAmt.Text);
                    cmd2.Parameters.AddWithValue("@Currency", "INR");
                    cmd2.Parameters.AddWithValue("@PBillName", txtContPersn.Text);
                    cmd2.Parameters.AddWithValue("@PBillAddr", txtAddr.Text);
                    cmd2.Parameters.AddWithValue("@PBillCity", string.Empty);
                    cmd2.Parameters.AddWithValue("@PBillState", string.Empty);
                    cmd2.Parameters.AddWithValue("@PBillCountry", ddlCountry.SelectedValue);
                    cmd2.Parameters.AddWithValue("@PBillMobile", txtMobNo.Text);
                    cmd2.Parameters.AddWithValue("@PBillEmailID", txtEmailID.Text);
                    cmd2.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
                    cmd2.Parameters.AddWithValue("@CustPinCode", txtZipCode.Text);
                    cmd2.Parameters.AddWithValue("@PartyID", PartyID);
                    string ordId = DataAccess.InsertExecuteScalar(cmd2);                 

                    Session["ordId"] = ordId;
                    //   Session["trnsId"] = transactionId;
                    Response.Redirect("selectPayGateway.aspx");
                }    
                
                
                alert.Visible = true;
                lblMSG.Text = "Successfully Saved";
                ClearFields();


            }
        }
        catch(Exception ex)
        {
            alert.Visible = true;
            lblMSG.Text = "Error : " + ex.Message;
        }    
    }
    private void SaveUploadFile(string PartyID)
    {
        //string filename = Path.GetFileName(fuPrjDocFile.PostedFile.FileName);
        //hdfPrjDocFile.Value = Path.GetFileName(fuPrjDocFile.PostedFile.FileName);

        //string extension = Path.GetExtension(filename);
        //string contentType = fuPrjDocFile.PostedFile.ContentType;
        //HttpPostedFile file = fuPrjDocFile.PostedFile;
        //byte[] document = new byte[file.ContentLength];
        //file.InputStream.Read(document, 0, file.ContentLength);
        ////Validations  
        //if ((extension == ".pdf") || (extension == ".doc") || (extension == ".docx") || (extension == ".xls") || (extension == ".jpg") || (extension == ".jpeg") || (extension == ".png"))//extension  
        //{
        //    if (file.ContentLength <= 31457280)//size  
        //    {
        //        fuPrjDocFile.SaveAs(Server.MapPath("~/ClientContractDoc/" + fuPrjDocFile.FileName));
                
                //SqlCommand cmdCV = new SqlCommand("INSERT INTO [CVProfile]([CvName],[Name],[MobileNo],[CrearteOn],[UserID]) VALUES(@CvName,@Name,@MobileNo,@CrearteOn,@UserID)");
                //cmdCV.Parameters.AddWithValue("@CvName", hdfCV.Value);
                //cmdCV.Parameters.AddWithValue("@Name", txtName.Text);
                //cmdCV.Parameters.AddWithValue("@MobileNo", txtMobNo.Text);
                //cmdCV.Parameters.AddWithValue("@CrearteOn", DateTime.Now);
                //cmdCV.Parameters.AddWithValue("@UserID", userid);
                //DataAccess.InsertExecuteNonQuery(cmdCV);
        //    }
        //    else
        //    { Response.Write("Inavlid File size"); return; }
        //}
        //else
        //{
        //    Response.Write("Inavlid File"); return;
        //}
    }


    public void SendMessage()
    {
        if (txtContPersn.Text != string.Empty)
        {
            string _EmailBody = " ";
            _EmailBody += "<table style ='width:60%; border:1px solid black'>";
            _EmailBody += " <tr style = 'border:1px solid black'>";
            _EmailBody += "<th  colspan='2' style = 'border:1px solid black'><h3> ITS gwalior, Client Memorandom Form Details of " + txtContPersn.Text + " </h3></th>";
            _EmailBody += "</tr>";

            _EmailBody += " <tr style = 'border:1px solid black'>";
            _EmailBody += "<td style = 'border:1px solid black'> User Name:</th>";
            _EmailBody += "<td style = 'border:1px solid black'>" + txtMobNo.Text + "</th>";
            _EmailBody += "</tr>";

            _EmailBody += " <tr style = 'border:1px solid black'>";
            _EmailBody += "<td style = 'border:1px solid black'> Password:</th>";
            _EmailBody += "<td style = 'border:1px solid black'>" + hdfUserPass.Value + "</th>";
            _EmailBody += "</tr>";

            _EmailBody += "<tr style = 'border:1px solid black'>";
            _EmailBody += "<td style = 'border:1px solid black'> E-mail </td>";
            _EmailBody += "<td style = 'border:1px solid black'>" + txtEmailID.Text + "</td >";
            _EmailBody += "</tr>";
            _EmailBody += "<tr style = 'border:1px solid black'>";
            _EmailBody += "<td style = 'border:1px solid black'>Mobile </td>";
            _EmailBody += "<td style = 'border:1px solid black'>" + txtMobNo.Text + "</td>";
            _EmailBody += "</tr>";
            _EmailBody += "</tr>";
            _EmailBody += "<tr style = 'border:1px solid black'>";
            _EmailBody += "<td style = 'border:1px solid black'>Project Description</td>";
            _EmailBody += "<td style = 'border:1px solid black'>" + txtPrjDesc.Text + "</td>";
            _EmailBody += "</tr>";
            _EmailBody += "</tr>";
            _EmailBody += "<tr style = 'border:1px solid black'>";
            _EmailBody += "<td style = 'border:1px solid black'>Project Amount</td>";
            _EmailBody += "<td style = 'border:1px solid black'>" + txtPrjAmt.Text + "</td>";
            _EmailBody += "</tr>";

            _EmailBody += "</tr>";
            _EmailBody += "<tr style = 'border:1px solid black'>";
            _EmailBody += "<td style = 'border:1px solid black'>Project Advance Amount</td>";
            _EmailBody += "<td style = 'border:1px solid black'>" + txtPrjAdvAmt.Text + "</td>";
            _EmailBody += "</tr>";

            _EmailBody += "</tr>";
            _EmailBody += "<tr style = 'border:1px solid black'>";
            _EmailBody += "<td style = 'border:1px solid black'>Project Due Amount</td>";
            _EmailBody += "<td style = 'border:1px solid black'>" + txtDueAmt.Text + "</td>";
            _EmailBody += "</tr>";

            _EmailBody += "</tr>";
            _EmailBody += "<tr style = 'border:1px solid black'>";
            _EmailBody += "<td style = 'border:1px solid black'>Payment Mode</td>";
            _EmailBody += "<td style = 'border:1px solid black'>" + ddlPayMode.SelectedItem.Text + "</td>";
            _EmailBody += "</tr>";
            _EmailBody += "</table>";

            string from = ConfigurationManager.AppSettings["MailUsername"].ToString();
            string To = ConfigurationManager.AppSettings["AdminMailID"].ToString();
            string subject = "ITS gwalior, Client Memorandom Form Details";
            SendMail.SendEmailClient(from, To, subject, _EmailBody, hdfPrjDocFile.Value, hdfClntAddrPrf.Value, hdfCompReg.Value);
        }
    }
    public void SendMessageClient()
    {
        if (txtEmailID.Text != string.Empty)
        {
            string _EmailBody = " ";
            _EmailBody += "<table style ='width:60%; border:1px solid black'>";
            _EmailBody += " <tr style = 'border:1px solid black'>";
            _EmailBody += "<td colspan='2' style = 'border:1px solid black'><h5> Thanks for taking service of ITS Gwalior,Web design and development compmay.<a href='https://itsgwalior.com/' target='_blank'> Click Here</a></h5></th>";
            
            _EmailBody += "</tr>";
            _EmailBody += "<tr style = 'border:1px solid black'>";
            _EmailBody += "<td style = 'border:1px solid black'>Total Project Cost:</td>";
            _EmailBody += "<td style = 'border:1px solid black'>" + txtPrjAmt.Text + "</td>";
            _EmailBody += "</tr>";

            _EmailBody += "</tr>";
            _EmailBody += "<tr style = 'border:1px solid black'>";
            _EmailBody += "<td style = 'border:1px solid black'>Received Advance Amount</td>";
            _EmailBody += "<td style = 'border:1px solid black'>" + txtPrjAdvAmt.Text + "</td>";
            _EmailBody += "</tr>";
            _EmailBody += "</table>";
            _EmailBody += "<br/> for any query <a href='https://itsgwalior.com/' target='_blank'> Click Here</a>";

            string from = ConfigurationManager.AppSettings["MailUsername"].ToString();
            string To = txtEmailID.Text;
            string subject = "Thanks for taking service of ITS Gwalior";
            SendMail.SendWebEmail(from, To, subject, _EmailBody);
        }
    }    
    private void ClearFields()
    {
        txtAddr.Text = string.Empty;
        txtCustName.Text = string.Empty;
        txtEmailID.Text = string.Empty;
        txtMobNo.Text = string.Empty;
        txtPrjAmt.Text = string.Empty;
        txtPrjDesc.Text = string.Empty;
        txtZipCode.Text = string.Empty;
        ddlCountry.ClearSelection();
        txtPrjDesc.Text = string.Empty;
        txtPrjAdvAmt.Text = string.Empty;
        ddlPayMode.ClearSelection();
        chkTermsCond.Checked = false;
        txtgstNumber.Text = string.Empty;
        txtDueAmt.Text = string.Empty;
        txtContPersn.Text = string.Empty;
    }
    private void BindPayMode()
    {
        ddlPayMode.ClearSelection();
        ListItem item = new ListItem("Select Payment Mode", "0");
        ddlPayMode.Items.Add(item);
        DataTable dt = DataAccess.GetData("select * from [PaymentMode]");
        if(dt.Rows.Count>0)
        {
            foreach(DataRow dr in dt.Rows)
            {
                ListItem item1 = new ListItem(dr["PaymentName"].ToString(), dr["ID"].ToString());
                ddlPayMode.Items.Add(item1);
            }
        }
    }
}