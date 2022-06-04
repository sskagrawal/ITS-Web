using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_User_UserParmition : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindUserRole();
            BindTReeView();
        }
    }

    private void BindTReeView()
    {
        DataTable dt = DataAccess.GetData("SELECT * FROM Mst_Menu_Master WHERE [ParentID]='0'");
        PopulateTreeView(dt, 0, null);
    }

    private void BindUserRole()
    {
        drdUserRole.Items.Clear();
        ListItem item1 = new ListItem();
        item1.Value = "0";
        item1.Text = "--Select User Role--";
        drdUserRole.Items.Add(item1);
        DataTable dt = DataAccess.GetData("Select * from User_Role");
        if (dt.Rows.Count > 0 && dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["User_Role_ID"].ToString();
                item.Text = dr["User_Role"].ToString();
                drdUserRole.Items.Add(item);
            }
        }
    }
    private void PopulateTreeView(DataTable dtParent, int parentId, TreeNode treeNode)
    {
        foreach (DataRow row in dtParent.Rows)
        {
            TreeNode child = new TreeNode
            {
                Text = row["MenuName"].ToString(),
                Value = row["MenuID"].ToString()
            };
            if (parentId == 0)
            {
                TreeView1.Nodes.Add(child);
                DataTable dtChild = DataAccess.GetData("SELECT * FROM Mst_Menu_Master WHERE [ParentID] = " + child.Value);
                PopulateTreeView(dtChild, int.Parse(child.Value), child);
            }
            else
            {
                treeNode.ChildNodes.Add(child);
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        foreach (TreeNode item in this.TreeView1.CheckedNodes)
        {
            string ChkMenuID = string.Empty;
            try
            {
                // 
                ChkMenuID = DataAccess.GetSingleValue("Select User_Permission_ID from User_Grant_Roles where Role_ID='" + drdUserRole.SelectedValue + "' and Menu_ID='" + item.Value + "'");

            }
            catch { }
            if (ChkMenuID == string.Empty)
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO [User_Grant_Roles] ([User_ID],[Role_ID],[Menu_ID],[Has_Permission],[Created_On]) VALUES(@User_ID,@Role_ID,@Menu_ID,@Has_Permission,@Created_On)");
                cmd.Parameters.AddWithValue("@User_ID", " ");
                cmd.Parameters.AddWithValue("@Role_ID", drdUserRole.SelectedValue);
                cmd.Parameters.AddWithValue("@Menu_ID", item.Value);
                cmd.Parameters.AddWithValue("@Has_Permission", true);
                cmd.Parameters.AddWithValue("@Created_On", DateTime.Now);
                DataAccess.InsertExecuteNonQuery(cmd);
                alert.Visible = true;
                lblMsg.Text = "record saved successfully";
            }
            else
            {
                SqlCommand cmd = new SqlCommand("UPDATE [User_Grant_Roles] SET [User_ID] = @User_ID,[Role_ID] = @Role_ID,[Menu_ID] = @Menu_ID,[Has_Permission] = @Has_Permission WHERE User_Permission_ID='" + ChkMenuID + "'");
                cmd.Parameters.AddWithValue("@User_ID", " ");
                cmd.Parameters.AddWithValue("@Role_ID", drdUserRole.SelectedValue);
                cmd.Parameters.AddWithValue("@Menu_ID", item.Value);
                cmd.Parameters.AddWithValue("@Has_Permission", true);
                cmd.Parameters.AddWithValue("@Created_On", DateTime.Now);
                DataAccess.InsertExecuteNonQuery(cmd);
                alert.Visible = true;
                lblMsg.Text = "record update successfully";
            }

           // TreeNode node = TreeView1.CheckedNodes[0];
            //node.Checked = false;
        }
    }
}