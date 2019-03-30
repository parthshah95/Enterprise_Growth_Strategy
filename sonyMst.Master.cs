using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SonyWeb_3
{
    public partial class sonyMst : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["Name"])))
                Response.Redirect("~/login.aspx");
            if (!IsPostBack)
            {
                lblUser.Text = Convert.ToString(Session["Name"]);
                imgUser.ImageUrl = "~/userData/userPic/" + Convert.ToString(Session["userID"]) + ".jpg";

                if (Convert.ToInt64(Session["userType"]) == 1)
                {
                    adminis.Visible = true;
                }
                else
                {
                    adminis.Visible = false;
                }
            }
        }
    }
}