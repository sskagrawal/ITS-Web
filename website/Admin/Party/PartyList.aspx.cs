using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Amity.ERP_Utilities;
using System.Globalization;
using System.IO;
using System.Web.Services;
using System.Web.UI.HtmlControls;



public partial class Admin_Party_PartyList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            bindPartyType();
            BindgrideView();
            CustPager.Reload();

        }

        
    }

    protected void btnbtnSave_Click(object sender, EventArgs e)
    {
        BindgrideView();
        CustPager.Reload();
    }

    public void bindPartyType()
    {

        DrdpartyType.Items.Clear();
        ListItem item1 = new ListItem();
        item1.Text = ("Select Party Type");
        item1.Value = "0";
        DrdpartyType.Items.Add(item1);
        //DataTable dt = DataAccess.GetData("select  * from [UserType] where ID NOT IN (1,2,3,7) ");
        DataTable dt = DataAccess.GetData("select  * from [UserType] where ID NOT IN (1,7) ");
        foreach (DataRow dr in dt.Rows)
        {
            ListItem item = new ListItem();
            item.Value = dr["ID"].ToString();
            item.Text = dr["UserTypeName"].ToString();
            DrdpartyType.Items.Add(item);
        }
    }

    protected void btn_back(object sender, EventArgs e)
    {
        Response.Redirect("AddParty.aspx");
        
    }
    public void BindgrideView()
    {


        string Query = string.Empty;
        Query = "select  * from View_Party";
         string whereConcatenator = " WHERE ";

        if (DrdpartyType.SelectedValue != "0")
        {
            Query += whereConcatenator;          
            Query += "Party_Type='" + DrdpartyType.SelectedValue.Trim() + "'";
            whereConcatenator = " and ";
        }

        //if (Txtprtycat.Text != string.Empty)
        //{
        //    Query += whereConcatenator;         
        //    Query += "Party_Category like '%" + Txtprtycat.Text + "%' ";
        //    whereConcatenator = " and ";
        //}

        

        if (ddlPartysearch.SelectedValue == "1")
        {
            Query += whereConcatenator;
            Query += "Party_name like '" + txtsearch.Text + "%' ";
            whereConcatenator = " and ";
        }
        
        else if (ddlPartysearch.SelectedValue == "2")
        {
            Query += whereConcatenator;
            Query += "Email like '" + txtsearch.Text + "%' ";
            whereConcatenator = " and ";
        }

        else if (ddlPartysearch.SelectedValue == "3")
        {
            Query += whereConcatenator;
            Query += "mobile_no like '" + txtsearch.Text + "%' ";
            whereConcatenator = " and ";
        }

        else if (ddlPartysearch.SelectedValue == "4")
        {
            Query += whereConcatenator;
            Query += "Contact_person_name like '" + txtsearch.Text + "%' ";
            whereConcatenator = " and ";
        }


       

        if (drdStatus.SelectedValue!= "-1")
        {
            Query += whereConcatenator;
            Query += "Is_active= " + drdStatus.SelectedValue + " ";
            whereConcatenator = " and ";
        }       


        Query += " order by [PartyID] desc ";
        DataTable dt = DataAccess.GetData(Query);
      
        if (dt.Rows.Count > 0)
        {
            grdView.DataSource = dt;
            grdView.DataBind();

            grdView.Columns[10].Visible = false;
            grdView.Columns[11].Visible = false;
            grdView.Columns[12].Visible = false;       


            int TotalPage = dt.Rows.Count;
                  CustPager.TotalRecords = TotalPage;
                   CustPager.TotalPage = TotalPage % grdView.PageSize == 0 ? TotalPage / grdView.PageSize : TotalPage / grdView.PageSize + 1;
        }
        else
        {
            dt.Rows.Add(dt.NewRow());
            grdView.DataSource = dt; 
            grdView.DataBind();
            int TotalColumns = grdView.Rows[0].Cells.Count;
            grdView.Rows[0].Cells.Clear();
            grdView.Rows[0].Cells.Add(new TableCell());
            grdView.Rows[0].Cells[0].ColumnSpan = TotalColumns;
            grdView.Rows[0].Cells[0].Text = "No records Found";

        }

    }

  
    protected void CustPager_PageChanged(object sender, CustomPageChangeArgs e)
    {
        grdView.PageSize = e.CurrentPageSize;
        grdView.PageIndex = e.CurrentPageNumber - 1;
        BindgrideView();
       // CustPager.Reload();
    }

    protected void Edit(object sender, ImageClickEventArgs e)
    {
        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;
       

        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfID")).Value);


        if (btndetails.ID.Equals("imgbtnUpdate"))
        {
            Response.Redirect("~/Admin/Party/AddParty.aspx?ID=" + ID);
        }
        else if (btndetails.ID.Equals("imgbtnDelete"))
        {
            string MaxID = string.Empty;

            //ID_Generator ID_Gen = new ID_Generator();
            try
            {

                MaxID = DataAccess.GetSingleValue("select  PartyCode  from  PartyMaster  where  PartyID=" + ID + "");

            }
            catch { }
          
            Label Lblpartyname = (Label)grdView.FindControl("Lblpartyname");
            TextBox TxtdeleteCode = (TextBox)grdView.FindControl("TxtdeleteCode");
            Button btndelete = (Button)grdView.FindControl("btndelete");
            TxtdeleteCode.Visible = true;
            btndelete.Visible = true;

            //Your Party Delete otp{#var#} Are You Sure Do Want to Delete the party {#var#} in itsgwalior.com 
             string msg = "Your Party Delete otp " + MaxID + " Are You Sure Do Want to Delete the party " + Lblpartyname.Text + " in itsgwalior.com";
        
                if (MaxID != string.Empty)
                {
               //  SendSMS.ProcessSMS("8770168831", msg, "1207162443679103084");
                SendSMS.ProcessSMS("8989024130", msg, "1207162443679103084");

                hdfmsgCode.Value = MaxID;
                
                }          

        }
     
           }  

    protected void imgbtnActive_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtnEdit = sender as ImageButton;
        GridViewRow grdRow = (GridViewRow)imgbtnEdit.NamingContainer;
        string ID = (((HiddenField)(grdRow.FindControl("hdfID"))).Value).ToString();
        HiddenField hdfIsActive = (HiddenField)grdRow.FindControl("hdfIsActive");
        if (hdfIsActive.Value == "True")
        {
            SqlCommand cmd = new SqlCommand("UPDATE [PartyMaster] SET [Is_active] =0 WHERE PartyID=" + ID + " ");
            DataAccess.InsertExecuteNonQuery(cmd);
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [PartyMaster] SET [Is_active] =1 WHERE PartyID=" + ID + " ");
            DataAccess.InsertExecuteNonQuery(cmd);
        }
        BindgrideView();
        CustPager.Reload();

    }

    protected void grideViewCatogry_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        HiddenField hdfpartyid = (HiddenField)e.Row.FindControl("hdfID");
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
           
            ImageButton imgbtnActive = (ImageButton)e.Row.FindControl("imgbtnActive");
            ImageButton imgbtnDelete = (ImageButton)e.Row.FindControl("imgbtnDelete");
            HiddenField hdfIsActive = (HiddenField)e.Row.FindControl("hdfIsActive");
            Button btndelete = (Button)e.Row.FindControl("btndelete");
            TextBox TxtdeleteCode = (TextBox)e.Row.FindControl("TxtdeleteCode");
          

            if (hdfIsActive.Value == "True")
            {
                imgbtnActive.ToolTip = "Active";
                imgbtnActive.ImageUrl = "~/image/icon_enable.png";
                imgbtnDelete.Visible = false;
                
                

            }
            else
            {
                imgbtnActive.ToolTip = "Dactive";
                imgbtnActive.ImageUrl = "~/image/icon_disable.png";
                imgbtnDelete.Visible = true;
               
               

            }
            DataTable dt = DataAccess.GetData("select [VoucherMasterID] from [VoucherMaster] Where [PartyID]='" + hdfpartyid.Value + "'  ");
            if (dt.Rows.Count > 0 && dt != null)
            {
                LinkButton linkbutton2 = (LinkButton)e.Row.FindControl("LinkButton2");
                linkbutton2.Visible = true;
                
            }
            else
            {
                LinkButton linkbutton1 = (LinkButton)e.Row.FindControl("LinkButton1");
                linkbutton1.Visible = true;
            }

            //Get Password

          
            Label lblPaswd = (Label)e.Row.FindControl("lblPswd");

            DataTable dtpsw = DataAccess.GetData("Select PassWord from [UserDetails] Where [PartyID]='" + hdfpartyid.Value+ "' ");
            if (dtpsw.Rows.Count > 0)
            {

             lblPaswd.Text = dtpsw.Rows[0]["PassWord"].ToString();

            }

        }
    }
    

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton btndetails = sender as LinkButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;

        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfID")).Value);


        if (btndetails.ID.Equals("LinkButton2"))
        {
            //  Response.Redirect("~/Admin/Sale/View_Salevoucher.aspx?PID=" + ID);
            Response.Redirect("~/Admin/Sale/AddPartyService.aspx?PID=" + ID);
            
        }

        else
        
        if (btndetails.ID.Equals("LinkButton1"))
        {
            //  Response.Redirect("~/Admin/Sale/CreateSaleVoucher.aspx?PID=" + ID);
            Response.Redirect("~/Admin/Sale/AddPartyService.aspx?PID=" + ID);
        }
        
        BindgrideView();
        CustPager.Reload();

    }



    protected void btndelete_Click(object sender, EventArgs e)
    {
        Button btndetails = sender as Button;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;

        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfID")).Value);

        
        TextBox TxtdeleteCode = (TextBox)grdView.FindControl("TxtdeleteCode");
            
            if (TxtdeleteCode.Text != string.Empty)
            {
                if(string.Compare(TxtdeleteCode.Text,hdfmsgCode.Value)==0)
                {
                SqlCommand cmd = new SqlCommand("DELETE FROM [PartyMaster]  WHERE  PartyID =" + ID + "");
                DataAccess.InsertExecuteNonQuery(cmd);

                SqlCommand cmd1 = new SqlCommand("DELETE FROM [UserDetails]  WHERE  [PartyID] =" + ID + "");
                DataAccess.InsertExecuteNonQuery(cmd1);

                BindgrideView();
                CustPager.Reload();
            }      
         

        }
    }

    protected void drdStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindgrideView();
        CustPager.Reload();
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        DrdpartyType.ClearSelection();
        ddlPartysearch.ClearSelection();
        txtsearch.Text = string.Empty;
        drdStatus.ClearSelection();
        BindgrideView();
        CustPager.Reload();
    }

    protected void linkVouvher_Click(object sender, EventArgs e)
    {
        LinkButton btndetails = sender as LinkButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;

        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfID")).Value);


        if (btndetails.ID.Equals("linkVouvher"))
        {
            Response.Redirect("~/Admin/Sale/AddSaleVoucher.aspx?PID=" + ID);
        }
    }


    protected void ExportToExcel(object sender, EventArgs e)
    {
        grdView.Columns[1].Visible = false;
        grdView.Columns[2].Visible = false;
        grdView.Columns[3].Visible = false;

        grdView.Columns[10].Visible = true;
        grdView.Columns[11].Visible = true;
        grdView.Columns[12].Visible = true;
      //  grdView.Columns[13].Visible = true;
      //  grdView.Columns[14].Visible = true;
       // grdView.Columns[15].Visible = true;

        string attachment = "attachment; filename=partyList.xls";
        Response.ClearContent();
        Response.AddHeader("content-disposition", attachment);
        Response.ContentType = "application/ms-excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);
        grdView.AllowPaging = false;
        this.BindgrideView();

        grdView.Columns[1].Visible = false;
        grdView.Columns[2].Visible = false;
        grdView.Columns[3].Visible = false;

        grdView.Columns[10].Visible = true;
        grdView.Columns[11].Visible = true;
        grdView.Columns[12].Visible = true;
      //  grdView.Columns[13].Visible = true;
     //   grdView.Columns[14].Visible = true;
       // grdView.Columns[15].Visible = true;

        // Create a form to contain the grid
        HtmlForm frm = new HtmlForm();
        grdView.GridLines = GridLines.Both;
        grdView.HeaderStyle.Font.Bold = true;
        grdView.RowStyle.Font.Size = 10;
        grdView.Width = 50;
        //grdView.Parent.Controls.Add(frm);
        //frm.Attributes["runat"] = "server";
        //frm.Controls.Add(grdView);
        //frm.RenderControl(htw);

        //GridView1.RenderControl(htw);
        Response.Write(sw.ToString());
        Response.End();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {

    }
}