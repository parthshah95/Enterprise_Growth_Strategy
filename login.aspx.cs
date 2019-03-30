using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SonyWeb_3
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblVal.Text = "";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // validate the Captcha to check we're not dealing with a bot
            bool isHuman = ExampleCaptcha.Validate(CaptchaCodeTextBox.Text);

            CaptchaCodeTextBox.Text = null; // clear previous user input

            if (!isHuman)
            {
                lblVal.Text = "Invalid Code.";
                return;
            }
            else
            {
                try
                {

                    using (SalesDBEntities1 objEntity = new SalesDBEntities1())
                    {
                        userDetail objUser = objEntity.userDetails.FirstOrDefault(users => users.userName == txtUserName.Text);
                        if (objUser != null)
                        {
                            if (StringCipher.DecryptStringAES(objUser.userPass) == txtPass.Text)
                            {

                                Session["userID"] = objUser.userID;
                                Session["userType"] = objUser.userGroupID;
                                Session["userName"] = txtUserName.Text;
                                Session["Name"] = objUser.firstName;
                                Response.Redirect("~/Dashboard.aspx", false);
                            }
                            else
                                lblVal.Text = "Please verify your Password";

                        }
                        else
                        {
                            lblVal.Text = "Please check user name and password.";
                        }
                    }
                }
                catch (Exception ex)
                {
                    appOperations.LogException(ex, "Login -Button Click");
                    lblVal.Text = "Something went wrong.<br/>Please try again later.";
                }
            }
        }
    }
}