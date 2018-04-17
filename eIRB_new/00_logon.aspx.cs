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
    public partial class _00_logon : System.Web.UI.Page
    {
        private static log4net.ILog Log { get; set; } = log4net.LogManager.GetLogger(typeof(_00_logon));
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Session["Account"] = "";
            HttpContext.Current.Session["UserName"] = "";
        }

        [System.Web.Services.WebMethod]
        public static string Login(string account, string password) //登入
        {
            string result = "";
            using (SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr = null;
                cmd.Connection = Conn;
                cmd.CommandText = " SELECT * FROM Account WHERE account=@account AND password=@password ; ";

                cmd.Parameters.Add(new SqlParameter("@account", account));
                cmd.Parameters.Add(new SqlParameter("@password", password));
                try
                {
                    Conn.Open();
                    dr=cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            if (dr["status"].ToString() == "False" && dr["allow_check"].ToString() == "True")
                            {
                                result = "帳戶停用中.";
                            }
                            else if (dr["allow_check"].ToString() == "False")
                            {
                                result = "帳號尚未開通.";
                            }
                            else {
                                if (dr["identity"].ToString() == "醫師" || dr["identity"].ToString() == "委託廠商" || dr["identity"].ToString() == "委託機構" || dr["identity"].ToString() == "研究護理師" || dr["identity"].ToString() == "研究人員")
                                    result = "醫師";
                                else
                                    result = dr["identity"].ToString();
                                using (SqlConnection Conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
                                {
                                    SqlCommand cmd1 = new SqlCommand();
                                    cmd1.Connection = Conn1;
                                    cmd1.CommandText = " INSERT INTO Visit ([account], [name], [identity], [date], [ip])VALUES(@account,@name,@identity,@date,@ip) ; ";

                                    cmd1.Parameters.Add(new SqlParameter("@account", dr["account"]));
                                    cmd1.Parameters.Add(new SqlParameter("@name", dr["name"]));
                                    cmd1.Parameters.Add(new SqlParameter("@identity", dr["identity"]));
                                    cmd1.Parameters.Add(new SqlParameter("@date", DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")));

                                    System.Web.HttpContext context = System.Web.HttpContext.Current;
                                    cmd1.Parameters.Add(new SqlParameter("@ip", context.Request.ServerVariables["REMOTE_ADDR"].ToString()));

                                    try
                                    {
                                        Conn1.Open();
                                        cmd1.ExecuteNonQuery();
                                    }
                                    catch (Exception ex)
                                    {
                                        string body = "00_logon.aspx.cs--Login(string account, string password)--登入--登入資訊--" + ex.Message;
                                        SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                                        Log.Error(body);
                                    }
                                    finally
                                    {
                                        string body = "00_logon.aspx.cs--Login(string account, string password)--登入--登入資訊--" + cmd1.CommandText + "--account=" + account+"/ip="+ context.Request.ServerVariables["REMOTE_ADDR"].ToString();
                                        Log.Info(body);
                                        HttpContext.Current.Session["Account"] = account;
                                        HttpContext.Current.Session["UserName"] = dr["name"];
                                        cmd1.Cancel();
                                        Conn1.Close();
                                        Conn1.Dispose();
                                    }
                                }
                            }
                        }
                    }
                    else
                    {
                        result= "帳號/密碼輸入錯誤.";
                    }
                }
                catch (Exception ex)
                {
                    string body = "00_logon.aspx.cs--Login(string account, string password)--登入--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                }
                finally
                {
                    string body = "00_logon.aspx.cs--Login(string account, string password)--登入--" + cmd.CommandText + "--account=" + account;
                    Log.Info(body);
                    cmd.Cancel();
                    Conn.Close();
                    Conn.Dispose();
                }
            }
            return result;
        }

        [System.Web.Services.WebMethod]
        public static string CheckAccount(string account) //檢查帳號有無重複
        {
            string result = "";
            using (SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr = null;
                cmd.Connection = Conn;
                cmd.CommandText = " SELECT * FROM Account WHERE account=@account ; ";

                cmd.Parameters.Add(new SqlParameter("@account", account));
                try
                {
                    Conn.Open();
                    dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        result = "帳號重複!";
                    }
                }
                catch (Exception ex)
                {
                    string body = "00_logon.aspx.cs--CheckAccount(string account)--檢查帳號有無重複--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                }
                finally
                {
                    string body = "00_logon.aspx.cs--CheckAccount(string account)--檢查帳號有無重複--" + cmd.CommandText + "--account=" + account;
                    Log.Info(body);
                    cmd.Cancel();
                    Conn.Close();
                    Conn.Dispose();
                }
            }
            return result;
        }

        [System.Web.Services.WebMethod]
        public static string Submit(string account, string password, string name, string email, string phone1, string office, string job, string phone2, string fex, string address, string note) //註冊新帳號
        {
            string result = "";
            using (SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = Conn;
                cmd.CommandText = " INSERT INTO Account ([account],[password],[email],[name],[phone1],[phone2],[fex],[address],[job],[office],[identity],[status],[allow_check],[note],[date],[update_date]) "
                    + " VALUES (@account,@password,@email,@name,@phone1,@phone2,@fex,@address,@job,@office,'尚未指定',1,0,@note,@date,@date) ; ";

                cmd.Parameters.Add(new SqlParameter("@account", account));
                cmd.Parameters.Add(new SqlParameter("@password", password));
                cmd.Parameters.Add(new SqlParameter("@email", email));
                cmd.Parameters.Add(new SqlParameter("@name", name));
                cmd.Parameters.Add(new SqlParameter("@phone1", phone1));
                cmd.Parameters.Add(new SqlParameter("@phone2", phone2));
                cmd.Parameters.Add(new SqlParameter("@fex", fex));
                cmd.Parameters.Add(new SqlParameter("@address", address));
                cmd.Parameters.Add(new SqlParameter("@job", job));
                cmd.Parameters.Add(new SqlParameter("@office", office));
                cmd.Parameters.Add(new SqlParameter("@note", note));
                cmd.Parameters.Add(new SqlParameter("@date", DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")));
                try
                {
                    Conn.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    string body = "00_logon.aspx.cs--Submit(string account, string password, string name, string email, string phone1, string office, string job, string phone2, string fex, string address, string note)--註冊新帳號--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                }
                finally
                {
                    string body = "00_logon.aspx.cs--Submit(string account, string password, string name, string email, string phone1, string office, string job, string phone2, string fex, string address, string note)--註冊新帳號--" + cmd.CommandText + "--account=" + account;
                    Log.Info(body);
                    cmd.Cancel();
                    Conn.Close();
                    Conn.Dispose();
                }
            }
            return result;
        }
    }
}