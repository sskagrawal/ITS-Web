using System.Collections.Generic;
using System.Web;
using System.Collections;
using System;
using System.Data;
using System.Web.Security;
using System.Web.UI.WebControls;

/**
 * The ShoppingCart class 
 * 
 * Holds the items that are in the cart and provides methods for their manipulation
 */
public class ShoppingCart {
	#region Properties

    public List<ProductBusiness> PrdList = new List<ProductBusiness>();
    public Hashtable Items = new Hashtable();
    //const double DelCharge = 50.00;
    public 	int Qty=0;
    public string CustomImgId;
    string customerID;
    string customerName=string.Empty;
    string unit;
    string amount;
    
    string customerContact;
    string customerEmail;
    DateTime invoiceDate;
    string personTitle = string.Empty;
    string firstName=string.Empty;
    string middleName = string.Empty;
    string lastName = string.Empty;
    
    string address1 = string.Empty;
    string address2 = string.Empty;
    string country = string.Empty;
    string state = string.Empty;
    string city = string.Empty;
    string pinCode = string.Empty;
    string phoneNo = string.Empty;
    string companyName = string.Empty;
    string landmark = string.Empty;
    string faxNo = string.Empty;



    string coupondiscountper = string.Empty;
    string coupondiscountamt = string.Empty;
    //string address1PhoneNoH = string.Empty;
    //string address2HouseStreetName = string.Empty;
    //string address2Line1 = string.Empty;
    //string address2Line2 = string.Empty;
    //string address2Country = string.Empty;
    //string address2State = string.Empty;
    //string address2City = string.Empty;
    //string address2PinCode = string.Empty;
    //string address2PhoneNoR = string.Empty;
    //string address2PhoneNoH = string.Empty;

    string paymentModeID = string.Empty;

    //string address1MOB = string.Empty;
    //string address2MOB = string.Empty;
    //string address1Email = string.Empty;
    //string address2Email = string.Empty;
    string paymentModeName = string.Empty;
    string transactionID="0";

    string invoiceNo = string.Empty;
    string invoiceID = string.Empty;

    string description = string.Empty;
    string status = string.Empty;
    string errorDesc_General = string.Empty;
    string errorDesc_Technical = string.Empty;
    bool saved_Status ;

    DataTable dtPrd = new DataTable();
    string subtotal = string.Empty;

    string shipmentFee = string.Empty;
    string grandTotal = string.Empty;

    string deliverySlot = string.Empty;

    string discount = string.Empty;
    string tax = string.Empty;

    string totalSaving = string.Empty;

    string succUrl = string.Empty;
    string failUrl = string.Empty;
    string serviceProvider = string.Empty;
    string vatPerc = string.Empty;
    string vatAmt = string.Empty;
    string totAmntIncludeVat = string.Empty;
    string egglessPrc = string.Empty;
    string delPincode = string.Empty;
    string delDate = string.Empty;
    string delTime = string.Empty;
   
    public string VatPerc
    {
        get { return vatPerc; }
        set { vatPerc = value; }
    }
    public string VatAmt
    {
        get { return vatAmt; }
        set { vatAmt = value; }
    }
    public string TotAmntIncludeVat
    {
        get { return totAmntIncludeVat; }
        set { totAmntIncludeVat = value; }
    }

    public string SuccUrl
    {
        get { return succUrl; }
        set { succUrl = value; }
    }
    public string FailUrl
    {
        get { return failUrl; }
        set { failUrl = value; }
    }

    public string ServiceProvider
    {
        get { return serviceProvider; }
        set { serviceProvider = value; }
    }

    public string Discount
    {
        get { return discount; }
        set { discount = value; }
    }

    public string Tax
    {
        get { return tax; }
        set { tax = value; }
    }
    public string DeliverySlot
    {
        get { return deliverySlot; }
        set { deliverySlot = value; }
    }
    public string PersonTitle
    {
        get { return personTitle; }
        set { personTitle = value; }
    }
    public string SubTotal
    {
        get { return subtotal; }
        set { subtotal = value; }
    }
    public string ProductDiscount 
    {
        get { return ProductDiscount; }
        set { subtotal = value; }
    }
    public string ShipmentFee
    {
        get { return shipmentFee; }
        set { shipmentFee = value; }
    }

