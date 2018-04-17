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
    /// Summary description for HandlerEditPlan
    /// </summary>
    public class HandlerEditPlan : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {

        String strConnString = ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString;
        private static log4net.ILog Log { get; set; } = log4net.LogManager.GetLogger(typeof(HandlerEditPlan));
        public void ProcessRequest(HttpContext context)
        {

            System.Collections.Specialized.NameValueCollection forms = context.Request.Form;
            string strOperation = forms.Get("oper");
            string strResponse = string.Empty;

            if (strOperation == null)
            {
                SqlConnection conn = new SqlConnection(strConnString);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = " SELECT a.[案件編號] AS CaseNo,a.[權限] AS Authority,b.[案件類別] AS CaseType, "
                                + " ISNULL(c.[中文計畫名稱], '') AS CHName, ISNULL(c.[協同主持人], '') AS CorPI, c.[計畫主持人] AS PI "
                                + " FROM [計畫聯絡人] AS a "
                                + " LEFT JOIN [計畫基本資料] AS b on a.[案件編號] = b.[案件編號] "
                                + " LEFT JOIN [計畫總覽] AS c on a.[案件編號] = c.[案件編號] "
                                + " LEFT JOIN [計畫執行進度] AS d on a.[案件編號]=d.[案件編號] "
                                + " WHERE a.[帳號]=@帳號 AND d.[送審進度]='編輯中'; ";

                cmd.Parameters.Add(new SqlParameter("@帳號", context.Session["Account"]));

                cmd.Connection = conn;
                try
                {
                    conn.Open();
                    DataTable dt = new DataTable();
                    SqlDataAdapter oda = new SqlDataAdapter(cmd);
                    oda.Fill(dt);
                    List<EditPlanClass> EditPlanClass = new List<EditPlanClass>();
                    EditPlanClass = (from DataRow row in dt.Rows
                                     select new EditPlanClass
                                     {
                                         CaseNo = row["CaseNo"].ToString(),
                                         CHName = row["CHName"].ToString(),
                                         CaseType = row["CaseType"].ToString(),
                                         PI = row["PI"].ToString(),
                                         CorPI = row["CorPI"].ToString(),
                                         Authority = row["Authority"].ToString(),
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
                    context.Response.Write(jsonSerializer.Serialize(EditPlanClass));
                }
                catch (Exception ex)
                {
                    string body = "HandlerEditPlan.ashx.cs--ProcessRequest(HttpContext context)--讀取編輯中的案件--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                    throw new NotImplementedException();
                }
                finally
                {
                    string body = "HandlerEditPlan.ashx.cs--ProcessRequest(HttpContext context)--讀取編輯中的案件--" + cmd.CommandText+"--帳號="+ context.Session["Account"];
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