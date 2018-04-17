using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace eIRB_new
{
    /// <summary>
    /// Summary description for HandlerVisit
    /// </summary>
    public class HandlerVisit : IHttpHandler
    {

        String strConnString = ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString;
        private static log4net.ILog Log { get; set; } = log4net.LogManager.GetLogger(typeof(HandlerVisit));
        public void ProcessRequest(HttpContext context)
        {

            System.Collections.Specialized.NameValueCollection forms = context.Request.Form;
            string strOperation = forms.Get("oper");
            string strResponse = string.Empty;

            if (strOperation == null)
            {
                SqlConnection conn = new SqlConnection(strConnString);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = " SELECT * FROM dbo.Visit;";
                cmd.Connection = conn;
                try
                {
                    conn.Open();
                    DataTable dt = new DataTable();
                    SqlDataAdapter oda = new SqlDataAdapter(cmd);
                    oda.Fill(dt);
                    List<VisitClass> VisitClass = new List<VisitClass>();
                    VisitClass = (from DataRow row in dt.Rows
                                    select new VisitClass
                                    {
                                        account = row["account"].ToString(),
                                        name = row["name"].ToString(),
                                        identity = row["identity"].ToString(),
                                        ip = row["ip"].ToString(),
                                        date = row["date"].ToString(),
                                    }).ToList();
                    //List<VisitClass> x = (List<VisitClass>)HttpContext.Current.Session["AccountData"];
                    //var vPersonData = VisitClass
                    //                    .Where(c => c.account == x[0].account)
                    //                    .Select(grp =>
                    //                             new VisitClass
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
                    //        VisitClass.Clear();
                    //        VisitClass.Add(v);
                    //        break;
                    //    }
                    //}
                    var jsonSerializer = new JavaScriptSerializer();
                    context.Response.Write(jsonSerializer.Serialize(VisitClass));
                }
                catch (Exception ex)
                {
                    string body = "HandlerVisit.ashx.cs--ProcessRequest(HttpContext context)--登入資訊--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                    throw new NotImplementedException();
                }
                finally
                {
                    string body = "HandlerVisit.ashx.cs--ProcessRequest(HttpContext context)--登入資訊--" + cmd.CommandText;
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