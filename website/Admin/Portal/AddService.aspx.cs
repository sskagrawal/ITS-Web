using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Portal_AddService : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAddService_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("INSERT INTO [ServiceMST] ([ServiceID],[ServiceNM],[ServiceAMT],[Sort],[CreateOn]) VALUES(@ServiceID,@ServiceNM,@ServiceAMT,@Sort,@CreateOn)");
    }
}