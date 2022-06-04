using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class shop_ShopDetails : System.Web.UI.Page
{
    public DataTable DtProduct { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Request.QueryString["PID"] != null)
            {

                hdfProdId.Value = Request.QueryString["PID"].ToString();

                BindProductDetail();
              

            }


        }
    }

    public void BindProductDetail()
    {
        DtProduct = DataAccess.GetData("Select * from [ecom_Product] Where [Product_id]=" + hdfProdId.Value + " ");

        if (DtProduct.Rows[0]["ChildCategoryId"].ToString() != string.Empty)
        {
            hdfChidcatId.Value = DtProduct.Rows[0]["ChildCategoryId"].ToString();

            BindChildCategory();
        }

        if(DtProduct.Rows.Count>0)
        {
            //hdfSelImg.Value = DtProduct.Rows[0]["Mainproduct_image"].ToString();
        }
       // Add Page Title
        if (DtProduct.Rows[0]["product_name"].ToString() != string.Empty)
            this.Page.Title = DtProduct.Rows[0]["product_name"].ToString();

        //Add Keywords Meta Tag
        if (DtProduct.Rows[0]["Meta_keyword"].ToString() != string.Empty)
        {
            HtmlMeta keywords = new HtmlMeta();
            keywords.HttpEquiv = "keywords";
            keywords.Name = "keywords";
            keywords.Content = DtProduct.Rows[0]["Meta_keyword"].ToString();
            this.Page.Header.Controls.Add(keywords);
        }

        //Add Description Meta Tag
        if (DtProduct.Rows[0]["Meta_description"].ToString() != string.Empty)
        {
            HtmlMeta description = new HtmlMeta();
            description.HttpEquiv = "description";
            description.Name = "description";
            description.Content = DtProduct.Rows[0]["Meta_description"].ToString();
            this.Page.Header.Controls.Add(description);
        }

    }

    public void BindChildCategory()
    {

        DataTable dtchild = DataAccess.GetData("Select [ChildCategoryName] from [ecom_ChildCategoryMaster] Where [ChildCategoryId]=" + hdfChidcatId.Value + " ");
        if (dtchild.Rows.Count > 0)
        {

            foreach (DataRow dr in dtchild.Rows)
            {

                ltrChildCatId.Text = "<li class='cat-item cat-item-96'><a href='Product-List.aspx'>" + dr["ChildCategoryName"].ToString()+"</a></li>";


            }
        }
    }


    public DataTable Bind_thumbnailsProduct(string Product_Id)
    {

        DataTable dtimg = DataAccess.GetData("Select * from [ecom_Product_Photo] Where [Product_id]=" + Product_Id + " ");
        if(dtimg.Rows.Count>0)
        {
            //hdfSelImg.Value=dtimg.Rows[0]["Prd_PhotoId"].ToString();
            //hdfSelImgName.Value = dtimg.Rows[0]["Product_Photo"].ToString();
        }
        return dtimg;



    }

    public DataTable BindProductPrice(string Product_Id)
    {
        DataTable dtprice = DataAccess.GetData("Select * from [View_ecom_ProductSizeMaster] Where [Product_id]=" + Product_Id + " ");
        if(dtprice.Rows.Count>0)
        {
            hdfMrpPrc.Value = dtprice.Rows[0]["MrpPrice"].ToString();
            
            ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "getPrc(" + Product_Id + ","+dtprice.Rows[0]["MrpPrice"].ToString()+","+ dtprice.Rows[0]["SellingPrice"].ToString() + ","+ dtprice.Rows[0]["ProductSize_id"].ToString() + ");", true);
        }
        return dtprice;
    }



    public DataTable BindProductSpecification(string Product_Id)
    {
        DataTable dtsp = DataAccess.GetData("Select * from [ecom_Product_Specification] Where [Product_ID]=" + Product_Id + " ");
        return dtsp;
    }


    public DataTable BindRelatedProduct(string Product_Id)
    {
        DataTable dtrp = DataAccess.GetData("Select top 5 * from [ecom_Product] Where [Product_id]!=" + hdfProdId.Value + " ");
        return dtrp;
    }


    



}