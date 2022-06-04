using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class FindJob : System.Web.UI.Page
{
    private int CurrentPage = 1;

    private int ItemsPerPage = 20;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["sridd"] != null)
            {
                hdfUserID.Value = Session["sridd"].ToString();
                //Your request has been sent successfully
                if (Request.QueryString["UID"] != null)
                {
                    alertM.Visible = true;
                    lblPMSG.Text = "Your request has been sent successfully";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                }

            }
            //BindNew();
            BindEXP();
            BindIndustries();
            BindQualification();
            if (ViewState["CurrentPage"] != null)
            {

                this.CurrentPage = Convert.ToInt32(ViewState["CurrentPage"]);

            }

            //if (!IsPostBack)
            //{

            int TotalRows = this.BindList(1);

            this.Prepare_Pager(TotalRows);




            //}
        }
    }

    protected void Pager_Click(object sender, EventArgs e)
    {

        LinkButton lnkPager = (LinkButton)sender;

        int PageNo = 1;

        switch (lnkPager.CommandName)
        {

            case "Previous":

                PageNo = this.CurrentPage - 1;

                break;

            case "Next":

                PageNo = this.CurrentPage + 1;

                break;

        }

        int TotalRows = this.BindList(PageNo);

        int PageCount = this.CalculateTotalPages(TotalRows);

        ViewState["CurrentPage"] = PageNo;

        if (PageNo == 1)
        {

            lnkPrev.Enabled = false;

        }

        else
        {

            lnkPrev.Enabled = true;

        }

        if (PageNo == PageCount)
        {

            lnkNext.Enabled = false;

        }

        else
        {

            lnkNext.Enabled = true;

        }

    }

    private int BindList(int PageNo)
    {

        int TotalRows = 0;

        string Search = string.Empty;
        if (drdExperience.SelectedValue != "0")
        {
            Search += " AND Exp='" + drdExperience.SelectedItem.Text + "'";
        }
        if (drdIndustry.SelectedValue != "0")
        {
            Search += " AND Industry='" + drdIndustry.SelectedItem.Text + "'";
        }
        if (drdQual.SelectedValue != "0")
        {
            Search += " AND job_Qulalification='" + drdQual.SelectedItem.Text + "'";
        }

        DataTable dt = new DataTable();


        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

        SqlConnection con = new SqlConnection(strConnString);

        SqlDataAdapter sda = new SqlDataAdapter();

        SqlCommand cmd = new SqlCommand("spx_Pager");

        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@PageNo", SqlDbType.Int).Value = PageNo;

        cmd.Parameters.Add("@ItemsPerPage", SqlDbType.Int).Value = ItemsPerPage;

        cmd.Parameters.Add("@TotalRows", SqlDbType.Int).Direction = ParameterDirection.Output;

        //cmd.Parameters.Add("@ItemsPerPage", SqlDbType.Int).Value = ItemsPerPage;
        if (Search != string.Empty)
        {
            cmd.Parameters.Add("@Search", SqlDbType.Text).Value = Search + "and JobCategory !='JobSheeker'";
        }
        else
        {
            cmd.Parameters.Add("@Search", SqlDbType.Text).Value = "and 1=1 and JobCategory !='JobSheeker'";
        }

        cmd.Connection = con;

        try
        {

            con.Open();

            sda.SelectCommand = cmd;

            sda.Fill(dt);

            DataList1.DataSource = dt;

            DataList1.DataBind();

            TotalRows = Convert.ToInt32(cmd.Parameters["@TotalRows"].Value);

        }

        catch (Exception ex)
        {

            Response.Write(ex.Message);

        }

        finally
        {

            con.Close();

            sda.Dispose();

            con.Dispose();

        }

        return TotalRows;

    }


    private int CalculateTotalPages(int intTotalRows)
    {

        int intPageCount = 1;

        double dblPageCount = (double)(Convert.ToDecimal(intTotalRows) / Convert.ToDecimal(this.ItemsPerPage));

        intPageCount = Convert.ToInt32(Math.Ceiling(dblPageCount));

        return intPageCount;

    }


    private void Prepare_Pager(int TotalRows)
    {

        int intPageCount = this.CalculateTotalPages(TotalRows);

        if (intPageCount > 1 && this.CurrentPage < intPageCount)
        {

            this.lnkNext.Enabled = true;

        }

        if (this.CurrentPage != 1)
        {

            this.lnkPrev.Enabled = true;

        }

        else
        {

            this.lnkPrev.Enabled = false;

        }

    }

    private void BindQualification()
    {
        drdQual.Items.Clear();
        ListItem item = new ListItem("Select Qalification", "0");
        drdQual.Items.Add(item);
        DataTable dt = DataAccess.GetData("Select * from Qalification  order by Qualification");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                ListItem item1 = new ListItem(row["Qualification"].ToString(), row["ID"].ToString());
                drdQual.Items.Add(item1);
            }
        }
    }

    private void BindIndustries()
    {
        drdIndustry.Items.Clear();
        ListItem item = new ListItem("Select Industry", "0");
        drdIndustry.Items.Add(item);
        DataTable dt = DataAccess.GetData("Select * from Industry_Mst"); //order by Industry
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                ListItem item1 = new ListItem(row["Industry"].ToString(), row["ID"].ToString());
                drdIndustry.Items.Add(item1);
            }
        }
    }

    private void BindEXP()
    {
        drdExperience.Items.Clear();
        ListItem item = new ListItem("Select Experience", "0");
        drdExperience.Items.Add(item);
        DataTable dt = DataAccess.GetData("Select * from EsperienceMST");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                ListItem item1 = new ListItem(row["Experience"].ToString(), row["ID"].ToString());
                drdExperience.Items.Add(item1);
            }
        }
    }

    //private void BindNew()
    //{
    //    string Query = string.Empty;
    //    Query = "select * from [View_FindJob] ";
    //    string whereConcatenator = " WHERE ";

    //    if (drdExperience.SelectedValue != "0")
    //    {
    //        Query += whereConcatenator;
    //        Query += "Exp =" + drdExperience.SelectedItem.Text + "";
    //        whereConcatenator = "and ";
    //    }
    //    if (drdIndustry.SelectedValue != "0")
    //    {
    //        Query += whereConcatenator;
    //        Query += "Industry =" + drdIndustry.SelectedItem.Text + "";
    //        whereConcatenator = "and ";
    //    }
    //    //if (drdIndustry.SelectedValue != "0")
    //    //{
    //    //    Query += whereConcatenator;
    //    //    Query += "AreaID =" + drdArea.SelectedValue + "";
    //    //    whereConcatenator = "and ";
    //    //}
    //    if (drdQual.SelectedValue != "0")
    //    {
    //        Query += whereConcatenator;
    //        Query += "job_Qulalification =" + drdQual.SelectedItem.Text + "";
    //        whereConcatenator = "and ";
    //    }

    //    Query += whereConcatenator;
    //    Query += "JobCategory ='Client'";

    //    //if (drdSeacrchTP.SelectedValue == "2")
    //    //{
    //    //    Query += whereConcatenator;
    //    //    Query += "PinCode ='" + txtSearchValue.Text.Trim() + "'";
    //    //    whereConcatenator = "and ";
    //    //}

    //    //Query += "order by CreateOn desc";
    //    DataTable dt = DataAccess.GetData(Query);
    //    //DataTable dt = DataAccess.GetData("Select * from View_FindJob where JobCategory ='Client'");
    //    if (dt.Rows.Count > 0 && dt != null)
    //    {
    //        for (int i = 0; i < dt.Rows.Count;i++ )
    //        {

    //            ltrJobList.Text += "<article data-grid='ninzio_01' class='post-194 post type-post status-publish format-aside has-post-thumbnail hentry category-marketing tag-design tag-eva tag-external tag-logo tag-marketing tag-ninzio-style tag-painting tag-smart post_format-post-format-aside' id='post-194'>";
    //            ltrJobList.Text += "<div class='post-date-custom'><span>" + Convert.ToDateTime(dt.Rows[i]["CreatedOn"]).ToString("dd") + "</span><span>" + Convert.ToDateTime(dt.Rows[i]["CreatedOn"]).ToString("MMM") + "</span></div> ";
    //            ltrJobList.Text += "<div class='post-body'><div class='post-body-in'>";
    //            ltrJobList.Text += "<div class='format-wrapper nz-clearfix'>";
    //            //ltrJobList.Text += "<div class='col8'><h3 class='post-title'><a href='#' title='' rel='bookmark'> " + dt.Rows[i]["job_Title"].ToString() + "</a> </h3></div>  ";
    //            ltrJobList.Text += "<div class='col8' style='margin:0;'> <div class='col-inner'>";
    //            ltrJobList.Text += "<h3 id='h3_01b4_1' class='vc_custom_heading ninzio-latter-spacing'  style='text-align:left;'>" + dt.Rows[i]["job_Title"].ToString() + "</h3>";
    //            ltrJobList.Text += "<div class=''  style='text-align:left;' data-effect='none'>";
    //            ltrJobList.Text += "<div class='nz-separator solid' id='div_01b4_21'>&nbsp;</div>";
    //            ltrJobList.Text += "</div>";
    //            ltrJobList.Text += "</div></div>  ";
    //            //ltrJobList.Text += "<div class='col4'><div style='float:right;'><img src='Job_Image/" + dt.Rows[i]["job_Image"].ToString() + "' /> </div>";
    //            //ltrJobList.Text += "</div> ";
    //            ltrJobList.Text += "<div class='postmeta'><span class='post-comments'><a href='#'>Job Open Date: " + Convert.ToDateTime(dt.Rows[i]["jobopen_Date"]).ToString("dd/MM/yyyy") + "</a>  &nbsp; &nbsp;<strong>|</strong> &nbsp;&nbsp; <a href='#'>  Job Close Date: " + Convert.ToDateTime(dt.Rows[i]["jobClose_Date"]).ToString("dd/MM/yyyy") + "</a>  &nbsp; &nbsp;<strong>|</strong> &nbsp;&nbsp; <a href='#'> Location: " + dt.Rows[i]["CityID"].ToString() + "</a></div>";
    //            ltrJobList.Text += "<p><strong>Experience:-</strong>" + dt.Rows[i]["Exp"].ToString() + " &nbsp;<strong>|</strong> &nbsp;<strong>No. of Position:-</strong>" + dt.Rows[i]["Position"].ToString() + " &nbsp;<strong>|</strong> &nbsp;<strong>Salary:-</strong> <i class='fa fa-inr'></i> " + dt.Rows[i]["MimiSalery"].ToString() + " To <i class='fa fa-inr'></i>  " + dt.Rows[i]["MaxiMum"].ToString() + " &nbsp;<strong>|</strong> &nbsp;<strong>Qualification:-</strong>" + dt.Rows[i]["job_Qulalification"].ToString() + "&nbsp;<strong>|</strong> &nbsp;<strong>Job Type:-</strong>" + dt.Rows[i]["JobType"].ToString() + "</p>";
    //            //ltrJob.Text += "<p><strong> Qualification:-</strong>" + dt.Rows[i]["job_Qulalification"].ToString() + "</p>";
    //            ltrJobList.Text += "<div class='post-excerpt' style='font-size: 14px; margin-bottom: 22px;  line-height: 25px;  font-family: Open Sans;    font-style: normal;'>";
    //            ltrJobList.Text += "<strong>  Description:-</strong>" + dt.Rows[i]["job_Desc"].ToString() + "</div>";
    //            if (Session["sridd"] != null)
    //            {
    //                ltrJobList.Text += "  <hr />";
    //                ltrJobList.Text += "<h3 style='padding-top: 14px;'>Company Name:-<strong>" + dt.Rows[i]["CompanyName"].ToString() + "</strong></h3>";
    //                ltrJobList.Text += "<p><strong>Contact Info: Name:-</strong>" + dt.Rows[i]["Name"].ToString() + " &nbsp;|&nbsp;<strong>Mobile No.:-</strong>" + dt.Rows[i]["MobileNo"].ToString() + " &nbsp;|&nbsp;<strong>Email ID.:-</strong>" + dt.Rows[i]["EmailID"].ToString() + "</p>";
    //                ltrJobList.Text += "<p><strong>Website:-</strong><a href='http://" + dt.Rows[i]["Website"].ToString() + "' target='_blank'>Click Here</a>&nbsp;|&nbsp;<strong>Address:-</strong>" + dt.Rows[i]["Address"].ToString() + "</p>";
    //                ltrJobList.Text += "<div class='col12'>";
    //                ltrJobList.Text += "<div style='float:right;'>";
    //                ltrJobList.Text += "<a href='' class='button button-3d green full-false medium square icon-true animate-false anim-type-ghost element-animate-false' style='background-color:#F0634C'>Apply Now</a>";
    //          ltrJobList.Text += "</div></div>";
    //            }
    //            else
    //            {
    //                ltrJobList.Text += "  <hr />";
    //                ltrJobList.Text += "  <a class='top-button' data-toggle='modal' data-target='#myModal'>Read More</a>";
    //            }
    //           ltrJobList.Text += "</div></div></div></article>";
    //        }
    //    }
    //}
    ////protected void lbtnSubmit_Click(object sender, EventArgs e)
    ////{
    ////    string Mob = string.Empty;
    ////    try
    ////    {
    ////         Mob = DataAccess.GetSingleValue("select MobileNo from UserDetails where MobileNo='"+txtMobNo.Text+"'");
    ////    }
    ////    catch { }
    ////    if (Mob == string.Empty)
    ////    {
    ////        SqlCommand cmd = new SqlCommand("INSERT INTO [UserDetails]([UserName],[PassWord],[Createon],[MobileNo],[Name],[InActive],[UserTypeID],[EmailID]) VALUES(@UserName,@PassWord,@Createon,@MobileNo,@Name,@InActive,@UserTypeID,@EmailID)");
    ////        cmd.Parameters.AddWithValue("@UserName", txtName.Text);
    ////        cmd.Parameters.AddWithValue("@PassWord", txtPSWD.Text.Trim());
    ////        cmd.Parameters.AddWithValue("@Createon", DateTime.Now);
    ////        cmd.Parameters.AddWithValue("@MobileNo", txtMobNo.Text);
    ////        cmd.Parameters.AddWithValue("@Name", txtName.Text);
    ////        cmd.Parameters.AddWithValue("@EmailID",txtEmailID.Text);
    ////        cmd.Parameters.AddWithValue("@InActive", "True");
    ////        cmd.Parameters.AddWithValue("@UserTypeID", drdIndustries.SelectedValue);
    ////        DataAccess.InsertExecuteNonQuery(cmd);

    ////        alert.Visible = true;
    ////        lblMSG.Text = "Your registration has been successfully completed";

    ////    }
    ////    else
    ////    {
    ////        alert.Visible = true;
    ////        lblMSG.Text = "This mobile number is already registered";

    ////    }
    ////    ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
    ////    CLR();
    ////}

    ////private void CLR()
    ////{
    ////    txtEmailID.Text = string.Empty;
    ////    txtMobNo.Text = string.Empty;
    ////    txtName.Text = string.Empty;
    ////    txtPSWD.Text = string.Empty;
    ////    drdIndustries.ClearSelection();
    ////}

    //protected void lbtnSend_Click1(object sender, EventArgs e)
    //{

    //}
    protected void lbtnSend_Click(object sender, EventArgs e)
    {
        int TotalRows = this.BindList(1);
    }

    //protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    //{
    //    Panel pDownload = e.Item.FindControl("pDownload") as Panel;
    //    Panel pRMore = e.Item.FindControl("pRMore") as Panel;
    //    string PlanID = DataAccess.GetSingleValue("Select PlanID From UserPlanDetaile where UserID='" + hdfUserID.Value + "'");
    //    if (PlanID != string.Empty)
    //    {
    //        pDownload.Visible = true;
    //        pRMore.Visible = true;
    //    }
    //    else
    //    {
    //        pDownload.Visible = false;
    //        pRMore.Visible = true;
    //    }
    //}
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Panel pDownload = e.Item.FindControl("pDownload") as Panel;
        Panel pRMore = e.Item.FindControl("pRMore") as Panel;
        if (hdfUserID.Value != string.Empty)
        {
            string PlanID = string.Empty;
            try
            {
                PlanID = DataAccess.GetSingleValue("Select PlanID From UserPlanDetaile where UserID='" + hdfUserID.Value + "'");
            }
            catch { }
            if (PlanID != string.Empty)
            {
                pDownload.Visible = true;
                pRMore.Visible = false;
            }
            else
            {
                pDownload.Visible = false;
                pRMore.Visible = true;
            }
        }
        else
        {
            pDownload.Visible = false;
            pRMore.Visible = true;

        }
    }
}