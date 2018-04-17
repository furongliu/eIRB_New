using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace eIRB_new
{
    public class CRUDClass
    {
    }
    public class AccountClass
    {
        public int id { get; set; }//id
        public string account { get; set; }//帳號
        public int status { get; set; }//帳戶停用
        public int allow_check { get; set; }//秘書允許帳號加入
        public string name { get; set; }//姓名
        public string phone1 { get; set; }//手機
        public string phone2 { get; set; }//辦公室電話
        public string fex { get; set; }//傳真
        public string address { get; set; }//地址
        public string job { get; set; }//職稱
        public string office { get; set; }//工作單位
        public string identity { get; set; }//身分
        public string email { get; set; }//Email
        public string password { get; set; }//密碼
        public string note { get; set; }//備註
        public string date { get; set; }//申請帳號時間
        public string update_date { get; set; }//最後更新時間
    }

    public class VisitClass
    {
        public string account { get; set; }//帳號
        public string name { get; set; }//姓名
        public string identity { get; set; }//身分
        public string ip { get; set; }//ip
        public string date { get; set; }//登入時間
    }
    public class EditPlanClass
    {
        public string CaseNo { get; set; }
        public string CHName { get; set; }
        public string CaseType { get; set; }
        public string PI { get; set; }
        public string CorPI { get; set; }
        public string Authority { get; set; }
        public string CorPI2 { get; set; }
        public string IRBNo { get; set; }
        public string TheDate { get; set; }
        public string Status { get; set; }
        public string PlanNo { get; set; }
    }

    public class PlanObject
    {
        public string PlanYear { get; set; }//申請年度
        public string CaseNo { get; set; }//案件編號
        public string chk1 { get; set; }//案件類別
        public string chk2 { get; set; }//是否須送署審查
        public string chk3 { get; set; }//案件種類
        public string chk4 { get; set; }//試驗階段
        public string chk5 { get; set; }//經費來源
        public string chk6 { get; set; }//使用藥物或器材提供者
        public string chk7 { get; set; }//試驗區域
        public string chk3_1 { get; set; }//案件種類--醫療法定義之人體試驗子選項
        public string chk3other { get; set; }//案件種類--其他
        public string chk4other { get; set; }//試驗階段--BABE--主試驗預試驗
        public string chk5_1_1 { get; set; }//經費來源--有--贊助廠商
        public string chk5_1_2 { get; set; }//經費來源--有--本院醫學研究部
        public string chk5_1_3 { get; set; }//經費來源--有--中央主管機關
        public string chk5_1_4 { get; set; }//經費來源--有--學術研究機構
        public string chk5_1_5 { get; set; }//經費來源--有--學校單位
        public string chk5_1_6 { get; set; }//經費來源--有--醫療機構
        public string chk5_1_7 { get; set; }//經費來源--有--其他單位
        public string chk7_1 { get; set; }//試驗區域--多國多中心--其他參與試驗的國家
        public string chk7_2 { get; set; }//試驗區域--多國多中心/台灣多中心--台灣燦預試驗的機構
        public string chk7_3 { get; set; }//試驗區域--單一中心

        //
        public string account { get; set; }
        public string kind { get; set; }
        public string authority { get; set; }
        public string job { get; set; }
        public string office { get; set; }
        public string phone2 { get; set; }
        public string phone1 { get; set; }
        public string fex { get; set; }
        public string email { get; set; }
        public string address { get; set; }
        //
        public string IRBNo { get; set; }
    }

    public class PlanContactClass
    {
        public string account { get; set; }
        public string name { get; set; }
        public string kind { get; set; }
        public string authority { get; set; }
        public string email { get; set; }
        public string phone1 { get; set; }
        public string phone2 { get; set; }
        public string fex { get; set; }
        public string address { get; set; }
        public string job { get; set; }
        public string office { get; set; }
    }

    public class Plan3Class//計畫總覽table 資料庫[計畫總覽]
    {
        //以下註解為[計畫總覽]的欄位名稱
        public string CaseNo { get; set; }//案件編號
        public string PICaseNo { get; set; }//計畫編號
        public string TestMedicineItem { get; set; }//試驗藥品醫療器材
        public string PI { get; set; }//計畫主持人
        public string CorPI { get; set; }//協同主持人
        public string CorPI2 { get; set; }//試驗委託者
        public string PlanNameCH { get; set; }//中文計畫名稱
        public string PlanNameEN { get; set; }//英文計畫名稱
        public string PlanLocation { get; set; }//試驗執行地點
        public string PlanLocationOther { get; set; }//試驗執行地點_其他
        public string PlanOffice { get; set; }//執行本試驗之其他機構
        public string PlanYear { get; set; }//進度期限_年
        public string PlanMonth { get; set; }//進度期限_月
        public string PeopleOld { get; set; }//受試者年齡層
        public string People1 { get; set; }//受試者人數_本院
        public string People2 { get; set; }//受試者人數_多中心總人數_台灣
        public string People3 { get; set; }//受試者人數_多中心總人數_全球
        public string Way { get; set; }//收納受試者方式
        public string SecretWay { get; set; }//受試者資料保密方式
        public string CheckPeople { get; set; }//會審視受試者資料的名單
        public string Special { get; set; }//特殊族群
        public string HavePay { get; set; }//受試者營養補助交通費_有無
        public string PayWay { get; set; }//受試者營養補助交通費_每次總共
        public string Pay { get; set; }//受試者營養補助交通費_元
        public string Medicine { get; set; }//研究用藥品學名
        public string Item { get; set; }//商品名
        public string Type { get; set; }//規格
        public string Vender { get; set; }//製造廠商
        public string Country { get; set; }//製造國別
        public string Section { get; set; }//科別
        public string PeopleOldOther { get; set; }//受試者年齡層_其他
        public string WayOther { get; set; }//收納受試者方式_其他
        public string SecretWayOther { get; set; }//受試者資料保密方式_其他
        public string SpecialOther { get; set; }//特殊族群_其他

    }

    public class SendEmail
    {
        private static log4net.ILog Log { get; set; } = log4net.LogManager.GetLogger(typeof(SendEmail));
        public SendEmail(string sSubject, string sBody, List<string> lTo)
        {
            try
            {
                MailMessage mail = new MailMessage();
                //SmtpClient SmtpServer = new SmtpClient("itmail.GGA.ASIA");
                mail.IsBodyHtml = true;
                mail.BodyEncoding = System.Text.Encoding.UTF8;
                mail.From = new MailAddress("創源測試用信箱<GGAMSCTEST@gmail.com>");
                //mail.To.Add("FurongLiu@GGA.ASIA");
                if (lTo != null)
                {
                    foreach (var v in lTo)
                    {
                        mail.To.Add(v);
                    }
                }
                mail.Subject = sSubject;
                mail.Body = sBody + "</p><p>From IRB 重寫</p>";

                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                SmtpServer.Port = 587;
                SmtpServer.Credentials = new System.Net.NetworkCredential("GGAMSCTEST", "jbeqgipjmbsuulgi");//二階段認證碼 http://demo.tc/post/807
                SmtpServer.EnableSsl = true;

                SmtpServer.Send(mail);
                var vEmailTo = string.Empty;
                foreach (var v in mail.To)
                {
                    vEmailTo += string.Format("{0},", v);
                }
                 Log.Info("Sent EMail to" + vEmailTo + " ; Body " + mail.Body + " ; Subject " + mail.Subject);
            }
            catch (Exception ex)
            {
                 Log.Fatal("EMail Function is Fatal :" + ex.Message);
            }
        }
    }
}