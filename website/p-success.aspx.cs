using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PSuccess : System.Web.UI.Page
{
    public string orderStatus = string.Empty;
    public string succMsg = string.Empty;
    public string TrackId = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["ordSt"] != null)
            {
                orderStatus = DB_Configuration.Decryptdata(Request.QueryString["ordSt"].ToString());
            }
            if (Request.QueryString["sMsg"] != null)
            {
                succMsg = DB_Configuration.Decryptdata(Request.QueryString["sMsg"].ToString());
            }
            if (Request.QueryString["trkId"] != null)
            {
                TrackId = DB_Configuration.Decryptdata(Request.QueryString["trkId"].ToString());
            }
        }
    }
}