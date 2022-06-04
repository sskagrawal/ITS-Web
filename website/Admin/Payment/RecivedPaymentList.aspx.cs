using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Payment_PaymentList : System.Web.UI.Page
{
    public DataTable dtSubmitQuery { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            //Bind_AddParty();

            Bind_RecivePay();
        }

    }
    public void Bind_AddParty()
    {
        drdParty.Items.Clear();
        ListItem item1 = new ListItem();
        item1.Text = "-Select Party-";
        item1.Value = "0";
        drdParty.Items.Add(item1);

        DataTable dt = DataAccess.GetData("select * from [View_PartyMaster] where [IsContact]='1' order by [PartyId] Desc  ");
        if (dt != null && dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["PartyId"].ToString();
                item.Text = dr["CompanyName"].ToString() + " ," + dr["MemberName"].ToString() + "," + dr["Phone"].ToString();
                drdParty.Items.Add(item);
            }
        }

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Bind_RecivePay();
    }
    public void Bind_RecivePay()
    {
        //string Query = string.Empty;
        //Query = "select * from [View_WorkTrans]";

        //string whereConcatenator = " WHERE ";
        //if (drdParty.SelectedValue != "0")
        //{
        //    Query += whereConcatenator;
        //    Query += "Party_Id='" + drdParty.SelectedValue + "'";
        //    whereConcatenator = " and ";
        //}


        //if (drdmultisearch.SelectedValue == "VehicleNumber")
        //{
        //    Query += whereConcatenator;
        //    Query += "VehicleNumber='" + txtSearch.Text + "'";
        //    whereConcatenator = " and ";
        //}

        //else if (drdmultisearch.SelectedValue == "VehiccleCode")
        //{
        //    Query += whereConcatenator;
        //    Query += "VehiccleCode='" + txtSearch.Text + "'";
        //    whereConcatenator = " and ";
        //}


        //else if (drdmultisearch.SelectedValue == "Cont_Persion")
        //{
        //    Query += whereConcatenator;
        //    Query += "Cont_Persion='" + txtSearch.Text + "'";
        //    whereConcatenator = "and ";
        //}

        //else if (drdmultisearch.SelectedValue == "DriverName")
        //{
        //    Query += whereConcatenator;
        //    Query += "DriverName='" + txtSearch.Text + "'";
        //    whereConcatenator = " and ";
        //}




        //DataTable dt = DataAccess.GetData(Query);
        //if (dt != null && dt.Rows.Count > 0)
        //{
        //    grdEmp.DataSource = dt;
        //    grdEmp.DataBind();
        //}
        //else
        //{
        //    DivMSG.Visible = true;
        //    lblMSG.Text = "Record not found";
        //}   


        DataTable dt = DataAccess.GetData("Select * from [View_PaymentReciveList] order by [Trans_Id] desc");
        if (dt.Rows.Count > 0)
        {

            grdEmp.DataSource = dt;
            grdEmp.DataBind();

            int TotalPage = dt.Rows.Count;
            CustPager.TotalRecords = TotalPage;
            CustPager.TotalPage = TotalPage % grdEmp.PageSize == 0 ? TotalPage / grdEmp.PageSize : TotalPage / grdEmp.PageSize + 1;


        }

        else
        {
            dt.Rows.Add(dt.NewRow());
            grdEmp.DataSource = dt;
            grdEmp.DataBind();
            int TotalColumns = grdEmp.Rows[0].Cells.Count;
            grdEmp.Rows[0].Cells.Clear();
            grdEmp.Rows[0].Cells.Add(new TableCell());
            grdEmp.Rows[0].Cells[0].ColumnSpan = TotalColumns;
            grdEmp.Rows[0].Cells[0].Text = "No records Found";

        }




    }
    protected void Edit(object sender, EventArgs e)
    {
        ImageButton imgBtn = sender as ImageButton;
        GridViewRow grdRow = (GridViewRow)imgBtn.NamingContainer;
        int hdfWorktransId = Convert.ToInt32(((HiddenField)(grdRow.FindControl("hdfWorkTransID"))).Value);
        HiddenField hdfPayMID = (HiddenField)grdRow.FindControl("hdfPayMID");
        Label lblTamount = (Label)grdRow.FindControl("lblTamount");
        Label lblDUAmt = (Label)grdRow.FindControl("lblDUAmt");
        Label lblDpAmt = (Label)grdRow.FindControl("lblDpAmt");

        if (imgBtn.ID.Equals("imgbtnEdit"))
        {
            Response.Redirect("~/Admin/Payment/PrintReciept.aspx?PrId=" + hdfWorktransId);
        }

    }
    protected void CustPager_PageChanged(object sender, CustomPageChangeArgs e)
    {
        grdEmp.PageSize = e.CurrentPageSize;
        grdEmp.PageIndex = e.CurrentPageNumber - 1;
        Bind_RecivePay();
    }
    protected void grdEmp_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hdfDueAmt = (HiddenField)e.Row.FindControl("hdfDueAmt");
            HiddenField hdfPartyID = (HiddenField)e.Row.FindControl("hdfPartyID");
            Label lblParty = (Label)e.Row.FindControl("lblParty");
           
            //DataTable dt = DataAccess.GetData("select * from [View_PartyMaster] where [IsContact]='1' and [PartyId]='" + hdfPartyID.Value + "'  ");
            //if (dt != null && dt.Rows.Count > 0)
            //{

            //    lblParty.Text = dt.Rows[0]["CompanyName"].ToString() + " ," + dt.Rows[0]["MemberName"].ToString() + "," + dt.Rows[0]["Phone"].ToString();

            //}
        }
    }
}