    public string CouponDiscountPer
    {
        get { return coupondiscountper; }
        set { coupondiscountper = value; }
    }
    public string CouponDiscountAmt
    {
        get { return coupondiscountamt; }
        set { coupondiscountamt = value; }
    }
    public string GrandTotal
    {
        get { return grandTotal; }
        set { grandTotal = value; }
    }
    public DataTable DtPrd
    {
        get { return dtPrd; }
        set { dtPrd = value; }
    }
    public string InvoiceID
    {
        get { return invoiceID; }
        set { invoiceID = value; }
    }
    public string InvoiceNo
    {
        get { return invoiceNo; }
        set { invoiceNo = value; }
    }
    public string TransactionID
    {
        get { return transactionID; }
        set { transactionID = value; }
    }
    public string PaymentModeName
    {
        get { return paymentModeName; }
        set { paymentModeName = value; }
    }
    
    public string PaymentModeID
    {
        get { return paymentModeID; }
        set { paymentModeID = value; }
    }
    public string CustomerID
    {
        get { return customerID; }
        set { customerID = value; }
    }
    public string CustomerName
    {
        get { return customerName; }
        set { customerName = value; }
    }
    
    public string CustomerContact
    {
        get { return customerContact; }
        set { customerContact = value; }
    }
    public string CustomerEmail
    {
        get { return customerEmail; }
        set { customerEmail = value; }
    }
    public string Addr1
    {
        get { return address1; }
        set { address1 = value; }
    }
    public string Addr2
    {
        get { return address2; }
        set { address2 = value; }
    }
    public string Country
    {
        get { return country; }
        set { country = value; }
    }
    public string State
    {
        get { return state; }
        set { state = value; }
    }
    public string City
    {
        get { return city; }
        set { city = value; }
    }
    public string Landmark
    {
        get { return landmark; }
        set { landmark = value; }
    }
    public string Pipcode
    {
        get { return pinCode; }
        set { pinCode = value; }
    }
    public string FaxNo
    {
        get { return faxNo; }
        set { faxNo = value; }
    }
    public DateTime InvoiceDate
    {
        get { return invoiceDate; }
        set { invoiceDate = value; }
    }
    public string FirstName
    {
        get { return firstName; }
        set { firstName = value; }
    }
    public string MiddleName
    {
        get { return middleName; }
        set { middleName = value; }
    }
    public string LastName
    {
        get { return lastName; }
        set { lastName = value; }
    }
    public string PhoneNo
    {
        get { return phoneNo; }
        set { phoneNo = value; }
    }
    public string Unit
    {
        get { return unit; }
        set { unit = value; }
    }
    public string Amount
    {
        get { return amount; }
        set { amount = value; }
    }
    public string CompanyName
    {
        get { return companyName; }
        set { companyName = value; }
    }
    public string Description
    {
        get { return description; }
        set { description = value; }
    }
    public string ErrorDesc_General
    {
        get { return errorDesc_General; }
        set { errorDesc_General = value; }
    }
    public string ErrorDesc_Technical
    {
        get { return errorDesc_Technical; }
        set { errorDesc_Technical = value; }
    }
    public bool Saved_Status
    {
        get { return saved_Status; }
        set { saved_Status = value; }
    }
    public string TotalSaving
    {
        get { return totalSaving; }
        set { totalSaving = value; }
    }

    public string EgglessPrc
    {
        get { return egglessPrc; }
        set { egglessPrc = value; }
    }
    public string DelPinCode
    {
        get { return delPincode; }
        set { delPincode = value; }
    }
    public string DelDate
    {
        get { return delDate; }
        set { delDate = value; }
    }
    public string DelTime
    {
        get { return delTime; }
        set { delTime = value; }
    }


    #endregion
    #region Singleton Implementation


    static ShoppingCart() {
		
	}
    

	// A protected constructor ensures that an object can't be created from outside
	protected ShoppingCart() { }

	#endregion

