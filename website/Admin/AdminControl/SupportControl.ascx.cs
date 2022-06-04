using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_AdminControl_SupportControl : System.Web.UI.UserControl
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

        DataTable dt = DataAccess.GetData("Select top 2 * from [Co_Ordinator_Master] order by [CordntrId] desc ");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {

                ltrSupportAgent.Text += "<div class='profile-tile'>";
                ltrSupportAgent.Text += "<div class='profile-tile-box'>";


                ltrSupportAgent.Text += "<div class='pt-avatar-w'>";

                if (row["CoPhoto"].ToString() != string.Empty)
                {
                    ltrSupportAgent.Text += "<img alt = '' src='../../CoordinatorPhoto/" + row["CoPhoto"].ToString() + "'/>";
                }

                else
                {

                    ltrSupportAgent.Text += "<img alt = '' src='../../CoordinatorPhoto/dummy.png'/>";

                }

                ltrSupportAgent.Text += "</div>";

                ltrSupportAgent.Text += "<div class='pt-user-name'>" + row["FullName"].ToString() + "</div></div>";
                ltrSupportAgent.Text += "<div class='profile-tile-meta'>";
                ltrSupportAgent.Text += "<ul>";
                ltrSupportAgent.Text += "<li> <strong class='text-capitalize'><i class='fa fa-user'  aria-hidden='true'></i>: " + row["FullName"].ToString() + "</strong></li>";
                ltrSupportAgent.Text += "<li><span class='text-lowercase' style='color:#000;'> <i class='fa fa-phone'  aria-hidden='true'></i>: " + row["Mobile"].ToString() + "</span></li>";
                if (row["WhatsappNo"].ToString() != string.Empty)
                {
                    ltrSupportAgent.Text += "<li><span style='color:#000;'> <i class='fa fa-whatsapp'  aria-hidden='true'></i>: " + row["WhatsappNo"].ToString() + "</strong></li>";
                }
             
                ltrSupportAgent.Text += "</ul>";
              
                ltrSupportAgent.Text += " <div class='pt-btn'><a class='btn btn-success btn-sm' href='#'>Send Message</a></div></div></div>";
                  //ltrSupportAgent.Text += "<p><span style='color:#000;'>" + row["Email"].ToString() + "</span></p>";


            }


        }

    }
}