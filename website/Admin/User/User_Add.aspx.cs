using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Security.Cryptography;
using System.IO;
using System.Text;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Globalization;
using System.Configuration;
using Amity.ERP_Utilities;
public partial class Admin_User_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
            BindUserType();
          

            bindstate();
            Drdstate.Items.FindByValue("1640").Selected = true;

            //if (Request.QueryString["PID"] != null)
            //{
            //    hdfID.Value = Utilities.Decrypt(Request.QueryString["PID"].ToString());
            //    BindUsers();

            //}

            if (Request.QueryString["PID"] != null)
            {
                hdfpartyid.Value = Request.QueryString["PID"].ToString();
                BindUsers();

            }



            if (Request.QueryString["UsID"] != null)

            {
                hdfpartyid.Value = Request.QueryString["UsID"].ToString();
                BindUsers();


            }

        }


    }

    public void BindUsers()
    {
        if (hdfpartyid.Value != string.Empty)
        {
            DataTable dt = DataAccess.GetData("Select * from [PartyMaster] where [PartyID]=" + hdfpartyid.Value + " and [Party_Type]='7' ");
            if (dt.Rows.Count > 0 && dt != null)
            {
                drdUserType.SelectedValue = dt.Rows[0]["Party_Type"].ToString();
                txtName.Text = dt.Rows[0]["Contact_person_name"].ToString();
                txtMob.Text = dt.Rows[0]["mobile_no"].ToString();
                txtEmailID.Text = dt.Rows[0]["Email"].ToString();
              

                if (hdfpartyid.Value != string.Empty)
                {

                    DataTable dt1 = DataAccess.GetData("Select [PassWord] from [UserDetails] where [PartyID]=" + hdfpartyid.Value + " and [UserTypeID]='7' ");
                    if (dt1.Rows.Count > 0)
                    {

                     txtPSWD.Text = dt1.Rows[0]["PassWord"].ToString();

                    }

                }


                Button1.Text = "Update";

                ddlSalaryMode.SelectedValue = dt.Rows[0]["Salary_Mode"].ToString();
                if (ddlSalaryMode.SelectedValue == "Monthly")
                {
                    divMonthly.Visible = true;
                    divCommision.Visible = false;
                    txtMonthlysalary.Text = dt.Rows[0]["Min_Salary"].ToString();

                }

                else
                {
                    divMonthly.Visible = false;
                    divCommision.Visible = true;
                    txtCommission.Text = dt.Rows[0]["Comm_Percent"].ToString();

                }
                bindstate();
                Drdstate.SelectedValue = dt.Rows[0]["state"].ToString();
                txtCity.Text = dt.Rows[0]["City"].ToString();
                txtAddress.Text = dt.Rows[0]["address"].ToString();
                txtZipcode.Text = dt.Rows[0]["pincode"].ToString();


                btnSubmitSalary.Text = "Update";

                BindgvDocument();

                txtBankName.Text = dt.Rows[0]["Bank_Name"].ToString();
                txtAccHolderName.Text = dt.Rows[0]["AccountHname"].ToString();
                txtBranchName.Text = dt.Rows[0]["BranceName"].ToString();
                txtAccNumber.Text = dt.Rows[0]["AccountNo"].ToString();
                txtIFSCcode.Text = dt.Rows[0]["IFSCCoad"].ToString();


                btnSubmitBankDetail.Text = "Update";
            }
        }}

    public void bindstate()
    {

       Drdstate.Items.Clear();

        ListItem item1 = new ListItem();

        item1.Text = ("--Select State--");
        item1.Value = "0";


        Drdstate.Items.Add(item1);


        DataTable dt = DataAccess.GetData("select *  FROM [StateMaster] where [Country_Id]= 101;");
        foreach (DataRow dr in dt.Rows)
        {
            ListItem item = new ListItem();
            item.Value = dr["State_Id"].ToString();
            item.Text = dr["State_Name"].ToString();
            Drdstate.Items.Add(item);
        }
    }
    private void BindUserType()
    {
        //DataTable dt = DataAccess.GetData("Select * from [UserType] where ID NOT IN (1,4,5) order by UserTypeName");
        DataTable dt = DataAccess.GetData("Select * from [UserType] where ID NOT IN (1,2,3,4,5) order by UserTypeName");
        if (dt.Rows.Count > 0 && dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem Item = new ListItem();
                Item.Value = dr["ID"].ToString();
                Item.Text = dr["UserTypeName"].ToString();
                drdUserType.Items.Add(Item);
            }
        }


    }


  //Basic Detail Step I
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        //string PartyID = string.Empty;
        string MaxID = string.Empty;
        string ID_Format = string.Empty;
        ID_Generator ID_Gen = new ID_Generator();

        try
        {
            MaxID = DataAccess.GetSingleValue("select top 1 PartyCode from [PartyMaster]  order by [PartyID] desc");
        }
        catch { }


        ID_Format = "PT-000";
        string var = ID_Gen.GenrateProductID(MaxID, ID_Format);

        string Mob = string.Empty;
        try
        {
            Mob = DataAccess.GetSingleValue("select [MobileNo] from [UserDetails] where [MobileNo]='" + txtMob.Text + "'");
        }
        catch { }
        if (Mob == string.Empty)
        {


            if (hdfpartyid.Value == String.Empty)
            {
                SqlCommand cmdParty = new SqlCommand("INSERT INTO [PartyMaster]([PartyCode],[Party_Type],[Contact_person_name],[mobile_no],[Email],[job_Title],[Createon]) VALUES(@PartyCode,@Party_Type, @Contact_person_name,@mobile_no,@Email,@job_Title, @Createon) Select SCOPE_IDENTITY();");
                cmdParty.Parameters.AddWithValue("@PartyCode", var);
                cmdParty.Parameters.AddWithValue("@Party_Type", drdUserType.SelectedValue);
                cmdParty.Parameters.AddWithValue("@Contact_person_name", txtName.Text);
                cmdParty.Parameters.AddWithValue("@mobile_no", txtMob.Text);
                cmdParty.Parameters.AddWithValue("@Email", txtEmailID.Text);
                cmdParty.Parameters.AddWithValue("@job_Title", "Co-ordinator");
                cmdParty.Parameters.AddWithValue("@Createon", DateTime.Now);
                hdfpartyid.Value = DataAccess.InsertExecuteScalar(cmdParty);


                SqlCommand cmd = new SqlCommand("INSERT INTO [UserDetails]([UserName],[PassWord],[Createon],[MobileNo],[Name],[InActive],[UserTypeID],[EmailID],[PartyID]) VALUES(@UserName,@PassWord,@Createon,@MobileNo,@Name,@InActive,@UserTypeID,@EmailID,@PartyID)");
                cmd.Parameters.AddWithValue("@UserName", txtName.Text);
                cmd.Parameters.AddWithValue("@PassWord", txtPSWD.Text.Trim());
                cmd.Parameters.AddWithValue("@Createon", DateTime.Now);
                cmd.Parameters.AddWithValue("@MobileNo", txtMob.Text);
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@EmailID", txtEmailID.Text);
                cmd.Parameters.AddWithValue("@InActive", "True");
                cmd.Parameters.AddWithValue("@UserTypeID", drdUserType.SelectedValue);
                cmd.Parameters.AddWithValue("@PartyID", hdfpartyid.Value);
                DataAccess.InsertExecuteNonQuery(cmd);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openTab2();", true);

            }

            else
            {

                SqlCommand cmdParty = new SqlCommand("Update [PartyMaster] SET [Contact_person_name]=@Contact_person_name,[mobile_no]=@mobile_no,[Email]=@Email Where [PartyID]=" + hdfpartyid.Value + "  ");
              
              
                cmdParty.Parameters.AddWithValue("@Contact_person_name", txtName.Text);
                cmdParty.Parameters.AddWithValue("@mobile_no", txtMob.Text);
                cmdParty.Parameters.AddWithValue("@Email", txtEmailID.Text);              
                DataAccess.InsertExecuteNonQuery(cmdParty);


            }

        }
        else
        {
            alert.Visible = true;
            lblMsg.Text = "This mobile number is already registered";

        }    

    

    }

    private void CLR()
    {      
        txtAddress.Text = string.Empty;      
        txtEmailID.Text = string.Empty;
        txtMob.Text = string.Empty;
        txtName.Text = string.Empty;
        txtPSWD.Text = string.Empty;       
        drdUserType.ClearSelection();       
    }
protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {

     

        if (drdUserType.SelectedValue == "7")
        {
          
          


        }
     

    }  



    protected void ddlSalaryMode_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlSalaryMode.SelectedValue == "Monthly")
        {
            divMonthly.Visible = true;
            divCommision.Visible = false;

        }

        else
        {
            divMonthly.Visible = false;
            divCommision.Visible = true;

        }

        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openTab2();", true);
    }

    //Store Document 


    protected void btnAddDocument_Click(object sender, EventArgs e)
    {
        if (fuDocument.HasFile)
        {
            if (File.Exists(Server.MapPath("ClientContractDoc/" + hdfPhoto.Value)))
            {
                File.Delete(Server.MapPath("ClientContractDoc/" + hdfPhoto.Value));
            }
            fuDocument.SaveAs(Server.MapPath("~/ClientContractDoc/" + fuDocument.FileName));
            hdfPhoto.Value = fuDocument.FileName;
        }

        if (hdfdoc_id.Value == string.Empty)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [PartyDocument_Master]([Document_Name],[Upload_File],[PartyID],[CreatedOn]) VALUES(@Document_Name,@Upload_File ,@PartyID,@CreatedOn)");
            cmd.Parameters.AddWithValue("@Document_Name", ddlDocument.SelectedValue);
            cmd.Parameters.AddWithValue("@Upload_File", hdfPhoto.Value);
            cmd.Parameters.AddWithValue("@PartyID", hdfpartyid.Value);
            cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "File saved successfully";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "openTab3();", true);
        }

        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [PartyDocument_Master] SET [Document_Name]=@Document_Name,[Upload_File]=@Upload_File,[PartyID]=@PartyID  WHERE [Document_Id] = " + hdfdoc_id.Value + " ");
            cmd.Parameters.AddWithValue("@Document_Name", ddlDocument.SelectedValue);
            cmd.Parameters.AddWithValue("@Upload_File", hdfPhoto.Value);
            cmd.Parameters.AddWithValue("@PartyID", hdfpartyid.Value);
            DataAccess.InsertExecuteNonQuery(cmd);
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "openTab3();", true);
            alert.Visible = true;
            lblMsg.Text = "record update successfully";
        }

        BindgvDocument();
        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "displaydiv3();", true);
        Clr();

    }

    public void BindgvDocument()
    {
        DataTable dt = DataAccess.GetData("Select * from [PartyDocument_Master] Where [PartyID]=" + hdfpartyid.Value + " ");
        if (dt.Rows.Count > 0)
        {
            gvFileDetails.DataSource = dt;
            gvFileDetails.DataBind();
        }
    }

    public void Clr()
    {
        ddlDocument.ClearSelection();

    }


    protected void imgbtnEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtn = sender as ImageButton;
        GridViewRow grdRow = (GridViewRow)imgbtn.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdRow.FindControl("hdf_ID")).Value);
        hdfdoc_id.Value = ID.ToString();

        DataTable dt = DataAccess.GetData("Select * from [PartyDocument_Master] Where [Document_Id]=" + hdfdoc_id.Value + " ");
        if (dt.Rows.Count > 0)
        {
            ddlDocument.SelectedValue = dt.Rows[0]["Document_Name"].ToString();
            hdfPhoto.Value = dt.Rows[0]["Upload_File"].ToString();
            btnAddDocument.Text = "Update";
        }
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "openTab3();", true);

    }

    protected void Delete(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtn = sender as ImageButton;
        GridViewRow grdRow = (GridViewRow)imgbtn.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdRow.FindControl("hdf_ID")).Value);
        hdfdoc_id.Value = ID.ToString();

        SqlCommand cmd = new SqlCommand("Delete from [PartyDocument_Master] where [Document_Id] = " + hdfdoc_id.Value + "");
        DataAccess.InsertExecuteNonQuery(cmd);
        BindgvDocument();
        alert.Visible = true;
        lblMsg.Text = "Record Delete Sucessfully";
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "displaydiv3();", true);
    }
    protected void gvFileDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hdfdocid = (HiddenField)e.Row.FindControl("hdfDocId");

            Literal ltrCv = (Literal)e.Row.FindControl("ltrDoc");

            DataTable dt = DataAccess.GetData("Select * from [PartyDocument_Master] Where [Document_Id]=" + hdfdocid.Value + " ");
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["Upload_File"].ToString() != string.Empty)
                {
                    ltrCv.Text = "<a href='../../ClientContractDoc/" + dt.Rows[0]["Upload_File"].ToString() + "' target='_blank'><img src='../../img/Download.gif' alt='' /></a>";
                }
            }
        }
    }


    

   
    protected void imgbtnDelete_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtn = sender as ImageButton;
        GridViewRow grdRow = (GridViewRow)imgbtn.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdRow.FindControl("hdf_ID")).Value);
        hdfdoc_id.Value = ID.ToString();

        SqlCommand cmd = new SqlCommand("Delete from [PartyDocument_Master] where [Document_Id] = " + hdfdoc_id.Value + "");
        DataAccess.InsertExecuteNonQuery(cmd);
        BindgvDocument();
        alert.Visible = true;
        lblMsg.Text = "Record Delete Sucessfully";
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "openTab3();", true);
    }

  

    protected void btnSubmitSalary_Click(object sender, EventArgs e)
    {

        if (hdfpartyid.Value != string.Empty)
        {
            SqlCommand cmdParty = new SqlCommand("Update [PartyMaster] SET [Salary_Mode]=@Salary_Mode,[Min_Salary]=@Min_Salary,[Comm_Percent]=@Comm_Percent, [state]=@state,[City]=@City, [address]=@address, [pincode]=@pincode,[Createon]=@Createon  Where [PartyID]=" + hdfpartyid.Value + " ");


            cmdParty.Parameters.AddWithValue("@Salary_Mode", ddlSalaryMode.SelectedValue);
     
            if (txtMonthlysalary.Text != string.Empty)
            {

                cmdParty.Parameters.AddWithValue("@Min_Salary", txtMonthlysalary.Text);
            }
            else
            {
                cmdParty.Parameters.AddWithValue("@Min_Salary", string.Empty);

            }


            if (txtCommission.Text != string.Empty)
            {
                cmdParty.Parameters.AddWithValue("@Comm_Percent", txtCommission.Text);
            }
            else
            {
                cmdParty.Parameters.AddWithValue("@Comm_Percent", string.Empty);
            }

            cmdParty.Parameters.AddWithValue("@state", Drdstate.SelectedValue);

            cmdParty.Parameters.AddWithValue("@City", txtCity.Text);
            cmdParty.Parameters.AddWithValue("@address", txtAddress.Text);
            cmdParty.Parameters.AddWithValue("@pincode", txtZipcode.Text);
            cmdParty.Parameters.AddWithValue("@Createon", DateTime.Now);

            DataAccess.InsertExecuteNonQuery(cmdParty);
          
        }

        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openTab3();", true);


    }


    protected void btnSubmitBankDetail_Click(object sender, EventArgs e)
    {

        SqlCommand cmd = new SqlCommand("update [PartyMaster] set  [Bank_Name]=@Bank_Name,[AccountHname]=@AccountHname,[BranceName]=@BranceName,[AccountNo]=@AccountNo,[IFSCCoad]=@IFSCCoad where [PartyID]=" + hdfpartyid.Value + " ");
        cmd.Parameters.AddWithValue("@Bank_Name", txtBankName.Text);
        cmd.Parameters.AddWithValue("@AccountHname", txtAccHolderName.Text);
        cmd.Parameters.AddWithValue("@BranceName", txtBranchName.Text);
        cmd.Parameters.AddWithValue("@AccountNo", txtAccNumber.Text);
        cmd.Parameters.AddWithValue("@IFSCCoad", txtIFSCcode.Text);
        DataAccess.InsertExecuteNonQuery(cmd);
        alert.Visible = true;
        lblMsg.Text = "Bank Detail Updated Successfully";
       
    }
}