	#region Item Modification Methods
	/**
	 * AddItem() - Adds an item to the shopping 
	 */
    public void AddItem(string Prd_ID, string Qnt, string color, string size ,string offrPrc, string offrPrcntg, string sellPrc, string mrpPrc,string isEggless,string egglessPrc)
    {
       
        var Chkitem = Instance.PrdList.Find(x => x.ProductId == Convert.ToInt32(Prd_ID));
        if (Chkitem != null)
        {
            ProductBusiness obj_Prd = new ProductBusiness();
            obj_Prd.ProductId = Convert.ToInt32(Prd_ID);
            obj_Prd.PrdQnt = Convert.ToInt32(Qnt);
            obj_Prd.PrdColor = color;
         //   obj_Prd.Size = size;
            obj_Prd.offrPrc = offrPrc;
            obj_Prd.offrPrcntg = offrPrcntg;
            obj_Prd.MRPPrice = Convert.ToDecimal(mrpPrc);
            obj_Prd.SellingPrice = Convert.ToDecimal(sellPrc);
            obj_Prd.IsEggless =isEggless ;
            obj_Prd.EgglessPrc = egglessPrc;
            //obj_Prd.
            //obj_Prd.Weight = PrdWeight;
            if (HttpContext.Current.Session["custPrdImgId"] != null)
                obj_Prd.CustomImgID = HttpContext.Current.Session["custPrdImgId"].ToString();
            HttpContext.Current.Session["custPrdImgId"] = null;
        }
        else
        {
            Qty++;
            ProductBusiness obj_Prd = new ProductBusiness();
            obj_Prd.ProductId = Convert.ToInt32(Prd_ID);


            obj_Prd.PrdQnt = Convert.ToInt32(Qnt);
    
            obj_Prd.PrdColor = color;
            obj_Prd.Size = size;
            obj_Prd.offrPrc = offrPrc;
            obj_Prd.offrPrcntg = offrPrcntg;
            obj_Prd.MRPPrice = Convert.ToDecimal(mrpPrc);
            obj_Prd.SellingPrice = Convert.ToDecimal(sellPrc);
            obj_Prd.IsEggless = isEggless;
            obj_Prd.EgglessPrc = egglessPrc;
            //obj_Prd.Weight = PrdWeight;
            if (HttpContext.Current.Session["custPrdImgId"] != null)
                obj_Prd.CustomImgID = HttpContext.Current.Session["custPrdImgId"].ToString();

            HttpContext.Current.Session["custPrdImgId"] = null;

            //DataTable dt = new DataTable();
            //dt.Columns.Add("Prd_ID");
            //dt.Columns.Add("Prd_Name");
            //dt.Columns.Add("Prd_No");
            //dt.Columns.Add("Description");
            //dt.Columns.Add("Weight");
            //dt.Columns.Add("Qnt");


            //dt.Columns.Add("MrpPrice");
            //dt.Columns.Add("sellPrc");

            //dt.Columns.Add("Prd_Image");
            //dt.Columns.Add("delCharge");

            //dt.Columns.Add("Prd_Comp");
            //dt.Columns.Add("Saving");
            //dt.Columns.Add("DelCharge");
            //DataTable dtPrd = DataAccess.GetData("Select * From [ProductMaster] WHERE [ProductId]=" + Prd_ID);

            //if (dtPrd.Rows.Count > 0)
            //{
            //    string Saving = "0";
            //    if (dtPrd.Rows[0]["MRPPrice"].ToString() != "" && dtPrd.Rows[0]["sellPrc"].ToString() != "")
            //    {
            //        if (Convert.ToDecimal(dtPrd.Rows[0]["MRPPrice"]) > Convert.ToDecimal(dtPrd.Rows[0]["sellPrc"].ToString()))
            //        {
            //            Saving = (Convert.ToDecimal(dtPrd.Rows[0]["MRPPrice"]) - Convert.ToDecimal(dtPrd.Rows[0]["sellPrc"])).ToString();
            //            ProductDiscount = Convert.ToString(Convert.ToDecimal(dtPrd.Rows[0]["MRPPrice"]) - Convert.ToDecimal(dtPrd.Rows[0]["sellPrc"]));

            //        }
            //        else
            //        {
            //            Saving = "0";
            //            ProductDiscount = "0";
            //        }
            //    }

            //    dt.Rows.Add(Prd_ID, dtPrd.Rows[0]["ProductName"].ToString(), dtPrd.Rows[0]["ProductNo"].ToString(), dtPrd.Rows[0]["FullDescription"].ToString(), dtPrd.Rows[0]["Weight"].ToString(), Qty,dtPrd.Rows[0]["MRPPrice"].ToString(), dtPrd.Rows[0]["SellingPrice"].ToString(), dtPrd.Rows[0]["ProductImage"].ToString(), dtPrd.Rows[0]["ShippingCharge"].ToString(), dtPrd.Rows[0]["CompanyName"].ToString(), Saving, "");

            //}
            //obj_Prd.DtPrd = dt;
            //}
            Instance.PrdList.Add(obj_Prd);
        }

    }

	
	public void SetItemQuantity(string productId, int quantity) {
        //// If we are setting the quantity to 0, remove the item entirely
        //if (quantity == 0) {
        //    RemoveItem(productId);
        //    return;
        //}

        //// Find the item and update the quantity
        //ArrayList updatedItem = new ArrayList(productId);

        //foreach (ArrayList item in Items)
        //{
        //    if (item.Equals(productId))
        //    {
        //        Quantity = quantity;
        //        return;
        //    }
        //}
	}


