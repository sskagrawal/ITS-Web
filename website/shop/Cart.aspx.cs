using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class shop_Cart : System.Web.UI.Page
{
    public decimal FinalSubTotal { get; set; }
    public decimal TotalMakingCharge { get; set; }
    public decimal SubTotal = 0;
    public decimal OfferAmount = 0;
    public string CouponCode { get; set; }
    public string CouponPercentage { get; set; }
    public DataTable DtCategory { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCartItems();
            lblShipping.Text = "0";
            lblGrandTotal.Text = lblSubTotal.Text;
            hdfGrndTot.Value = lblSubTotal.Text;
            //if (HttpContext.Current.Session["BuyerId"] != null)
            //{
            //    hdfBuyerId.Value = HttpContext.Current.Session["BuyerId"].ToString();
            //   // BindCartItems();
            //  //  GetDataListItemSubTotal();
            //  //  GetCouponCode();

            //}
            //else
            //{
            //    Session["url"] = "~/cart.aspx";
            //    Response.Redirect("~/Login.aspx");
            //}

        }
    }
    public void BindCartItems()
    {
        DataTable Dt = ShoppingCart.Instance.GetData1();
        if (Dt.Rows.Count > 0)
        {
            //LnkBtn.Visible = true;
            // lblEmptyMsg.Text = "";
            btnCheckout.Visible = true;
            dtLstCart.DataSource = Dt;
            dtLstCart.DataBind();
            string prdSize = string.Empty;
            string con = string.Empty;
            foreach (DataRow dr in Dt.Rows)
            {
                if (dr["prdSize"].ToString() != string.Empty)
                {
                    prdSize = con + dr["prdSize"].ToString();
                    con = ",";
                }
            }
            //hdfPrdSize.Value = prdSize;
            // decimal TotalSaving = 0;
            // hdfPrdId.Value = Dt.Rows[0]["Prd_ID"].ToString();



            //foreach (DataRow dr in Dt.Rows)
            //{
            //    if (dr["Saving"].ToString() != string.Empty)
            //    {
            //        TotalSaving += Convert.ToDecimal(dr["Saving"]);
            //    }
            //}


            // lblTotalSaving.Text = TotalSaving.ToString();
        }
        else
        {
            btnCheckout.Visible = false;
            dtLstCart.DataSource = Dt;
            dtLstCart.DataBind();
            //ordDet.Visible = false;
            //lblEmptyMsg.Text = "No Items in Your Cart";
            //btnCheckOut.Visible = false;
            //divcooupon.Visible = false;
            //TotalDiv.Visible = false;
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton lnkbtn = sender as LinkButton;
        GridViewRow item = (GridViewRow)lnkbtn.NamingContainer;
        string ProId = Convert.ToString(((HiddenField)item.FindControl("hdfProductId")).Value);
        ShoppingCart.Instance.RemoveItem(ProId);
        BindCartItems();

    }
    public string getSubTotal(object Qty, object SellingPrice, object offrPrice,object delCh)
    {
        decimal SubTot = 0;
        decimal totDelChrg = 0;

        if (Convert.ToString(Qty) != string.Empty && Convert.ToString(SellingPrice) != string.Empty && Convert.ToString(offrPrice) != string.Empty)
        {
            int Qnt = Convert.ToInt32(Qty);
            decimal offrPrc = Convert.ToDecimal(offrPrice);
            decimal SllingPri = Convert.ToDecimal(SellingPrice);
            SubTot = (Qnt * SllingPri);
            
            // lblAmount.Text = Convert.ToString(SubTotal);
        }
        else
        {
            int Qnt = Convert.ToInt32(Qty);
            decimal SellPrice = Convert.ToDecimal(SellingPrice);
            SubTot = (Qnt * SellPrice);

            //SubTotal = SubTotal + SubTot;

            //lblSubTotal.Text = Convert.ToString(SubTotal);
            //// lblAmount.Text = Convert.ToString(SubTotal);
        }
        decimal delChrge = 0;
        if (Convert.ToString(delCh) != string.Empty)
        {
            delChrge = Convert.ToDecimal(delCh);
        }
        totDelChrg = totDelChrg + delChrge;
        SubTot = SubTot + delChrge;

        SubTotal = SubTotal + SubTot;

        lblSubTotal.Text = Convert.ToString(SubTotal);
        lblShipping.Text = totDelChrg.ToString();

        //-------------------Check For Delivery Charge
        DataTable dt = ShoppingCart.Instance.GetData1();
        if (dt != null && dt.Rows.Count > 0)
        {
            if (dt.Rows[0]["offrPrice"].ToString() == string.Empty)
            {
                OfferAmount = 0;
            }
            else
                OfferAmount = Convert.ToDecimal(dt.Rows[0]["offrPrice"]);


            //if (dt.Rows[0]["DelCharge"].ToString() == string.Empty)
            //{
            //    lblDeliveryCharger.Text = "0";
            //}
            //else
            //{
            //    lblDeliveryCharger.Text = dt.Rows[0]["DelCharge"].ToString();
            //}


        }

        if (SubTotal != 0 && SubTotal >= 500)
        {

        }
        else
        {
            //if (!string.IsNullOrEmpty(lblDeliveryCharger.Text.Trim()))
            //{

            //}
            //else
            //{

            //}
        }

        return Convert.ToString(SubTot);
    }
    protected void btnCheckout_Click(object sender, EventArgs e)
    {
        string TotalSaving = string.Empty;
        DataTable dt = new DataTable();
        DataRow dr;
        dt.Columns.Add(new System.Data.DataColumn("PrdID", typeof(String)));
        dt.Columns.Add(new System.Data.DataColumn("PrdName", typeof(String)));
        dt.Columns.Add(new System.Data.DataColumn("Qnt", typeof(String)));
        dt.Columns.Add(new System.Data.DataColumn("PrdPriceTotal", typeof(String)));
        dt.Columns.Add(new System.Data.DataColumn("UnitPrice", typeof(String)));
        dt.Columns.Add(new System.Data.DataColumn("OfferAmount", typeof(String)));
        // dt.Columns.Add(new System.Data.DataColumn("TotalSaving", typeof(String)));
        // dt.Columns.Add(new System.Data.DataColumn("PrdColor", typeof(String)));
        dt.Columns.Add(new System.Data.DataColumn("prdSize", typeof(String)));
        dt.Columns.Add(new System.Data.DataColumn("offrPrice", typeof(String)));
        dt.Columns.Add(new System.Data.DataColumn("offrPercentage", typeof(String)));
        dt.Columns.Add(new System.Data.DataColumn("selectedImg", typeof(String)));
        dt.Columns.Add(new System.Data.DataColumn("PrdMrp", typeof(String)));
        //dt.Columns.Add(new System.Data.DataColumn("iseggless", typeof(String)));
        //dt.Columns.Add(new System.Data.DataColumn("eglessPrc", typeof(String)));
        dt.Columns.Add(new System.Data.DataColumn("ShipCharge", typeof(String)));
        // dt.Columns.Add(new System.Data.DataColumn("SubTot", typeof(String)));
        foreach (GridViewRow item in dtLstCart.Rows)
        {
            string ProductId = Convert.ToString(((HiddenField)item.FindControl("hdfProductId")).Value);
            // string hdfPrdColor = Convert.ToString(((HiddenField)item.FindControl("hdfPrdColor")).Value);
            string hdfPrdSize = Convert.ToString(((HiddenField)item.FindControl("hdfPrdSize")).Value);
            string ProdName = Convert.ToString(((Label)item.FindControl("lblProductName")).Text);
            string Qnt = Convert.ToString(((HiddenField)item.FindControl("hdfPrdQnt")).Value);

            string SellingPrice = Convert.ToString(((Label)item.FindControl("lblSellingPrice")).Text);

            //TotalSaving = Convert.ToString(((Label)item.FindControl("lblSaving")).Text);
            string SubTotal = Convert.ToString(((Label)item.FindControl("lblSubTotal")).Text);

            string offerPrc = Convert.ToString(((HiddenField)item.FindControl("hdfOffrPrice")).Value);
            string offerPercntg = Convert.ToString(((HiddenField)item.FindControl("hdfOffrPercnt")).Value);
            string selectImg = Convert.ToString(((HiddenField)item.FindControl("hdfSelImg")).Value);
            string mrpPrc = Convert.ToString(((HiddenField)item.FindControl("hdfMrpPrc")).Value);
            string shipCharge = Convert.ToString(((Label)item.FindControl("lblShipCharge")).Text);
            //string prdIsEggls = Convert.ToString(((HiddenField)item.FindControl("hdfIsEggls")).Value);
            //string prdEgglsPrc = Convert.ToString(((HiddenField)item.FindControl("hdfEgglsPrc")).Value);

            dr = dt.NewRow();
            dr[0] = ProductId;
            dr[1] = ProdName;
            dr[2] = Qnt;
            dr[3] = SubTotal;
            dr[4] = SellingPrice;
            dr[5] = OfferAmount;
            // dr[6] = TotalSaving;
            // dr[7] = hdfPrdColor;
            dr[6] = hdfPrdSize;
            dr[7] = offerPrc;
            dr[8] = offerPercntg;
            dr[9] = selectImg;
            dr[10] = mrpPrc;
            dr[11] = shipCharge;
            //dr[12] = prdEgglsPrc;
            dt.Rows.Add(dr);
        }


        ShoppingCart.Instance.DtPrd = dt;
        ShoppingCart.Instance.SubTotal = lblSubTotal.Text.Trim();
        ShoppingCart.Instance.ShipmentFee = hdfShippingChrg.Value.Trim();
        ShoppingCart.Instance.EgglessPrc = string.Empty;

        ShoppingCart.Instance.GrandTotal = hdfGrndTot.Value;
        ShoppingCart.Instance.DelPinCode = string.Empty;
        ShoppingCart.Instance.DelTime = string.Empty;
        ShoppingCart.Instance.DelDate = string.Empty;

        Response.Redirect("myShipAddress.aspx");
    }

    public void bindShopingCart()
    {



    }
}