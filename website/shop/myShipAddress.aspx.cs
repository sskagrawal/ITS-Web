using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class shop_myShipAddress : System.Web.UI.Page
{
    public DataTable dtShipAddr;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            
            if (Session["partyid"]!=null)
            {
                bindState();
                hdfPartyId.Value = Session["partyid"].ToString();
                
                bindShippingAddress();
            }
            else
            {
                Session["urrr"] = "~/shop/myShipAddress.aspx";
                Response.Redirect("~/Admin/Login.aspx");
            }

        }
    }
    private DataTable bindShippingAddress()
    {
        dtShipAddr = DataAccess.GetData("select * from [ecom_buyerShippingAddress] where [BuyerId]=" + hdfPartyId.Value + " order by [BuyerShippingId] desc");
        if(dtShipAddr.Rows.Count>0)
        {
            txtName.Value = dtShipAddr.Rows[0]["name"].ToString();
            txtMob.Value= dtShipAddr.Rows[0]["mobNo"].ToString();
            if(dtShipAddr.Rows[0]["statename"].ToString()!=string.Empty)
            {
                ddlState.SelectedItem.Text = dtShipAddr.Rows[0]["statename"].ToString();
            }
            
            txtCity.Value= dtShipAddr.Rows[0]["cityname"].ToString();
            txtPincode.Value= dtShipAddr.Rows[0]["pincode"].ToString();
            txtAddr.Value= dtShipAddr.Rows[0]["address"].ToString();
            hdfShipAddrId.Value = dtShipAddr.Rows[0]["BuyerShippingId"].ToString();
            DataTable dt = DataAccess.GetData("select * from [PartyMaster] where [PartyID]=" + hdfPartyId.Value + "");
            if (dt.Rows.Count > 0)
            {
                hdfEmail.Value = dt.Rows[0]["Email"].ToString();
            }
        }
        else
        {
            DataTable dt = DataAccess.GetData("select * from [PartyMaster] where [PartyID]=" + hdfPartyId.Value + "");
            if(dt.Rows.Count>0)
            {
                txtName.Value = dt.Rows[0]["Contact_person_name"].ToString();
                txtMob.Value = dt.Rows[0]["mobile_no"].ToString();
                ddlState.SelectedValue = dt.Rows[0]["state"].ToString();
                txtCity.Value = dt.Rows[0]["City"].ToString();
                txtPincode.Value = dt.Rows[0]["pincode"].ToString();
                txtAddr.Value = dt.Rows[0]["address"].ToString();
                hdfEmail.Value= dt.Rows[0]["Email"].ToString();
                //hdfShipAddrId.Value = dt.Rows[0]["BuyerShippingId"].ToString();
            }
        }
        return dtShipAddr;
    }
    public void bindState()
    {
        ListItem item = new ListItem();
        item.Value = "";
        item.Text = "Select State";
        ddlState.Items.Add(item);
        DataTable dt = DataAccess.GetData("SELECT  * FROM [StateMaster] Where [Country_Id]=101 ");
        foreach (DataRow row in dt.Rows)
        {
            ListItem item1 = new ListItem();
            item1.Value = row["State_Id"].ToString();
            item1.Text = row["State_Name"].ToString();
            ddlState.Items.Add(item1);
        }
        ddlState.SelectedValue = "1640";

    }

    protected void btnUpdCont_Click(object sender, EventArgs e)
    {
        if(hdfShipAddrId.Value==string.Empty)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [ecom_buyerShippingAddress]([BuyerId],[name],[mobNo],[pincode],[address],[statename],[cityname],[isDefaultAddr],[createdOn])VALUES(@BuyerId,@name,@mobNo,@pincode,@address,@statename,@cityname,@isDefaultAddr,@createdOn)");
            cmd.Parameters.AddWithValue("@BuyerId",hdfPartyId.Value);
            cmd.Parameters.AddWithValue("@name",txtName.Value);
            cmd.Parameters.AddWithValue("@mobNo",txtMob.Value);
            cmd.Parameters.AddWithValue("@pincode",txtPincode.Value);
            cmd.Parameters.AddWithValue("@address",txtAddr.Value);
            cmd.Parameters.AddWithValue("@statename",ddlState.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@cityname",txtCity.Value);
            cmd.Parameters.AddWithValue("@isDefaultAddr",chkDefAddr.Checked);
            cmd.Parameters.AddWithValue("@createdOn",DateTime.Now);
            DataAccess.InsertExecuteNonQuery(cmd);
        }
        else
        {
            SqlCommand cmd = new SqlCommand("update [ecom_buyerShippingAddress] set [name]=@name,[mobNo]=@mobNo,[pincode]=@pincode,[address]=@address,[statename]=@statename,[cityname]=@cityname,[isDefaultAddr]=@isDefaultAddr where [BuyerShippingId]=@BuyerShippingId");
            //cmd.Parameters.AddWithValue("@BuyerId", hdfPartyId.Value);
            cmd.Parameters.AddWithValue("@name", txtName.Value);
            cmd.Parameters.AddWithValue("@mobNo", txtMob.Value);
            cmd.Parameters.AddWithValue("@pincode", txtPincode.Value);
            cmd.Parameters.AddWithValue("@address", txtAddr.Value);
            cmd.Parameters.AddWithValue("@statename", ddlState.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@cityname", txtCity.Value);
            cmd.Parameters.AddWithValue("@isDefaultAddr", chkDefAddr.Checked);
            cmd.Parameters.AddWithValue("@BuyerShippingId", DateTime.Now);
            DataAccess.InsertExecuteNonQuery(cmd);
        }
        SaveInformationInShoppingCart();

    }
    public void SaveInformationInShoppingCart()
    {
        ShoppingCart.Instance.CustomerID = hdfPartyId.Value;
        ShoppingCart.Instance.CustomerName = txtName.Value;
        ShoppingCart.Instance.CustomerEmail = hdfEmail.Value;
        ShoppingCart.Instance.PersonTitle = "0";
        ShoppingCart.Instance.FirstName = txtName.Value;
        ShoppingCart.Instance.CustomerContact = txtMob.Value;
        ShoppingCart.Instance.Addr1 = txtAddr.Value;
        ShoppingCart.Instance.Addr2 = string.Empty;
        ShoppingCart.Instance.State = ddlState.SelectedItem.Text;
        ShoppingCart.Instance.Country = "India";
        ShoppingCart.Instance.City = txtCity.Value;
        ShoppingCart.Instance.Pipcode = txtPincode.Value;
        Response.Redirect("OrderSummary.aspx");
    }
    protected void btnCont_Click(object sender, EventArgs e)
    {
        SaveInformationInShoppingCart();

    }
}