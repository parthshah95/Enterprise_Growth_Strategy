using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace  SonyWeb_3
{
    public partial class cutomrDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            liVal.Text = "";
            if (!IsPostBack)
            {
                getCust();
            }
        }

        private void getCust()
        {
            try
            {
                using (SalesDBEntities1 objEntity = new SalesDBEntities1())
                {
                    decimal custID = Convert.ToDecimal(Session["custID"]);
                    customerMST objProNew = objEntity.customerMSTs.FirstOrDefault(cust => cust.customerID == custID);
                    if (objProNew != null)
                    {
                        txtCell.Text = objProNew.cellNumber;
                        txtCompany.Text = objProNew.companyName;

                        if (ddlStatus.Items.FindByValue(Convert.ToInt64(objProNew.customerStatusID).ToString())!=null)
                            ddlStatus.Items.FindByValue(Convert.ToInt64(objProNew.customerStatusID).ToString()).Selected = true;
                        if (ddlType.Items.FindByValue(Convert.ToInt64(objProNew.customerTypeID).ToString()) != null)
                            ddlType.Items.FindByValue(Convert.ToInt64(objProNew.customerTypeID).ToString()).Selected = true;
                        txtFName.Text = objProNew.firstName;
                        txtHome.Text = objProNew.homeNumber;

                        txtLName.Text = objProNew.lastName;
                        txtMName.Text = objProNew.middelName;

                        txtAddress1.Text = objProNew.addressLine1;
                        txtAddress2.Text = objProNew.addressLine2;
                        txtCity.Text = objProNew.city;
                        txtDOB.Text = Convert.ToString(objProNew.DOB);
                        txtEmail.Text = objProNew.email;
                        txtWebSite.Text = objProNew.website;
                        txtWorkPhone.Text = objProNew.workPhone;
                    }
                    else
                    {
                        liVal.Text = "Customer Not Found.";
                    }
                }
            }
            catch (Exception ex)
            {
                appOperations.LogException(ex, "");
                liVal.Text = ex.Message;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                using (SalesDBEntities1 objEntity = new SalesDBEntities1())
                {
                    decimal custID = Convert.ToDecimal(Session["custID"]);
                    customerMST objProNew = objEntity.customerMSTs.FirstOrDefault(cust => cust.customerID == custID);
                    if (objProNew != null)
                    {
                        objProNew.cellNumber = txtCell.Text;
                        objProNew.companyName = txtCompany.Text;
                        objProNew.LastmodifiedBy = Convert.ToDecimal(Session["userID"]);
                        objProNew.LastmodifiedDate = DateTime.Now;
                        objProNew.customerStatusID = Convert.ToInt64(ddlStatus.SelectedValue);
                        objProNew.customerTypeID = Convert.ToInt64(ddlType.SelectedValue);
                        objProNew.firstName = txtFName.Text;
                        objProNew.homeNumber = txtHome.Text;
                        objProNew.isActive = true;
                        objProNew.isDeleted = false;
                        objProNew.lastName = txtLName.Text;
                        objProNew.middelName = txtMName.Text;




                        objProNew.addressLine1 = txtAddress1.Text;
                        objProNew.addressLine2 = txtAddress2.Text;
                        objProNew.city = txtCity.Text;
                        if (txtDOB.Text != "")
                            objProNew.DOB = Convert.ToDateTime(txtDOB.Text);
                        objProNew.email = txtEmail.Text;
                        objProNew.website = txtWebSite.Text;
                        objProNew.workPhone = txtWorkPhone.Text;





                        objEntity.SaveChanges();
                        liVal.Text = "Saved Successfull.";
                    }
                    else
                    {
                        liVal.Text = "Customer Not Found.";
                    }
                }
            }
            catch (Exception ex)
            {
                appOperations.LogException(ex, "");
                liVal.Text = ex.Message;
            }
        }
    }
}