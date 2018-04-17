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
    public partial class _01_01_01_new_account : System.Web.UI.Page
    {
        private static log4net.ILog Log { get; set; } = log4net.LogManager.GetLogger(typeof(_01_01_01_new_account));
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]
        public static string AddAccount(string id, string identity) //新增帳號
        {
            using (SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = Conn;
                cmd.CommandText = " UPDATE Account SET allow_check=1, [identity]=@identity, update_date=@update_date WHERE id=@id ; ";

                cmd.Parameters.Add(new SqlParameter("@id", id));
                cmd.Parameters.Add(new SqlParameter("@identity", identity));
                cmd.Parameters.Add(new SqlParameter("@update_date", DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")));
                try
                {
                    Conn.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    string body = "01_01_01_new_account.aspx.cs--AddAccount(string id, string identity)--新增帳號--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                }
                finally
                {
                    string body = "01_01_01_new_account.aspx.cs--AddAccount(string id, string identity)--新增帳號--" + cmd.CommandText + "--id=" + id;
                    Log.Info(body);
                    cmd.Cancel();
                    Conn.Close();
                    Conn.Dispose();
                }
            }
            return "OK";
        }

        [System.Web.Services.WebMethod]
        public static string RemoveAccount(string id) //刪除帳號
        {
            using (SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = Conn;
                cmd.CommandText = " DELETE FROM Account WHERE id=@id ; ";

                cmd.Parameters.Add(new SqlParameter("@id", id));
                try
                {
                    Conn.Open();  
                    cmd.ExecuteNonQuery(); 
                }
                catch (Exception ex)
                {
                    string body = "01_01_01_new_account.aspx.cs--RemoveAccount(string id)--刪除帳號--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                }
                finally
                {
                    string body = "01_01_01_new_account.aspx.cs--RemoveAccount(string id)--刪除帳號--" + cmd.CommandText + "--id=" + id;
                    Log.Info(body);
                    cmd.Cancel();
                    Conn.Close();
                    Conn.Dispose();
                }
            }
            return "OK";
        }
    }
}