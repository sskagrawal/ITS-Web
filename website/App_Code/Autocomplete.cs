using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;
using System.Net;

/// <summary>
/// Summary description for Autocomplete
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class Autocomplete : System.Web.Services.WebService {

    public Autocomplete () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }

    [WebMethod(EnableSession = true)]
    public void Item_Add_To_Cart(string PrdID, string Qnt, string offrPrc, string offrprcntg, string PrdColor, string PrdSize, string SellPrc, string MrpPrc, string isEgLess, string egglessPrc)
    {
        ShoppingCart.Instance.AddItem(PrdID, Qnt, PrdColor, PrdSize, offrPrc, offrprcntg, SellPrc, MrpPrc, isEgLess, egglessPrc);
    }

    //[WebMethod(EnableSession = true)]
    //public void Item_Add_To_Cart(string PrdID, string Qnt, string PrdColor, string PrdSize, string offrPrc, string offrprcntg)
    //{
    //    ShoppingCart.Instance.AddItem(PrdID, Qnt, PrdColor, PrdSize, offrPrc, offrprcntg);
    //}

    //------------- Add To Wish LIst
    //[WebMethod(EnableSession = true)]
    //public void Item_Add_To_WishList(string PrdID)
    //{
    //    WishList.WishListInstance.AddItemToWishList(PrdID);
    //}
    //-----------------

    [WebMethod(EnableSession = true)]
    public int ShopCartItem()
    {
        return ShoppingCart.Instance.Qty;
        //return 0;
    }

    //[WebMethod(EnableSession = true)]
    //public int WishListItem()
    //{
    //    return WishList.WishListInstance.WishQty;
    //    //return 0;
    //}

    [WebMethod(EnableSession = true)]
    public string FillShopCart()
    {
        DataTable dt = ShoppingCart.Instance.GetData1();
        return JsonConvert.SerializeObject(dt);
        //return "";
    }
    [WebMethod(EnableSession = true)]
    public void DeleteShopCartItem(string PrdID)
    {
        ShoppingCart.Instance.RemoveItem(PrdID);
    }

    //[WebMethod(EnableSession = true)]
    //public void DeleteWishlistItem(string PrdID)
    //{
    //    //WishList.WishListInstance.RemoveItem(PrdID);
    //}

    [WebMethod(EnableSession = true)]
    public void UpdateItemQnt(string PrdID, string Qnt)
    {
        ShoppingCart.Instance.UpdateItemQnt(PrdID, Qnt);
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public List<Party> GetDetail(string pre, string partytp)
    {
        List<Party> allPrd = new List<Party>();
        //List<PartyDetails> AllParty = new List<PartyDetails>();

        DataTable dtParty = DataAccess.GetData("select * from [PartyMaster] where Party_name like '%" + pre + "%' and Party_Type = '" + partytp + "'"); //
         if (dtParty.Rows.Count > 0)
        {
            foreach (DataRow dr in dtParty.Rows)
            {
                //if (dr["CategoryId"].ToString() != string.Empty)
                //{ 
                //    string catName = DataAccess.GetSingleValue("select * from [CategoryMaster] where [CategoeyId]=" + dr["CategoryId"].ToString() + "");
                //}
                //PartyDetails objParty = new PartyDetails();
                //objParty.Address = dr["address"].ToString();
                //objParty.City = dr["City"].ToString();
                //objParty.State = dr["State_Name"].ToString();
                //objParty.mobileno = dr["mobile_no"].ToString();

                Party objPraty = new Party();

                objPraty.partyID = dr["PartyID"].ToString();
                objPraty.PartyName = dr["Party_name"].ToString();
                objPraty.Address = dr["address"].ToString();
                objPraty.MobNo = dr["mobile_no"].ToString();
                objPraty.EmailID = dr["Email"].ToString();
                objPraty.partyTPID = dr["Party_Type"].ToString();
                //objPraty.mobileno = dr["mobile_no"].ToString();

                //string NavUrl = string.Concat("http://", HttpContext.Current.Request.Url.Authority, HttpContext.Current.Response.ApplyAppPathModifier("~/ViewCategoryProduct.aspx?CCId=" + dr["ChildCategoryId"].ToString() + ""));
                ////"~/ViewCategoryProduct.aspx?CCId=" + dr["ChildCategoryId"].ToString();
                //objPrdBuss.SearchRedirect = NavUrl;
                //objPrdBuss.SearchFocus = dr["ChildCategoryName"].ToString();

                //objPrdBuss.SearchResult = "<a href='" + NavUrl + "'>" + dr["ChildCategoryName"].ToString() + " - <span style='font-size:9px;color:grey'>Category</span></a>";
               // AllParty.Add(objParty);
                allPrd.Add(objPraty);
            }

        }
        return allPrd.ToList();
        //return AllParty.ToList();
    }
    //[WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    //public static List<ProposalRating> Rate(string iPId, string iUserRating)
    //{
    //    List<ProposalRating> BooksRatings = new List<ProposalRating>();
    //    try
    //    {
    //        SqlCommand cmd = new SqlCommand("update [Proposal_Master] set [FeedbackRating]=@FeedbackRating where [Proposal_Id]=@Proposal_Id");
    //        cmd.Parameters.AddWithValue("@FeedbackRating", iUserRating);
    //        // cmd.Parameters.AddWithValue("@FeedackDesc", DBNull.Value);
    //        cmd.Parameters.AddWithValue("@Proposal_Id", iPId);
    //        DataAccess.InsertExecuteNonQuery(cmd);


    //        string sQuery = "SELECT COUNT(FeedbackRating) TotalRatings, " +
    //            "ISNULL(CAST(CAST(SUM(FeedbackRating) AS NUMERIC(5,2)) / COUNT(FeedbackRating) AS NUMERIC(3,1)), 0) AverageRate " +
    //            "FROM [Proposal_Master] " + "WHERE Proposal_Id = " + iPId;

    //        DataTable dt = DataAccess.GetData(sQuery);
    //        if (dt.Rows.Count > 0)
    //        {
    //            BooksRatings.Add(new ProposalRating
    //            {
    //                TotalRatings = Convert.ToInt32(dt.Rows[0]["TotalRatings"]),
    //                AvgRatings = Convert.ToDouble(dt.Rows[0]["AverageRate"])
    //            });
    //        }
    //    }
    //    catch (Exception ex)
    //    {

    //    }
    //    return BooksRatings;
    //    //string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    //    //using (SqlConnection con = new SqlConnection(constr))
    //    //{
    //    //    using (SqlCommand cmd = new SqlCommand("INSERT INTO UserRatings VALUES(@Rating)"))
    //    //    {
    //    //        using (SqlDataAdapter sda = new SqlDataAdapter())
    //    //        {
    //    //            cmd.CommandType = CommandType.Text;
    //    //            cmd.Parameters.AddWithValue("@Rating", rating);
    //    //            cmd.Connection = con;
    //    //            con.Open();
    //    //            cmd.ExecuteNonQuery();
    //    //            con.Close();
    //    //        }
    //    //    }
    //    //}
    //}
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void test()
    {

    }
    [WebMethod(EnableSession = true)]
    public void SaveCalltoAction(string mno, string prtid)
    {
        string hostName = Dns.GetHostName(); // Retrive the Name of HOST  

        // Get the IP  
        string myIP = Dns.GetHostByName(hostName).AddressList[0].ToString();

        SqlCommand cmd = new SqlCommand("INSERT INTO [HireEmployeeCalltoAction]([PartyId],[MobileNo],[AddedOn],[IpAddresss])values(@PartyId,@MobileNo,@AddedOn,@IpAddresss)");
        cmd.Parameters.AddWithValue("@PartyId", prtid);
        cmd.Parameters.AddWithValue("@MobileNo", mno);
        cmd.Parameters.AddWithValue("@AddedOn", DateTime.Now);
        cmd.Parameters.AddWithValue("@IpAddresss", myIP);
        DataAccess.InsertExecuteNonQuery(cmd);
    }



    [WebMethod(EnableSession = true)]
    public void SaveCalltoAction1(string mno, string jobid)
    {
        string hostName = Dns.GetHostName(); // Retrive the Name of HOST  

        // Get the IP  
        string myIP = Dns.GetHostByName(hostName).AddressList[0].ToString();

        SqlCommand cmd = new SqlCommand("INSERT INTO [FindJobCalltoAction]([JobId],[MobileNo],[AddedOn],[IpAddresss])values(@JobId,@MobileNo,@AddedOn,@IpAddresss)");
        cmd.Parameters.AddWithValue("@JobId", jobid);
        cmd.Parameters.AddWithValue("@MobileNo", mno);
        cmd.Parameters.AddWithValue("@AddedOn", DateTime.Now);
        cmd.Parameters.AddWithValue("@IpAddresss", myIP);
        DataAccess.InsertExecuteNonQuery(cmd);
    }



    //[WebMethod]
    //public void delPincode(string pId)
    //{
    //    SqlCommand cmd = new SqlCommand("delete from [VendorPincode] where [VendorPincodeId]=" + pId + "");
    //    DataAccess.InsertExecuteNonQuery(cmd);
    //}
    //[WebMethod]
    //public string bindPincode(string vId)
    //{
    //    DataTable dt = DataAccess.GetData("select distinct [Pincode],VendorPincodeId from [VendorPincode] where [VendorId]=" + vId + "");
    //    return JsonConvert.SerializeObject(dt);
    //}



    [WebMethod]
    public string bindskill(string vId)
    {
        //Select distinct[Skill_Name] from[View_Post_Job_Skill] Where[PartyID] = " + hdfClientId.Value + "
        DataTable dt = DataAccess.GetData("Select distinct [Skill_Name] ,[Post_JobSkill_Id] from [View_Post_Job_Skill] Where [PartyID]=" + vId + " ");
        return JsonConvert.SerializeObject(dt);
    }


    [WebMethod]
    public string delskill(string vId)
    {
        //Select distinct[Skill_Name] from[View_Post_Job_Skill] Where[PartyID] = " + hdfClientId.Value + "
        DataTable dt = DataAccess.GetData("delete from [View_Post_Job_Skill] Where [Post_JobSkill_Id]=" + vId + " ");
        return JsonConvert.SerializeObject(dt);
    }





    [WebMethod]
    public void delkeyword(string pId)
    {
        SqlCommand cmd = new SqlCommand("delete from [Job_Keyword] where [Job_keywrd_Id]=" + pId + "");
        DataAccess.InsertExecuteNonQuery(cmd);
    }
    [WebMethod]
    public string bindkeyword(string vId)
    {
        // DataTable dt = DataAccess.GetData("Select Distinct * from [Keyword_Master] where [JobCat_Id]=" + ddlBusinessCat.SelectedValue + "");
        DataTable dt = DataAccess.GetData("Select distinct [Keyword],Job_keywrd_Id from [View_Job_Keyword_Master] Where [PartyID]=" + vId + " ");
        return JsonConvert.SerializeObject(dt);
    }


}
