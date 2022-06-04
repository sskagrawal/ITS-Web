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
using System.Configuration;
public partial class Controle_Product : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            bindcategory();         
            bindhomecategory();         

            if (Session["partyid"] != null)
            {
                hdfUserID.Value = Session["partyid"].ToString();
            }

           if (Request.QueryString["PrdId"] != null)
            {
                hdfid.Value = Request.QueryString["PrdId"].ToString();
                Bind_Edit();
                hdfProdSpfID.Value = Request.QueryString["PrdId"].ToString();
                bindSizeQuantity();            
                BindProductSpecifDetails();
                bind_Product_Photo();
            }

            btnSave.Enabled = false;
            btnSpeci.Enabled = false;
            btnSubmitPhoto.Enabled = false;
        }
    }

    //[WebMethod(EnableSession = true)]
    public static string GetCapturedImage()
    {
        string url = HttpContext.Current.Session["CapturedImage"].ToString();
        HttpContext.Current.Session["CapturedImage"] = null;
        return url;
    }

   
    public void Bind_Edit()
    {

        DataTable dt = DataAccess.GetData("select * from [ecom_Product] where [Product_id]=" + hdfid.Value + " ");
        if (dt.Rows.Count > 0)
        {
            TxtprodctN.Text = dt.Rows[0]["product_name"].ToString();
            bindcategory();
            Drdcategory.SelectedValue = dt.Rows[0]["CategoryID"].ToString();
            bindsubcategory();
            DrdSubcat.SelectedValue = dt.Rows[0]["SubCategoryID"].ToString();
            bindChildCategory();
            ddlChildCategory.SelectedValue = dt.Rows[0]["ChildCategoryId"].ToString();
            bindhomecategory();
            DrdHomecat.SelectedValue = dt.Rows[0]["Homeproduct_cat_id"].ToString();
            txtFullDescription.Text = dt.Rows[0]["Full_description"].ToString();
            Txtmeta.Text = dt.Rows[0]["Meta_description"].ToString();
            Txtmetakey.Text = dt.Rows[0]["Meta_keyword"].ToString();
            hdfUpload1.Value = dt.Rows[0]["Mainproduct_image"].ToString();   
            if(dt.Rows[0]["ShipType"].ToString()!=string.Empty)
            {
                ddlShipType.SelectedValue = dt.Rows[0]["ShipType"].ToString();
            }
            txtShipCharg.Text = dt.Rows[0]["ShipCharge"].ToString();
            bindSizeQuantity();
            bind_Product_Photo();
            Button1.Text = "Update";

        }
    }



    public void bindcategory()
    {

        Drdcategory.Items.Clear();
        ListItem item1 = new ListItem();
        item1.Text = "-Select Category-";
        item1.Value = "0";
        Drdcategory.Items.Add(item1);

        DataTable dt = DataAccess.GetData("select * from [ecom_CategoryMaster] ");
        if (dt != null && dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["CategoryID"].ToString();
                item.Text = dr["CategoryName"].ToString();

                Drdcategory.Items.Add(item);
            }
        }
    }

    protected void Drdcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindsubcategory();
        BindSize();
    }

    public void bindsubcategory()
    {

        DrdSubcat.Items.Clear();
        ListItem item1 = new ListItem();
        item1.Text = "-Select Sub Category-";
        item1.Value = "0";
        DrdSubcat.Items.Add(item1);

        DataTable dt = DataAccess.GetData("select * from [ecom_SubCategoryMaster] Where [CategoryID]=" + Drdcategory.SelectedValue + " ");
        if (dt != null && dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["SubCategoryID"].ToString();
                item.Text = dr["SubCategoryName"].ToString();
                DrdSubcat.Items.Add(item);
            }
        }
    }
    public void bindhomecategory()
    {

        DrdHomecat.Items.Clear();
        ListItem item1 = new ListItem();
        item1.Text = "-Select Home Category-";
        item1.Value = "0";
        DrdHomecat.Items.Add(item1);

        DataTable dt = DataAccess.GetData("select * from [ecom_Home_product_category]");
        if (dt != null && dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["Homeproduct_cat_id"].ToString();
                item.Text = dr["Product_cat_name"].ToString();
                DrdHomecat.Items.Add(item);
            }
        }


    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string targetPath = string.Empty;
            if (FileUpload1.PostedFile != null)
            {
                // Check the extension of image  
                string extension = Path.GetExtension(FileUpload1.FileName);
                if (extension.ToLower() == ".png" || extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg")
                {
                    Stream strm = FileUpload1.PostedFile.InputStream;
                    using (var image = System.Drawing.Image.FromStream(strm))
                    {

                        int newWidth = 383; // New Width of Image in Pixel  
                        int newHeight =440; // New Height of Image in Pixel  
                        var thumbImg = new Bitmap(newWidth, newHeight);
                        var thumbGraph = Graphics.FromImage(thumbImg);
                        thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
                        thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
                        thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        var imgRectangle = new Rectangle(0, 0, newWidth, newHeight);
                        thumbGraph.DrawImage(image, imgRectangle);

                        targetPath = Server.MapPath(@"~\Product_image\") + FileUpload1.FileName;     /*download folder where image is store*/
                        thumbImg.Save(targetPath, image.RawFormat);
                        hdfUpload1.Value = FileUpload1.FileName;
                    }
                }
            }

          

            if (hdfid.Value == string.Empty)
            {
                SqlCommand cmd = new SqlCommand("Insert into [ecom_Product]([product_name],[CategoryID],[SubCategoryID],[ChildCategoryId],[Homeproduct_cat_id] ,[Full_description],[Meta_description],[Meta_keyword],[Mainproduct_image],[Status],[CreatedOn],[EditedBy],[ShipType],[ShipCharge])values(@product_name,@CategoryID,@SubCategoryID,@ChildCategoryId,@Homeproduct_cat_id,@Full_description,@Meta_description,@Meta_keyword,@Mainproduct_image,@Status,@CreatedOn,@EditedBy,@ShipType,@ShipCharge) select scope_identity();");
                cmd.Parameters.AddWithValue("@product_name", TxtprodctN.Text);
                cmd.Parameters.AddWithValue("@CategoryID", Drdcategory.SelectedValue);
                cmd.Parameters.AddWithValue("@SubCategoryID", DrdSubcat.SelectedValue);
                cmd.Parameters.AddWithValue("@ChildCategoryId", ddlChildCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@Homeproduct_cat_id", DrdHomecat.SelectedValue);
                cmd.Parameters.AddWithValue("@Full_description", txtFullDescription.Text);
                cmd.Parameters.AddWithValue("@Meta_description", Txtmeta.Text);
                cmd.Parameters.AddWithValue("@Meta_keyword", Txtmetakey.Text);
                cmd.Parameters.AddWithValue("@Mainproduct_image", hdfUpload1.Value);           
                cmd.Parameters.AddWithValue("@Status", true);
                cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
                cmd.Parameters.AddWithValue("@EditedBy", hdfUserID.Value);
                cmd.Parameters.AddWithValue("@ShipType", ddlShipType.SelectedValue);
                if (txtShipCharg.Text != string.Empty)
                {
                    cmd.Parameters.AddWithValue("@ShipCharge", txtShipCharg.Text);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@ShipCharge", "0");
                }
                string ComID = DataAccess.InsertExecuteScalar(cmd);

                

                hdfid.Value = ComID;

                SqlCommand cmd4 = new SqlCommand("Insert into [ecom_Product_Photo]([Product_Photo],[Product_id],[PhotoType])values(@Product_Photo,@Product_id,@PhotoType)");
                cmd4.Parameters.AddWithValue("@PhotoType", "main photo");
                cmd4.Parameters.AddWithValue("@Product_Photo", hdfUpload1.Value);
                cmd4.Parameters.AddWithValue("@Product_id", hdfid.Value);
                DataAccess.InsertExecuteNonQuery(cmd4);

                BindSize();
                bind_Product_Photo();

                divMsg.Visible = true;
                lblmsg.Text = "Product stored Successfully";
                ClearTextbox();



            }

            else
            {

                SqlCommand cmd = new SqlCommand("UPDATE [ecom_Product] SET  [product_name]=@product_name,[CategoryID]=@CategoryID,[SubCategoryID]=@SubCategoryID,[ChildCategoryId]=@ChildCategoryId,[Homeproduct_cat_id]=@Homeproduct_cat_id ,[Full_description]=@Full_description,[Meta_description]=@Meta_description,[Meta_keyword]=@Meta_keyword,[Mainproduct_image]=@Mainproduct_image,[ShipType]=@ShipType,[ShipCharge]=@ShipCharge  WHERE [Product_id]=" + hdfid.Value + "");
                cmd.Parameters.AddWithValue("@product_name", TxtprodctN.Text);
                cmd.Parameters.AddWithValue("@CategoryID", Drdcategory.SelectedValue);
                cmd.Parameters.AddWithValue("@SubCategoryID", DrdSubcat.SelectedValue);
                cmd.Parameters.AddWithValue("@ChildCategoryId", ddlChildCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@Homeproduct_cat_id", DrdHomecat.SelectedValue);
                cmd.Parameters.AddWithValue("@Full_description", txtFullDescription.Text);
                cmd.Parameters.AddWithValue("@Meta_description", Txtmeta.Text);
                cmd.Parameters.AddWithValue("@Meta_keyword", Txtmetakey.Text);
                cmd.Parameters.AddWithValue("@Mainproduct_image", hdfUpload1.Value);
                cmd.Parameters.AddWithValue("@ShipType", ddlShipType.SelectedValue);
                if (txtShipCharg.Text != string.Empty)
                {
                    cmd.Parameters.AddWithValue("@ShipCharge", txtShipCharg.Text);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@ShipCharge", "0");
                }
                DataAccess.InsertExecuteNonQuery(cmd);
                divMsg.Visible = true;
                lblmsg.Text = "Record update Sucessfully";
                ClearTextbox();
            }
        }
        catch (Exception ex)
        {
            divMsg.Visible = true;
            lblmsg.Text = "Some Error Occured, pls Try Again." + ex.Message;
        }


        btnSave.Enabled = true;
        btnSpeci.Enabled = true;
        btnSubmitPhoto.Enabled = true;

    }

    private void ClearTextbox()
    {
        TxtprodctN.Text = "";
        Drdcategory.ClearSelection();
        DrdSubcat.ClearSelection();
        ddlChildCategory.ClearSelection();
        DrdHomecat.ClearSelection();
        txtFullDescription.Text = "";
        hdfUpload1.Value = string.Empty;
        Txtmeta.Text = "";     
        Txtmetakey.Text = "";  
        ddlSize.ClearSelection();
        txtSellingPrice.Text = string.Empty;
        txtMrpPrice.Text = string.Empty;
        txtStocks.Text = string.Empty;
        hdfShowcase.Value = string.Empty;

    }


    public void BindSize()
    {

     

            ddlSize.Items.Clear();
            ListItem item1 = new ListItem();
            item1.Text = "-Select Size-";
            item1.Value = "0";
            ddlSize.Items.Add(item1);

            DataTable dt = DataAccess.GetData("select * from [ecom_Size_master] Where [CategoryID]=" + Drdcategory.SelectedValue + " ");
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    ListItem item = new ListItem();
                    item.Value = dr["Sizemaster_id"].ToString();
                    item.Text = dr["Size_name"].ToString();

                    ddlSize.Items.Add(item);
                }
            }
      
    }

    //Size and Quantity
    protected void btnSave_Click(object sender, EventArgs e)
    {

        if (hdfid.Value != string.Empty)
        {

            if (hdfSizeID.Value == string.Empty)
            {

                SqlCommand cmd1 = new SqlCommand("insert into [ecom_Product_Size] ([Sizemaster_id],[Product_id],[SellingPrice],[MrpPrice],[Stocks],[RemainingStocks],[CreatedOn]) values (@Sizemaster_id,@Product_id,@SellingPrice,@MrpPrice,@Stocks,@RemainingStocks,@CreatedOn) ");
                cmd1.Parameters.AddWithValue("@Sizemaster_id", ddlSize.SelectedValue);
                cmd1.Parameters.AddWithValue("@Product_id", hdfid.Value);
                cmd1.Parameters.AddWithValue("@SellingPrice", txtSellingPrice.Text);
                cmd1.Parameters.AddWithValue("@MrpPrice", txtMrpPrice.Text);
                cmd1.Parameters.AddWithValue("@Stocks", txtStocks.Text);
                cmd1.Parameters.AddWithValue("@RemainingStocks", txtStocks.Text);
                cmd1.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
                DataAccess.InsertExecuteNonQuery(cmd1);
                divMsg.Visible = true;
                lblmsg.Text = "Product Size Stored Successfully";
                bindSizeQuantity();
                ClearSizeField();
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "tab2();", true);
            }

            else
            {

                SqlCommand cmd1 = new SqlCommand("Update [ecom_Product_Size] SET [Sizemaster_id]=@Sizemaster_id,[Product_id]=@Product_id,[SellingPrice]=@SellingPrice,[MrpPrice]=@MrpPrice,[Stocks]=@Stocks,[RemainingStocks]=@RemainingStocks Where [ProductSize_id] =" + hdfSizeID.Value + "  ");
                cmd1.Parameters.AddWithValue("@Sizemaster_id", ddlSize.SelectedValue);
                cmd1.Parameters.AddWithValue("@Product_id", hdfid.Value);
                cmd1.Parameters.AddWithValue("@SellingPrice", txtSellingPrice.Text);
                cmd1.Parameters.AddWithValue("@MrpPrice", txtMrpPrice.Text);
                cmd1.Parameters.AddWithValue("@Stocks", txtStocks.Text);
                cmd1.Parameters.AddWithValue("@RemainingStocks", txtStocks.Text);
                DataAccess.InsertExecuteNonQuery(cmd1);
                divMsg.Visible = true;
                lblmsg.Text = "Product Size Updated Successfully";
                bindSizeQuantity();

                ClearSizeField();

                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "tab2();", true);
            }

        }
    }

    public void ClearSizeField()
    {
        ddlSize.ClearSelection();
        txtSellingPrice.Text = string.Empty;
        txtMrpPrice.Text = string.Empty;
        txtStocks.Text = string.Empty;

    }

    public void bindSizeQuantity()
    {
      

        DataTable dt = DataAccess.GetData("Select * from [View_ecom_ProductSizeMaster]  Where [Product_id]=" + hdfid.Value + "  ");

        if (dt.Rows.Count > 0)
        {
            gvSize.DataSource = dt;
            gvSize.DataBind();
            int TotalPage = dt.Rows.Count;
            CustPager.TotalRecords = TotalPage;
            CustPager.TotalPage = TotalPage % gvSize.PageSize == 0 ? TotalPage / gvSize.PageSize : TotalPage / gvSize.PageSize + 1;

        }

        else
        {
            dt.Rows.Add(dt.NewRow());
            gvSize.DataSource = dt;
            gvSize.DataBind();
            int TotalColumns = gvSize.Rows[0].Cells.Count;
            gvSize.Rows[0].Cells.Clear();
            gvSize.Rows[0].Cells.Add(new TableCell());
            gvSize.Rows[0].Cells[0].ColumnSpan = TotalColumns;
            gvSize.Rows[0].Cells[0].Text = "No records Found";

        }

    }

    protected void CustPager_PageChanged(object sender, CustomPageChangeArgs e)
    {
        gvSize.PageSize = e.CurrentPageSize;
        gvSize.PageIndex = e.CurrentPageNumber - 1;
        bindSizeQuantity();
    }

    protected void Edit_Click(object sender, EventArgs e)
    {

        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;
        int SizeId = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfSizeID")).Value);
        hdfSizeID.Value = SizeId.ToString();

        DataTable dt = DataAccess.GetData("Select * from [ecom_Product_Size] Where [ProductSize_id]=" + hdfSizeID.Value + " ");
        if (dt.Rows.Count > 0)
        {
            BindSize();
            ddlSize.SelectedValue = dt.Rows[0]["Sizemaster_id"].ToString();
            txtSellingPrice.Text = dt.Rows[0]["SellingPrice"].ToString();
            txtMrpPrice.Text = dt.Rows[0]["MrpPrice"].ToString();
            txtStocks.Text = dt.Rows[0]["Stocks"].ToString();
            btnSave.Text = "Update";
        }


        if (btndetails.ID.Equals("imgbtnDelete"))
        {
            try
            {
                SqlCommand cmd = new SqlCommand("delete from [ecom_Product_Size] where [ProductSize_id]=" + hdfSizeID.Value + "  ");
                DataAccess.InsertExecuteNonQuery(cmd);
                lblmsg.Text = "Successfully Deleted";
                divMsg.Visible = true;
                bindSizeQuantity();
            }

            catch { }
        }

    }
    //product Specification
    protected void btnSpeci_Click(object sender, EventArgs e)
    {

        if (hdfPrdSpfID.Value == string.Empty)
        {

            SqlCommand cmd1 = new SqlCommand("insert into [ecom_Product_Specification] ([Product_ID],[Specification_name],[Specification_value],[CreatedOn],[Is_Active]) values (@Product_ID,@Specification_name ,@Specification_value,@CreatedOn,@Is_Active) ");
            cmd1.Parameters.AddWithValue("@Product_ID", hdfid.Value);
            cmd1.Parameters.AddWithValue("@Specification_name", txtProductSpecification.Text);
            cmd1.Parameters.AddWithValue("@Specification_value", txtSpecifValue.Text);
            cmd1.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
            cmd1.Parameters.AddWithValue("@Is_Active", true);
            DataAccess.InsertExecuteNonQuery(cmd1);
            divMsg.Visible = true;
            lblmsg.Text = "ecom_Product_Specification Stored Successfully";

            ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "tab3();", true);
        }

        else
        {

            SqlCommand cmd1 = new SqlCommand("Update [ecom_Product_Specification] SET [Product_ID]=@Product_ID,[Specification_name]=@Specification_name,[Specification_value]=@Specification_value  Where [Prod_Specification_ID] = " + hdfPrdSpfID.Value + "  ");
            cmd1.Parameters.AddWithValue("@Product_ID", hdfid.Value);
            cmd1.Parameters.AddWithValue("@Specification_name", txtProductSpecification.Text);
            cmd1.Parameters.AddWithValue("@Specification_value", txtSpecifValue.Text);
            DataAccess.InsertExecuteNonQuery(cmd1);
            divMsg.Visible = true;
            lblmsg.Text = "ecom_Product_Specification Updated Successfully";

            btnSpeci.Text = "Save";

            ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "tab3();", true);
        }

        ClearProdSpecification();
        BindProductSpecifDetails();
    }


    public void ClearProdSpecification()
    {

        txtProductSpecification.Text = string.Empty;
        txtSpecifValue.Text = string.Empty;
    }

    protected void BindProductSpecifDetails()
    {


        DataTable dt = DataAccess.GetData("Select * from [ecom_Product_Specification] Where [Product_ID]=" + hdfid.Value + "  ");
        if (dt.Rows.Count > 0)
        {
            gvSpecification.DataSource = dt;
            gvSpecification.DataBind();
            int TotalPage = dt.Rows.Count;
            CustPager.TotalRecords = TotalPage;
            CustPager.TotalPage = TotalPage % gvSpecification.PageSize == 0 ? TotalPage / gvSpecification.PageSize : TotalPage / gvSpecification.PageSize + 1;

        }

        else
        {
            dt.Rows.Add(dt.NewRow());
            gvSpecification.DataSource = dt;
            gvSpecification.DataBind();
            int TotalColumns = gvSpecification.Rows[0].Cells.Count;
            gvSpecification.Rows[0].Cells.Clear();
            gvSpecification.Rows[0].Cells.Add(new TableCell());
            gvSpecification.Rows[0].Cells[0].ColumnSpan = TotalColumns;
            gvSpecification.Rows[0].Cells[0].Text = "No records Found";

        }
    }


    protected void Edit_Click1(object sender, EventArgs e)
    {

        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;
        int SpeId = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfSpeciId")).Value);
        hdfPrdSpfID.Value = SpeId.ToString();

        DataTable dt = DataAccess.GetData("Select * from [ecom_Product_Specification] where [Prod_Specification_ID]=" + hdfPrdSpfID.Value + " ");
        if (dt.Rows.Count > 0)
        {
            txtProductSpecification.Text = dt.Rows[0]["Specification_name"].ToString();
            txtSpecifValue.Text = dt.Rows[0]["Specification_value"].ToString();
            btnSpeci.Text = "Update";
        }


        if (btndetails.ID.Equals("imgbtnDelete1"))
        {
            try
            {
                SqlCommand cmd = new SqlCommand("delete from [ecom_Product_Specification] where [Prod_Specification_ID]=" + hdfPrdSpfID.Value + "  ");
                DataAccess.InsertExecuteNonQuery(cmd);
                lblmsg.Text = "Successfully Deleted";
                divMsg.Visible = true;
                BindProductSpecifDetails();
            }

            catch { }
        }
    }
    //protected void btnSpeciCancel_Click(object sender, EventArgs e)
    //{
    //    txtProductSpecification.Text = string.Empty;
    //    txtSpecifValue.Text = string.Empty;
    //    BindProductSpecifDetails();
    //}

    protected void DrdSubcat_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindChildCategory();
    }

    public void bindChildCategory()
    {

        ddlChildCategory.Items.Clear();
        ListItem item1 = new ListItem();
        item1.Text = "-Select Child Category-";
        item1.Value = "0";
        ddlChildCategory.Items.Add(item1);

        DataTable dt = DataAccess.GetData("select * from [ecom_ChildCategoryMaster] Where [SubCategoryID]=" + DrdSubcat.SelectedValue + " ");
        if (dt != null && dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                ListItem item = new ListItem();
                item.Value = dr["ChildCategoryId"].ToString();
                item.Text = dr["ChildCategoryName"].ToString();

                ddlChildCategory.Items.Add(item);
            }
        }
    }

    // Product Show Case Photo
    protected void btnSubmitPhoto_Click(object sender, EventArgs e)
    {       
        try
        {
            string targetPath = string.Empty;
            if (fuShowCase.PostedFile != null) 
            {
                // Check the extension of image  
                string extension = Path.GetExtension(fuShowCase.FileName);
                if (extension.ToLower() == ".png" || extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg")
                {
                    Stream strm = fuShowCase.PostedFile.InputStream;
                    using (var image = System.Drawing.Image.FromStream(strm))
                    {

                        int newWidth = 384; // New Width of Image in Pixel  
                        int newHeight = 440; // New Height of Image in Pixel  
                        var thumbImg = new Bitmap(newWidth, newHeight);
                        var thumbGraph = Graphics.FromImage(thumbImg);
                        thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
                        thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
                        thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        var imgRectangle = new Rectangle(0, 0, newWidth, newHeight);
                        thumbGraph.DrawImage(image, imgRectangle);

                        targetPath = Server.MapPath(@"~\Product_image\") + fuShowCase.FileName;     /*download folder where image is store*/
                        thumbImg.Save(targetPath, image.RawFormat);
                        hdfShowcase.Value = fuShowCase.FileName; 
                    }
                }
            }

        

            if (hdfShowCaseId.Value == string.Empty)
            {
                SqlCommand cmd4 = new SqlCommand("Insert into [ecom_Product_Photo]([Product_Photo],[Product_id])values(@Product_Photo,@Product_id)");
             
                cmd4.Parameters.AddWithValue("@Product_Photo", hdfShowcase.Value);              
                cmd4.Parameters.AddWithValue("@Product_id", hdfid.Value);             
                DataAccess.InsertExecuteNonQuery(cmd4);

                divMsg.Visible = true;
                lblmsg.Text = "Product Photo stored Successfully";
                ClearTextbox();

                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "tab4();", true);

            }

            else
            {

                SqlCommand cmd4 = new SqlCommand("UPDATE [ecom_Product_Photo] SET  [Product_Photo]=@Product_Photo  WHERE [Prd_PhotoId]=" + hdfShowCaseId.Value + "");
                cmd4.Parameters.AddWithValue("@Product_Photo", hdfShowcase.Value);
                cmd4.Parameters.AddWithValue("@Product_id", hdfid.Value);
                DataAccess.InsertExecuteNonQuery(cmd4);
                divMsg.Visible = true;
                lblmsg.Text = "Product Photo update Sucessfully";
                ClearTextbox();
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "tab4();", true);
            }
        }
        catch (Exception ex)
        {
            divMsg.Visible = true;
            lblmsg.Text = "Some Error Occured, pls Try Again." + ex.Message;
        }

        bind_Product_Photo();
    }


 

    public void bind_Product_Photo()
    {      

       
        DataTable dt = DataAccess.GetData("Select * from [View_ecom_Product_Photo] Where [Product_id]="+ hdfid.Value + " and [PhotoType]!='main photo' ");
        if (dt.Rows.Count > 0)
        {
            gvProductImage.DataSource = dt;
            gvProductImage.DataBind();
            int TotalPage = dt.Rows.Count;
            CustPager.TotalRecords = TotalPage;
            CustPager.TotalPage = TotalPage % gvProductImage.PageSize == 0 ? TotalPage / gvProductImage.PageSize : TotalPage / gvProductImage.PageSize + 1;
        }
        else
        {      
            dt.Rows.Add(dt.NewRow());
            gvProductImage.DataSource = dt;
            gvProductImage.DataBind();
           int TotalColumns = gvProductImage.Rows[0].Cells.Count;
            gvProductImage.Rows[0].Cells.Clear();
            gvProductImage.Rows[0].Cells.Add(new TableCell());
            gvProductImage.Rows[0].Cells[0].ColumnSpan = TotalColumns;
            gvProductImage.Rows[0].Cells[0].Text = "No records Found";        

        }
    }
    protected void Edit_Photo_Click(object sender, EventArgs e)
    {

        ImageButton btndetails = sender as ImageButton;
        GridViewRow grdView = (GridViewRow)btndetails.NamingContainer;
        int PhotoId = Convert.ToInt32(((HiddenField)grdView.FindControl("hdfPrd_Photoid")).Value);
        hdfShowCaseId.Value = PhotoId.ToString();
        DataTable dt = DataAccess.GetData("Select * from [ecom_Product_Photo] where [Prd_PhotoId]=" + hdfShowCaseId.Value + " ");
        if (dt.Rows.Count > 0)
        {
            hdfShowcase.Value = dt.Rows[0]["Product_Photo"].ToString();        
            btnSubmitPhoto.Text = "Update";
           
         }

        if (btndetails.ID.Equals("imgbtnDelete"))
        {
            try
            {
                SqlCommand cmd = new SqlCommand("delete from [ecom_Product_Photo] where [Prd_PhotoId]=" + hdfShowCaseId.Value + "  ");
                DataAccess.InsertExecuteNonQuery(cmd);
                lblmsg.Text = "Successfully Deleted";
                divMsg.Visible = true;
                bind_Product_Photo();
            }

            catch { }
        }
    }

   
}