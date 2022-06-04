using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing.Drawing2D;
using System.Drawing;
using System.IO;
using System.Data;

public partial class Admin_AddupdatesGallery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(Request.QueryString["ID"] != null)
            {
            hdfID.Value = Request.QueryString["ID"].ToString();

                bindPortfolioList();          
            }
        }

    }

    public void bindPortfolioList()
    {

        DataTable dt = DataAccess.GetData("select * from Portfolio where ID=" + hdfID.Value + "");
        if (dt.Rows.Count > 0 && dt != null)
        {
            txtCity.Text = dt.Rows[0]["WebsiteCity"].ToString();
            txtportfolio.Text = dt.Rows[0]["PortfolioTitle"].ToString();
            txtSubTitle.Text = dt.Rows[0]["PortfolioSubTitle"].ToString();
            txtUrl.Text = dt.Rows[0]["PortfolioLink"].ToString();
            txtSortO.Text = dt.Rows[0]["sort"].ToString();

           hdfImage.Value = dt.Rows[0]["portfolioImage"].ToString();
             

            drdPortType.SelectedValue = dt.Rows[0]["PortfolioType"].ToString();
            Button1.Text = "Update";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string targetPath = string.Empty;
        if (fluPorUpload.HasFile)
        {
        
            if (File.Exists(Server.MapPath("~/PortfolioImage/" + hdfImage.Value)))
            {
                File.Delete(Server.MapPath("~/PortfolioImage/" + hdfImage.Value));
            }
           
           fluPorUpload.SaveAs(Server.MapPath("~/PortfolioImage/" + fluPorUpload.FileName));
            hdfImage.Value = fluPorUpload.FileName;       
           
        }


        if (hdfID.Value == string.Empty)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [Portfolio]([PortfolioTitle],[PortfolioSubTitle],[PortfolioLink],[CreateOn],[portfolioImage],[WebsiteCity],[PortfolioType],[sort]) VALUES(@PortfolioTitle,@PortfolioSubTitle,@PortfolioLink,@CreateOn,@portfolioImage,@WebsiteCity,@PortfolioType,@sort)");
            cmd.Parameters.AddWithValue("@PortfolioTitle", txtportfolio.Text);
            cmd.Parameters.AddWithValue("@PortfolioSubTitle", txtSubTitle.Text);
            cmd.Parameters.AddWithValue("@PortfolioLink", txtUrl.Text);
            cmd.Parameters.AddWithValue("@CreateOn", DateTime.Now);
            cmd.Parameters.AddWithValue("@portfolioImage", hdfImage.Value);
            cmd.Parameters.AddWithValue("@WebsiteCity", txtCity.Text);
            cmd.Parameters.AddWithValue("@sort", txtSortO.Text);
            cmd.Parameters.AddWithValue("@PortfolioType", drdPortType.SelectedValue);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Record Saved Successfully";
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [Portfolio] SET [PortfolioTitle] = @PortfolioTitle,[PortfolioSubTitle] = @PortfolioSubTitle,[PortfolioLink] = @PortfolioLink,[portfolioImage] =@portfolioImage,[WebsiteCity] = @WebsiteCity,[PortfolioType] = @PortfolioType,[sort]=@sort WHERE ID=" + hdfID.Value+"");
            cmd.Parameters.AddWithValue("@PortfolioTitle", txtportfolio.Text);
            cmd.Parameters.AddWithValue("@PortfolioSubTitle", txtSubTitle.Text);
            cmd.Parameters.AddWithValue("@PortfolioLink", txtUrl.Text);
            cmd.Parameters.AddWithValue("@portfolioImage", hdfImage.Value);
            cmd.Parameters.AddWithValue("@WebsiteCity", txtCity.Text);
            cmd.Parameters.AddWithValue("@sort", txtSortO.Text);
            cmd.Parameters.AddWithValue("@PortfolioType", drdPortType.SelectedValue);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Record Update Successfully";
        }

        Clr();
    }

    private void Clr()
    {
        drdPortType.ClearSelection();
        txtCity.Text = string.Empty;
        txtportfolio.Text = string.Empty;
        txtSubTitle.Text = string.Empty;
        txtUrl.Text = string.Empty;
        hdfImage.Value = string.Empty;
        hdfID.Value=string.Empty;
        txtSortO.Text = string.Empty;
        Button1.Text = "submit";
    }
}