using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Admin_AdminControl_AdsControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            bindCoOrdinator();

        }
    }

    public void bindCoOrdinator()
    {

        //DataTable dt = DataAccess.GetData("Select top 1 * from [Ads_Master] order by [Last_Date] desc  ");
        //if (dt.Rows.Count > 0)
        //{
        //    ltrAds.Text+= "<h6 class='element-header'>"+dt.Rows[0]["AdTitle"].ToString()+"</h6>";
        //    ltrAds.Text += "<a href='"+dt.Rows[0]["AdLink"].ToString()  + "' target='_blank' title='" + dt.Rows[0]["AdTitle"].ToString() + "'>";
        //    ltrAds.Text += "<img src = '../../AdsImage/"+ dt.Rows[0]["Ads_Image"].ToString() + "' alt = '" + dt.Rows[0]["AdTitle"].ToString() + "' style = 'width:100%;'/></a>";

        //}

    }
}