using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Master_TreeView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (!this.IsPostBack)
            {
                DataTable dt =DataAccess.GetData("SELECT * FROM Mst_Menu_Master WHERE [ParentID]='0'");
                this.PopulateTreeView(dt, 0, null);
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
}