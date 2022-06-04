using Amity.ERP_Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeEngine.Framework.QueryBuilder;
using CodeEngine.Framework.QueryBuilder.Enums;
using System.Configuration;
using System.IO;
using System.Web.UI.HtmlControls;

public partial class Admin_AddParty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            drdPartyType.Focus();
            bindPartyType();
            BindPayMode();
            BindCountry();
            BindState();

            drdState.Items.FindByValue("1640").Selected = true;

            if (Request.QueryString["ID"] != null)
            {
                hdfID.Value = Request.QueryString["ID"].ToString();

                BindPartyDetail();
            }

            ID_Generator ID_Gen = new ID_Generator();
            hdfuserPsw.Value = ID_Gen.CreateRandomPassword(6);

        }
      }



    private void BindPayMode()
    {
        ddlPayMode.ClearSelection();
        ListItem item = new ListItem("Select Payment Mode", "0");
        ddlPayMode.Items.Add(item);
        DataTable dt = DataAccess.GetData("select * from [PaymentMode]");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item1 = new ListItem(dr["PaymentName"].ToString(), dr["ID"].ToString());
                ddlPayMode.Items.Add(item1);
            }
        }
    }


    public void BindPartyDetail()
    {

    DataTable dt = DataAccess.GetData("Select * from [PartyMaster] Where PartyID='" + hdfID.Value + "'");
        if (dt.Rows.Count > 0 && dt != null)
        {
            bindPartyType();
            drdPartyType.SelectedValue = dt.Rows[0]["Party_Type"].ToString();
            txtName.Text = dt.Rows[0]["Party_name"].ToString();
            txtAddress.Text = dt.Rows[0]["address"].ToString();          
            BindCountry(); 
            drdCountry.SelectedValue = dt.Rows[0]["country"].ToString();
           // BindState();
            drdState.SelectedValue = dt.Rows[0]["state"].ToString();
            txtCity.Text = dt.Rows[0]["City"].ToString();
            txtCName.Text = dt.Rows[0]["Contact_person_name"].ToString();
            txtEmailID.Text = dt.Rows[0]["Email"].ToString();
            txtMobNo.Text = dt.Rows[0]["mobile_no"].ToString();
            txtPhonNo.Text = dt.Rows[0]["phone_no"].ToString();
            txtCName.Text = dt.Rows[0]["AccountHname"].ToString();
            txtPinCode.Text = dt.Rows[0]["pincode"].ToString();
            // txtCName.Text = dt.Rows[0]["cheque_printing_name"].ToString();
            txtCName.Text = dt.Rows[0]["Contact_person_name"].ToString();
            TxtGstno.Text= dt.Rows[0]["Gst_no"].ToString();
            Txtprtyctgy.Text = dt.Rows[0]["Party_Category"].ToString();
            txtOwnerName.Text = dt.Rows[0]["OwnerName"].ToString();
            txtOwnerMob.Text = dt.Rows[0]["OwnerMob"].ToString();
            txtOwnerEmail.Text = dt.Rows[0]["OwnerEmail"].ToString();
            txtPrjDesc.Text = dt.Rows[0]["PrjDesc"].ToString();
            hdfPrjDocFile.Value = dt.Rows[0]["PrjDocFile"].ToString();

            if (hdfPrjDocFile.Value != string.Empty)
            {
                divProject.Visible = true;
                anchorIDprojectFile.Attributes["href"] = "~/ClientContractDoc/" + hdfPrjDocFile.Value + "";

            }


           

            txtPrjAmt.Text = dt.Rows[0]["PrjAmount"].ToString();
            txtPrjAdvAmt.Text = dt.Rows[0]["PrjAdvAmt"].ToString();
            txtDueAmt.Text = dt.Rows[0]["PrjDueAmt"].ToString();
            hdfClntAddrPrf.Value = dt.Rows[0]["ClientAddrProof"].ToString();

            if (hdfClntAddrPrf.Value != string.Empty)
            {
                divAddressProof.Visible = true;
                anchorIdAddProof.Attributes["href"] = "~/ClientContractDoc/" + hdfClntAddrPrf.Value + "";

            }


            hdfCompReg.Value = dt.Rows[0]["CompReg"].ToString();


            if (hdfCompReg.Value != string.Empty)
            {
                divCompReg.Visible = true;
                anchorCompReg.Attributes["href"] = "~/ClientContractDoc/" + hdfCompReg.Value + "";

            }



            BindPayMode();
            ddlPayMode.SelectedItem.Text = dt.Rows[0]["PayMode"].ToString();
            DataTable dtUserDet = DataAccess.GetData("select [PassWord] from UserDetails where PartyID=" + dt.Rows[0]["PartyID"].ToString() + " ");
            if (dtUserDet.Rows.Count > 0)
            {
                hdfuserPsw.Value = dtUserDet.Rows[0]["PassWord"].ToString();

            }

        }

        btnSubmit.Text = "Update";

    }
    public void BindCountry()
    {
        DataTable dt = DataAccess.GetData("select * from Mst_Country_Master order by Country_Name");
        if (dt != null && dt.Rows.Count > 0)
        {

            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["Country_Id"].ToString();
                item.Text = dr["Country_Name"].ToString();
                drdCountry.Items.Add(item);
            }
            drdCountry.SelectedValue = "101";
        }
    }

    public void BindState()
    {

       

        DataTable dt = DataAccess.GetData("select * from [StateMaster] where [Country_Id] ='"+drdCountry.SelectedValue+ "' order by State_Name ");
        if (dt != null && dt.Rows.Count > 0)
        {

            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["State_Id"].ToString();
                item.Text = dr["State_Name"].ToString();
                drdState.Items.Add(item);
            }

        }
    }
    public void bindPartyType()
    {
        drdPartyType.Items.Clear();
        ListItem item1 = new ListItem();
        item1.Value = "0";
        item1.Text = "--Select--";
        drdPartyType.Items.Add(item1);


        DataTable dt = DataAccess.GetData("select * from [UserType] where ID NOT IN (1,2,3,7) "); //where CompanyID=" + hdfCompnyID.Value + "
        if (dt != null && dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["ID"].ToString();
                item.Text = dr["UserTypeName"].ToString();
                drdPartyType.Items.Add(item);
            }

        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {


        if (fuPrjDocFile.HasFile)
        {
            System.IO.FileInfo file = new System.IO.FileInfo(fuPrjDocFile.PostedFile.FileName);
            string fname = file.Name.Remove((file.Name.Length - file.Extension.Length));
            fname = fname + System.DateTime.Now.ToString("_PrjddMMyyhhmmss") + file.Extension;
            if (File.Exists(Server.MapPath("~/ClientContractDoc/" + fname)))
            {
                File.Delete(Server.MapPath("~/ClientContractDoc/" + fname));
            }

            fuPrjDocFile.SaveAs(Server.MapPath("~/ClientContractDoc/" + fname));
            hdfPrjDocFile.Value = fname;
        }
        if (fuClntAddrProof.HasFile)
        {
            System.IO.FileInfo file = new System.IO.FileInfo(fuClntAddrProof.PostedFile.FileName);
            string fname = file.Name.Remove((file.Name.Length - file.Extension.Length));
            fname = fname + System.DateTime.Now.ToString("_ClntddMMyyhhmmss") + file.Extension;
            if (File.Exists(Server.MapPath("~/ClientContractDoc/" + fname)))
            {
                File.Delete(Server.MapPath("~/ClientContractDoc/" + fname));
            }

            fuClntAddrProof.SaveAs(Server.MapPath("~/ClientContractDoc/" + fname));
            hdfClntAddrPrf.Value = fname;
        }
        if (fuCompReNo.HasFile)
        {
            System.IO.FileInfo file = new System.IO.FileInfo(fuCompReNo.PostedFile.FileName);
            string fname = file.Name.Remove((file.Name.Length - file.Extension.Length));
            fname = fname + System.DateTime.Now.ToString("_CompddMMyyhhmmss") + file.Extension;
            if (File.Exists(Server.MapPath("~/ClientContractDoc/" + fname)))
            {
                File.Delete(Server.MapPath("~/ClientContractDoc/" + fname));
            }

            fuCompReNo.SaveAs(Server.MapPath("~/ClientContractDoc/" + fname));
            hdfCompReg.Value = fname;
        }


        if (hdfID.Value == string.Empty)
        {
            string PartyID = string.Empty;
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


            string Mob = string.Empty;
            try
            {
                Mob = DataAccess.GetSingleValue("select MobileNo from [PartyMaster] where [mobile_no]='" + txtMobNo.Text + "'");
            }
            catch { }

            if (Mob == string.Empty)
            {

                SqlCommand cmd = new SqlCommand("INSERT INTO [PartyMaster]([CompanyID],[PartyCode],[Party_Type],[Party_name],[address],[country],[state],[City],[Contact_person_name],[Email],[mobile_no],[phone_no],[UserID],[Createon],[pincode],[cheque_printing_name],[Gst_no],[Party_Category],[OwnerEmail],[OwnerMob],[OwnerName],[PrjDesc],[PrjDocFile],[PrjAmount],[PrjAdvAmt],[PrjDueAmt],[ClientAddrProof],[CompReg],[PayMode]) VALUES(@CompanyID,@PartyCode,@Party_Type,@Party_name,@address,@country,@state,@City,@Contact_person_name,@Email,@mobile_no,@phone_no,@UserID,@Createon,@pincode,@cheque_printing_name,@Gst_no,@Party_Category ,@OwnerEmail,@OwnerMob,@OwnerName,@PrjDesc,@PrjDocFile,@PrjAmount,@PrjAdvAmt,@PrjDueAmt,@ClientAddrProof,@CompReg,@PayMode) select scope_Identity()");
                cmd.Parameters.AddWithValue("@CompanyID", " ");
                cmd.Parameters.AddWithValue("@PartyCode", var);
                cmd.Parameters.AddWithValue("@Party_Type", drdPartyType.SelectedValue);
                cmd.Parameters.AddWithValue("@Party_name", txtName.Text);
                cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@country", drdCountry.SelectedValue);
                cmd.Parameters.AddWithValue("@state", drdState.SelectedValue);
                cmd.Parameters.AddWithValue("@City", txtCity.Text);
                cmd.Parameters.AddWithValue("@Contact_person_name", txtCName.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmailID.Text);
                cmd.Parameters.AddWithValue("@mobile_no", txtMobNo.Text);
                cmd.Parameters.AddWithValue("@phone_no", txtPhonNo.Text);
                cmd.Parameters.AddWithValue("@UserID", " ");
                cmd.Parameters.AddWithValue("@Createon", DateTime.Now);
                cmd.Parameters.AddWithValue("@pincode", txtPinCode.Text);
                cmd.Parameters.AddWithValue("@cheque_printing_name", txtCName.Text);
                cmd.Parameters.AddWithValue("@Gst_no", TxtGstno.Text);
                cmd.Parameters.AddWithValue("@Party_Category", Txtprtyctgy.Text);

                cmd.Parameters.AddWithValue("@OwnerEmail", txtOwnerEmail.Text);
                cmd.Parameters.AddWithValue("@OwnerMob", txtOwnerMob.Text);
                cmd.Parameters.AddWithValue("@OwnerName", txtOwnerName.Text);
                cmd.Parameters.AddWithValue("@PrjDesc", txtPrjDesc.Text);
                
                cmd.Parameters.AddWithValue("@PrjDocFile", hdfPrjDocFile.Value);

              

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

                cmd.Parameters.AddWithValue("@ClientAddrProof", hdfClntAddrPrf.Value);
                cmd.Parameters.AddWithValue("@CompReg", hdfCompReg.Value);
                cmd.Parameters.AddWithValue("@PayMode", ddlPayMode.SelectedItem.Text);
                PartyID = DataAccess.InsertExecuteScalar(cmd);

           

               
            }

            else
            {
                alert.Visible = true;
                lblMsg.Text = "This mobile number is already registered";

            }

            if (PartyID != string.Empty)
            {
                SqlCommand cmdP = new SqlCommand("INSERT INTO [UserDetails] ([MobileNo],[PassWord],[InActive],[UserTypeID],[Createon],[PartyID],[UserRoleID]) VALUES(@MobileNo,@PassWord,@InActive,@UserTypeID,@Createon,@PartyID,@UserRoleID)");
                cmdP.Parameters.AddWithValue("@MobileNo", txtMobNo.Text);
                cmdP.Parameters.AddWithValue("@PassWord", hdfuserPsw.Value);
                cmdP.Parameters.AddWithValue("@InActive", "True");
                cmdP.Parameters.AddWithValue("@UserTypeID", drdPartyType.SelectedValue);
                cmdP.Parameters.AddWithValue("@Createon", DateTime.Now);
                cmdP.Parameters.AddWithValue("@PartyID", PartyID);
                cmdP.Parameters.AddWithValue("@UserRoleID","4");
                DataAccess.InsertExecuteNonQuery(cmdP);
            }
            alert.Visible = true;
            lblMsg.Text = "Party add successfully";

            //  SendSMSLoginDetail();

            // Created New By Surendra 
            string msg = " Congratulation!Sir / Mam #var, You are successfully registered with ITS Gwalior, User Name: " + txtMobNo.Text + " ad Password: " + hdfuserPsw.Value + ", For login click here : https://itsgwalior.com.";
            if (txtMobNo.Text != string.Empty)
            {
                SendSMS.ProcessSMS(txtMobNo.Text, msg, "1207162460292631960");
            }



            SendEmailLoginDetail();


            Response.Redirect("PartyList.aspx");

           
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [PartyMaster] SET [Party_Type] = @Party_Type,[Party_name] = @Party_name,[address] = @address,[country] = @country,[state] = @state,[City] = @City,[Contact_person_name] = @Contact_person_name,[Email] = @Email,[mobile_no] = @mobile_no,[phone_no] = @phone_no,[AccountHname] = @AccountHname,[pincode] = @pincode,[cheque_printing_name] = @cheque_printing_name,[Gst_no]=@Gst_no,[Party_Category]=@Party_Category,[OwnerEmail]=@OwnerEmail,[OwnerMob]=@OwnerMob,[OwnerName]=@OwnerName,[PrjDocFile]=@PrjDocFile,[PrjAmount]=@PrjAmount,[PrjAdvAmt]=@PrjAdvAmt,[PrjDueAmt]=@PrjDueAmt,[ClientAddrProof]=@ClientAddrProof,[CompReg]=@CompReg,[PayMode]=@PayMode  where PartyID='" + hdfID.Value + "'");
            cmd.Parameters.AddWithValue("@Party_Type", drdPartyType.SelectedValue);
            cmd.Parameters.AddWithValue("@Party_name", txtName.Text);
            cmd.Parameters.AddWithValue("@address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@country", drdCountry.SelectedValue);
            cmd.Parameters.AddWithValue("@state", drdState.SelectedValue);
            cmd.Parameters.AddWithValue("@City", txtCity.Text);
            cmd.Parameters.AddWithValue("@Contact_person_name", txtCName.Text);
            cmd.Parameters.AddWithValue("Email", txtEmailID.Text);
            cmd.Parameters.AddWithValue("@mobile_no", txtMobNo.Text);
            cmd.Parameters.AddWithValue("@phone_no", txtPhonNo.Text);       
            cmd.Parameters.AddWithValue("@AccountHname", txtCName.Text);         
            cmd.Parameters.AddWithValue("@UserID", " ");          
            cmd.Parameters.AddWithValue("@pincode", txtPinCode.Text);
            cmd.Parameters.AddWithValue("@cheque_printing_name", txtCName.Text); 
            cmd.Parameters.AddWithValue("@Gst_no", TxtGstno.Text);
            cmd.Parameters.AddWithValue("@Party_Category", Txtprtyctgy.Text);

            cmd.Parameters.AddWithValue("@OwnerEmail", txtOwnerEmail.Text);
            cmd.Parameters.AddWithValue("@OwnerMob", txtOwnerMob.Text);
            cmd.Parameters.AddWithValue("@OwnerName", txtOwnerName.Text);
            cmd.Parameters.AddWithValue("@PrjDesc", txtPrjDesc.Text);
            cmd.Parameters.AddWithValue("@PrjDocFile", hdfPrjDocFile.Value);

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

            cmd.Parameters.AddWithValue("@ClientAddrProof", hdfClntAddrPrf.Value);
            cmd.Parameters.AddWithValue("@CompReg", hdfCompReg.Value);
            cmd.Parameters.AddWithValue("@PayMode", ddlPayMode.SelectedItem.Text);

            DataAccess.InsertExecuteNonQuery(cmd);

            SqlCommand cmdd = new SqlCommand("UPDATE [UserDetails]  SET [PassWord] = @PassWord,[MobileNo] = @MobileNo,[UserTypeID] = @UserTypeID WHERE PartyID='"+hdfID.Value+"'");
            cmdd.Parameters.AddWithValue("@MobileNo", txtMobNo.Text);
            cmdd.Parameters.AddWithValue("@PassWord", hdfuserPsw.Value);
            cmdd.Parameters.AddWithValue("@UserTypeID", drdPartyType.SelectedValue);
            DataAccess.InsertExecuteNonQuery(cmdd);
            alert.Visible = true;
            lblMsg.Text = "Party update successfully";

            SendSMSLoginDetail();
            SendEmailLoginDetail();

            Response.Redirect("PartyList.aspx");
        }

      
        Clr();
    }

    public void SendSMSLoginDetail()
    {
        string custName = txtName.Text;
        string mobNo = txtMobNo.Text;

        string msgBody = " Hi  " + custName + " ,  Welcome to ITS Gwalior, Your user id:-  " + txtMobNo.Text + "   and  Password:-  " + hdfuserPsw.Value + "   Url:- https://itsgwalior.com/ .Your advance amount  " + txtPrjAdvAmt.Text + "  received."; 
       // string msgBody = "Dear Mr/Miss " + custName + ", your login Detail given below: <br/> User Name: " + txtMobNo.Text + " <br/>Password: " + hdfuserPsw.Value + " Your advance amount " + txtPrjAdvAmt.Text + " received.";
        SendSMS.ProcessSMS(mobNo, msgBody, "1207162436773509259");

    }

    public void SendEmailLoginDetail()
    {
        string _EmailBody = " ";    
     
        _EmailBody += "<table style ='width:60%; border:1px solid black'>";
        _EmailBody += " <tr style = 'border:1px solid black'>";
        //_EmailBody += "<th colspan='2' style = 'border:1px solid black'><img src='images/logo2.png'></th>";
        _EmailBody += "<th  colspan='2' style = 'border:1px solid black'><h2> ITS gwalior </h2></th>";
        _EmailBody += "</tr>";

        _EmailBody += " <tr style = 'border:1px solid black'>";
        _EmailBody += "<td style = 'border:1px solid black'> User Name:</th>";
        _EmailBody += "<td style = 'border:1px solid black'>" + txtMobNo.Text + "</th>";
        _EmailBody += "</tr>";

        _EmailBody += " <tr style = 'border:1px solid black'>";
        _EmailBody += "<td style = 'border:1px solid black'> Password:</th>";
        _EmailBody += "<td style = 'border:1px solid black'>" + hdfuserPsw.Value + "</th>";
        _EmailBody += "</tr>";

        _EmailBody += " <tr style = 'border:1px solid black'>";
        _EmailBody += "<td style = 'border:1px solid black'> Party Name:</th>";
        _EmailBody += "<td style = 'border:1px solid black'>" + txtName.Text + "</th>";
        _EmailBody += "</tr>";      


        _EmailBody += " <tr style = 'border:1px solid black'>";
        _EmailBody += "<td style = 'border:1px solid black'> City Name:</th>";
        _EmailBody += "<td style = 'border:1px solid black'>" + txtCity.Text + "</th>";
        _EmailBody += "</tr>";

        _EmailBody += " <tr style = 'border:1px solid black'>";
        _EmailBody += "<td style = 'border:1px solid black'> Address:</th>";
        _EmailBody += "<td style = 'border:1px solid black'>" + txtAddress.Text + "</th>";
        _EmailBody += "</tr>";


        _EmailBody += " <tr style = 'border:1px solid black'>";
        _EmailBody += "<td style = 'border:1px solid black'> Pin Code:</th>";
        _EmailBody += "<td style = 'border:1px solid black'>" + txtPinCode.Text + "</th>";
        _EmailBody += "</tr>";


        _EmailBody += " <tr style = 'border:1px solid black'>";
        _EmailBody += "<td style = 'border:1px solid black'>Contact Person Name</th>";
        _EmailBody += "<td style = 'border:1px solid black'>" + txtCName.Text + "</th>";
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

        _EmailBody += "</tr>";
        _EmailBody += "<tr style = 'border:1px solid black'>";
        _EmailBody += "<td style = 'border:1px solid black'>GST Reg No</td>";
        _EmailBody += "<td style = 'border:1px solid black'>" + TxtGstno.Text + "</td>";
        _EmailBody += "</tr>";


        _EmailBody += "</tr>";
        _EmailBody += "<tr style = 'border:1px solid black'>";
        _EmailBody += "<td style = 'border:1px solid black'>Owner Name</td>";
        _EmailBody += "<td style = 'border:1px solid black'>" + txtOwnerName.Text + "</td>";
        _EmailBody += "</tr>";

        _EmailBody += "</tr>";
        _EmailBody += "<tr style = 'border:1px solid black'>";
        _EmailBody += "<td style = 'border:1px solid black'>Owner Mobile</td>";
        _EmailBody += "<td style = 'border:1px solid black'>" + txtOwnerMob.Text + "</td>";
        _EmailBody += "</tr>";

        _EmailBody += "</tr>";
        _EmailBody += "<tr style = 'border:1px solid black'>";
        _EmailBody += "<td style = 'border:1px solid black'>Owner Email</td>";
        _EmailBody += "<td style = 'border:1px solid black'>" + txtOwnerEmail.Text + "</td>";
        _EmailBody += "</tr>";

        _EmailBody += "</table>";      
      

        string from = ConfigurationManager.AppSettings["MailUsername"].ToString();
        string To = ConfigurationManager.AppSettings["AdminMailID"].ToString();
        string subject = "ITS gwalior Login Detail";
        SendMail.SendWebEmail(from, To, subject, _EmailBody);
        lblMsg.Text = "Successfully Sent";

    }


    protected void btnAutoSubmit_Click(object sender, EventArgs e)
    {
        SelectQueryBuilder query = new SelectQueryBuilder();
        query.SelectFromTable("PartyMaster");
        query.SelectAllColumns();

        if (txtName.Text != string.Empty)
        {
            query.AddWhere("Party_name", Comparison.Like, txtName.Text + '%');

        }
        if (Txtprtyctgy.Text != string.Empty)
        {
            query.AddWhere("Party_Category", Comparison.Like, Txtprtyctgy.Text + '%');

        }

        string Query = query.BuildQuery();
        DataTable dt = DataAccess.GetData(Query);
       
    }
     
        
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchEmpByName(string prefixText, int count)
    {
        DataTable dt = DataAccess.GetData("select [Party_name] from [PartyMaster] WHERE Is_active=1 and Party_name like '" + prefixText + "%'");
        List<string> customers = new List<string>();
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {

                customers.Add(dr["Party_name"].ToString());
            }
        }
        return customers;

    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchpartyBycat(string prefixText, int count)
    {
        DataTable dt = DataAccess.GetData("select [Party_Category] from [PartyMaster] WHERE Party_Category like '" + prefixText + "%'");
        List<string> customers = new List<string>();
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {

                customers.Add(dr["Party_Category"].ToString());
            }
        }
        return customers;

    }

    private void Clr()
    {
        
        txtAddress.Text = string.Empty;      
        txtCity.Text = string.Empty;
        txtCName.Text = string.Empty;      
        txtEmailID.Text = string.Empty;      
        txtMobNo.Text = string.Empty;
        txtName.Text = string.Empty;      
        txtPinCode.Text = string.Empty;      
        hdfID.Value = string.Empty;
        hdfImage.Value = string.Empty;
        txtPhonNo.Text = string.Empty;
        drdCountry.ClearSelection();
        drdPartyType.ClearSelection();
        drdState.ClearSelection();

        txtOwnerEmail.Text = string.Empty;
        txtOwnerMob.Text = string.Empty;
        txtOwnerName.Text = string.Empty;

        txtPrjAmt.Text = string.Empty;
        txtPrjAdvAmt.Text = string.Empty;
        txtDueAmt.Text = string.Empty;

        txtPrjDesc.Text = string.Empty;
        hdfPrjDocFile.Value = string.Empty;
        hdfCompReg.Value = string.Empty;
        hdfClntAddrPrf.Value = string.Empty;
        ddlPayMode.ClearSelection();

    }

}