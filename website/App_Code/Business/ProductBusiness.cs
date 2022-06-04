using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;


public class ProductBusiness
{
   
     public int ProductId { get; set; }
    public Int64 MerchentId { get; set; }
    public int CategoryId { get; set; }
    public int? SubCategoryId { get; set; }
    public int? ChildCategoryId { get; set; }
    public string ProductName { get; set; }
    public string  CompanyName { get; set; }
    public string FullDescription { get; set; }
    public decimal? ShippingCharge { get; set; }
    public string Weight { get; set; }
    public decimal MRPPrice { get; set; }
    public decimal SellingPrice { get; set; }
  //  public decimal? DealPrice { get; set; }
    public decimal? Points { get; set; }
    public string ProductImage { get; set; }
    public bool IsSpecialOffer { get; set; }
    public bool IsNewArrival { get; set; }
    public string MerchantRef { get; set; }
    public string MFGRef { get; set; }
    public string MFGType { get; set; }
    public int CommittedQuantity { get; set; }
    public string PageTitle { get; set; }
    public string MetaDescription { get; set; }
    public string MetaKeyWord { get; set; }
    public string SearchKeyWord { get; set; }
    public bool IsActive { get; set; }
    public int ProductHitCount { get; set; }

    public int PrdStock { get; set; }

    public string PrdSize { get; set; }

    //Add new field --Surendra Goyal-----

   // public string  ArrivalStatus { get; set; }    
  
    public int ColorId { get; set; }
    // public int WholeSaleMinQnty { get; set; }

    string isEggless = string.Empty;
    string eglessPrc = string.Empty;

    public string IsEggless
    {
        get { return isEggless; }
        set { isEggless = value; }
    }
    public string EgglessPrc
    {
        get { return eglessPrc; }
        set { eglessPrc = value; }

    }


    private string customImgID = string.Empty;
    public string CustomImgID
    {
        get { return customImgID; }
        set { customImgID = value; }
    }

    private int prdID;
    private int prdQnt;
    public int PrdID
    {
        get { return prdID; }
        set { prdID = value; }
    }

    public int PrdQnt { get; set; }

    public string ProductImage2 { get; set; }
    public string ProductImage3 { get; set; }
    public string ProductImage4 { get; set; }
    public string ProductImage5 { get; set; }

    public decimal? MakingCharge { get; set; }

    public int ProductOfferId { get; set; }
    public int OfferId { get; set; }
   // public int ColorId { get; set; }
   public string Size { get; set; }
    public string PrdColor { get; set; }

    public string offrPrc = string.Empty;
    public string offrPrcntg = string.Empty;



    //--------------- Product color Master

    public int ProductColorId { get; set; }
    public int ProductSizeId { get; set; }
    public int SizeId { get; set; }
    public int RemainingStaock { get; set; }
    public int HomePrdCat { get; set; }
    public string PrdFeatures { get; set; }

    public string CategoryName { get; set; }
    public string SubCategoryName { get; set; }
   // public string ChildCategoryName { get; set; }

    public string SearchResult { get; set; }
    public string SearchFocus { get; set; }
    public string SearchRedirect { get; set; }
    

   
    public DataTable SelectProduct(string search = "")
    {
        DbConnection db = new DbConnection();
        db.AddParameter("@Search", search);
        return db.ExecuteDataTable("SelectProduct");
    }
    public DataTable SelectRecentProduct(string search = "")
    {
        DbConnection db = new DbConnection();
        db.AddParameter("@Search", search);
        return db.ExecuteDataTable("SelectRecentProduct");
    }
    public DataTable SelectRecentSpecialOfferProduct(string search = "")
    {
        DbConnection db = new DbConnection();
        db.AddParameter("@Search", search);
        return db.ExecuteDataTable("SelectRecentSpecialOfferProduct");
    }
    public string ChangeProductStatus()
    {
        DbConnection db = new DbConnection();
        db.AddParameter("@ProductId", ProductId);
        return Convert.ToString(db.ExecuteScalar("ChangeProductStatus"));
    }

