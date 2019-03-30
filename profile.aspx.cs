using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace  SonyWeb_3
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            liVal.Text = "";
            if (!IsPostBack)
            {
                getUserDetail();
            }
        }

        private void getUserDetail()
        {
            try
            {
                decimal userID = Convert.ToDecimal(Session["userID"]);
                using (SalesDBEntities1 objEntity = new SalesDBEntities1())
                {
                    userDetail objProNew = objEntity.userDetails.FirstOrDefault(Pro => Pro.userID == userID);
                    if (objProNew != null)
                    {


                        txtState.Text = objProNew.state;

                        txtAddLine1.Text = objProNew.addressLine1;
                        txtAddressLine2.Text = objProNew.addressLine2;
                        txtCity.Text = objProNew.city;
                        txtFName.Text = objProNew.firstName;
                        txtLName.Text = objProNew.lastName;

                        txtContact.Text = objProNew.contactNumber;
                        txtPass.Text = StringCipher.DecryptStringAES(objProNew.userPass);
                        txtDOB.Text = Convert.ToString(objProNew.DOB);

                        objEntity.SaveChanges();

                        string filename = objProNew.userID.ToString() + ".jpg";
                        imgPic.ImageUrl = "~/userData/userPic/" + filename;
                        
                    }
                }
            }
            catch (Exception ex)
            {
                appOperations.LogException(ex, "User Save");
                liVal.Text = ex.Message;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                decimal userID = Convert.ToDecimal(Session["userID"]);
                using (SalesDBEntities1 objEntity = new SalesDBEntities1())
                {
                    userDetail objProNew = objEntity.userDetails.FirstOrDefault(Pro => Pro.userID == userID);
                    if (objProNew != null)
                    {


                        objProNew.state = txtState.Text;

                        objProNew.addressLine1 = txtAddLine1.Text;
                        objProNew.addressLine2 = txtAddressLine2.Text;
                        objProNew.city = txtCity.Text;
                        objProNew.firstName = txtFName.Text;
                        objProNew.lastName = txtLName.Text;

                        objProNew.contactNumber = txtContact.Text;
                        objProNew.userPass = StringCipher.EncryptStringAES(txtPass.Text);
                        objProNew.DOB = Convert.ToDateTime(txtDOB.Text);

                        objEntity.SaveChanges();

                        string filename = objProNew.userID.ToString() + ".jpg";
                        flPhoto.SaveAs(Server.MapPath("~/userData/userPic/" + filename));


                        Response.Redirect("~/adUsers.aspx", false);
                    }
                }
            }
            catch (Exception ex)
            {
                appOperations.LogException(ex, "User Save");
                liVal.Text = ex.Message;
            }
        }
    }
}