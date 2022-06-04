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
public partial class Admin_Ecommerce_Add_Category : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) 
        {          

            if (Request.QueryString["ID"] != null)
            {
                hdfID.Value = Request.QueryString["ID"].ToString();

                DataTable dt = DataAccess.GetData("Select * from [ecom_CategoryMaster] where [CategoryID]=" + hdfID.Value + "  ");

                if (dt.Rows.Count > 0 && dt != null)
                {
                    txtCategoryName.Text = dt.Rows[0]["CategoryName"].ToString();
                    txtDescription.Text = dt.Rows[0]["CategoryDescription"].ToString();
                    TxtSequence.Text = dt.Rows[0]["Sequence_no"].ToString();

                    hdfImage.Value = dt.Rows[0]["Icon_img"].ToString();
                    Button1.Text = "Update";

                }

            }
            Bind_Category();
            Bind_SequenceNo();
            bindtotalCategory();

        }
    }


    public void bindtotalCategory()
    {

        DataTable dt = DataAccess.GetData("Select Count(CategoryID)as 'totalCat' from [ecom_CategoryMaster] ");
        if (dt.Rows.Count > 0)
        {
            lblCategory.Text = dt.Rows[0]["totalCat"].ToString();

        }
    }
    public void Bind_SequenceNo()
    {

        DataTable dt = DataAccess.GetData("Select MAx(CategoryID) as 'Seqno' from [ecom_CategoryMaster] ");

        if (dt.Rows.Count > 0 && dt != null)
        {
            TxtSequence.Text = dt.Rows[0]["Seqno"].ToString();

        }
    }
    protected void BtnSubmit(object sender, EventArgs e)
    {
        alert.Visible = true;

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


        if (hdfID.Value == string.Empty)
        {
            SqlCommand cmd = new SqlCommand("insert into [ecom_CategoryMaster] ([CategoryName],[CategoryDescription],[Icon_img],[CreatedOn],[Sequence_no],[Is_active]) values (@CategoryName,@CategoryDescription,@Icon_img,@CreatedOn,@Sequence_no,@Is_active)");
            cmd.Parameters.AddWithValue("@CategoryName", txtCategoryName.Text);
            cmd.Parameters.AddWithValue("@CategoryDescription", txtDescription.Text);
            cmd.Parameters.AddWithValue("@Icon_img", hdfImage.Value);
            cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
            cmd.Parameters.AddWithValue("@Sequence_no", TxtSequence.Text);
            cmd.Parameters.AddWithValue("@Is_active", true);            
            DataAccess.InsertExecuteNonQuery(cmd);
            lblMsg.Text = "Record Saved Successfully";

        }

        else

        {

            SqlCommand cmd = new SqlCommand("Update [ecom_CategoryMaster] set [CategoryName]=@CategoryName,[CategoryDescription]=@CategoryDescription ,[Icon_img]=@Icon_img,[Sequence_no]=@Sequence_no where [CategoryID]=" + hdfID.Value + "   ");
            cmd.Parameters.AddWithValue("@CategoryName", txtCategoryName.Text);
            cmd.Parameters.AddWithValue("@CategoryDescription", txtDescription.Text);
            cmd.Parameters.AddWithValue("@Icon_img", hdfImage.Value);
            cmd.Parameters.AddWithValue("@Sequence_no", TxtSequence.Text);
            DataAccess.InsertExecuteNonQuery(cmd);
            lblMsg.Text = "Record Update Successfully";

        }
        Bind_Category();
        ClearText();
        CustPager.Reload();

    }

    public void Bind_Category()
    {

        DataTable dt = DataAccess.GetData("Select * from [ecom_CategoryMaster]");
        if (dt.Rows.Count > 0 && dt != null)
        {
            grdView.DataSource = dt;
            grdView.DataBind();

            int TotalPage = dt.Rows.Count;
            CustPager.TotalRecords = TotalPage;
            CustPager.TotalPage = TotalPage % grdView.PageSize == 0 ? TotalPage / grdView.PageSize : TotalPage / grdView.PageSize + 1;


        }
    }


    protected void Edit(object sender, ImageClickEventArgs e)
    {

        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;
        int ID = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfID")).Value);

        if (btndetails.ID.Equals("imgbtnUpdate"))
        {
            Response.Redirect("Add_Category.aspx?ID=" + ID);
          

        }
        //else if (btndetails.ID.Equals("imgbtnDelete"))
        //{

        //    SqlCommand cmd = new SqlCommand("DELETE FROM [ecom_CategoryMaster]  WHERE  [CategoryID] =" + ID + "");
        //    DataAccess.InsertExecuteNonQuery(cmd);

        //}
        Bind_Category();
        CustPager.Reload();


    }


    protected void CustPager_PageChanged(object sender, CustomPageChangeArgs e)
    {
        grdView.PageSize = e.CurrentPageSize;
        grdView.PageIndex = e.CurrentPageNumber - 1;
        Bind_Category();
    }




    //protected void ButtonDelete_Click(object sender, EventArgs e)

    //{

    //    StringCollection sc = new StringCollection();

    //    string id = string.Empty;

    //    for (int i = 0; i < grdView.Rows.Count; i++)

    //    {

    //        CheckBox cb = (CheckBox)grdView.Rows[i].Cells[0].FindControl("CheckBox1");

    //        if (cb != null)

    //        {

    //            if (cb.Checked)

    //            {

    //                int ID = Convert.ToInt32(((HiddenField)grdView.Rows[i].Cells[5].FindControl("hdfID")).Value);

    //                SqlCommand cmd = new SqlCommand("DELETE FROM [ecom_CategoryMaster]  WHERE  [CategoryID] =" + ID + "");
    //                DataAccess.InsertExecuteNonQuery(cmd);

    //            }
    //        }
    //    }



    //    Bind_Category();

    //}



    //protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)

    //{

    //    if (e.Row.RowType == DataControlRowType.Header)

    //    {

    //        Button b = (Button)e.Row.FindControl("ButtonDelete");

    //        b.Attributes.Add("onclick", "return ConfirmOnDelete();");

    //    }

    //}



    public void ClearText()
    {
        TxtSequence.Text = string.Empty;
        txtCategoryName.Text = string.Empty;
        txtDescription.Text = string.Empty;
        hdfImage.Value = string.Empty;
        hdfID.Value = string.Empty;
        Button1.Text = "Submit";

    }


    protected void imgbtnActive_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtnEdit = sender as ImageButton;
        GridViewRow grdRow = (GridViewRow)imgbtnEdit.NamingContainer;

        string ID = (((HiddenField)(grdRow.FindControl("hdfID"))).Value).ToString();

        HiddenField hdfIsActive = (HiddenField)grdRow.FindControl("hdfIsActive");

        if (hdfIsActive.Value == "True")
        {
            SqlCommand cmd = new SqlCommand("UPDATE [ecom_CategoryMaster] SET [Is_active] =0 WHERE [CategoryID]=" + ID + " ");
            DataAccess.InsertExecuteNonQuery(cmd);
            alert.Visible = true;
            lblMsg.Text = "Category Inactive";


        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [ecom_CategoryMaster] SET [Is_active] =1 WHERE [CategoryID]=" + ID + " ");
            DataAccess.InsertExecuteNonQuery(cmd);

            alert.Visible = true;
            lblMsg.Text = "Category Active";
        }

        Bind_Category();
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

    protected void btnreset_Click(object sender, EventArgs e)
    {
        ClearText();
    }
}