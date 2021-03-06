using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;

public partial class FindJob : System.Web.UI.Page
{
    private int CurrentPage = 1;

    private int ItemsPerPage = 8;
    private object ltrSkills;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //if (Session["sridd"] != null)
            //{
            //    hdfUserID.Value = Session["sridd"].ToString();              
            //    if (Request.QueryString["UID"] != null)
            //    {
            //        alertM.Visible = true;
            //        lblPMSG.Text = "Your request has been sent successfully";
            //        ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            //    }

            //}
            //BindNew();
            BindEXP();
            BindIndustries();
            BindQualification();
            if (ViewState["CurrentPage"] != null)
            {
                this.CurrentPage = Convert.ToInt32(ViewState["CurrentPage"]);
            }
            BindGrid();
           
        }
    }

   

    private void BindGrid()
    {
        string Query = string.Empty;
        Query = "select * from [View_FindJob] ";
        string whereConcatenator = " WHERE ";

        if (drdExperience.SelectedValue != "0")
        {
            Query += whereConcatenator;
            Query += "Exp ='" + drdExperience.SelectedItem.Text + "'";
            whereConcatenator = "and ";
        }
        if (drdIndustry.SelectedValue != "0")
        {
            Query += whereConcatenator;
            Query += "Industry ='" + drdIndustry.SelectedItem.Text + "'";
            whereConcatenator = "and ";
        }
     
        if (drdQual.SelectedValue != "0")
        {
            Query += whereConcatenator;
            Query += "job_Qulalification ='" + drdQual.SelectedItem.Text + "'";
            whereConcatenator = "and ";
        }

        Query += whereConcatenator;
        Query += "JobCategory !='JobSheeker' and Exp IS NOT NULL and MimiSalery IS NOT NULL and job_Qulalification IS NOT NULL ";
        //Query += "Exp IS NOT NULL";
        //Query += "MimiSalery IS NOT NULL";
        //Query += "job_Qulalification IS NOT NULL ";

        //and[Exp] IS NOT NULL and[MimiSalery] IS NOT NULL and[job_Qulalification]IS NOT NULL
        Query += "order by [OrderPosition] ASC";
        //Query += "order by CreatedOn desc";
        DataTable dt = DataAccess.GetData(Query);
        if (dt.Rows.Count > 0 && dt != null)
        {
            DataList1.DataSource = dt;

            DataList1.DataBind();

            BindJobSkill();
        }
    }


    



    public void BindJobSkill()
    {
       // ltrSkills.Text += "";

        //ltrSkill.Text += "<ul id='footer-menu' class='menu'>";
        //DataTable dtskill = DataAccess.GetData(" Select Distinct * from [View_Post_Job_Skill] Where [PartyID]=" + hdfpartyid.Value + " ");
        //if (dtskill.Rows.Count > 0)
        //{
        //    ltrSkill.Text += "<li class='menu-item' style='list-style:none;display:inline;'><strong> Skills </strong></li>";
        //    foreach (DataRow dr1 in dtskill.Rows)
        //    {
        //        ltrSkill.Text += "<li class='menu-item' style='list-style:none;display:inline;'>" + dr1["Skill_Name"].ToString() + "</li> , &nbsp;";

        //    }
        //}
        //ltrSkill.Text += "</ul> ";
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

    
    protected void lbtnSend_Click(object sender, EventArgs e)
    {
        //int TotalRows = this.BindList(1);
        BindGrid();
    }

    
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {

        HiddenField hdfJOBID1 = e.Item.FindControl("hdfJOBID") as HiddenField;
        Label lblCounter = e.Item.FindControl("lblCounter") as Label;
        if (lblCounter.Text!= string.Empty)
        {
            DataTable dtcount = DataAccess.GetData("Select [View_Counter] from [View_FindJob] Where[job_Id]=" + hdfJOBID1.Value + " ");
            if (dtcount.Rows.Count > 0)
            {
                lblCounter.Text = dtcount.Rows[0]["View_Counter"].ToString();
            }
        }

        else
        {

            lblCounter.Text = "0";
        }


        Label lblExpe = e.Item.FindControl("lblExperience") as Label;        
          if(lblExpe.Text!=string.Empty && lblExpe.Text== "Select Experience")
          {
            

           }
          else
          {

            lblExpe.Text = "Not Required";

           }

        Label lbljobtitle = e.Item.FindControl("lblJobtitle") as Label;

        string jobtitle = lbljobtitle.Text;
        int headingLength1 = jobtitle.Length;
        if (headingLength1 > 45)
        {
            string str1 = jobtitle.Substring(0, 40);
            lbljobtitle.Text = str1 + "  ..... <br/> ";

        }


        Label lbljobQualifcation = e.Item.FindControl("lblQualification") as Label;

         if(lbljobQualifcation.Text!=String.Empty && lbljobQualifcation.Text != "Select Qualification")
          {
            
          }

         else
          {
            lbljobQualifcation.Text = "Not Required";
          }

        Label lbljobDesc = e.Item.FindControl("lblJobDesription") as Label;
        string jobtxt = lbljobDesc.Text;
        int headingLength = jobtxt.Length;
        if (headingLength > 170)
        {
            string str1 = jobtxt.Substring(0, 170);
            lbljobDesc.Text = str1 + "  ..... <br/> ";
          
        }
       

        Panel pDownload = e.Item.FindControl("pDownload") as Panel;
        Panel pRMore = e.Item.FindControl("pRMore") as Panel;
        Panel PApplye = e.Item.FindControl("PApplye") as Panel;
        HiddenField hdfJobOpDate = e.Item.FindControl("hdfJobOpDate") as HiddenField;
        Label lblPostDay = e.Item.FindControl("lblPostDay") as Label;
        HiddenField hdfJOBID = e.Item.FindControl("hdfJOBID") as HiddenField;
        if (hdfJobOpDate.Value != string.Empty)
        {
            DateTime dthdfOpDate = Convert.ToDateTime(hdfJobOpDate.Value);
            DateTime dtcurrentD = DateTime.Now;
            TimeSpan t = dtcurrentD - dthdfOpDate;
            double CurDay = t.TotalDays;
            int var = Convert.ToInt32(CurDay);
            string DayAgo = string.Empty;
            if (var < 7)
            {
                DayAgo = Convert.ToString(var + " Day(s) ago");
            }
            else if (var >= 7 && var < 30)
            {
                int noWeek = var / 7;
                int noday = var % 7;
                if (noday > 0)
                {
                    DayAgo = noWeek + " Week and " + noday + " Day(s) ago";
                }
                else
                {
                    DayAgo = noWeek + " Week ago";//Convert.ToString(var+" Days");
                }
            }
            else if (var >= 30)
            {
                int noWeek = var / 30;
                int noday = var % 30;
                if (noday > 0)
                {
                    if (noday >= 7)
                    {
                        int noWeek1 = noday / 7;
                        int noday1 = noday % 7;
                        if (noday1 > 0)
                        {
                            DayAgo = noWeek + " Month, " + noWeek1 + " Week and " + noday1 + " Day(s) ago";
                        }
                        else
                        {
                            DayAgo = noWeek1 + " Week ago";//Convert.ToString(var+" Days");
                        }
                    }
                    else
                    {
                        DayAgo = noWeek + " Month and " + noday + " Day(s) ago";
                    }
                }
                else
                {
                    DayAgo = noWeek + " Month ago";//Convert.ToString(var+" Days");
                }
            }
            lblPostDay.Text = DayAgo;
        }

        
        //if (hdfUserID.Value != string.Empty)
        //{
        //    string PlanID = string.Empty;
        //    string JobApple = string.Empty;
        //    try
        //    {
        //        // PlanID = DataAccess.GetSingleValue("Select PlanID From UserPlanDetaile where UserID='" + hdfUserID.Value + "'");
        //        JobApple = DataAccess.GetSingleValue("Select ID From JobApply where RequestID='" + hdfUserID.Value + "' and JobID='" + hdfJOBID.Value + "'");
        //    }
        //    catch { }
        //    if (hdfUserID.Value != string.Empty)
        //    {
        //        if (JobApple != string.Empty)
        //        {
        //            PApplye.Visible = true;
        //            pDownload.Visible = false;
        //            pRMore.Visible = false;
        //        }
        //        else
        //        {
        //            pDownload.Visible = true;
        //            pRMore.Visible = false;
        //        }

        //    }
        //    else
        //    {
        //        pDownload.Visible = false;
        //        pRMore.Visible = true;
        //    }
        //}
        //else
        //{
        //    pDownload.Visible = false;
        //    pRMore.Visible = true;

        //}

        int id = Convert.ToInt32(DataList1.DataKeys[e.Item.ItemIndex].ToString());

      

        Literal ltrskill = e.Item.FindControl("ltrskill") as Literal;     

      
           DataTable dtskill = DataAccess.GetData(" Select top 4 Skill_Name from [View_Post_Job_Skill] where [job_Id]=" + id + "  ");

            if (dtskill.Rows.Count > 0)
            {
                
                foreach (DataRow dr1 in dtskill.Rows)
                {
                  ltrskill.Text +="<a href='javascript:void(0)'>" + dr1["Skill_Name"].ToString() + "</a>";

                }
            }

        Label lblBudget = e.Item.FindControl("lblBudget") as Label;
        HiddenField hdfUnit = e.Item.FindControl("hdfUnit") as HiddenField;
        HiddenField hdfFixPrice = e.Item.FindControl("hdfFixPrice") as HiddenField;
        HiddenField hdfMinSal = e.Item.FindControl("hdfMinSal") as HiddenField;
        HiddenField hdfMaxSal = e.Item.FindControl("hdfMaxSal") as HiddenField;
        if (hdfUnit.Value== "Fix Price")
        {
            lblBudget.Text = hdfFixPrice.Value + " Fix Price";
        }
        else
        {
            lblBudget.Text = hdfMinSal.Value + " - " + hdfMaxSal.Value;
        }


    }   


    public static void GetStartAndEndOfWeek(int year, int week, out DateTime startOfWeek, out DateTime endOfWeek)

    {

        // find the first week.

        CalendarWeekRule cwr = CultureInfo.CurrentCulture.DateTimeFormat.CalendarWeekRule;
        DayOfWeek firstDayOfWeek = CultureInfo.CurrentCulture.DateTimeFormat.FirstDayOfWeek;
        DateTime firstdayofyear = new DateTime(year, 1, 1);

        int offset = 0;



        if (firstdayofyear.DayOfWeek != firstDayOfWeek)

        {

            // find first first day.

            if (cwr == CalendarWeekRule.FirstFourDayWeek)

            {

                DateTime firstFullWeekStart = firstdayofyear;

                while (firstFullWeekStart.DayOfWeek != firstDayOfWeek)

                    firstFullWeekStart = firstFullWeekStart.AddDays(1);

                if (firstFullWeekStart.Subtract(firstdayofyear).Days >= 4)

                    offset = -1;

            }



            if (cwr == CalendarWeekRule.FirstDay)

                offset = -1;

        }



        startOfWeek = firstdayofyear.AddDays(7 * (week + offset));



        while (startOfWeek != firstdayofyear && startOfWeek.DayOfWeek != firstDayOfWeek)

            startOfWeek = startOfWeek.AddDays(-1);



        endOfWeek = startOfWeek;

        do

        {

            endOfWeek = endOfWeek.AddDays(1);

        } while (endOfWeek < new DateTime(year + 1, 1, 1).AddDays(-1) && endOfWeek.AddDays(1).DayOfWeek != firstDayOfWeek);

    }

    protected void lnkBtnApplyJob_Click(object sender, EventArgs e)
    {
        LinkButton lBtn = (LinkButton)sender;
        string jbid = lBtn.CommandArgument;


    }



    protected void lnkBtnReadMore_Click(object sender, EventArgs e)
    {

    

        LinkButton lBtnReadMore = (LinkButton)sender;
        string jbid = lBtnReadMore.CommandArgument;
        Label lblCounter = FindControl("lblCounter") as Label;
        
        DataListItem grdView = (DataListItem)lBtnReadMore.NamingContainer;
        string jobtitle = Convert.ToString(((HiddenField)grdView.FindControl("hdfJobTiltll")).Value);
        string MaxID = string.Empty;
        DataTable dt = DataAccess.GetData("select max(View_Counter) as 'Counter' from [Job_Master] Where [job_Id]=" + jbid + " ");
        if (dt.Rows.Count > 0)
        {
            MaxID = dt.Rows[0]["Counter"].ToString();

        }
        int maxNo = 0;
        if (MaxID == string.Empty)
        {
            maxNo = 1;
            
        }

        else
        {
            int parse = int.Parse(MaxID);
            maxNo = parse + 1;
            
        }

        SqlCommand cmd = new SqlCommand("Update [Job_Master] Set [View_Counter]=@View_Counter Where [job_Id]="+jbid+" ");
        cmd.Parameters.AddWithValue("@View_Counter", maxNo);
        DataAccess.InsertExecuteNonQuery(cmd);

        Response.Redirect(GenerateURL(jobtitle,Convert.ToInt32(jbid)));
    }
    public static string GenerateURL(string title, int Id)
    {
        string strTitle = title.Trim();
        strTitle = strTitle.ToLower();
        strTitle = strTitle.Replace("c#", "C-Sharp");
        strTitle = strTitle.Replace(" ", "-");
        strTitle = strTitle.Trim();
        strTitle = strTitle.Trim('-');
        strTitle = "/Job/" + strTitle + "-" + Id.ToString() + ".aspx";

        return strTitle;
    }
}