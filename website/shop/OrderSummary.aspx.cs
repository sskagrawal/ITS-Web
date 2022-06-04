using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class shop_OrderSummary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {









            if (HttpContext.Current.Session["partyid"] != null)
            {


                //System.Data.DataTable dt = new System.Data.DataTable();  
                //dt.Columns.AddRange(new System.Data.DataColumn[] { new System.Data.DataColumn("Id", typeof(int)) });  
                //for (int i = 0; i < 5; i++)  
                //{  
                //    dt.Rows.Add((i + 1));  
                //}
                //grdProduct.DataSource = dt;
                //grdProduct.DataBind();  








                DataTable dt = ShoppingCart.Instance.GetData1();
                if (dt.Rows.Count > 0)
                {
                    //string temp = HttpContext.Current.Session["ShopCart"].ToString();
                    OrderSumm.Visible = true;
                    hdfBuyerId.Value = HttpContext.Current.Session["partyid"].ToString();
                    BindCustomerInformation();

                    ProductInformation();
                }
                else
                {
                    OrderSumm.Visible = false;
                }




            }

            else
            {
                Session["urrr"] = "~/shop/OrderSummary.aspx";
                Response.Redirect("~/Admin/Login.aspx");
            }

        }
    }
    public void ProductInformation()
    {
        DataTable Dt = ShoppingCart.Instance.DtPrd;

        //DtProduct = Dt;

        dtLstCart.DataSource = Dt;
        dtLstCart.DataBind();
    }
    public void BindCustomerInformation()
    {



        lblName.Text = ShoppingCart.Instance.CustomerName;
        // lblEmail.Text = ShoppingCart.Instance.CustomerEmail;
        lblMob.Text = ShoppingCart.Instance.CustomerContact;
        lblAddr.Text = ShoppingCart.Instance.DelPinCode + " " + ShoppingCart.Instance.Addr1 + " " + ShoppingCart.Instance.City + " " + ShoppingCart.Instance.State + " " + ShoppingCart.Instance.Country;



        //lblMobileNo.Text = ShoppingCart.Instance.Address1MOB;

        if (ShoppingCart.Instance.Qty != 0)
        {
            lblSubTot.Text = ShoppingCart.Instance.SubTotal;
        }

        lblSubTot.Text = ShoppingCart.Instance.SubTotal;


        lblShip.Text = ShoppingCart.Instance.ShipmentFee;
        //if (ShoppingCart.Instance.EgglessPrc != string.Empty)
        //{
        //    if (ShoppingCart.Instance.EgglessPrc != "0")
        //    {
        //        egglesDiv.Visible = true;
        //        lblEgglessPrc.Text = ShoppingCart.Instance.EgglessPrc;

        //    }
        //    else
        //    {
        //        egglesDiv.Visible = false;
        //        lblEgglessPrc.Text = "0";
        //    }
        //}
        //else
        //{
        //    egglesDiv.Visible = false;
        //    lblEgglessPrc.Text = "0";
        //}
        lblTotal.Text = ShoppingCart.Instance.GrandTotal;
        Session["GrandTotal"] = ShoppingCart.Instance.GrandTotal;

        //lblTotalSaving.Text = ShoppingCart.Instance.TotalSaving;

        //string VatPercstr = string.Empty;
        //try
        //{
        //    VatPercstr = DataAccess.GetSingleValue("select [VatTaxPerc] from [VatTaxMaster]");
        //}
        //catch { }

        //if (VatPercstr != string.Empty)
        //{
        //    VatTaxPerc = VatPercstr;
        //    decimal VatAmount = 0;
        //    decimal TotAmount = 0;
        //    decimal VatPerc = 0;

        //    if (ShoppingCart.Instance.GrandTotal != string.Empty)
        //    {
        //        TotAmount = Convert.ToDecimal(ShoppingCart.Instance.GrandTotal);
        //        VatPerc = Convert.ToDecimal(VatTaxPerc);
        //        VatAmount = (TotAmount * VatPerc) / 100;
        //        lblVatTaxAmt.Text = (Math.Round(VatAmount, 2)).ToString();
        //    }

        //    ShoppingCart.Instance.VatPerc = VatPerc.ToString();
        //    ShoppingCart.Instance.VatAmt = VatAmount.ToString();
        //    ShoppingCart.Instance.TotAmntIncludeVat = (TotAmount + (Math.Round(VatAmount, 2))).ToString();

        //}
        //lblTotalAmount.Text = ShoppingCart.Instance.TotAmntIncludeVat;

    }

    public string Generatetxnid()
    {

        Random rnd = new Random();
        string strHash = Generatehash512(rnd.ToString() + DateTime.Now);
        string txnid1 = strHash.ToString().Substring(0, 20);

        return txnid1;
    }
    private string GetNewID()
    {
        string MaxID = string.Empty;
        try
        {
            MaxID = DataAccess.GetSingleValue("Select top 1 [OrderNumber] FROM [ecom_OrderMaster] order by [OrderId] desc"); //select max Invoice ID
        }
        catch { }
        string IDFormate = "ITS000";

        string NewInvoiceID = utility.GenrateOrderNo(MaxID, IDFormate);
        return NewInvoiceID;
    }
    public string Generatehash512(string text)
    {

        byte[] message = Encoding.UTF8.GetBytes(text);

        UnicodeEncoding UE = new UnicodeEncoding();
        byte[] hashValue;
        SHA512Managed hashString = new SHA512Managed();
        string hex = "";
        hashValue = hashString.ComputeHash(message);
        foreach (byte x in hashValue)
        {
            hex += String.Format("{0:x2}", x);
        }
        return hex;

    }
    public void SaveOrderDetails()
    {
        SqlCommand cmd = new SqlCommand("INSERT INTO [ecom_OrderMaster]([OrderNumber],[BuyerId],[BuyerName],[BuyerAddress1],[BuyerAddress2],[BuyerMobileNo],[BuyerCountry],[BuyerState],[BuyerCity],[DelPincode],[BuyerEmail],[OrderDate],[OrderAmount],[DiscountAmount],[Total_Amnt],[TransactionID],[PaymentBy],[ShipmentFee],[IsActive],[Created_On],[OrderStatus],[PaymentMode],[OrderFinalStatus],[UserRemark],[CouponDiscAmt],[CouponDiscPerc],[PaymentStatus],[DeliveryDate],[DeliveryTime],[EgglessPrc])VALUES(@OrderNumber,@BuyerId,@BuyerName,@BuyerAddress1,@BuyerAddress2,@BuyerMobileNo,@BuyerCountry,@BuyerState,@BuyerCity,@DelPincode,@BuyerEmail,@OrderDate,@OrderAmount,@DiscountAmount,@Total_Amnt,@TransactionID,@PaymentBy,@ShipmentFee,@IsActive,@Created_On,@OrderStatus,@PaymentMode,@OrderFinalStatus,@UserRemark,@CouponDiscAmt,@CouponDiscPerc,@PaymentStatus,@DeliveryDate,@DeliveryTime,@EgglessPrc);select scope_identity();");
        cmd.Parameters.AddWithValue("@OrderNumber", ShoppingCart.Instance.InvoiceNo);
        cmd.Parameters.AddWithValue("@BuyerId", ShoppingCart.Instance.CustomerID);
        cmd.Parameters.AddWithValue("@BuyerName", ShoppingCart.Instance.CustomerName);
        cmd.Parameters.AddWithValue("@BuyerAddress1", ShoppingCart.Instance.Addr1);
        cmd.Parameters.AddWithValue("@BuyerAddress2", ShoppingCart.Instance.Addr2);
        cmd.Parameters.AddWithValue("@BuyerMobileNo", ShoppingCart.Instance.CustomerContact);
        cmd.Parameters.AddWithValue("@BuyerCountry", ShoppingCart.Instance.Country);
        cmd.Parameters.AddWithValue("@BuyerState", ShoppingCart.Instance.State);
        cmd.Parameters.AddWithValue("@BuyerCity", ShoppingCart.Instance.City);
        cmd.Parameters.AddWithValue("@DelPincode", ShoppingCart.Instance.DelPinCode);
        cmd.Parameters.AddWithValue("@BuyerEmail", ShoppingCart.Instance.CustomerEmail);
        cmd.Parameters.AddWithValue("@OrderDate", DateTime.Now);
        cmd.Parameters.AddWithValue("@OrderAmount", ShoppingCart.Instance.SubTotal);
        cmd.Parameters.AddWithValue("@DiscountAmount", "0");
        cmd.Parameters.AddWithValue("@Total_Amnt", ShoppingCart.Instance.GrandTotal);
        cmd.Parameters.AddWithValue("@TransactionID", ShoppingCart.Instance.TransactionID);
        cmd.Parameters.AddWithValue("@PaymentBy", ShoppingCart.Instance.PaymentModeName);
        if (ShoppingCart.Instance.ShipmentFee != string.Empty)
        {
            cmd.Parameters.AddWithValue("@ShipmentFee", ShoppingCart.Instance.ShipmentFee);
        }
        else
        {
            cmd.Parameters.AddWithValue("@ShipmentFee", "0");
        }

        cmd.Parameters.AddWithValue("@IsActive", true);
        cmd.Parameters.AddWithValue("@Created_On", DateTime.Now);
        cmd.Parameters.AddWithValue("@OrderStatus", "Pending");
        cmd.Parameters.AddWithValue("@PaymentMode", string.Empty);
        cmd.Parameters.AddWithValue("@OrderFinalStatus", "Pending");
        cmd.Parameters.AddWithValue("@UserRemark", "");
        if (ShoppingCart.Instance.CouponDiscountAmt != string.Empty)
        {
            cmd.Parameters.AddWithValue("@CouponDiscAmt", ShoppingCart.Instance.CouponDiscountAmt);
        }
        else
        {
            cmd.Parameters.AddWithValue("@CouponDiscAmt", "0");
        }
        if (ShoppingCart.Instance.CouponDiscountPer != string.Empty)
        {
            cmd.Parameters.AddWithValue("@CouponDiscPerc", ShoppingCart.Instance.CouponDiscountPer);
        }
        else
        {
            cmd.Parameters.AddWithValue("@CouponDiscPerc", "0");
        }

        cmd.Parameters.AddWithValue("@PaymentStatus", "UnPaid");
        cmd.Parameters.AddWithValue("@DeliveryDate", DBNull.Value);
        cmd.Parameters.AddWithValue("@DeliveryTime", ShoppingCart.Instance.DelTime);
        
            cmd.Parameters.AddWithValue("@EgglessPrc", "0");
       

        string orderMasterID = DataAccess.InsertExecuteScalar(cmd);
        if (orderMasterID != string.Empty)
        {
            hdfOrderId.Value = orderMasterID;
            Session["OrderId"] = Convert.ToString(hdfOrderId.Value);
            SaveOrderItems();



            if (ShoppingCart.Instance.PaymentModeName == "Cash On Delivery")
            {
                //string msg = "Hi " + ShoppingCart.Instance.CustomerName + ", Your Order No " + ShoppingCart.Instance.InvoiceNo + " is Successfully Placed with KremyKraft of amount " + ShoppingCart.Instance.GrandTotal + "";
                //SendSMS.ProcessSMS(ShoppingCart.Instance.CustomerContact, msg, "1207162383044748720");

                //string AdmMsg = "Hi Admin, There is new Order No " + ShoppingCart.Instance.InvoiceNo + " is Successfully Placed with KremyKraft ";
                //SendSMS.ProcessSMS("8770168831", AdmMsg, "1207162383064908472");
                SendMailToAdmin();
                SendMailToUser();

                //DataTable dtVendr = DataAccess.GetData("select * from [View_Vendor_Master] where Pincode='" + ShoppingCart.Instance.DelPinCode + "'  ");
                //if (dtVendr.Rows.Count > 0)
                //{
                //    foreach (DataRow dr in dtVendr.Rows)
                //    {
                //        if (dr["Mobile"].ToString() != string.Empty)
                //        {
                //            string VndrMsg = "Hello Vendor, There is new Order No " + ShoppingCart.Instance.InvoiceNo + " is placed on kremykraft of amount - " + ShoppingCart.Instance.GrandTotal;
                //            SendSMS.ProcessSMS(dr["Mobile"].ToString(), VndrMsg, "1207163637087895752");
                //        }
                //        if (dr["Email"].ToString() != string.Empty)
                //        {
                //            //SendMailToVendor(dr["Email"].ToString());
                //        }

                //    }
                //}




                DataTable dt = ShoppingCart.Instance.DtPrd;
                foreach (DataRow dr in dt.Rows)
                {
                    ShoppingCart.Instance.RemoveItem(dr["PrdID"].ToString());
                    //UpdateProductStock(Convert.ToInt32(dr["PrdID"]), Convert.ToInt32(dr["Qnt"]));
                }

                //foreach (DataRow dr in dt.Rows)
                //{
                //    ShoppingCart.Instance.RemoveItem(dr["PrdID"].ToString());
                //    UpdateProductStock(Convert.ToInt32(dt.Rows[i]["PrdID"]), Convert.ToInt32(dt.Rows[i]["Qnt"]));
                //}

                Response.Redirect("order-success.aspx?invN=" + DB_Configuration.Encryptdata(ShoppingCart.Instance.InvoiceNo) + "");
            }
            else
            {
                //DataTable dt = ShoppingCart.Instance.DtPrd;
                //foreach (DataRow dr in dt.Rows)
                //{
                //    ShoppingCart.Instance.RemoveItem(dr["PrdID"].ToString());
                //}
                //BindPaymentGateway();
            }


        }


        //OrderMasterBusiness obj = new OrderMasterBusiness();
        //obj.OrderId = Convert.ToInt32(hdfOrderId.Value);


        //obj.OrderNumber = GetNewID();
        //obj.BuyerId = Convert.ToInt32(HttpContext.Current.Session["BuyerId"]);
        //obj.BuyerName = ShoppingCart.Instance.CustomerName;
        //obj.BuyerAddress1 = ShoppingCart.Instance.Addr1;
        //obj.BuyerAddress2 = ShoppingCart.Instance.Addr2;
        //obj.BuyerMobileNo = ShoppingCart.Instance.CustomerContact;
        //obj.BuyerEmail = ShoppingCart.Instance.CustomerEmail;
        //obj.OrderDate = utility.getCurrentDateTime();


        ////by Surendra Goyal
        ////  obj.City = ShoppingCart.Instance.City;
        //// obj.State = ShoppingCart.Instance.State;
        //// obj.Country = ShoppingCart.Instance.Country;




        //obj.OrderAmount = Convert.ToDecimal(ShoppingCart.Instance.SubTotal);
        //obj.TaxAmount = 0;
        //if (ShoppingCart.Instance.TotalSaving != "0.0" && ShoppingCart.Instance.TotalSaving != "")
        //    obj.DiscountAmount = Convert.ToDecimal(ShoppingCart.Instance.TotalSaving);
        //else
        //    obj.DiscountAmount = 0;
        //obj.Total_Amnt = Convert.ToDecimal(ShoppingCart.Instance.TotAmntIncludeVat);
        //obj.TransactionID = ShoppingCart.Instance.TransactionID;
        //obj.PaymentBy = ShoppingCart.Instance.PaymentModeName;
        //if (ShoppingCart.Instance.ShipmentFee != "0.0" && ShoppingCart.Instance.ShipmentFee != "")
        //    obj.ShipmentFee = Convert.ToDecimal(ShoppingCart.Instance.ShipmentFee);
        //else
        //    obj.ShipmentFee = 0;
        //obj.BuyerTitle = ShoppingCart.Instance.PersonTitle;
        //obj.BuyerFirstName = ShoppingCart.Instance.FirstName;
        //obj.BuyerLasName = ShoppingCart.Instance.LastName;
        //obj.IsActive = true;
        //obj.Created_On = utility.getCurrentDateTime();
        //obj.Modified_On = utility.getCurrentDateTime();

        ////if(rbtnCashOnDelivery.Checked)

        //obj.OrderStatus = "Pending";
        //obj.PaymentStatus = "Pending";
        //if (ShoppingCart.Instance.VatPerc == string.Empty)
        //{
        //    obj.VatPerc = "0";
        //}
        //else
        //{
        //    obj.VatPerc = ShoppingCart.Instance.VatPerc;
        //}

        //if (ShoppingCart.Instance.VatAmt == string.Empty)
        //{
        //    obj.VatAmnt = "0";
        //}
        //else
        //{
        //    obj.VatAmnt = ShoppingCart.Instance.VatAmt;
        //}


        ////  obj.UserRemark = txtRem.Text;


        //if (ShoppingCart.Instance.CouponDiscountAmt != "")
        //{
        //    obj.CouponDisc = ShoppingCart.Instance.CouponDiscountAmt;
        //}


        //else
        //{
        //    obj.CouponDisc = "0";
        //}


        //if (ShoppingCart.Instance.CouponDiscountPer != "")
        //{
        //    obj.CouponPerc = ShoppingCart.Instance.CouponDiscountPer;
        //}
        //else
        //{
        //    obj.CouponPerc = "0";
        //}
        //if (ShoppingCart.Instance.OrderMrpAmt != "")
        //{
        //    obj.OrderMrpAmount = Convert.ToDecimal(ShoppingCart.Instance.OrderMrpAmt);
        //}
        //else
        //{
        //    obj.OrderMrpAmount = 0;
        //}

        //if (ShoppingCart.Instance.CouponId != "")
        //{
        //    obj.CouponId = ShoppingCart.Instance.CouponId;
        //}
        //else
        //{
        //    obj.CouponId = "0";
        //}


        //string res = obj.AddUpdateOrderMaster();


        //if (res.LastIndexOf("Successfully") > 0)
        //{
        //    //Record Saved Successfully,2
        //    string s1 = res.Substring((res.IndexOf(",") + 1));
        //    hdfOrderId.Value = Convert.ToString(res.Substring((res.IndexOf(",") + 1)));


        //    Session["OrderId"] = Convert.ToString(hdfOrderId.Value);


        //    SaveOrderItems();

        //    UpdateBuyerPaymentMode();
        //    DataTable dt = ShoppingCart.Instance.DtPrd;
        //    foreach (DataRow dr in dt.Rows)
        //    {

        //        ShoppingCart.Instance.RemoveItem(dr["PrdID"].ToString());
        //    }


        //    if (rbtnCashOnDelivery.SelectedValue == "Cash On Delivery")
        //    {
        //        OrderSumm.Visible = false;

        //        SuccessOrderSumm.Visible = true;

        //        lblOrderID.Text = DataAccess.GetSingleValue("select [OrderNumber] from [OrderMaster] where [OrderId]=" + hdfOrderId.Value + "");

        //    }


        //}
    }

    private void SendMailToAdmin()
    {
        // Get HTML Email Template data
        StringBuilder _EmailBody = new StringBuilder();




        //Replace Values into HTML Email Template data
        _EmailBody.Append("<h2>Order Details are given below</h2>");
        _EmailBody = _EmailBody.Append("OrderNo: " + ShoppingCart.Instance.InvoiceNo + "<br/>");
        _EmailBody = _EmailBody.Append("Payment By: " + ShoppingCart.Instance.PaymentModeName + "<br/>");
        _EmailBody.Append("<h4>Customer Details - </h4>");
        _EmailBody.Append(ShoppingCart.Instance.CustomerName + "<br/>" + ShoppingCart.Instance.Addr1 + "<br/>" + ShoppingCart.Instance.City + " - " + ShoppingCart.Instance.Pipcode + "<br/>" + ShoppingCart.Instance.CustomerContact);
        //_EmailBody = _EmailBody.Replace("<%CustAddrr%>", CustAddrr);

        //string DtPrd = string.Empty;
        _EmailBody.Append("<h4>Product Details - </h4>");
        _EmailBody.Append("<table width='100%' cellspacing='0' cellpadding='0' border='0' align='center' style='font-size:11px;'><tr><td style='background-color:#d2d3d5;width:20px'></td><td style='font-family:Arial,Helvetica,sans-serif;font-size:12px;line-height:18px;color:#6c6c6c;text-align:left;background-color:#d2d3d5;line-height:22px;padding-left:3px;font-weight:bold;width:240px'>Item Details</td><td style='font-family:Arial,Helvetica,sans-serif;font-size:12px;line-height:18px;color:#6c6c6c;text-align:left;background-color:#d2d3d5;line-height:22px;padding-left:3px;font-weight:bold;width:240px'>Size</td><td style='font-family:Arial,Helvetica,sans-serif;font-size:12px;line-height:18px;color:#6c6c6c;text-align:center;background-color:#d2d3d5;line-height:22px;padding-left:3px;font-weight:bold;width:30px'>Qty</td><td style='font-family:Arial,Helvetica,sans-serif;font-size:12px;line-height:18px;color:#6c6c6c;text-align:center;background-color:#d2d3d5;line-height:22px;padding-left:3px;font-weight:bold;width:70px'>Unit Price</td><td style='font-family:Arial,Helvetica,sans-serif;font-size:12px;line-height:18px;color:#6c6c6c;text-align:center;background-color:#d2d3d5;line-height:22px;padding-left:3px;font-weight:bold;width:70px'>Sub Total</td><td style='background-color:#d2d3d5;width:20px'></td></tr>");
        //DtPrd+="<tr><td width='250' colspan='7' style='border-bottom:1px dashed #cccccc;background:#ededed;color:#00000;padding:5px 20px;text-transform:uppercase'></td></tr>";
        _EmailBody.Append("<tr><td colspan='5' width='250' style='background:#ededed;color:#6c6c6c;padding:5px 20px;text-transform:uppercase'></td></tr>");
        DataTable dt = ShoppingCart.Instance.DtPrd;
        foreach (DataRow dr in dt.Rows)
        {
            _EmailBody.Append("<tr style='background-color:#ffffff;font-size:11px;font-family:arial;color:#6c6c6c;line-height:18px'><td style='background-color:#d2d3d5;width:20px'></td><td style='text-align:center;padding:3px 0 3px 3px'>" + dr["PrdName"].ToString() + "</td><td style='width:240px;padding:3px 0 3px 3px'>" + dr["PrdSize"].ToString() + "</td><td style='text-align:center;padding:3px 0 3px 3px;width:30px'>" + dr["Qnt"].ToString() + "</td><td style='text-align:center;width:70px;padding:3px 0 3px 3px'>" + dr["UnitPrice"].ToString() + "</td><td style='text-align:center;padding:3px 0 3px 3px;width:70px'>" + dr["PrdPriceTotal"].ToString() + "</td><td></td></tr>");

        }

        _EmailBody.Append("<tr style='background-color:#fff;font-weight:bold;color:#6c6c6c;font-family:arial'><td></td><td style='text-align:right;white-space:nowrap;line-height:26px;border-top:1px solid #cccccc' colspan='4'>Sub Total :</td><td style='text-align:left;padding-left:15px;border-top:1px solid #cccccc'>" + ShoppingCart.Instance.SubTotal + "</td><td></td></tr>");
        _EmailBody.Append("<tr style='background-color:#fff;font-weight:bold;color:#6c6c6c;font-family:arial'><td></td><td style='text-align:right;white-space:nowrap;line-height:26px;border-top:1px solid #cccccc' colspan='4'>Discount :</td><td style='text-align:left;padding-left:15px;border-top:1px solid #cccccc'>" + ShoppingCart.Instance.CouponDiscountAmt + "</td><td></td></tr>");
        _EmailBody.Append("<tr style='background-color:#fff;font-weight:bold;color:#6c6c6c;font-family:arial'><td></td><td style='text-align:right;white-space:nowrap;line-height:26px;border-top:1px solid #cccccc' colspan='4'>Shipping Charges :</td><td style='text-align:left;padding-left:15px;border-top:1px solid #cccccc'>" + ShoppingCart.Instance.ShipmentFee + "</td><td></td></tr>");
        _EmailBody.Append("<tr style='background-color:#fff;font-weight:bold;color:#6c6c6c;font-family:arial'><td></td><td style='text-align:right;white-space:nowrap;line-height:26px;border-top:1px solid #cccccc' colspan='4'>Eggless Price :</td><td style='text-align:left;padding-left:15px;border-top:1px solid #cccccc'>" + ShoppingCart.Instance.EgglessPrc + "</td><td></td></tr>");
        _EmailBody.Append("<tr style='background-color:#666;color:#fff;font-weight:bold;font-size:12px;font-family:arial'><td style='background-color:#fff'></td><td style='text-align:right;white-space:nowrap;line-height:26px;font-weight:bold' colspan='4'>Final Total</td><td style='text-align:left;padding-left:15px;white-space:nowrap;font-weight:bold'>" + ShoppingCart.Instance.GrandTotal + "</td><td style='background-color:#fff'></td></tr></table>");

        //_EmailBody = _EmailBody.Replace("<%prdTable%>", DtPrd);

        //Send EMail
        string from = ConfigurationManager.AppSettings["MailUsername"].ToString();
        string AdminMail = ConfigurationManager.AppSettings["AdminMailID"].ToString();
        string subject = "Order with kremykraft.com [Order No: " + ShoppingCart.Instance.InvoiceNo + "]";
        SendMail.SendWebEmail(from, AdminMail, subject, _EmailBody.ToString());
        //SendMail.SendEmail(from, txtEmail.Text, subject, _EmailBody);

    }
    private void SendMailToUser()
    {
        // Get HTML Email Template data
        StringBuilder _EmailBody = new StringBuilder();




        //Replace Values into HTML Email Template data
        _EmailBody.Append("<h2>Congratualation! You have successfully Placed Order</h2>");
        _EmailBody = _EmailBody.Append("OrderNo: " + ShoppingCart.Instance.InvoiceNo + "<br/>");
        _EmailBody = _EmailBody.Append("Payment By: " + ShoppingCart.Instance.PaymentModeName + "<br/>");
        _EmailBody.Append("<h4>Shipping Details - </h4>");
        _EmailBody.Append(ShoppingCart.Instance.CustomerName + "<br/>" + ShoppingCart.Instance.Addr1 + "<br/>" + ShoppingCart.Instance.City + " - " + ShoppingCart.Instance.Pipcode + "<br/>" + ShoppingCart.Instance.CustomerContact);
        //_EmailBody = _EmailBody.Replace("<%CustAddrr%>", CustAddrr);

        //string DtPrd = string.Empty;
        _EmailBody.Append("<h4>Product Details - </h4>");
        _EmailBody.Append("<table width='100%' cellspacing='0' cellpadding='0' border='0' align='center' style='font-size:11px;'><tr><td style='background-color:#d2d3d5;width:20px'></td><td style='font-family:Arial,Helvetica,sans-serif;font-size:12px;line-height:18px;color:#6c6c6c;text-align:left;background-color:#d2d3d5;line-height:22px;padding-left:3px;font-weight:bold;width:240px'>Item Details</td><td style='font-family:Arial,Helvetica,sans-serif;font-size:12px;line-height:18px;color:#6c6c6c;text-align:left;background-color:#d2d3d5;line-height:22px;padding-left:3px;font-weight:bold;width:240px'>Size</td><td style='font-family:Arial,Helvetica,sans-serif;font-size:12px;line-height:18px;color:#6c6c6c;text-align:center;background-color:#d2d3d5;line-height:22px;padding-left:3px;font-weight:bold;width:30px'>Qty</td><td style='font-family:Arial,Helvetica,sans-serif;font-size:12px;line-height:18px;color:#6c6c6c;text-align:center;background-color:#d2d3d5;line-height:22px;padding-left:3px;font-weight:bold;width:70px'>Unit Price</td><td style='font-family:Arial,Helvetica,sans-serif;font-size:12px;line-height:18px;color:#6c6c6c;text-align:center;background-color:#d2d3d5;line-height:22px;padding-left:3px;font-weight:bold;width:70px'>Sub Total</td><td style='background-color:#d2d3d5;width:20px'></td></tr>");
        //DtPrd+="<tr><td width='250' colspan='7' style='border-bottom:1px dashed #cccccc;background:#ededed;color:#00000;padding:5px 20px;text-transform:uppercase'></td></tr>";
        _EmailBody.Append("<tr><td colspan='5' width='250' style='background:#ededed;color:#6c6c6c;padding:5px 20px;text-transform:uppercase'></td></tr>");
        DataTable dt = ShoppingCart.Instance.DtPrd;
        foreach (DataRow dr in dt.Rows)
        {
            _EmailBody.Append("<tr style='background-color:#ffffff;font-size:11px;font-family:arial;color:#6c6c6c;line-height:18px'><td style='background-color:#d2d3d5;width:20px'></td><td style='text-align:center;padding:3px 0 3px 3px'>" + dr["PrdName"].ToString() + "</td><td style='width:240px;padding:3px 0 3px 3px'>" + dr["PrdSize"].ToString() + "</td><td style='text-align:center;padding:3px 0 3px 3px;width:30px'>" + dr["Qnt"].ToString() + "</td><td style='text-align:center;width:70px;padding:3px 0 3px 3px'>" + dr["UnitPrice"].ToString() + "</td><td style='text-align:center;padding:3px 0 3px 3px;width:70px'>" + dr["PrdPriceTotal"].ToString() + "</td><td></td></tr>");

        }

        _EmailBody.Append("<tr style='background-color:#fff;font-weight:bold;color:#6c6c6c;font-family:arial'><td></td><td style='text-align:right;white-space:nowrap;line-height:26px;border-top:1px solid #cccccc' colspan='4'>Sub Total :</td><td style='text-align:left;padding-left:15px;border-top:1px solid #cccccc'>" + ShoppingCart.Instance.SubTotal + "</td><td></td></tr>");
        _EmailBody.Append("<tr style='background-color:#fff;font-weight:bold;color:#6c6c6c;font-family:arial'><td></td><td style='text-align:right;white-space:nowrap;line-height:26px;border-top:1px solid #cccccc' colspan='4'>Discount :</td><td style='text-align:left;padding-left:15px;border-top:1px solid #cccccc'>" + ShoppingCart.Instance.CouponDiscountAmt + "</td><td></td></tr>");
        _EmailBody.Append("<tr style='background-color:#fff;font-weight:bold;color:#6c6c6c;font-family:arial'><td></td><td style='text-align:right;white-space:nowrap;line-height:26px;border-top:1px solid #cccccc' colspan='4'>Shipping Charges :</td><td style='text-align:left;padding-left:15px;border-top:1px solid #cccccc'>" + ShoppingCart.Instance.ShipmentFee + "</td><td></td></tr>");
        _EmailBody.Append("<tr style='background-color:#fff;font-weight:bold;color:#6c6c6c;font-family:arial'><td></td><td style='text-align:right;white-space:nowrap;line-height:26px;border-top:1px solid #cccccc' colspan='4'>Eggless Price :</td><td style='text-align:left;padding-left:15px;border-top:1px solid #cccccc'>" + ShoppingCart.Instance.EgglessPrc + "</td><td></td></tr>");
        _EmailBody.Append("<tr style='background-color:#666;color:#fff;font-weight:bold;font-size:12px;font-family:arial'><td style='background-color:#fff'></td><td style='text-align:right;white-space:nowrap;line-height:26px;font-weight:bold' colspan='4'>Final Total</td><td style='text-align:left;padding-left:15px;white-space:nowrap;font-weight:bold'>" + ShoppingCart.Instance.GrandTotal + "</td><td style='background-color:#fff'></td></tr></table>");

        //_EmailBody = _EmailBody.Replace("<%prdTable%>", DtPrd);

        //Send EMail
        string from = ConfigurationManager.AppSettings["MailUsername"].ToString();
        string UserMail = ShoppingCart.Instance.CustomerEmail;
        string subject = "Order with kremykraft.com [Order No: " + ShoppingCart.Instance.InvoiceNo + "]";
        SendMail.SendWebEmail(from, UserMail, subject, _EmailBody.ToString());
        //SendMail.SendEmail(from, txtEmail.Text, subject, _EmailBody);

    }
    public void SaveOrderItems()
    {
        DataTable dt = ShoppingCart.Instance.DtPrd;
        if (dt != null && dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO [ecom_OrderDetails]([OrderID],[ProductID],[ProductName],[ProductQnt],[ProductAmount],[IsActive],[CreatedOn],[UnitPrice],[PrdSize],[OfferPrice],[OfferPerc],[ProductMrpAmount],[IsEggless],[EgglessPrice])VALUES(@OrderID,@ProductID,@ProductName,@ProductQnt,@ProductAmount,@IsActive,@CreatedOn,@UnitPrice,@PrdSize,@OfferPrice,@OfferPerc,@ProductMrpAmount,@IsEggless,@EgglessPrice)");
                cmd.Parameters.AddWithValue("@OrderID", hdfOrderId.Value);
                cmd.Parameters.AddWithValue("@ProductID", Convert.ToInt32(dt.Rows[i]["PrdID"]));
                cmd.Parameters.AddWithValue("@ProductName", Convert.ToString(dt.Rows[i]["PrdName"]));
                cmd.Parameters.AddWithValue("@ProductQnt", Convert.ToInt32(dt.Rows[i]["Qnt"]));
                cmd.Parameters.AddWithValue("@ProductAmount", Convert.ToDecimal(dt.Rows[i]["PrdPriceTotal"]));
                cmd.Parameters.AddWithValue("@IsActive", true);
                cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
                cmd.Parameters.AddWithValue("@UnitPrice", Convert.ToDecimal(dt.Rows[i]["UnitPrice"]));
                cmd.Parameters.AddWithValue("@PrdSize", Convert.ToString(dt.Rows[i]["prdSize"]));
                if (dt.Rows[i]["offrPrice"].ToString() != string.Empty)
                {
                    cmd.Parameters.AddWithValue("@OfferPrice", Convert.ToString(dt.Rows[i]["offrPrice"]));
                }
                else
                {
                    cmd.Parameters.AddWithValue("@OfferPrice", "0");
                }
                if (dt.Rows[i]["offrPercentage"].ToString() != string.Empty)
                {
                    cmd.Parameters.AddWithValue("@OfferPerc", Convert.ToString(dt.Rows[i]["offrPercentage"]));
                }
                else
                {
                    cmd.Parameters.AddWithValue("@OfferPerc", "0");
                }
                if (dt.Rows[i]["PrdMrp"].ToString() != string.Empty)
                {
                    cmd.Parameters.AddWithValue("@ProductMrpAmount", Convert.ToDecimal(dt.Rows[i]["PrdMrp"]));
                }
                else
                {
                    cmd.Parameters.AddWithValue("@ProductMrpAmount", "0");
                }
                cmd.Parameters.AddWithValue("@IsEggless","");
                //if (dt.Rows[i]["eglessPrc"].ToString() != string.Empty)
                //{
                //    cmd.Parameters.AddWithValue("@EgglessPrice", dt.Rows[i]["eglessPrc"].ToString());
                //}
                //else
                //{
                    cmd.Parameters.AddWithValue("@EgglessPrice", "0");
                //}


                DataAccess.InsertExecuteNonQuery(cmd);



                //OrderMasterBusiness obj = new OrderMasterBusiness();
                //obj.OrderDetailID = Convert.ToInt32(hdfOrderdetailsId.Value);
                //obj.OrderNumber = Convert.ToString(hdfOrderId.Value);
                //obj.ProductID = Convert.ToInt32(dt.Rows[i]["PrdID"]);
                //Session["ProductId"] = Convert.ToString(dt.Rows[i]["PrdID"]);
                //obj.ProductName = Convert.ToString(dt.Rows[i]["PrdName"]);
                //obj.ProductQnt = Convert.ToInt32(dt.Rows[i]["Qnt"]);
                //obj.ProductAmount = Convert.ToDecimal(dt.Rows[i]["PrdPriceTotal"]);
                //obj.IsActive = true;
                //obj.IsDeleted = false;
                //obj.Created_On = utility.getCurrentDateTime();
                //obj.Modified_On = utility.getCurrentDateTime();
                //obj.PrdColor = Convert.ToString(dt.Rows[i]["PrdColor"]);
                //obj.PrdSize = Convert.ToString(dt.Rows[i]["sizeName"]);
                //obj.PrdCustImgID = string.Empty;
                //obj.sizeId = Convert.ToInt32(dt.Rows[i]["prdSizeId"]);
                //obj.selImage = Convert.ToString(dt.Rows[i]["selectedImg"]);

                //if (Convert.ToString(dt.Rows[i]["offrPrice"]) != string.Empty)
                //{
                //    obj.PrdOffrPrice = Convert.ToString(dt.Rows[i]["offrPrice"]);
                //}
                //else
                //{
                //    obj.PrdOffrPrice = "0";
                //}

                //if (Convert.ToString(dt.Rows[i]["offrPercentage"]) != string.Empty)
                //{

                //    obj.PrdOffrPercntg = Convert.ToString(dt.Rows[i]["offrPercentage"]);
                //}
                //else
                //{
                //    obj.PrdOffrPercntg = "0";
                //}
                //obj.PrdUnitPrice = Convert.ToDecimal(dt.Rows[i]["UnitPrice"]);
                //obj.PrdMrpPrc = Convert.ToDecimal(dt.Rows[i]["PrdMrp"]);
                //string res = obj.AddUpdateOrderDetails();
                //UpdateProductStock(Convert.ToInt32(dt.Rows[i]["PrdID"]), Convert.ToInt32(dt.Rows[i]["Qnt"]));
            }
        }
    }

    protected void btnSumit_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "Cash On Delivery")
        {
            ShoppingCart.Instance.PaymentModeName = "Cash On Delivery";
            ShoppingCart.Instance.TransactionID = Generatetxnid();
            ShoppingCart.Instance.InvoiceNo = GetNewID();


            SaveOrderDetails();
        }
        else
        {
            ShoppingCart.Instance.PaymentModeName = "Online Payment";
            ShoppingCart.Instance.TransactionID = Generatetxnid();
            ShoppingCart.Instance.InvoiceNo = GetNewID();
            saveTempOrder();
            //BindPaymentGateway();
        }
    }
    private void saveTempOrder()
    {
        SqlCommand cmd = new SqlCommand("INSERT INTO [TempOrderMaster]([OrderNumber],[BuyerId],[BuyerName],[BuyerAddress1],[BuyerAddress2],[BuyerMobileNo],[BuyerCountry],[BuyerState],[BuyerCity],[DelPincode],[BuyerEmail],[OrderDate],[OrderAmount],[DiscountAmount],[Total_Amnt],[TransactionID],[PaymentBy],[ShipmentFee],[IsActive],[Created_On],[OrderStatus],[PaymentMode],[OrderFinalStatus],[UserRemark],[CouponDiscAmt],[CouponDiscPerc],[PaymentStatus],[DeliveryDate],[DeliveryTime],[EgglessPrc])VALUES(@OrderNumber,@BuyerId,@BuyerName,@BuyerAddress1,@BuyerAddress2,@BuyerMobileNo,@BuyerCountry,@BuyerState,@BuyerCity,@DelPincode,@BuyerEmail,@OrderDate,@OrderAmount,@DiscountAmount,@Total_Amnt,@TransactionID,@PaymentBy,@ShipmentFee,@IsActive,@Created_On,@OrderStatus,@PaymentMode,@OrderFinalStatus,@UserRemark,@CouponDiscAmt,@CouponDiscPerc,@PaymentStatus,@DeliveryDate,@DeliveryTime,@EgglessPrc);select scope_identity();");
        cmd.Parameters.AddWithValue("@OrderNumber", ShoppingCart.Instance.InvoiceNo);
        cmd.Parameters.AddWithValue("@BuyerId", ShoppingCart.Instance.CustomerID);
        cmd.Parameters.AddWithValue("@BuyerName", ShoppingCart.Instance.CustomerName);
        cmd.Parameters.AddWithValue("@BuyerAddress1", ShoppingCart.Instance.Addr1);
        cmd.Parameters.AddWithValue("@BuyerAddress2", ShoppingCart.Instance.Addr2);
        cmd.Parameters.AddWithValue("@BuyerMobileNo", ShoppingCart.Instance.CustomerContact);
        cmd.Parameters.AddWithValue("@BuyerCountry", ShoppingCart.Instance.Country);
        cmd.Parameters.AddWithValue("@BuyerState", ShoppingCart.Instance.State);
        cmd.Parameters.AddWithValue("@BuyerCity", ShoppingCart.Instance.City);
        cmd.Parameters.AddWithValue("@DelPincode", ShoppingCart.Instance.DelPinCode);
        cmd.Parameters.AddWithValue("@BuyerEmail", ShoppingCart.Instance.CustomerEmail);
        cmd.Parameters.AddWithValue("@OrderDate", DateTime.Now);
        cmd.Parameters.AddWithValue("@OrderAmount", ShoppingCart.Instance.SubTotal);
        cmd.Parameters.AddWithValue("@DiscountAmount", "0");
        cmd.Parameters.AddWithValue("@Total_Amnt", ShoppingCart.Instance.GrandTotal);
        cmd.Parameters.AddWithValue("@TransactionID", ShoppingCart.Instance.TransactionID);
        cmd.Parameters.AddWithValue("@PaymentBy", ShoppingCart.Instance.PaymentModeName);
        if (ShoppingCart.Instance.ShipmentFee != string.Empty)
        {
            cmd.Parameters.AddWithValue("@ShipmentFee", ShoppingCart.Instance.ShipmentFee);
        }
        else
        {
            cmd.Parameters.AddWithValue("@ShipmentFee", "0");
        }

        cmd.Parameters.AddWithValue("@IsActive", true);
        cmd.Parameters.AddWithValue("@Created_On", DateTime.Now);
        cmd.Parameters.AddWithValue("@OrderStatus", "Pending");
        cmd.Parameters.AddWithValue("@PaymentMode", string.Empty);
        cmd.Parameters.AddWithValue("@OrderFinalStatus", "Pending");
        cmd.Parameters.AddWithValue("@UserRemark", "");
        if (ShoppingCart.Instance.CouponDiscountAmt != string.Empty)
        {
            cmd.Parameters.AddWithValue("@CouponDiscAmt", ShoppingCart.Instance.CouponDiscountAmt);
        }
        else
        {
            cmd.Parameters.AddWithValue("@CouponDiscAmt", "0");
        }
        if (ShoppingCart.Instance.CouponDiscountPer != string.Empty)
        {
            cmd.Parameters.AddWithValue("@CouponDiscPerc", ShoppingCart.Instance.CouponDiscountPer);
        }
        else
        {
            cmd.Parameters.AddWithValue("@CouponDiscPerc", "0");
        }

        cmd.Parameters.AddWithValue("@PaymentStatus", "UnPaid");
        if (ShoppingCart.Instance.DelDate != string.Empty)
        {
            cmd.Parameters.AddWithValue("@DeliveryDate", ShoppingCart.Instance.DelDate.ToDateFormat());
        }
        else
        {
            cmd.Parameters.AddWithValue("@DeliveryDate", DBNull.Value);
        }

        cmd.Parameters.AddWithValue("@DeliveryTime", ShoppingCart.Instance.DelTime);
        if (ShoppingCart.Instance.EgglessPrc != string.Empty)
        {
            cmd.Parameters.AddWithValue("@EgglessPrc", ShoppingCart.Instance.EgglessPrc);
        }
        else
        {
            cmd.Parameters.AddWithValue("@EgglessPrc", "0");
        }

        string orderMasterID = DataAccess.InsertExecuteScalar(cmd);
        if (orderMasterID != string.Empty)
        {
            hdfOrderId.Value = orderMasterID;
            //Session["OrderId"] = Convert.ToString(hdfOrderId.Value);
            saveOrderIteminTemp();



        }

    }
    private void saveOrderIteminTemp()
    {
        DataTable dt = ShoppingCart.Instance.DtPrd;
        if (dt != null && dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO [TempOrderDetails]([OrderID],[ProductID],[ProductName],[ProductQnt],[ProductAmount],[IsActive],[CreatedOn],[UnitPrice],[PrdSize],[OfferPrice],[OfferPerc],[ProductMrpAmount],[IsEggless],[EgglessPrice])VALUES(@OrderID,@ProductID,@ProductName,@ProductQnt,@ProductAmount,@IsActive,@CreatedOn,@UnitPrice,@PrdSize,@OfferPrice,@OfferPerc,@ProductMrpAmount,@IsEggless,@EgglessPrice)");
                cmd.Parameters.AddWithValue("@OrderID", hdfOrderId.Value);
                cmd.Parameters.AddWithValue("@ProductID", Convert.ToInt32(dt.Rows[i]["PrdID"]));
                cmd.Parameters.AddWithValue("@ProductName", Convert.ToString(dt.Rows[i]["PrdName"]));
                cmd.Parameters.AddWithValue("@ProductQnt", Convert.ToInt32(dt.Rows[i]["Qnt"]));
                cmd.Parameters.AddWithValue("@ProductAmount", Convert.ToDecimal(dt.Rows[i]["PrdPriceTotal"]));
                cmd.Parameters.AddWithValue("@IsActive", true);
                cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
                cmd.Parameters.AddWithValue("@UnitPrice", Convert.ToDecimal(dt.Rows[i]["UnitPrice"]));
                cmd.Parameters.AddWithValue("@PrdSize", Convert.ToString(dt.Rows[i]["prdSize"]));
                if (dt.Rows[i]["offrPrice"].ToString() != string.Empty)
                {
                    cmd.Parameters.AddWithValue("@OfferPrice", Convert.ToString(dt.Rows[i]["offrPrice"]));
                }
                else
                {
                    cmd.Parameters.AddWithValue("@OfferPrice", "0");
                }
                if (dt.Rows[i]["offrPercentage"].ToString() != string.Empty)
                {
                    cmd.Parameters.AddWithValue("@OfferPerc", Convert.ToString(dt.Rows[i]["offrPercentage"]));
                }
                else
                {
                    cmd.Parameters.AddWithValue("@OfferPerc", "0");
                }
                if (dt.Rows[i]["PrdMrp"].ToString() != string.Empty)
                {
                    cmd.Parameters.AddWithValue("@ProductMrpAmount", Convert.ToDecimal(dt.Rows[i]["PrdMrp"]));
                }
                else
                {
                    cmd.Parameters.AddWithValue("@ProductMrpAmount", "0");
                }
                cmd.Parameters.AddWithValue("@IsEggless", "");
                
                    cmd.Parameters.AddWithValue("@EgglessPrice", "0");
                


                DataAccess.InsertExecuteNonQuery(cmd);

            }
        }
    }
}