    public void RemoveItem(string Prd_ID)
    {
        if (Qty > 0)
        {
            Qty--;
        }
        var Delitem = Instance.PrdList.Find(x => x.ProductId == Convert.ToInt32(Prd_ID));
        Instance.PrdList.Remove(Delitem);

        Items.Remove(Prd_ID);
       
	}

    #region User_Info session Imaplementation
    public static ShoppingCart Instance
    {
        get
        {
            var test = HttpContext.Current.Session["ShopCart"];

            ShoppingCart session = (ShoppingCart)test;
            if (session == null)
            {
                session = new ShoppingCart();
                HttpContext.Current.Session["ShopCart"] = session;
            }
            return session;
        }

    }
    #endregion

    public void UpdateItemQnt(string Prd_ID, string qnt)
    {
        //if (Qty > 0)
        //{
        //    Qty--;
        //}

        var Delitem = Instance.PrdList.Find(x => x.ProductId == Convert.ToInt32(Prd_ID));


        Instance.PrdList.Find(x => x.ProductId == Convert.ToInt32(Prd_ID)).PrdQnt = Convert.ToInt32(qnt);
        //Instance.Items.Add(Prd_ID, Prd_ID);
       // Instance.Items.Add(Qty,qnt);
        //Items.Remove(Prd_ID);

    }

	#endregion

	
	public decimal GetSubTotal() {
		decimal subTotal = 0;
        //foreach (CartItem item in Items)
        //    subTotal += item.TotalPrice;

		return subTotal;
	}





    //kishan
    public DataTable GetData1()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Prd_ID");
        dt.Columns.Add("Prd_Name");
       // dt.Columns.Add("Prd_No");
        dt.Columns.Add("Description");
        //dt.Columns.Add("Weight");
        dt.Columns.Add("Qnt");


        dt.Columns.Add("MrpPrice");
        dt.Columns.Add("SellingPrice");

        dt.Columns.Add("Prd_Image");
        dt.Columns.Add("delCharge");

