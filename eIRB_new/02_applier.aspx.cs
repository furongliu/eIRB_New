using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eIRB_new
{
    public partial class _02_applier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label label = new Label();
            LoginName.InnerText=(Session["UserName"].ToString());
        }
    }
}