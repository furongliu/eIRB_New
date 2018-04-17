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
    public partial class _02_02_01_new_plan : System.Web.UI.Page
    {
        private static log4net.ILog Log { get; set; } = log4net.LogManager.GetLogger(typeof(_02_02_01_new_plan));
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]
        public static string AddPlan(object tmp) //新增
        {
            string strJson = JsonConvert.SerializeObject(tmp);
            PlanObject data = JsonConvert.DeserializeObject<PlanObject>(strJson);
            

            //尋找案件編號
            string CaseNo = "";
            using (SqlConnection Conn0 = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
            {
                SqlCommand cmd0 = new SqlCommand();
                SqlDataReader dr0 = null;
                cmd0.Connection = Conn0;
                cmd0.CommandText = " SELECT MAX([案件編號]) as CaseNo FROM [計畫基本資料] ";

                try
                {
                    Conn0.Open();
                    dr0 = cmd0.ExecuteReader();
                    while (dr0.Read())
                    {
                        string date = DateTime.Now.Year.ToString();
                        if (DateTime.Now.Month < 10) date += "0" + DateTime.Now.Month.ToString();
                        else date += DateTime.Now.Month.ToString();

                        if (!DBNull.Value.Equals(dr0["CaseNo"]) && dr0["CaseNo"].ToString().Substring(0, 6) == date)
                        {
                            int no1 = Convert.ToInt32(dr0["CaseNo"].ToString().Substring(6))+1;
                            if (no1 < 10)
                            {
                                CaseNo = date + "0000" + no1.ToString();
                            }
                            else if (no1 < 100)
                            {
                                CaseNo = date + "000" + no1.ToString();
                            }
                            else if (no1 < 1000)
                            {
                                CaseNo = date + "00" + no1.ToString();
                            }
                            else if (no1 < 10000)
                            {
                                CaseNo = date + "0" + no1.ToString();
                            }
                            else
                            {
                                CaseNo = date + no1.ToString();
                            }
                        }
                        else
                        {
                            CaseNo = date + "00001";
                        }
                    }
                }
                catch (Exception ex)
                {
                    string body = "02_02_01_new_plan.aspx.cs--AddPlan(object tmp)--新增--尋找案件編號--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                }
                finally
                {
                    string body = "02_02_01_new_plan.aspx.cs--AddPlan(object tmp)--新增--尋找案件編號--" + cmd0.CommandText + "--CaseNo=" + CaseNo;
                    Log.Info(body);
                    cmd0.Cancel();
                    Conn0.Close();
                    Conn0.Dispose();
                }
            }

            string[] column = {"申請年度","案件類別","是否須送署審查","案件種類","試驗階段","經費來源有無","使用藥物或器材提供者","試驗區域",
                "案件種類_醫療法定義之人體試驗","案件種類_其他","BABE主試驗預試驗",
                "經費來源_贊助廠商","經費來源_本院醫學研究部","經費來源_中央主管機關","經費來源_學術研究機構","經費來源_學校單位","經費來源_醫療機構","經費來源_其他單位",
                "試驗區域_其他參與試驗的國家","試驗區域_台灣參與試驗的機構","試驗區域_單一中心","案件編號" };


            using (SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = Conn;
                string str= " INSERT INTO [計畫基本資料] ( ";
                for (int i = 0; i < column.Length; i++)
                {
                    str += "[" + column[i] + "],";
                }
                str=str.TrimEnd(',')+ ") VALUES (";
                for (int i = 0; i < column.Length; i++)
                {
                    str += "@" + column[i] + ",";
                }
                str = str.TrimEnd(',') + " ); ";
                str += "INSERT INTO [計畫聯絡人] ([案件編號],[帳號],[性質],[權限]) VALUES (@案件編號,@帳號,'計畫主持人','可以送審'); ";
                str += "INSERT INTO [計畫總覽] ([案件編號],[計畫主持人],[計畫編號],[試驗藥品醫療器材],[協同主持人]";
                str += ",[中文計畫名稱],[英文計畫名稱],[試驗執行地點],[試驗執行地點_其他],[執行本試驗之其他機構],[進度期限_年],[進度期限_月]";
                str += ",[受試者年齡層],[受試者人數_本院],[受試者人數_多中心總人數_台灣],[受試者人數_多中心總人數_全球]";
                str += ",[收納受試者方式],[受試者資料保密方式],[會審視受試者資料的名單],[特殊族群]";
                str += ",[受試者營養補助交通費_有無],[受試者營養補助交通費_每次總共],[受試者營養補助交通費_元]";
                str += ",[研究用藥品學名],[商品名],[規格],[製造廠商],[製造國別],[科別],[試驗委託者],[受試者年齡層_其他],[收納受試者方式_其他],[受試者資料保密方式_其他],[特殊族群_其他]) VALUES(@案件編號,@帳號";
                str += ",'','','','','','','','',0,0,'',0,0,0,'','','',0,'','','','','','','','','','','','','',''); ";
                str += "INSERT INTO [計畫執行進度] ([案件編號],[送審進度],[更新時間]) VALUES (@案件編號,'編輯中',GETDATE()); ";
                cmd.CommandText = str;

                cmd.Parameters.Add(new SqlParameter("@申請年度", data.PlanYear));
                cmd.Parameters.Add(new SqlParameter("@案件類別", data.chk1));
                cmd.Parameters.Add(new SqlParameter("@是否須送署審查", data.chk2));
                cmd.Parameters.Add(new SqlParameter("@案件種類", data.chk3));
                cmd.Parameters.Add(new SqlParameter("@試驗階段", data.chk4));
                cmd.Parameters.Add(new SqlParameter("@經費來源有無", data.chk5));
                cmd.Parameters.Add(new SqlParameter("@使用藥物或器材提供者", data.chk6));
                cmd.Parameters.Add(new SqlParameter("@試驗區域", data.chk7));
                cmd.Parameters.Add(new SqlParameter("@案件種類_醫療法定義之人體試驗", data.chk3_1));
                cmd.Parameters.Add(new SqlParameter("@案件種類_其他", data.chk3other));
                cmd.Parameters.Add(new SqlParameter("@BABE主試驗預試驗", data.chk4other));
                cmd.Parameters.Add(new SqlParameter("@經費來源_贊助廠商", data.chk5_1_1));
                cmd.Parameters.Add(new SqlParameter("@經費來源_本院醫學研究部", data.chk5_1_2));
                cmd.Parameters.Add(new SqlParameter("@經費來源_中央主管機關", data.chk5_1_3));
                cmd.Parameters.Add(new SqlParameter("@經費來源_學術研究機構", data.chk5_1_4));
                cmd.Parameters.Add(new SqlParameter("@經費來源_學校單位", data.chk5_1_5));
                cmd.Parameters.Add(new SqlParameter("@經費來源_醫療機構", data.chk5_1_6));
                cmd.Parameters.Add(new SqlParameter("@經費來源_其他單位", data.chk5_1_7));
                cmd.Parameters.Add(new SqlParameter("@試驗區域_其他參與試驗的國家", data.chk7_1));
                cmd.Parameters.Add(new SqlParameter("@試驗區域_台灣參與試驗的機構", data.chk7_2));
                cmd.Parameters.Add(new SqlParameter("@試驗區域_單一中心", data.chk7_3));
                cmd.Parameters.Add(new SqlParameter("@案件編號", CaseNo));
                cmd.Parameters.Add(new SqlParameter("@帳號", HttpContext.Current.Session["Account"]));
                cmd.Parameters.Add(new SqlParameter("@計畫主持人", HttpContext.Current.Session["UserName"]));

                try
                {
                    Conn.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    string body = "02_02_01_new_plan.aspx.cs--AddPlan(object tmp)--新增--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                }
                finally
                {
                    string body = "02_02_01_new_plan.aspx.cs--AddPlan(object tmp)--新增--" + cmd.CommandText + "--帳號=" + HttpContext.Current.Session["Account"]+"/姓名="+ HttpContext.Current.Session["UserName"];
                    Log.Info(body);
                    cmd.Cancel();
                    Conn.Close();
                    Conn.Dispose();
                }
            }
            return CaseNo;
        }

        [System.Web.Services.WebMethod]
        public static string SaveThisCorPI(object tmp) //儲存案件聯絡人資料
        {
            string strJson = JsonConvert.SerializeObject(tmp);
            PlanObject data = JsonConvert.DeserializeObject<PlanObject>(strJson);
            
            using (SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = Conn;
                string str = " UPDATE Account SET email=@email, phone1=@phone1, phone2=@phone2, fex=@fex, address=@address, [job]=@job, office=@office, update_date=GETDATE() WHERE account=@account ; ";
                cmd.CommandText = str;

                cmd.Parameters.Add(new SqlParameter("@email", data.email));
                cmd.Parameters.Add(new SqlParameter("@phone1", data.phone1));
                cmd.Parameters.Add(new SqlParameter("@phone2", data.phone2));
                cmd.Parameters.Add(new SqlParameter("@fex", data.fex));
                cmd.Parameters.Add(new SqlParameter("@address", data.address));
                cmd.Parameters.Add(new SqlParameter("@job", data.job));
                cmd.Parameters.Add(new SqlParameter("@office", data.office));
                cmd.Parameters.Add(new SqlParameter("@account", data.account));

                try
                {
                    Conn.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    string body = "02_02_01_new_plan.aspx.cs--SaveThisCorPI(object tmp)--儲存案件聯絡人資料--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                }
                finally
                {
                    string body = "02_02_01_new_plan.aspx.cs--SaveThisCorPI(object tmp)--儲存案件聯絡人資料--" + cmd.CommandText + "--account=" + data.account;
                    Log.Info(body);
                    cmd.Cancel();
                    Conn.Close();
                    Conn.Dispose();
                }
            }
            return null;
        }

        [System.Web.Services.WebMethod]
        public static string AddThisCorPI(object tmp) //新增案件聯絡人
        {
            string strJson = JsonConvert.SerializeObject(tmp);
            PlanObject data = JsonConvert.DeserializeObject<PlanObject>(strJson);

            using (SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = Conn;
                cmd.CommandText = " INSERT INTO [計畫聯絡人] ([案件編號],[帳號],[性質],[權限]) VALUES (@案件編號,@帳號,@性質,@權限) ; ";

                cmd.Parameters.Add(new SqlParameter("@帳號", data.account));
                cmd.Parameters.Add(new SqlParameter("@性質", data.kind));
                cmd.Parameters.Add(new SqlParameter("@權限", data.authority));
                cmd.Parameters.Add(new SqlParameter("@案件編號", data.CaseNo));

                try
                {
                    Conn.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    string body = "02_02_01_new_plan.aspx.cs--AddThisCorPI(object tmp)--新增案件聯絡人--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                }
                finally
                {
                    string body = "02_02_01_new_plan.aspx.cs--AddThisCorPI(object tmp)--新增案件聯絡人--" + cmd.CommandText + "--帳號=" + data.account+"/性質="+ data.kind+"/案件編號="+ data.CaseNo;
                    Log.Info(body);
                    cmd.Cancel();
                    Conn.Close();
                    Conn.Dispose();
                }
            }
            return null;
        }
        [System.Web.Services.WebMethod]
        public static string SavePlan(object tmp) //儲存
        {
            string strJson = JsonConvert.SerializeObject(tmp);
            PlanObject data = JsonConvert.DeserializeObject<PlanObject>(strJson);

            string[] column = {"案件類別","是否須送署審查","案件種類","試驗階段","經費來源有無","使用藥物或器材提供者","試驗區域",
                "案件種類_醫療法定義之人體試驗","案件種類_其他","BABE主試驗預試驗",
                "經費來源_贊助廠商","經費來源_本院醫學研究部","經費來源_中央主管機關","經費來源_學術研究機構","經費來源_學校單位","經費來源_醫療機構","經費來源_其他單位",
                "試驗區域_其他參與試驗的國家","試驗區域_台灣參與試驗的機構","試驗區域_單一中心","申請年度" };

            using (SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = Conn;
                string str = " UPDATE [計畫基本資料] SET ";
                for (int i = 0; i < column.Length; i++)
                {
                    str += "[" + column[i] + "]=@"+ column[i]+",";
                }
                str = str.TrimEnd(',') + " WHERE [案件編號]=@案件編號; ";
                str += " UPDATE [計畫執行進度] SET [更新時間]=GETDATE(); ";
                cmd.CommandText = str;

                cmd.Parameters.Add(new SqlParameter("@申請年度", data.PlanYear));
                cmd.Parameters.Add(new SqlParameter("@案件類別", data.chk1));
                cmd.Parameters.Add(new SqlParameter("@是否須送署審查", data.chk2));
                cmd.Parameters.Add(new SqlParameter("@案件種類", data.chk3));
                cmd.Parameters.Add(new SqlParameter("@試驗階段", data.chk4));
                cmd.Parameters.Add(new SqlParameter("@經費來源有無", data.chk5));
                cmd.Parameters.Add(new SqlParameter("@使用藥物或器材提供者", data.chk6));
                cmd.Parameters.Add(new SqlParameter("@試驗區域", data.chk7));
                cmd.Parameters.Add(new SqlParameter("@案件種類_醫療法定義之人體試驗", data.chk3_1));
                cmd.Parameters.Add(new SqlParameter("@案件種類_其他", data.chk3other));
                cmd.Parameters.Add(new SqlParameter("@BABE主試驗預試驗", data.chk4other));
                cmd.Parameters.Add(new SqlParameter("@經費來源_贊助廠商", data.chk5_1_1));
                cmd.Parameters.Add(new SqlParameter("@經費來源_本院醫學研究部", data.chk5_1_2));
                cmd.Parameters.Add(new SqlParameter("@經費來源_中央主管機關", data.chk5_1_3));
                cmd.Parameters.Add(new SqlParameter("@經費來源_學術研究機構", data.chk5_1_4));
                cmd.Parameters.Add(new SqlParameter("@經費來源_學校單位", data.chk5_1_5));
                cmd.Parameters.Add(new SqlParameter("@經費來源_醫療機構", data.chk5_1_6));
                cmd.Parameters.Add(new SqlParameter("@經費來源_其他單位", data.chk5_1_7));
                cmd.Parameters.Add(new SqlParameter("@試驗區域_其他參與試驗的國家", data.chk7_1));
                cmd.Parameters.Add(new SqlParameter("@試驗區域_台灣參與試驗的機構", data.chk7_2));
                cmd.Parameters.Add(new SqlParameter("@試驗區域_單一中心", data.chk7_3));
                cmd.Parameters.Add(new SqlParameter("@案件編號", data.CaseNo));

                try
                {
                    Conn.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    string body = "02_02_01_new_plan.aspx.cs--SavePlan(object tmp)--儲存--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                }
                finally
                {
                    string body = "02_02_01_new_plan.aspx.cs--SavePlan(object tmp)--儲存--" + cmd.CommandText + "--案件編號=" + data.CaseNo;
                    Log.Info(body);
                    cmd.Cancel();
                    Conn.Close();
                    Conn.Dispose();
                }
            }
            return "done";
        }

        [System.Web.Services.WebMethod]
        public static object ReadPlan(string CaseNo) //讀取
        {
            PlanObject result = new PlanObject();
            using (SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr = null;
                cmd.Connection = Conn;
                
                cmd.CommandText = " SELECT * FROM  [計畫基本資料] WHERE [案件編號]=@案件編號;";
                cmd.Parameters.Add(new SqlParameter("@案件編號", CaseNo));
                
                try
                {
                    Conn.Open();
                    cmd.ExecuteNonQuery();
                    dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        result.chk1 = dr["案件類別"].ToString();
                        result.chk2 = dr["是否須送署審查"].ToString();
                        result.chk3 = dr["案件種類"].ToString();
                        result.chk4 = dr["試驗階段"].ToString();
                        result.chk5 = dr["經費來源有無"].ToString();
                        result.chk6 = dr["使用藥物或器材提供者"].ToString();
                        result.chk7 = dr["試驗區域"].ToString();
                        result.chk3_1 = dr["案件種類_醫療法定義之人體試驗"].ToString()==""?"NA": dr["案件種類_醫療法定義之人體試驗"].ToString();
                        result.chk3other = dr["案件種類_其他"].ToString() == "" ? "NA" : dr["案件種類_其他"].ToString();
                        result.chk4other = dr["BABE主試驗預試驗"].ToString() == "" ? "NA" : dr["BABE主試驗預試驗"].ToString();
                        result.chk5_1_1 = dr["經費來源_贊助廠商"].ToString() == "" ? "NA" : dr["經費來源_贊助廠商"].ToString();
                        result.chk5_1_2 = dr["經費來源_本院醫學研究部"].ToString() == "" ? "NA" : dr["經費來源_本院醫學研究部"].ToString();
                        result.chk5_1_3 = dr["經費來源_中央主管機關"].ToString() == "" ? "NA" : dr["經費來源_中央主管機關"].ToString();
                        result.chk5_1_4 = dr["經費來源_學術研究機構"].ToString() == "" ? "NA" : dr["經費來源_學術研究機構"].ToString();
                        result.chk5_1_5 = dr["經費來源_學校單位"].ToString() == "" ? "NA" : dr["經費來源_學校單位"].ToString();
                        result.chk5_1_6 = dr["經費來源_醫療機構"].ToString() == "" ? "NA" : dr["經費來源_醫療機構"].ToString();
                        result.chk5_1_7 = dr["經費來源_其他單位"].ToString() == "" ? "NA" : dr["經費來源_其他單位"].ToString();
                        result.chk7_1 = dr["試驗區域_其他參與試驗的國家"].ToString() == "" ? "NA" : dr["試驗區域_其他參與試驗的國家"].ToString();
                        result.chk7_2 = dr["試驗區域_台灣參與試驗的機構"].ToString() == "" ? "NA" : dr["試驗區域_台灣參與試驗的機構"].ToString();
                        result.chk7_3 = dr["試驗區域_單一中心"].ToString() == "" ? "NA" : dr["試驗區域_單一中心"].ToString();
                        result.PlanYear = dr["申請年度"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    string body = "02_02_01_new_plan.aspx.cs--ReadPlan(string CaseNo)--讀取--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                }
                finally
                {
                    string body = "02_02_01_new_plan.aspx.cs--ReadPlan(string CaseNo)--讀取--" + cmd.CommandText + "--案件編號=" + CaseNo;
                    Log.Info(body);
                    cmd.Cancel();
                    Conn.Close();
                    Conn.Dispose();
                }
            }
            return result;
        }

        [System.Web.Services.WebMethod]
        public static object ReadPlanContact(string CaseNo) //讀取計畫聯絡人
        {
            List<PlanContactClass> result = new List<PlanContactClass>();
            string tmp_CorPI = "";
            string tmp_CorPI2 = "";
            using (SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr = null;
                cmd.Connection = Conn;

                cmd.CommandText = " SELECT a.[id], a.[性質],a.[權限], "
                                + " b.account, b.email, b.[name], b.phone1, b.phone2, b.fex, b.address, b.[job], b.office "
                                + " FROM [計畫聯絡人] AS a "
                                + " LEFT JOIN Account as b on a.[帳號]=b.account "
                                + " WHERE a.[案件編號]=@案件編號 ORDER BY a.[id] ;";
                cmd.Parameters.Add(new SqlParameter("@案件編號", CaseNo));

                try
                {
                    Conn.Open();
                    cmd.ExecuteNonQuery();
                    dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        result.Add(new PlanContactClass()
                        {
                            account = dr["account"].ToString(),
                            name = dr["name"].ToString(),
                            kind = dr["性質"].ToString(),
                            authority = dr["權限"].ToString(),
                            email = dr["email"].ToString(),
                            phone1 = dr["phone1"].ToString(),
                            phone2 = dr["phone2"].ToString(),
                            fex = dr["fex"].ToString(),
                            address = dr["address"].ToString(),
                            job = dr["job"].ToString(),
                            office = dr["office"].ToString(),
                        });
                        if (dr["性質"].ToString() == "協同主持人")
                        {
                            tmp_CorPI += dr["account"].ToString() + ",";
                        }
                        else if (dr["性質"].ToString() == "委託廠商")
                        {
                            tmp_CorPI2 += dr["account"].ToString() + ",";
                        }
                    }
                }
                catch (Exception ex)
                {
                    string body = "02_02_01_new_plan.aspx.cs--ReadPlanContact(string CaseNo)--讀取計畫聯絡人--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                }
                finally
                {
                    string body = "02_02_01_new_plan.aspx.cs--ReadPlanContact(string CaseNo)--讀取計畫聯絡人--" + cmd.CommandText + "--案件編號=" + CaseNo;
                    Log.Info(body);
                    cmd.Cancel();
                    Conn.Close();
                    Conn.Dispose();
                }
            }
            //更新計畫總覽的協同主持人和試驗委託者
            tmp_CorPI = tmp_CorPI.TrimEnd(',');
            tmp_CorPI2 = tmp_CorPI2.TrimEnd(',');
            using (SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = Conn;
                cmd.CommandText = " UPDATE [計畫總覽] SET [協同主持人]=@協同主持人, [試驗委託者]=@試驗委託者 WHERE [案件編號]=@案件編號; ";
                cmd.Parameters.Add(new SqlParameter("@協同主持人", tmp_CorPI));
                cmd.Parameters.Add(new SqlParameter("@試驗委託者", tmp_CorPI2));
                cmd.Parameters.Add(new SqlParameter("@案件編號", CaseNo));

                try
                {
                    Conn.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    string body = "02_02_01_new_plan.aspx.cs--ReadPlanContact(string CaseNo)--讀取計畫聯絡人--更新計畫總覽的協同主持人和試驗委託者--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                }
                finally
                {
                    string body = "02_02_01_new_plan.aspx.cs--ReadPlanContact(string CaseNo)--讀取計畫聯絡人--更新計畫總覽的協同主持人和試驗委託者--" + cmd.CommandText + "--案件編號=" + CaseNo+ "--協同主持人="+ tmp_CorPI + "--協同主持人="+ tmp_CorPI2;
                    Log.Info(body);
                    cmd.Cancel();
                    Conn.Close();
                    Conn.Dispose();
                }
            }

            return result;
        }

        [System.Web.Services.WebMethod]
        public static object ReadPlanContactAdd(string identity,string find, string CaseNo) //讀取聯絡人清單
        {
            //尋找案件編號
            string Account = "";
            using (SqlConnection Conn0 = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
            {
                SqlCommand cmd0 = new SqlCommand();
                SqlDataReader dr0 = null;
                cmd0.Connection = Conn0;
                cmd0.CommandText = " SELECT [帳號] FROM [計畫聯絡人] WHERE [案件編號]=@案件編號 ";
                cmd0.Parameters.Add(new SqlParameter("@案件編號", CaseNo));

                try
                {
                    Conn0.Open();
                    dr0 = cmd0.ExecuteReader();
                    while (dr0.Read())
                    {
                        Account += dr0["帳號"]+",";
                    }
                }
                catch (Exception ex)
                {
                    string body = "02_02_01_new_plan.aspx.cs--ReadPlanContactAdd(string identity,string find, string CaseNo)--讀取聯絡人清單--尋找案件編號--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                }
                finally
                {
                    string body = "02_02_01_new_plan.aspx.cs--ReadPlanContactAdd(string identity,string find, string CaseNo)--讀取聯絡人清單--尋找案件編號--" + cmd0.CommandText + "--案件編號=" + CaseNo;
                    Log.Info(body);
                    cmd0.Cancel();
                    Conn0.Close();
                    Conn0.Dispose();
                }
            }
            string[] AliveAccount = (Account.TrimEnd(',')).Split(',');

            List<PlanContactClass> result = new List<PlanContactClass>();
            //PlanContactClass result = new PlanContactClass();
            using (SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr = null;
                cmd.Connection = Conn;

                string kind2 = "";
                if (identity == "協同主持人") kind2 = "醫師";
                else kind2 = identity;

                if (find == "")
                {
                    cmd.CommandText = " SELECT account,[name], office, [job], address, phone2, phone1, fex, email FROM Account WHERE [identity]=@identity AND [status]=1 AND [allow_check]=1 ";
                    cmd.Parameters.Add(new SqlParameter("@identity", kind2));
                }
                else
                {
                    cmd.CommandText = " SELECT account,[name], office, [job], address, phone2, phone1, fex, email FROM Account WHERE [identity]=@identity AND [status]=1 AND [allow_check]=1 ";
                    cmd.CommandText += " AND [name] LIKE '%"+find+"%' ";
                    cmd.Parameters.Add(new SqlParameter("@identity", kind2));
                }
                
                for (int i = 0; i < AliveAccount.Length; i++)
                {
                    cmd.CommandText += " AND account != '" + AliveAccount[i]+"' ";
                }
                cmd.CommandText += " ; ";

                try
                {
                    Conn.Open();
                    cmd.ExecuteNonQuery();
                    dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        result.Add(new PlanContactClass()
                        {
                            account = dr["account"].ToString(),
                            kind = identity,
                            name = dr["name"].ToString(),
                            email = dr["email"].ToString(),
                            phone1 = dr["phone1"].ToString(),
                            phone2 = dr["phone2"].ToString(),
                            fex = dr["fex"].ToString(),
                            address = dr["address"].ToString(),
                            job = dr["job"].ToString(),
                            office = dr["office"].ToString(),
                        });
                    }
                }
                catch (Exception ex)
                {
                    string body = "02_02_01_new_plan.aspx.cs--ReadPlanContactAdd(string identity,string find, string CaseNo)--讀取聯絡人清單--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                }
                finally
                {
                    string body = "02_02_01_new_plan.aspx.cs--ReadPlanContactAdd(string identity,string find, string CaseNo)--讀取聯絡人清單--" + cmd.CommandText + "--identity=" + kind2;
                    Log.Info(body);
                    cmd.Cancel();
                    Conn.Close();
                    Conn.Dispose();
                }
            }
            return result;
        }

        [System.Web.Services.WebMethod]
        public static object DeleteThisCorPI(string account) //刪除聯絡人
        {
            using (SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = Conn;
                cmd.CommandText = " DELETE FROM [計畫聯絡人] WHERE [帳號]=@帳號 ";
                cmd.Parameters.Add(new SqlParameter("@帳號", account));
                
                try
                {
                    Conn.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    string body = "02_02_01_new_plan.aspx.cs--DeleteThisCorPI(string account)--刪除聯絡人--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                }
                finally
                {
                    string body = "02_02_01_new_plan.aspx.cs--DeleteThisCorPI(string account)--刪除聯絡人--" + cmd.CommandText + "--帳號=" + account;
                    Log.Info(body);
                    cmd.Cancel();
                    Conn.Close();
                    Conn.Dispose();
                }
            }
            return null;
        }

        [System.Web.Services.WebMethod]
        public static object ReadPlan3(string CaseNo) //讀取計畫總覽資料
        {
            Plan3Class result = new Plan3Class();
            using (SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr = null;
                cmd.Connection = Conn;

                cmd.CommandText = " SELECT * FROM [計畫總覽] WHERE [案件編號]=@案件編號;";
                cmd.Parameters.Add(new SqlParameter("@案件編號", CaseNo));

                try
                {
                    Conn.Open();
                    cmd.ExecuteNonQuery();
                    dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        //計畫主持人
                        using (SqlConnection Conn0 = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
                        {
                            SqlCommand cmd0 = new SqlCommand();
                            SqlDataReader dr0 = null;
                            cmd0.Connection = Conn0;

                            cmd0.CommandText = " SELECT [name] AS [姓名] FROM Account WHERE account=@account";
                            cmd0.Parameters.Add(new SqlParameter("@account", dr["計畫主持人"].ToString()));

                            try
                            {
                                Conn0.Open();
                                cmd0.ExecuteNonQuery();
                                dr0 = cmd0.ExecuteReader();
                                while (dr0.Read())
                                {
                                    result.PI += dr0["姓名"].ToString();
                                }
                            }
                            catch (Exception ex)
                            {
                                string body = "02_02_01_new_plan.aspx.cs--ReadPlan3(string CaseNo)--讀取計畫總覽資料--計畫主持人--" + ex.Message;
                                SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                                Log.Error(body);
                            }
                            finally
                            {
                                string body = "02_02_01_new_plan.aspx.cs--ReadPlan3(string CaseNo)--讀取計畫總覽資料--計畫主持人--" + cmd0.CommandText + "--account=" + dr["計畫主持人"].ToString() + "--計畫主持人=" + result.PI;
                                Log.Info(body);
                                cmd0.Cancel();
                                Conn0.Close();
                                Conn0.Dispose();
                            }
                        }
                        //協同主持人
                        string[] sCorPI = dr["協同主持人"].ToString().Split(',');
                        foreach (string x in sCorPI)
                        {
                            using (SqlConnection Conn0 = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
                            {
                                SqlCommand cmd0 = new SqlCommand();
                                SqlDataReader dr0 = null;
                                cmd0.Connection = Conn0;

                                cmd0.CommandText = " SELECT [name] AS [姓名] FROM Account WHERE account=@account";
                                cmd0.Parameters.Add(new SqlParameter("@account", x));

                                try
                                {
                                    Conn0.Open();
                                    cmd0.ExecuteNonQuery();
                                    dr0 = cmd0.ExecuteReader();
                                    while (dr0.Read())
                                    {
                                        result.CorPI += dr0["姓名"].ToString() + ", ";
                                    }
                                }
                                catch (Exception ex)
                                {
                                    string body = "02_02_01_new_plan.aspx.cs--ReadPlan3(string CaseNo)--讀取計畫總覽資料--協同主持人--" + ex.Message;
                                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                                    Log.Error(body);
                                }
                                finally
                                {
                                    string body = "02_02_01_new_plan.aspx.cs--ReadPlan3(string CaseNo)--讀取計畫總覽資料--協同主持人--" + cmd0.CommandText + "--account=" + x + "--協同主持人=" + result.CorPI;
                                    Log.Info(body);
                                    cmd0.Cancel();
                                    Conn0.Close();
                                    Conn0.Dispose();
                                }
                            }
                        }
                        if (result.CorPI != null) result.CorPI = result.CorPI.TrimEnd(' ', ',');
                        else result.CorPI = "";

                        //委託廠商
                        string[] sCorPI2 = dr["試驗委託者"].ToString().Split(',');
                        foreach (string x in sCorPI2)
                        {
                            using (SqlConnection Conn0 = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
                            {
                                SqlCommand cmd0 = new SqlCommand();
                                SqlDataReader dr0 = null;
                                cmd0.Connection = Conn0;

                                cmd0.CommandText = " SELECT [name] AS [姓名] FROM Account WHERE account=@account";
                                cmd0.Parameters.Add(new SqlParameter("@account", x));

                                try
                                {
                                    Conn0.Open();
                                    cmd0.ExecuteNonQuery();
                                    dr0 = cmd0.ExecuteReader();
                                    while (dr0.Read())
                                    {
                                        result.CorPI2 += dr0["姓名"].ToString() + ", ";
                                    }
                                }
                                catch (Exception ex)
                                {
                                    string body = "02_02_01_new_plan.aspx.cs--ReadPlan3(string CaseNo)--讀取計畫總覽資料--委託廠商--" + ex.Message;
                                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                                    Log.Error(body);
                                }
                                finally
                                {
                                    string body = "02_02_01_new_plan.aspx.cs--ReadPlan3(string CaseNo)--讀取計畫總覽資料--委託廠商--" + cmd0.CommandText + "--account=" + x + "--委託廠商=" + result.CorPI2;
                                    Log.Info(body);
                                    cmd0.Cancel();
                                    Conn0.Close();
                                    Conn0.Dispose();
                                }
                            }
                        }
                        if (result.CorPI2 != null) result.CorPI2 = result.CorPI2.TrimEnd(' ', ',');
                        else result.CorPI2 = "";

                        //其他
                        result.PlanNameCH = dr["中文計畫名稱"].ToString();
                        result.PlanNameEN = dr["英文計畫名稱"].ToString();
                        result.PICaseNo = dr["計畫編號"].ToString();
                        result.TestMedicineItem = dr["試驗藥品醫療器材"].ToString();
                        result.PlanLocation = dr["試驗執行地點"].ToString();
                        result.PlanLocationOther = dr["試驗執行地點_其他"].ToString();
                        result.PlanOffice = dr["執行本試驗之其他機構"].ToString();
                        result.PlanYear = dr["進度期限_年"].ToString();
                        result.PlanMonth = dr["進度期限_月"].ToString();
                        result.PeopleOld = dr["受試者年齡層"].ToString();
                        result.People1 = dr["受試者人數_本院"].ToString();
                        result.People2 = dr["受試者人數_多中心總人數_台灣"].ToString();
                        result.People3 = dr["受試者人數_多中心總人數_全球"].ToString();
                        result.Way = dr["收納受試者方式"].ToString();
                        result.SecretWay = dr["受試者資料保密方式"].ToString();
                        result.CheckPeople = dr["會審視受試者資料的名單"].ToString();
                        result.Special = dr["特殊族群"].ToString();
                        result.HavePay = dr["受試者營養補助交通費_有無"].ToString();
                        result.PayWay = dr["受試者營養補助交通費_每次總共"].ToString();
                        result.Pay = dr["受試者營養補助交通費_元"].ToString();
                        result.Medicine = dr["研究用藥品學名"].ToString();
                        result.Item = dr["商品名"].ToString();
                        result.Type = dr["規格"].ToString();
                        result.Vender = dr["製造廠商"].ToString();
                        result.Country = dr["製造國別"].ToString();
                        result.Section = dr["科別"].ToString();
                        result.PeopleOldOther = dr["受試者年齡層_其他"].ToString();
                        result.WayOther = dr["收納受試者方式_其他"].ToString();
                        result.SecretWayOther = dr["受試者資料保密方式_其他"].ToString();
                        result.SpecialOther = dr["特殊族群_其他"].ToString();
                    }

                }
                catch (Exception ex)
                {
                    string body = "02_02_01_new_plan.aspx.cs--ReadPlan3(string CaseNo)--讀取計畫總覽資料--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                }
                finally
                {
                    string body = "02_02_01_new_plan.aspx.cs--ReadPlan3(string CaseNo)--讀取計畫總覽資料--" + cmd.CommandText + "--CaseNo=" + CaseNo;
                    Log.Info(body);
                    cmd.Cancel();
                    Conn.Close();
                    Conn.Dispose();
                }
            }

            return result;
        }
        [System.Web.Services.WebMethod]
        public static object SavePlan3(object tmp) //儲存計畫總覽資料
        {
            string strJson = JsonConvert.SerializeObject(tmp);
            Plan3Class data = JsonConvert.DeserializeObject<Plan3Class>(strJson);
        
            using (SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = Conn;
        
                cmd.CommandText = " UPDATE [計畫總覽] SET "
                                + " [計畫編號] =@計畫編號 ,[試驗藥品醫療器材] =@試驗藥品醫療器材 ,[中文計畫名稱] =@中文計畫名稱 ,[英文計畫名稱] =@英文計畫名稱 "
                                + " ,[試驗執行地點] =@試驗執行地點 ,[試驗執行地點_其他] =@試驗執行地點_其他 ,[執行本試驗之其他機構] =@執行本試驗之其他機構 "
                                + " ,[進度期限_年] =@進度期限_年 ,[進度期限_月] =@進度期限_月 "
                                + " ,[受試者年齡層] =@受試者年齡層 ,[受試者年齡層_其他] =@受試者年齡層_其他 "
                                + " ,[受試者人數_本院] =@受試者人數_本院 ,[受試者人數_多中心總人數_台灣] =@受試者人數_多中心總人數_台灣 ,[受試者人數_多中心總人數_全球] =@受試者人數_多中心總人數_全球 "
                                + " ,[收納受試者方式] =@收納受試者方式 ,[收納受試者方式_其他] =@收納受試者方式_其他 "
                                + " ,[受試者資料保密方式] =@受試者資料保密方式 ,[受試者資料保密方式_其他] =@受試者資料保密方式_其他 ,[會審視受試者資料的名單] =@會審視受試者資料的名單 "
                                + " ,[特殊族群] =@特殊族群 ,[特殊族群_其他] =@特殊族群_其他 "
                                + " ,[受試者營養補助交通費_有無] =@受試者營養補助交通費_有無 ,[受試者營養補助交通費_每次總共] =@受試者營養補助交通費_每次總共 "
                                + " ,[受試者營養補助交通費_元] =@受試者營養補助交通費_元 ,[研究用藥品學名] =@研究用藥品學名 ,[商品名] =@商品名 "
                                + " ,[規格] =@規格 ,[製造廠商] =@製造廠商 ,[製造國別] =@製造國別 ,[科別] =@科別 WHERE [案件編號]=@案件編號;";

                cmd.Parameters.Add(new SqlParameter("@案件編號", data.CaseNo));
                cmd.Parameters.Add(new SqlParameter("@計畫編號", data.PICaseNo));
                cmd.Parameters.Add(new SqlParameter("@試驗藥品醫療器材", data.TestMedicineItem));
                cmd.Parameters.Add(new SqlParameter("@中文計畫名稱", data.PlanNameCH));
                cmd.Parameters.Add(new SqlParameter("@英文計畫名稱", data.PlanNameEN));
                cmd.Parameters.Add(new SqlParameter("@試驗執行地點", data.PlanLocation));
                cmd.Parameters.Add(new SqlParameter("@試驗執行地點_其他", data.PlanLocationOther));
                cmd.Parameters.Add(new SqlParameter("@執行本試驗之其他機構", data.PlanOffice));
                cmd.Parameters.Add(new SqlParameter("@進度期限_年",Convert.ToInt32(data.PlanYear)));
                cmd.Parameters.Add(new SqlParameter("@進度期限_月", Convert.ToInt32(data.PlanMonth)));
                cmd.Parameters.Add(new SqlParameter("@受試者年齡層", data.PeopleOld));
                cmd.Parameters.Add(new SqlParameter("@受試者年齡層_其他", data.PeopleOldOther));
                cmd.Parameters.Add(new SqlParameter("@受試者人數_本院", Convert.ToInt32(data.People1)));
                cmd.Parameters.Add(new SqlParameter("@受試者人數_多中心總人數_台灣", Convert.ToInt32(data.People2)));
                cmd.Parameters.Add(new SqlParameter("@受試者人數_多中心總人數_全球", Convert.ToInt32(data.People3)));
                cmd.Parameters.Add(new SqlParameter("@收納受試者方式", data.Way));
                cmd.Parameters.Add(new SqlParameter("@收納受試者方式_其他", data.WayOther));
                cmd.Parameters.Add(new SqlParameter("@受試者資料保密方式", data.SecretWay));
                cmd.Parameters.Add(new SqlParameter("@受試者資料保密方式_其他", data.SecretWayOther));
                cmd.Parameters.Add(new SqlParameter("@會審視受試者資料的名單", data.CheckPeople));
                cmd.Parameters.Add(new SqlParameter("@特殊族群", data.Special));
                cmd.Parameters.Add(new SqlParameter("@特殊族群_其他", data.SpecialOther));
                cmd.Parameters.Add(new SqlParameter("@受試者營養補助交通費_有無", data.HavePay));
                cmd.Parameters.Add(new SqlParameter("@受試者營養補助交通費_每次總共", data.PayWay));
                cmd.Parameters.Add(new SqlParameter("@受試者營養補助交通費_元", data.Pay));
                cmd.Parameters.Add(new SqlParameter("@研究用藥品學名", data.Medicine));
                cmd.Parameters.Add(new SqlParameter("@商品名", data.Item));
                cmd.Parameters.Add(new SqlParameter("@規格", data.Type));
                cmd.Parameters.Add(new SqlParameter("@製造廠商", data.Vender));
                cmd.Parameters.Add(new SqlParameter("@製造國別", data.Country));
                cmd.Parameters.Add(new SqlParameter("@科別", data.Section));

                try
                {
                    Conn.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    string body = "02_02_01_new_plan.aspx.cs--SavePlan3(object tmp)--儲存計畫總覽資料--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                }
                finally
                {
                    string body = "02_02_01_new_plan.aspx.cs--SavePlan3(object tmp)--儲存計畫總覽資料--" + cmd.CommandText + "--CaseNo=" + data.CaseNo;
                    Log.Info(body);
                    cmd.Cancel();
                    Conn.Close();
                    Conn.Dispose();
                }
            }
            return null;
        }

        [System.Web.Services.WebMethod]
        public static string SubmitPlan(string CaseNo, string IRBNoType) //送出申請
        {
            //產生IRB編號
            string IRBNo = DateTime.Now.Year.ToString().Substring(2,2);
            string IRBNo2 = "";
            if (IRBNoType != "MMHIS")
            {
                IRBNo += IRBNoType.Split('_')[0];
                IRBNo2 = "e";
            }
            else
            {
                IRBNo += IRBNoType;
                IRBNo2 = "e";
            }

            using (SqlConnection Conn0 = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
            {
                SqlCommand cmd0 = new SqlCommand();
                SqlDataReader dr0 = null;
                cmd0.Connection = Conn0;
                cmd0.CommandText = " SELECT TOP 1 [IRB編號] FROM [IRB編號] WHERE [IRB編號] LIKE '"+ IRBNo +"%"+ IRBNo2 +"%' ORDER BY [id] DESC ";
                try
                {
                    int n = 1;
                    Conn0.Open();
                    dr0 = cmd0.ExecuteReader();
                    while (dr0.Read())
                    {
                        string tmp = dr0["IRB編號"].ToString();
                        if (tmp.Substring(2, 1) == "M")
                        {
                            n += Convert.ToInt32(tmp.Substring(7, 3));
                        }
                        else
                        {
                            n += Convert.ToInt32(tmp.Substring(4, 3));
                        }

                    }
                    if (n < 10) IRBNo += "00" + n.ToString();
                    else if (n < 100) IRBNo += "0" + n.ToString();
                    else IRBNo += n.ToString();

                    if (IRBNoType != "MMHIS") IRBNo += IRBNoType.Split('_')[1];
                    IRBNo += IRBNo2;
                }
                catch (Exception ex)
                {
                    string body = "02_02_01_new_plan.aspx.cs--SubmitPlan(string CaseNo, string IRBNoType)--送出申請--尋找IRB編號--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                }
                finally
                {
                    string body = "02_02_01_new_plan.aspx.cs--SubmitPlan(string CaseNo, string IRBNoType)--送出申請--尋找IRB編號--" + cmd0.CommandText + "--CaseNo=" + CaseNo;
                    Log.Info(body);
                    cmd0.Cancel();
                    Conn0.Close();
                    Conn0.Dispose();
                }
            }

            using (SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = Conn;
                cmd.CommandText = " UPDATE [計畫執行進度] SET [送審進度] = '審核中',[更新時間] = GETDATE() WHERE [案件編號]=@案件編號; "
                                + " INSERT INTO [案件追蹤] ([案件編號],[日期時間],[從角色],[從角色帳號],[到角色],[到角色帳號],[內容]) VALUES "
                                + " (@案件編號, GETDATE(), '計畫主持人', @計畫主持人帳號, '秘書', '', '案件送審'); "
                                + " INSERT INTO [IRB編號] ([案件編號],[IRB編號]) VALUES (@案件編號,@IRB編號); ";

                cmd.Parameters.Add(new SqlParameter("@案件編號", CaseNo));
                cmd.Parameters.Add(new SqlParameter("@IRB編號", IRBNo));
                cmd.Parameters.Add(new SqlParameter("@計畫主持人帳號", HttpContext.Current.Session["Account"]));


                try
                {
                    Conn.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    string body = "02_02_01_new_plan.aspx.cs--SubmitPlan(string CaseNo)--案件送審--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                }
                finally
                {
                    string body = "02_02_01_new_plan.aspx.cs--SubmitPlan(string CaseNo)--案件送審--" + cmd.CommandText + "--案件編號=" + CaseNo;
                    Log.Info(body);
                    cmd.Cancel();
                    Conn.Close();
                    Conn.Dispose();
                }
            }
            return "done";
        }
        [System.Web.Services.WebMethod]
        public static object ReadIRBNo(string CaseNo) //讀取IRB編號
        {
            string result ="";
            using (SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CTOConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr = null;
                cmd.Connection = Conn;

                cmd.CommandText = " SELECT [IRB編號] FROM  [IRB編號] WHERE [案件編號]=@案件編號;";
                cmd.Parameters.Add(new SqlParameter("@案件編號", CaseNo));

                try
                {
                    Conn.Open();
                    cmd.ExecuteNonQuery();
                    dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        result = dr["IRB編號"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    string body = "02_02_01_new_plan.aspx.cs--ReadIRBNo(string CaseNo)--讀取IRB編號--" + ex.Message;
                    SendEmail sendEmail = new SendEmail("IRB錯誤訊息", body, new List<string> { "FurongLiu@GGA.ASIA" });
                    Log.Error(body);
                }
                finally
                {
                    string body = "02_02_01_new_plan.aspx.cs--ReadIRBNo(string CaseNo)--讀取IRB編號--" + cmd.CommandText + "--案件編號=" + CaseNo;
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