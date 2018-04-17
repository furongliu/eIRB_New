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
    public partial class _02_02_02_edit_plan : System.Web.UI.Page
    {
        private static log4net.ILog Log { get; set; } = log4net.LogManager.GetLogger(typeof(_02_02_02_edit_plan));
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]
        public static string RemoveCase(string CaseNo) //刪除案件
        {
            using (SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = Conn;
                cmd.CommandText = " DELETE FROM [計畫基本資料] WHERE 案件編號=@案件編號 ; "
                    + " DELETE FROM [計畫總覽] WHERE 案件編號=@案件編號 ; "
                    + " DELETE FROM [計畫聯絡人] WHERE 案件編號=@案件編號 ; "
                    + " DELETE FROM [計畫執行進度] WHERE 案件編號=@案件編號 ; ";

                cmd.Parameters.Add(new SqlParameter("@案件編號", CaseNo));
                try
                {
                    Conn.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    string body = "02_02_02_edit_plan.aspx.cs--RemoveCase(string CaseNo)--刪除案件--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                }
                finally
                {
                    string body = "02_02_02_edit_plan.aspx.cs--RemoveCase(string CaseNo)--刪除案件--" + cmd.CommandText + "--案件編號=" + CaseNo;
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