        //dt.Columns.Add("Prd_Comp");
        dt.Columns.Add("Saving");
        dt.Columns.Add("DelCharge");
        dt.Columns.Add("MakingCharge");
        //dt.Columns.Add("OfferAmount");
        dt.Columns.Add("prdColor");
        dt.Columns.Add("prdSize");
        dt.Columns.Add("prdCustImgID");
        dt.Columns.Add("offrPrice");
        dt.Columns.Add("offrPrcntg");
        dt.Columns.Add("isEggless");
        dt.Columns.Add("egglessPrc");   
        foreach (ProductBusiness objPrd in Instance.PrdList)
        {
            string PrdID = objPrd.ProductId.ToString();
            string Qnt = objPrd.PrdQnt.ToString();
            string PrdColor = objPrd.PrdColor;
            string PrdSize = objPrd.Size;
            string prdCustImgId = objPrd.CustomImgID.ToString();
            string offrPerc = objPrd.offrPrc;
            string offrPercentage = objPrd.offrPrcntg;
            string SellingPrice = objPrd.SellingPrice.ToString();
            string MrpPrice = objPrd.MRPPrice.ToString();
            string isEgls = objPrd.IsEggless;
            string eglsPrc = objPrd.EgglessPrc;
            //string PrdWght = objPrd.Weight;           
            //string TotalSaving = string.Empty;
           
            string CategoryId = GetProductCategoryId(Convert.ToInt32(PrdID));
            string delChrg = "0";

            //string OfferAmount = GetOfferAmount(Convert.ToInt32(PrdID), Convert.ToInt32(CategoryId));
            DataTable dtPrd = DataAccess.GetData("Select * From [ecom_Product] WHERE [Product_id]=" + PrdID);
            if (dtPrd.Rows.Count > 0)
            {
                string Saving = "0";
                if (MrpPrice != "" && SellingPrice != "")
                {
                    if (Convert.ToDecimal(MrpPrice) > Convert.ToDecimal(SellingPrice))
                    {
                        Saving = ((Convert.ToDecimal(MrpPrice) - Convert.ToDecimal(SellingPrice)) * Convert.ToInt32(Qnt)).ToString();
                        //if (!string.IsNullOrEmpty(offrPerc))
                        //{
                        //    Saving = ((Convert.ToDecimal(MrpPrice) - Convert.ToDecimal(offrPerc)) * Convert.ToInt32(Qnt)).ToString();
                        //}
                        
                    }
                }
                if (dtPrd.Rows[0]["ShipCharge"].ToString() != string.Empty)
                {
                    delChrg = dtPrd.Rows[0]["ShipCharge"].ToString();
                }

                dt.Rows.Add(PrdID, dtPrd.Rows[0]["product_name"].ToString(), dtPrd.Rows[0]["Full_description"].ToString(), Qnt, MrpPrice, SellingPrice, dtPrd.Rows[0]["Mainproduct_image"].ToString(), delChrg, Saving, "", "0", PrdColor, PrdSize, prdCustImgId, offrPerc, offrPercentage,isEgls,eglsPrc);

            }

        }




        return dt;
    }
    //End
  
    public void RemoveSession()
    {
        HttpContext.Current.Session["ShopCart"] = null;
    }

    public string GetProductCategoryId(int ProductId)
    {
        string CategoryId=string.Empty;
        ProductBusiness obj = new ProductBusiness();
        string Search = " AND PM.ProductId=" + ProductId;
        DataTable dt = obj.SelectProduct(Search);
        if (dt != null && dt.Rows.Count > 0)
        {
             CategoryId = Convert.ToString(dt.Rows[0]["CategoryId"]);
        }
        return CategoryId;
    }

    public string GetOfferAmount(int ProductId,int CategoryId)
    {
        ProductBusiness obj = new ProductBusiness();
        obj.CategoryId = CategoryId;
        obj.ProductId = ProductId;
        string OfferAmount = obj.GetProductOfferAmount();
        return OfferAmount;
    }
    public Guid GetUserID()
    {
        MembershipUser currentUser = Membership.GetUser();
        Guid currentUserId = (Guid)currentUser.ProviderUserKey;
        return currentUserId;
    }
    public string Get_PersonID_By_UserID(Guid UserID)
    {
        string PersonID = DataAccess.GetSingleValue("SELECT [PersonID] FROM [Ge_Person_Profile] WHERE [UserID] ='" + UserID + "'");
        return PersonID;
    }
    public string GetTotalAmount()
    {
        double amount = 0;
        DataTable dt = ShoppingCart.Instance.GetData1();

        foreach (DataRow row in dt.Rows)
        {

            double a = Convert.ToDouble(row["Amount"]);


            amount = amount + a;
        }
        try
        {


            //GridFooterItem footeritem = RadGrid1.MasterTableView.GetItems(GridItemType.Footer)[0] as GridFooterItem;
            ////(footeritem.FindControl("TextBox1") as TextBox).Text = "123";
            ////(footeritem.FindControl("TextBox1") as TextBox).Enabled = false;
            //((Label)footeritem["Payment"].FindControl("lblFinalTotalAmount")).Text = amount.ToString();
        }
        catch
        {
        }

        return amount.ToString();



    }
}
