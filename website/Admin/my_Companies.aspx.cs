using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

public partial class Admin_my_Companies : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindData();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (fuLogoImage.HasFile)
        {
            if (File.Exists(Server.MapPath("../companiesLogo/" + hdfLogoImg.Value)))
            {
                File.Delete(Server.MapPath("../companiesLogo/" + hdfLogoImg.Value));
            }

            fuLogoImage.SaveAs(Server.MapPath("../companiesLogo/" + fuLogoImage.FileName));
            hdfLogoImg.Value = fuLogoImage.FileName;
        }
        if (hdfCompId.Value == string.Empty)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [Company_detail]([CompanyName],[OwnerName],[ContactNo],[Email],[GstNo],[CompAddr],[CompPinCode],[CompLogo],[AccNo],[BankName],[BranchName],[IfscCode],[AccHolderName],[CreatedOn],[IsGst])VALUES(@CompanyName,@OwnerName,@ContactNo,@Email,@GstNo,@CompAddr,@CompPinCode,@CompLogo,@AccNo,@BankName,@BranchName,@IfscCode,@AccHolderName,@CreatedOn,@IsGst)");
            cmd.Parameters.AddWithValue("@CompanyName", txtcampny.Text);
            cmd.Parameters.AddWithValue("@OwnerName", txtOwner.Text);
            cmd.Parameters.AddWithValue("@ContactNo", TxtContact.Text);
            cmd.Parameters.AddWithValue("@Email", TxtEmail.Text);
            cmd.Parameters.AddWithValue("@GstNo", Txtgstcmp.Text);
            cmd.Parameters.AddWithValue("@CompAddr", TxtAddress.Text);
            cmd.Parameters.AddWithValue("@CompPinCode", txtPnCode.Text);
            cmd.Parameters.AddWithValue("@CompLogo", hdfLogoImg.Value);
            cmd.Parameters.AddWithValue("@AccNo", Txtacc.Text);
            cmd.Parameters.AddWithValue("@BankName", txtBankName.Text);

            cmd.Parameters.AddWithValue("@BranchName", txtBranch.Text);
            cmd.Parameters.AddWithValue("@IfscCode", txtIfscCode.Text);
            cmd.Parameters.AddWithValue("@AccHolderName", txtAccHolderName.Text);
            cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
            cmd.Parameters.AddWithValue("@IsGst", rblGstNonGst.SelectedValue);
            DataAccess.InsertExecuteNonQuery(cmd);
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [Company_detail] SET [CompanyName]=@CompanyName,[OwnerName]=@OwnerName,[ContactNo]=@ContactNo,[Email]=@Email,[GstNo]=@GstNo,[CompAddr]=@CompAddr,[CompPinCode]=@CompPinCode,[CompLogo]=@CompLogo,[AccNo]=@AccNo,[BankName]=@BankName,[BranchName]=@BranchName,[IfscCode]=@IfscCode,[AccHolderName]=@AccHolderName,[IsGst]=@IsGst WHERE CompanyID=@CompanyID");
            cmd.Parameters.AddWithValue("@CompanyName", txtcampny.Text);
            cmd.Parameters.AddWithValue("@OwnerName", txtOwner.Text);
            cmd.Parameters.AddWithValue("@ContactNo", TxtContact.Text);
            cmd.Parameters.AddWithValue("@Email", TxtEmail.Text);
            cmd.Parameters.AddWithValue("@GstNo", Txtgstcmp.Text);
            cmd.Parameters.AddWithValue("@CompAddr", TxtAddress.Text);
            cmd.Parameters.AddWithValue("@CompPinCode", txtPnCode.Text);
            cmd.Parameters.AddWithValue("@CompLogo", hdfLogoImg.Value);
            cmd.Parameters.AddWithValue("@AccNo", Txtacc.Text);
            cmd.Parameters.AddWithValue("@BankName", txtBankName.Text);

            cmd.Parameters.AddWithValue("@BranchName", txtBranch.Text);
            cmd.Parameters.AddWithValue("@IfscCode", txtIfscCode.Text);
            cmd.Parameters.AddWithValue("@AccHolderName", txtAccHolderName.Text);
            cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
            cmd.Parameters.AddWithValue("@CompanyID", hdfCompId.Value);
            cmd.Parameters.AddWithValue("@IsGst", rblGstNonGst.SelectedValue);
            DataAccess.InsertExecuteNonQuery(cmd);
        }
        ClearFields();
        BindData();
    }
    private void ClearFields()
    {
        txtAccHolderName.Text = string.Empty;
        TxtAddress.Text = string.Empty;
        txtBankName.Text = string.Empty;
        txtBranch.Text = string.Empty;
        txtcampny.Text = string.Empty;
        TxtContact.Text = string.Empty;
        TxtEmail.Text = string.Empty;
        Txtgstcmp.Text = string.Empty;
        txtIfscCode.Text = string.Empty;
        txtOwner.Text = string.Empty;
        txtPnCode.Text = string.Empty;
        btnSubmit.Text = "Submit";
        hdfCompId.Value = string.Empty;
        Txtacc.Text = string.Empty;
        rblGstNonGst.ClearSelection();
    }
    private void BindData()
    {
        DataTable dt = DataAccess.GetData("select * from Company_detail");
        if(dt.Rows.Count>0)
        {
            grdView.DataSource = dt;
            grdView.DataBind();
        }
    }

    protected void imgbtnDelete_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;

        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfID")).Value);

        SqlCommand cmd = new SqlCommand("delete from Company_detail where CompanyID=" + ID + "");
        DataAccess.InsertExecuteNonQuery(cmd);
      
    }

    protected void imgbtnUpdate_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;

        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfID")).Value);

        hdfCompId.Value = ID.ToString();
        BindFields();
    }

    private void BindFields()
    {
        DataTable dt = DataAccess.GetData("select * from Company_detail where CompanyID=" + hdfCompId.Value + "");
        if(dt.Rows.Count>0)
        {
            txtAccHolderName.Text = dt.Rows[0]["AccHolderName"].ToString();
            TxtAddress.Text= dt.Rows[0]["CompAddr"].ToString();
            txtBankName.Text= dt.Rows[0]["BankName"].ToString();
            txtBranch.Text= dt.Rows[0]["BranchName"].ToString();
            txtcampny.Text= dt.Rows[0]["CompanyName"].ToString();
            TxtContact.Text= dt.Rows[0]["ContactNo"].ToString();
            TxtEmail.Text= dt.Rows[0]["Email"].ToString();
            Txtgstcmp.Text= dt.Rows[0]["GstNo"].ToString();
            txtIfscCode.Text= dt.Rows[0]["IfscCode"].ToString();
            txtOwner.Text= dt.Rows[0]["OwnerName"].ToString();
            txtPnCode.Text= dt.Rows[0]["CompPinCode"].ToString();
            hdfLogoImg.Value= dt.Rows[0]["CompLogo"].ToString();
            Txtacc.Text= dt.Rows[0]["AccNo"].ToString();
            if (dt.Rows[0]["IsGst"].ToString()!=string.Empty)
            {
                rblGstNonGst.SelectedValue = dt.Rows[0]["IsGst"].ToString();
            }
            btnSubmit.Text = "Update";
        }
    }
}