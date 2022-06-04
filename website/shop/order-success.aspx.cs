using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class shop_order_success : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["invN"] != null)
            {
                succDiv.Visible = true;
                errDiv.Visible = false;
                ltrlMsg.Text = "Please Note down your Order No for future use<br><span style='color:green;font-size:18px'>Order No - " + DB_Configuration.Decryptdata(Request.QueryString["invN"].ToString()) + " </span>";
            }
            else
            {
                errDiv.Visible = true;
                succDiv.Visible = false;
            }
        }
    }
}