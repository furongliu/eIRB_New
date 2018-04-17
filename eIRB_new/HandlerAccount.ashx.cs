using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace eIRB_new
{
    /// <summary>
    /// Summary description for HandlerAccount
    /// </summary>
    public class HandlerAccount : IHttpHandler
    {

        String strConnString = ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString;
        private static log4net.ILog Log { get; set; } = log4net.LogManager.GetLogger(typeof(HandlerAccount));
        public void ProcessRequest(HttpContext context)
        {

            System.Collections.Specialized.NameValueCollection forms = context.Request.Form;
            string strOperation = forms.Get("oper");
            string strResponse = string.Empty;

            if (strOperation == null)
            {
                SqlConnection conn = new SqlConnection(strConnString);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = " SELECT * FROM dbo.Account WHERE allow_check='1'; ";
                cmd.Connection = conn;
                try
                {
                    conn.Open();
                    DataTable dt = new DataTable();
                    SqlDataAdapter oda = new SqlDataAdapter(cmd);
                    oda.Fill(dt);
                    List<AccountClass> accountClass = new List<AccountClass>();
                    accountClass = (from DataRow row in dt.Rows
                                    select new AccountClass
                                    {
                                        id = Convert.ToInt32(row["id"].ToString()),
                                        identity = row["identity"].ToString(),
                                        name = row["name"].ToString(),
                                        account = row["account"].ToString(),
                                        password = row["password"].ToString(),
                                        email = row["email"].ToString(),
                                        office = row["office"].ToString(),
                                        job = row["job"].ToString(),
                                        phone1 = row["phone1"].ToString(),
                                        phone2 = row["phone2"].ToString(),
                                        address = row["address"].ToString(),
                                        fex = row["fex"].ToString(),
                                        status = row["status"].ToString() == "True" ? 1 : 0,
                                    }).ToList();
                    //List<AccountClass> x = (List<AccountClass>)HttpContext.Current.Session["AccountData"];
                    //var vPersonData = accountClass
                    //                    .Where(c => c.account == x[0].account)
                    //                    .Select(grp =>
                    //                             new AccountClass
                    //                             {
                    //                                 id = grp.id,
                    //                                 account = grp.account,
                    //                                 status = grp.status,
                    //                                 role = grp.role,
                    //                                 name = grp.name,
                    //                                 unit = grp.unit,
                    //                                 tel = grp.tel,
                    //                                 email = grp.email,
                    //                                 password = grp.password,
                    //                                 IsChangedPassword = grp.IsChangedPassword,
                    //                             });
                    //foreach (var v in vPersonData)
                    //{
                    //    if (v.role != 1)
                    //    {
                    //        accountClass.Clear();
                    //        accountClass.Add(v);
                    //        break;
                    //    }
                    //}
                    var jsonSerializer = new JavaScriptSerializer();
                    context.Response.Write(jsonSerializer.Serialize(accountClass));
                }
                catch (Exception ex)
                {
                    string body = "HandlerAccount.ashx.cs--ProcessRequest(HttpContext context)--讀取使用者帳號--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                    throw new NotImplementedException();
                }
                finally
                {
                    string body = "HandlerAccount.ashx.cs--ProcessRequest(HttpContext context)--讀取使用者帳號--" + cmd.CommandText;
                    Log.Info(body);
                    Log.Info(cmd.CommandText + JsonConvert.DeserializeObject(JsonConvert.SerializeObject(forms)));
                    conn.Dispose();
                }
            }
            else if (strOperation == "del")
            {
                string strOut = string.Empty;
                Del(forms, out strOut);
                context.Response.Write(strOut);
            }
            else
            {
                string strOut = string.Empty;
                AddEdit(forms, out strOut);
                context.Response.Write(strOut);
            }
        }

        private void AddEdit(NameValueCollection forms, out string strResponse)
        {
            string strOperation = forms.Get("oper");
            string strEmpId = string.Empty;
            strResponse = "--資料處理完成--";

            using (SqlConnection conn = new SqlConnection(strConnString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = string.Format(" UPDATE Account SET account = @account,status=@status, [name] = @name, " +
                   " phone1=@phone1, phone2=@phone2, fex=@fex, address=@address, [job]=@job, office=@office, [identity]=@identity, " +
                   " [allow_check]=1, [update_date]=GETDATE(), email=@email, [password]=@password " +
                   " WHERE id = @id; " +
                   " INSERT INTO Account( account ,[password] ,email ,[name] ,phone1 ,phone2 ,fex ,address ,[job] ,office ,[identity] ,status ,allow_check ,[date] ,update_date ) " +
                   " OUTPUT Inserted.id " +
                   " SELECT @account ,@password ,@email ,@name ,@phone1 ,@phone2 ,@fex ,@address ,@job ,@office ,@identity ,1 ,1 ,GETDATE() ,GETDATE() " +
                   " WHERE NOT EXISTS(SELECT 1 FROM Account WHERE id = @id ); ");
                try
                {
                    conn.Open();
                    AccountClass accountClass = new AccountClass()
                    {
                        id = forms.Get("id").IndexOf("empty") >= 0 ? 0 : Convert.ToInt32(forms.Get("id")),
                        account= forms.Get("account"),
                        password = forms.Get("password"),
                        email = forms.Get("email"),
                        name = forms.Get("name"),
                        phone1 = forms.Get("phone1"),
                        phone2 = forms.Get("phone2"),
                        fex = forms.Get("fex"),
                        address = forms.Get("address"),
                        job = forms.Get("job"),
                        office = forms.Get("office"),
                        identity = forms.Get("identity"),
                        status =Convert.ToInt32( forms.Get("status")),
                    };
                    var stringPropertyNamesAndValues = accountClass.GetType()
                     .GetProperties()
                     //.Where(pi => pi.PropertyType == typeof(string) && pi.GetGetMethod() != null
                     .Where(pi => pi.GetGetMethod() != null)
                     .Select(pi => new
                     {
                         Name = pi.Name,
                         Value = pi.GetGetMethod().Invoke(accountClass, null)
                     });
                    foreach (var v in stringPropertyNamesAndValues)
                    {
                        SqlParameter sp = new SqlParameter()
                        {
                            ParameterName = v.Name,
                            // Value = v.Value == null ? DBNull.Value : v.Value;
                        };
                        sp.Value = v.Value == null ? DBNull.Value : v.Value;
                        cmd.Parameters.Add(sp);
                    }
                    cmd.ExecuteNonQuery();
                    //var x = cmd.ExecuteScalar();
                    //HttpCookie myCookie = HttpContext.Current.Request.Cookies["UserSettings"];
                    //myCookie["IsChangedPassword"] = "1";
                    //HttpContext.Current.Response.Cookies.Add(myCookie);

                }
                catch (Exception ex)
                {
                    string body = "HandlerAccount.ashx.cs--AddEdit(NameValueCollection forms, out string strResponse)--新增編輯使用者帳號資料--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body + "<br/>" + cmd.CommandText + JsonConvert.DeserializeObject(JsonConvert.SerializeObject(forms)), new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                    Log.Error(cmd.CommandText + JsonConvert.DeserializeObject(JsonConvert.SerializeObject(forms)));
                    throw new NotImplementedException();
                }
                finally
                {
                    string body = "HandlerAccount.ashx.cs--AddEdit(NameValueCollection forms, out string strResponse)--新增編輯使用者帳號資料--" + cmd.CommandText;
                    Log.Info(body);
                    Log.Info(cmd.CommandText + JsonConvert.DeserializeObject(JsonConvert.SerializeObject(forms)));
                    conn.Dispose();
                }

            }
        }

        private void Del(NameValueCollection forms, out string strResponse)
        {
            string strOperation = forms.Get("oper");
            string strEmpId = string.Empty;
            strResponse = "--資料處理完成--";

            using (SqlConnection conn = new SqlConnection(strConnString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = string.Format(" DELETE FROM Account WHERE id = @id ; ");
                try
                {
                    conn.Open();
                    AccountClass accountClass = new AccountClass()
                    {
                        id = forms.Get("id").IndexOf("empty") >= 0 ? 0 : Convert.ToInt32(forms.Get("id"))
                    };
                    var stringPropertyNamesAndValues = accountClass.GetType()
                     .GetProperties()
                     //.Where(pi => pi.PropertyType == typeof(string) && pi.GetGetMethod() != null
                     .Where(pi => pi.GetGetMethod() != null)
                     .Select(pi => new
                     {
                         Name = pi.Name,
                         Value = pi.GetGetMethod().Invoke(accountClass, null)
                     });
                    foreach (var v in stringPropertyNamesAndValues)
                    {
                        SqlParameter sp = new SqlParameter()
                        {
                            ParameterName = v.Name,
                            // Value = v.Value == null ? DBNull.Value : v.Value;
                        };
                        sp.Value = v.Value == null ? DBNull.Value : v.Value;
                        cmd.Parameters.Add(sp);
                    }
                    cmd.ExecuteNonQuery();
                    //var x = cmd.ExecuteScalar();
                    //HttpCookie myCookie = HttpContext.Current.Request.Cookies["UserSettings"];
                    //myCookie["IsChangedPassword"] = "1";
                    //HttpContext.Current.Response.Cookies.Add(myCookie);

                }
                catch (Exception ex)
                {
                    string body = "HandlerAccount.ashx.cs--Del(NameValueCollection forms, out string strResponse)--刪除使用者帳號資料--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body+"<br/>" +cmd.CommandText + JsonConvert.DeserializeObject(JsonConvert.SerializeObject(forms)), new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                    Log.Error(cmd.CommandText + JsonConvert.DeserializeObject(JsonConvert.SerializeObject(forms)));
                    throw new NotImplementedException();
                }
                finally
                {
                    string body = "HandlerAccount.ashx.cs--Del(NameValueCollection forms, out string strResponse)--刪除使用者帳號資料--" + cmd.CommandText;
                    Log.Info(body);
                    Log.Info(cmd.CommandText + JsonConvert.DeserializeObject(JsonConvert.SerializeObject(forms)));
                    conn.Dispose();
                }

            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}