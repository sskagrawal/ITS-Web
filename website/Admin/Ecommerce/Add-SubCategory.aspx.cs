using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Drawing2D;
using System.Drawing;
using System.IO;
using System.Collections.Specialized;
using System.Text;
public partial class Admin_Ecommerce_Add_Subcategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindCategory();
            Bind_SequenceNo();
            BindgrideView();
            bindtotalCategory();

            //Searching 
            bindCategorySearch();
        }
    }

    public void bindCategorySearch()
    {

        ddlCategorySearch.Items.Clear();
        ListItem item1 = new ListItem();
        item1.Text = "-Select Category-";
        item1.Value = "0";
        ddlCategorySearch.Items.Add(item1);

        DataTable dt = DataAccess.GetData("select * from [ecom_CategoryMaster] ");
        if (dt != null && dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["CategoryID"].ToString();
                item.Text = dr["CategoryName"].ToString();
                ddlCategorySearch.Items.Add(item);
            }
        }

    }

    public void bindtotalCategory()
    {

        DataTable dt = DataAccess.GetData("Select Count(SubCategoryID)as 'totalCat' from [ecom_SubCategoryMaster] ");
        if (dt.Rows.Count > 0)
        {
           lblSubCategory.Text = dt.Rows[0]["totalCat"].ToString();

        }
    }
    public void bindCategory()
    {

        ddlcategory.Items.Clear();
        ListItem item1 = new ListItem();
        item1.Text = "-Select Category-";
        item1.Value = "0";
        ddlcategory.Items.Add(item1);

        DataTable dt = DataAccess.GetData("select * from [ecom_CategoryMaster] ");
        if (dt != null && dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["CategoryID"].ToString();
                item.Text = dr["CategoryName"].ToString();
                ddlcategory.Items.Add(item);
            }
        }

    }


    public void BindgrideView()
    {


        string Query = string.Empty;
        Query = "select  * from View_ecom_Category";
       string whereConcatenator = " WHERE ";
        if (ddlCategorySearch.SelectedValue != "0")
        {
            Query += whereConcatenator;
            Query += "CategoryID=" + ddlCategorySearch.SelectedValue.Trim() + " ";
            whereConcatenator = " and ";
        }

        if (txtSubCatNameSearch.Text != string.Empty)
        {
            Query += whereConcatenator;
            Query += "SubCategoryName like '%" + txtSubCatNameSearch.Text + "%' ";
            whereConcatenator = " and ";
        }



        //if (ddlPartysearch.SelectedValue == "1")
        //{
        //    Query += whereConcatenator;
        //    Query += "Party_name like '" + txtsearch.Text + "%' ";
        //    whereConcatenator = " and ";
        //}

        //else if (ddlPartysearch.SelectedValue == "2")
        //{
        //    Query += whereConcatenator;
        //    Query += "Email like '" + txtsearch.Text + "%' ";
        //    whereConcatenator = " and ";
        //}

        //else if (ddlPartysearch.SelectedValue == "3")
        //{
        //    Query += whereConcatenator;
        //    Query += "mobile_no like '" + txtsearch.Text + "%' ";
        //    whereConcatenator = " and ";
        //}

        //if (drdStatus.SelectedValue != "-1")
        //{
        //    Query += whereConcatenator;
        //    Query += "Is_active= " + drdStatus.SelectedValue + " ";
        //    whereConcatenator = " and ";
        //}


        Query += " order by [SubCategoryID] desc ";
        DataTable dt = DataAccess.GetData(Query);

        if (dt.Rows.Count > 0)
        {
            grdView.DataSource = dt;
            grdView.DataBind();
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

    public void Bind_SequenceNo()
    {

        DataTable dt = DataAccess.GetData("Select MAx(SubCategoryID) as 'Seqno' from [ecom_SubCategoryMaster] ");

        if (dt.Rows.Count > 0 && dt != null)
        {
            TxtSequence.Text = dt.Rows[0]["Seqno"].ToString();

        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {


        string targetPath = string.Empty;
        if (fluPorUpload.PostedFile != null)
        {
            // Check the extension of image  
            string extension = Path.GetExtension(fluPorUpload.FileName);
            if (extension.ToLower() == ".png" || extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg")
            {
                Stream strm = fluPorUpload.PostedFile.InputStream;
                using (var image = System.Drawing.Image.FromStream(strm))
                {

                    int newWidth = 23; // New Width of Image in Pixel  
                    int newHeight = 21; // New Height of Image in Pixel  
                    var thumbImg = new Bitmap(newWidth, newHeight);
                    var thumbGraph = Graphics.FromImage(thumbImg);
                    thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
                    thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
                    thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                    var imgRectangle = new Rectangle(0, 0, newWidth, newHeight);
                    thumbGraph.DrawImage(image, imgRectangle);
                    // Save the file  
                    targetPath = Server.MapPath(@"~\Cat_menu_icon\") + fluPorUpload.FileName;
                    thumbImg.Save(targetPath, image.RawFormat);
                    hdfImage.Value = fluPorUpload.FileName;

                }
            }
            else
            {
                //divMsg.Visible = true;
                //lblmsg.Text = "Please select image png and  jpg upload";
            }
        }





        if (hdsubcatid.Value==string.Empty)
        {
            SqlCommand cmd = new SqlCommand("Insert into [ecom_SubCategoryMaster] ([CategoryID],[SubCategoryName],[Sub_Icon_img],[Sequence_no],[Is_active]) Values (@CategoryID,@SubCategoryName,@Sub_Icon_img,@Sequence_no,@Is_active) ");
            cmd.Parameters.AddWithValue("@CategoryID", ddlcategory.SelectedValue);
            cmd.Parameters.AddWithValue("@SubCategoryName", txtSubCategoryName.Text);
            cmd.Parameters.AddWithValue("@Sub_Icon_img", hdfImage.Value);
            cmd.Parameters.AddWithValue("@Sequence_no", TxtSequence.Text);
            cmd.Parameters.AddWithValue("@Is_active", true);


            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Sub Category Saved Successfully";
        }

        else
        {

            SqlCommand cmd = new SqlCommand("Update [ecom_SubCategoryMaster] SET [CategoryID]=@CategoryID,[SubCategoryName]=@SubCategoryName,[Sub_Icon_img]=@Sub_Icon_img,[Sequence_no]=@Sequence_no  Where [SubCategoryID]=" + hdsubcatid.Value + " ");
            cmd.Parameters.AddWithValue("@CategoryID", ddlcategory.SelectedValue);
            cmd.Parameters.AddWithValue("@SubCategoryName", txtSubCategoryName.Text);
            cmd.Parameters.AddWithValue("@Sub_Icon_img", hdfImage.Value);
            cmd.Parameters.AddWithValue("@Sequence_no", TxtSequence.Text);
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Sub Category Updated Successfully";

        }
        BindgrideView();
        CustPager.Reload();

        ClearField();
    }

    public void ClearField()
    {
        ddlcategory.ClearSelection();
        txtSubCategoryName.Text = string.Empty;
        TxtSequence.Text = string.Empty;
        hdfImage.Value = string.Empty;
    }


    protected void CustPager_PageChanged(object sender, CustomPageChangeArgs e)
    {
        grdView.PageSize = e.CurrentPageSize;
        grdView.PageIndex = e.CurrentPageNumber - 1;
        BindgrideView();
        CustPager.Reload();
    }

    protected void Edit(object sender, ImageClickEventArgs e)
    {
        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;


        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfID")).Value);
        hdsubcatid.Value = ID.ToString();

        if (btndetails.ID.Equals("imgbtnUpdate"))
        {

            if (hdsubcatid.Value != string.Empty)
            {
                DataTable dt = DataAccess.GetData("Select * from [ecom_SubCategoryMaster] Where [SubCategoryID]=" + hdsubcatid.Value + " ");
                 if(dt.Rows.Count>0)
                {
                    bindCategory();
                    ddlcategory.SelectedValue = dt.Rows[0]["CategoryID"].ToString();
                    txtSubCategoryName.Text= dt.Rows[0]["SubCategoryName"].ToString();
                    hdfImage.Value= dt.Rows[0]["Sub_Icon_img"].ToString();
                    TxtSequence.Text= dt.Rows[0]["Sequence_no"].ToString();
                    btnSubmit.Text = "Update";
                }

            }



        }
        else if (btndetails.ID.Equals("imgbtnDelete"))
        {

            SqlCommand cmd = new SqlCommand("delete from [ecom_SubCategoryMaster] Where [SubCategoryID]=" + hdsubcatid.Value + " ");
            DataAccess.InsertExecuteNonQuery(cmd);
            BindgrideView();
            CustPager.Reload();
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
            SqlCommand cmd = new SqlCommand("UPDATE [ecom_SubCategoryMaster] SET [Is_active] =0 WHERE [SubCategoryID]=" + ID + " ");
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Sub Category Inactive";
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [ecom_SubCategoryMaster] SET [Is_active] =1 WHERE [SubCategoryID]=" + ID + " ");
            DataAccess.InsertExecuteNonQuery(cmd);

            alert.Visible = true;
            lblMsg.Text = "Sub Category Active";
        }

        BindgrideView();
        CustPager.Reload();

    }

    protected void grideViewCatogry_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            ImageButton imgbtnActive = (ImageButton)e.Row.FindControl("imgbtnActive");
            //  ImageButton imgbtnDelete = (ImageButton)e.Row.FindControl("imgbtnDelete");
            HiddenField hdfIsActive = (HiddenField)e.Row.FindControl("hdfIsActive");
            Button btndelete = (Button)e.Row.FindControl("btndelete");
            TextBox TxtdeleteCode = (TextBox)e.Row.FindControl("TxtdeleteCode");


            if (hdfIsActive.Value == "True")
            {
                imgbtnActive.ToolTip = "Active";
                imgbtnActive.ImageUrl = "~/image/icon_enable.png";
                //  imgbtnDelete.Visible = false;



            }
            else
            {
                imgbtnActive.ToolTip = "Dactive";
                imgbtnActive.ImageUrl = "~/image/icon_disable.png";
                //  imgbtnDelete.Visible = true;



            }

        }
    }




    protected void btnReset_Click(object sender, EventArgs e)
    {
        ClearField();
    }

    protected void ddlCategorySearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindgrideView();
        CustPager.Reload();
    }

    protected void btnbtnSearch_Click(object sender, EventArgs e)
    {
        BindgrideView();
        CustPager.Reload();
    }

    protected void btnResetSearch_Click(object sender, EventArgs e)
    {
        ddlCategorySearch.ClearSelection();
        txtSubCatNameSearch.Text = string.Empty;
        BindgrideView();
        CustPager.Reload();
    }
}