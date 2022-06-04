﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class shop_Product_List : System.Web.UI.Page
{
    public DataTable DtProduct { get; set; }
    public DataTable DtPrice { get; set; }
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //if (Request.QueryString["catId"]!= null)
            //{
                //hdfCatId.Value = Request.QueryString["catId"].ToString();
                //if (Request.QueryString["subCatId"]!= null )
                // {
                //    hdfSubCatId.Value = Request.QueryString["subCatId"].ToString();       

                // }

               BindProduct();
            //}                    

        }          
    
    }
    public void BindProduct()
    {
        //if (hdfCatId.Value != string.Empty)
        //{
            //"Select * from [View_ecom_ProductDetail] Where [CategoryID]=" + hdfCatId.Value + "   "
            DtProduct = DataAccess.GetData("Select * from [View_ecom_ProductDetail]   ");
        //}
        if (hdfCatId.Value != string.Empty && hdfSubCatId.Value != String.Empty)
        {
            DtProduct = DataAccess.GetData("Select * from [View_ecom_ProductDetail] Where [CategoryID]=" + hdfCatId.Value + " and [SubCategoryID]=" + hdfSubCatId.Value + "  ");

        }
    }   
    public DataTable BindProductPrice(string Product_Id)
    {      
       DataTable dtprice = DataAccess.GetData("Select top 1 [SellingPrice] from [ecom_Product_Size] Where [Product_id]=" + Product_Id + " ");
        return dtprice;     

    }
}