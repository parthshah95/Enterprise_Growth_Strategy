using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SonyWeb_3
{
    public partial class adAddUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            liVal.Text = "";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                using (SalesDBEntities1 objEntity = new SalesDBEntities1())
                {
                    userDetail objpro = objEntity.userDetails.FirstOrDefault(Pro => Pro.userName == txtUserName.Text);
                    if (objpro != null)
                    {
                        liVal.Text = "User Name Already Exists. <br/> Please Enter different Name.";
                        return;
                    }
                    else
                    {
                        userDetail objProNew = new userDetail();
                        if (ddlAccount.SelectedValue != "0")
                            objProNew.accountID = Convert.ToDecimal(ddlAccount.SelectedValue);
                        if (ddlStore.SelectedValue != "0")
                            objProNew.storeID = Convert.ToDecimal(ddlStore.SelectedValue);
                        if (ddlUserType.SelectedValue != "0")
                            objProNew.userGroupID = Convert.ToDecimal(ddlUserType.SelectedValue);
                        objProNew.state = txtState.Text;
                        objProNew.isActive = true;
                        objProNew.CreatedDate = DateTime.Now;
                        objProNew.addressLine1 = txtAddLine1.Text;
                        objProNew.addressLine2 = txtAddressLine2.Text;
                        objProNew.city = txtCity.Text;
                        objProNew.firstName = txtFName.Text;
                        objProNew.lastName = txtLName.Text;
                        objProNew.CreatedBy = Convert.ToDecimal(Session["userID"]);
                        objProNew.contactNumber = txtContact.Text;
                        objProNew.userName = txtUserName.Text;
                        objProNew.userPass = StringCipher.EncryptStringAES(txtPass.Text);
                        objProNew.DOB = Convert.ToDateTime(txtDOB.Text);
                        objEntity.userDetails.Add(objProNew);
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