    public string DeleteProduct()
    {
        DbConnection db = new DbConnection();
        db.AddParameter("@ProductId", ProductId);
        return Convert.ToString(db.ExecuteScalar("DeleteProduct"));
    }

  

    public DataTable GetProductColorByProductId()
    {
        DbConnection db = new DbConnection();
        db.AddParameter("@ProductId", ProductId);
        return db.ExecuteDataTable("GetProductColorByProductId");
    }

    public DataTable DtPrd { get; set; }

    public string AddUpdateProductColor()
    {
        DbConnection db = new DbConnection();
        db.AddParameter("@ProductColorId", ProductColorId);
        db.AddParameter("@ProductId", ProductId);
        db.AddParameter("@ColorId", ColorId);
        db.AddParameter("@IsActive", IsActive);
        db.AddParameter("@Size", Size);
        return Convert.ToString(db.ExecuteScalar("AddUpdateProductColor"));
    }


    public string AddUpdateProductOffer()
    {
        DbConnection db = new DbConnection();
        db.AddParameter("@ProductOfferId", ProductOfferId);
        db.AddParameter("@ProductId", ProductId);
        db.AddParameter("@OfferId", OfferId);
        db.AddParameter("@CategoryId", CategoryId);
        if(SubCategoryId !=null)
            db.AddParameter("@SubCategoryId", SubCategoryId);
        else
            db.AddParameter("@SubCategoryId", DBNull.Value);


        if (ChildCategoryId != null)
            db.AddParameter("@ChildCategoryId", ChildCategoryId);
        else
            db.AddParameter("@ChildCategoryId", DBNull.Value);



        db.AddParameter("@IsActive", IsActive);
        return Convert.ToString(db.ExecuteScalar("AddUpdateProductOffer"));
    }


    public DataTable GetProductOffersByProductId()
    {
        DbConnection db = new DbConnection();
        db.AddParameter("@ProductId", ProductId);
        return db.ExecuteDataTable("GetProductOffersByProductId");
    }

    public string GetProductOfferAmount()
    {
        DbConnection db = new DbConnection();
        db.AddParameter("@CategoryId", CategoryId);
        db.AddParameter("@ProductId", ProductId);
        return Convert.ToString(db.ExecuteScalar("GetPerticularProductOfferAmount"));
    }

    public DataTable GetCategoryOfferAmount()
    {
        DbConnection db = new DbConnection();
        db.AddParameter("@CategoryId", CategoryId);
        return db.ExecuteDataTable("GetCategoryOfferAmount");
    }
    public DataTable GetProductSizeByProductId()
    {
        DbConnection db = new DbConnection();
        db.AddParameter("@ProductId", ProductId);
        return db.ExecuteDataTable("GetProductSizeByProductId");
    }
    public string AddUpdateProductSize()
    {
        DbConnection db = new DbConnection();
        db.AddParameter("@ProductSizeId", ProductSizeId);
        db.AddParameter("@ProductId", ProductId);
      //  db.AddParameter("@SizeId", SizeId);
        db.AddParameter("@Size", Size);
        db.AddParameter("@IsActive", IsActive);
        return Convert.ToString(db.ExecuteScalar("AddUpdateProductSize"));
    }

    public DataTable GetDifferentProductBrands()
    {
        DbConnection db = new DbConnection();
        db.AddParameter("@CategoryId", CategoryId);
        return db.ExecuteDataTable("GetDifferentProductBrands");
    }
    public DataTable SelectProductSizeByCategoryId()
    {
        DbConnection db = new DbConnection();
        db.AddParameter("@CategoryId", CategoryId);
        return db.ExecuteDataTable("SelectProductSizeByCategoryId");
    }

    public string UpdateProductStock()
    {
        DbConnection db = new DbConnection();
        db.AddParameter("@ProductId", ProductId);
        db.AddParameter("@CommittedQuantity", CommittedQuantity);
        return Convert.ToString(db.ExecuteScalar("UpdateProductStock"));
    }


}