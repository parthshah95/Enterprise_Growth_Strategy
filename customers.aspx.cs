using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace  SonyWeb_3
{
    public partial class customers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            liVal.Text = "";
        }
        
        protected void lbtnDetail_Click1(object sender, EventArgs e)
        {
            try
            {
                LinkButton lbtn = (LinkButton)sender;
                Session["custID"] = Convert.ToInt64(lbtn.CommandArgument);
                Response.Redirect("~/cutomrDetail.aspx", false);
            }
            catch (Exception ex)
            {
                appOperations.LogException(ex, "");
                liVal.Text = ex.Message;
            }
        }

        protected void lbtnInqiry_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lbtn = (LinkButton)sender;
                Session["inqID"] = Convert.ToInt64(lbtn.CommandArgument);
                Response.Redirect("~/inquiryNew.aspx", false);
            }
            catch (Exception ex)
            {
                appOperations.LogException(ex, "");
                liVal.Text = ex.Message;
            }
        }
    }
}