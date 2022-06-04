using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.IO;

public partial class AddMenu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //BindBlock();
            //BindParentMenu();
            BindParentMenu();
            if (Request.QueryString["MenuID"] != null)
            {
                hdfID.Value = Request.QueryString["MenuID"].ToString();
                DataTable dt = DataAccess.GetData("select * from Mst_Menu_Master  where  MenuID=" + hdfID.Value + "");
                if (dt.Rows.Count > 0 && dt != null)
                {
                    txtMenuName.Text = dt.Rows[0]["MenuName"].ToString();
                    txtUrl.Text = dt.Rows[0]["MenuUrl"].ToString();
                    drdMenu.SelectedValue = dt.Rows[0]["ParentID"].ToString();
                    txtSortOrder.Text = dt.Rows[0]["Sort_Order"].ToString();
                    txtIcon.Text = dt.Rows[0]["Css"].ToString();
                }
            }
        }
    }

    protected void btnUserName_Click(object sender, EventArgs e)
    {
        if (hdfID.Value == string.Empty)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [Mst_Menu_Master]([MenuName],[MenuUrl],[ParentID],[IsActive],[Sort_Order],[Css]) VALUES(@MenuName,@MenuUrl,@ParentID,@IsActive,@Sort_Order,@Css)");
            cmd.Parameters.AddWithValue("@MenuName", txtMenuName.Text);
            cmd.Parameters.AddWithValue("@MenuUrl", txtUrl.Text);
            if (drdMenuType.SelectedValue == "1")
            {
                cmd.Parameters.AddWithValue("@ParentID", "0");
            }
            else if (drdMenuType.SelectedValue == "2")
            {
                cmd.Parameters.AddWithValue("@ParentID", drdMenu.SelectedValue);
            }
            else
            {
                cmd.Parameters.AddWithValue("@ParentID", drdMenu.SelectedValue);
            }
            cmd.Parameters.AddWithValue("@IsActive", "True");
            cmd.Parameters.AddWithValue("@Sort_Order", txtSortOrder.Text);
            cmd.Parameters.AddWithValue("@Css", txtIcon.Text);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Record Saved Successfully";
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [Mst_Menu_Master] SET [MenuName] = @MenuName,[MenuUrl] = @MenuUrl,[ParentID] = @ParentID,[IsActive] = @IsActive,[Sort_Order] = @Sort_Order,[Css]=@Css WHERE  MenuID=" + hdfID.Value + " ");
            cmd.Parameters.AddWithValue("@MenuName", txtMenuName.Text);
            cmd.Parameters.AddWithValue("@MenuUrl", txtUrl.Text);
            if (drdMenuType.SelectedValue == "1")
            {
                cmd.Parameters.AddWithValue("@ParentID", "0");
            }
            else if (drdMenuType.SelectedValue == "2")
            {
                cmd.Parameters.AddWithValue("@ParentID", drdMenu.SelectedValue);
            }
            else
            {
                cmd.Parameters.AddWithValue("@ParentID", drdMenu.SelectedValue);
            }
            cmd.Parameters.AddWithValue("@IsActive", "True");
            cmd.Parameters.AddWithValue("@Sort_Order", txtSortOrder.Text);
            cmd.Parameters.AddWithValue("@Css", txtIcon.Text);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Record Update Successfully";
        }
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
        Clr();

    }

    private void Clr()
    {
        txtMenuName.Text = string.Empty;
        txtSortOrder.Text = string.Empty;
        txtUrl.Text = string.Empty;
        drdMenu.ClearSelection();
        drdMenuType.ClearSelection();
        txtIcon.Text = string.Empty;
        btnUserName.Text = "Submit";
    }
    public void BindParentMenu()
    {
        drdMenu.Items.Clear();
        ListItem item = new ListItem("Select Parent Menu", "");
        drdMenu.Items.Add(item);
        DataTable dt = DataAccess.GetData("Select * from Mst_Menu_Master where ParentID=0");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                ListItem item1 = new ListItem(row["MenuName"].ToString(), row["MenuID"].ToString());
                drdMenu.Items.Add(item1);
            }
        }
    }
    protected void drdMenuType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drdMenuType.SelectedValue == "2")
        {
            BindParentMenu();
        }
        else if (drdMenuType.SelectedValue == "1")
        {
            drdMenu.Items.Clear();
        }
    }
}