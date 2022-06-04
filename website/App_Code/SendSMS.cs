using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;


/// <summary>
/// Summary description for SendSMS
/// </summary>
public static class SendSMS
{
    static SendSMS()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static void ProcessSMS(string MobNo, string Msg, string TemplateId)
    {

        try
        {
            string getUri = string.Empty;

            getUri = @"http://mysms.itsgwalior.in/http-tokenkeyapi.php?authentic-key=32384d756b693130301613480491&senderid=ITSGWL&route=2&number=" + MobNo + "&message=" + Msg + "&templateid=" + TemplateId + "";
            //getUri = @"http://api.commsoft.co.in/MNDR/SERAPI?SEROPTR=" + User_Info.Current.Mobile_APISettings.OperatorValue + "&SEROPTRCIR=" + User_Info.Current.Mobile_APISettings.OperatorCircle + "&SEROPTRSUBACNO=" + User_Info.Current.Mobile_APISettings.MobileNumber + "&TXNAMT=" + User_Info.Current.Mobile_APISettings.RechargeAmount + "&OPTRTP=" + User_Info.Current.Mobile_APISettings.OperatorType + "&SERTP=" + User_Info.Current.Mobile_APISettings.ServiceType + "&APICORPAGTXNAUTHID=" + User_Info.Current.Mobile_APISettings.Agent_Transaction_Authentication_ID + "&APICORPAGTXNPWD=" + User_Info.Current.Mobile_APISettings.Agent_Transaction_Authentication_Pswd + "&APICORPSAGTXNAUTHID=" + User_Info.Current.Mobile_APISettings.Sub_Agent_Transaction_Authentication_ID + "&APICORPSAGTXNAUTHPWD=" + User_Info.Current.Mobile_APISettings.Sub_Agent_Transaction_Authentication_Pswd + "&APICORPSAGREGMOBNO=" + User_Info.Current.Mobile_APISettings.Sub_Agent_Registered_Mobile_No + "&APICORPUTXNID=" + User_Info.Current.Mobile_APISettings.Transaction_ID + "";
            //getUri = @"http://api.commsoft.co.in/MNDR/SERAPI?SEROPTR=Vfmr&SEROPTRCIR=UPWEST&SEOPTRSUBACNO=2345676543&TXNAMT=10&OPTRTP=4&SERTP=mobile&APICORPAGTXNAUTHID=DEMOAPI&APICORPAGTXNPWD=5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8&APICORPSAGTXNAUTHID=111111&APICORPSAGTXNAUTHPWD=123456&APICORPSAGREGMOBNO=9873494846&APICORPUTXNID=1212121212121";


            WebRequest request = (WebRequest)WebRequest.Create(getUri);
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            StreamReader responseReader = new StreamReader(response.GetResponseStream());
            responseReader.ReadToEnd();


            //SqlCommand cmd = new SqlCommand("INSERT INTO [SYS_SmsRecord]([RecieverMobNo],[AuthKey],[SenderID],[RouteID],[MsgDsc],[CreateDateTime])VALUES(@RecieverMobNo,@AuthKey,@SenderID,@RouteID,@MsgDsc,@CreateDateTime) select scope_identity()");
            //cmd.Parameters.AddWithValue("@RecieverMobNo", MobNo);
            //cmd.Parameters.AddWithValue("@AuthKey", AuthKey);
            //cmd.Parameters.AddWithValue("@SenderID", SenderID);
            //cmd.Parameters.AddWithValue("@RouteID", RouteID);
            //cmd.Parameters.AddWithValue("@MsgDsc", Msg);
            ////cmd.Parameters.AddWithValue("@RsponseCode", "");
            ////cmd.Parameters.AddWithValue("@Response", DateTime.Now);
            //cmd.Parameters.AddWithValue("@CreateDateTime", DateTime.Now);
            // SMSID = DataAccess.InsertExecuteScalar(cmd);
            ////DataAccess.InsertExecuteNonQuery(cmd);

            //string res = SendSms(MobNo, AuthKey, Msg, SenderID, Convert.ToInt32(RouteID));
            //JObject obj = JObject.Parse(res);

            //SqlCommand cmdUpdate = new SqlCommand("update SYS_SmsRecord set RsponseCode=@RsponseCode,Response=@Response where ID=@ID");
            //cmdUpdate.Parameters.AddWithValue("@RsponseCode", obj["responseCode"].ToString());
            //cmdUpdate.Parameters.AddWithValue("@Response", obj["response"].ToString());
            //cmdUpdate.Parameters.AddWithValue("@ID", SMSID);
            //DataAccess.InsertExecuteNonQuery(cmdUpdate);
        }
        catch (WebException ed)
        {
            //SqlCommand cmdUpdate1 = new SqlCommand("update SYS_SmsRecord set Response=@Response where ID=@ID");
            ////cmdUpdate1.Parameters.AddWithValue("@RsponseCode", obj["responseCode"]);
            //cmdUpdate1.Parameters.AddWithValue("@Response", ed.Message);
            //cmdUpdate1.Parameters.AddWithValue("@ID", SMSID);
            //DataAccess.InsertExecuteNonQuery(cmdUpdate1);
            //// MessageBox.Show(ed.Message);
        }
        catch (Exception ex)
        {
            //SqlCommand cmdUpdate2 = new SqlCommand("update SYS_SmsRecord set Response=@Response where ID=@ID");
            ////cmdUpdate2.Parameters.AddWithValue("@RsponseCode", obj["responseCode"]);
            //cmdUpdate2.Parameters.AddWithValue("@Response", ex.Message);
            //cmdUpdate2.Parameters.AddWithValue("@ID", SMSID);
            //DataAccess.InsertExecuteNonQuery(cmdUpdate2);
            //// MessageBox.Show(ex.Message);
        }

    }
    private static string SendSms(string pMobileNo, string pAUTH_KEY, string pMessage, string pSenderID, int pRouteId)
    {
        string ResMsg = string.Empty;
        try
        {
            // document.body.style.cursor = Cursors.WaitCursor;
            string LL = "http://sms.itsgwalior.com/rest/services/sendSMS/sendGroupSms?AUTH_KEY=" + pAUTH_KEY + "&message=" + System.Web.HttpUtility.UrlEncode(pMessage) + "&senderId=" + pSenderID + "&routeId=" + pRouteId.ToString().Trim() + "&mobileNos=" + pMobileNo + "&smsContentType=english";
            ResMsg = getHTTP(LL.Trim());
            //Response.Write(getHTTP(LL.Trim()));
            System.Threading.Thread.Sleep(10);
            // this.Cursor = Cursors.Arrow;
        }
        catch (WebException ed)
        {
            ResMsg = ed.Message;
            // MessageBox.Show(ed.Message);
        }
        catch (Exception ex)
        {
            ResMsg = ex.Message;
            // MessageBox.Show(ex.Message);
        }
        finally
        {
            //this.Cursor = Cursors.Arrow;
        }
        return ResMsg;
    }
    public static string getHTTP(string szURL)
    {
        HttpWebRequest HttpRequest = default(HttpWebRequest);
        HttpWebResponse httpResponse = default(HttpWebResponse);
        string BodtText = null;
        Int32 Bytes = default(Int32);
        Stream ResponseStream = default(Stream);
        byte[] RecvByte = new byte[byte.MaxValue + 1];
        HttpRequest = (HttpWebRequest)WebRequest.Create(szURL);
        httpResponse = (HttpWebResponse)HttpRequest.GetResponse();
        ResponseStream = httpResponse.GetResponseStream();
        StreamReader readerst = new StreamReader(ResponseStream);
        while ((true))
        {
            Bytes = ResponseStream.Read(RecvByte, 0, RecvByte.Length);
            if (Bytes <= 0)
                break; // TODO: might not be correct. Was : Exit Do
            BodtText += System.Text.Encoding.UTF8.GetString(RecvByte, 0, Bytes);
        }
        return BodtText;
    }
}