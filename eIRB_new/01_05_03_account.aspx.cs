using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eIRB_new
{
    public partial class _01_05_03_account : System.Web.UI.Page
    {
        private static log4net.ILog Log { get; set; } = log4net.LogManager.GetLogger(typeof(_01_05_03_account));
        [System.Web.Services.WebMethod]
        public static string AccountDataCheck(string account)
        {
            var vReturn = " Done ";
            string sConn = ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(sConn))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = string.Format(" SELECT COUNT(*) from Account WHERE account='{0}'", account);

                try
                {
                    conn.Open();
                    var x = cmd.ExecuteScalar();
                    vReturn = x.ToString();
                }
                catch (Exception ex)
                {
                    string body = "01_05_03_account.aspx.cs--AccountDataCheck(string account)--新增帳號--檢查帳號有無重複--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                    vReturn = JsonConvert.SerializeObject("Error _0");
                }
                finally
                {
                    string body = "01_05_03_account.aspx.cs--AccountDataCheck(string account)--新增帳號--檢查帳號有無重複--" + cmd.CommandText + "--account=" + account;
                    Log.Info(body);
                    conn.Dispose();

                }
            }
            //var vJsonText = JsonConvert.SerializeObject("{\"return\":[ \"account\" :\"" + vReturn + "\"]}",Formatting.None);
            // var vJsonText = JsonConvert.SerializeObject("'{\"result\":\"" + vReturn+ "\"}'", Formatting.None);
            //  return vJsonText;
            //  return JsonConvert.SerializeObject("'{ \"result\": \"" + vReturn + "\" }' ", Formatting.None);
            Result result = new eIRB_new._01_05_03_account.Result();
            result.Account = vReturn;
            return JsonConvert.SerializeObject(result);

        }
        public class Result
        {
            public string Account { get; set; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}