using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace  SonyWeb_3
{
    public partial class inquiryNew : System.Web.UI.Page
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
                    inquiryMST objProNew = new inquiryMST();
                    objProNew.createdBy = Convert.ToDecimal(Session["userID"]);
                    objProNew.createdDate = DateTime.Now;
                    objProNew.custName = Convert.ToString(ddlCustomer.SelectedItem.Text);
                    objProNew.customerID = Convert.ToInt64(ddlCustomer.SelectedValue);
                    objProNew.inquiryNextFollowupDate = Convert.ToDateTime(txtFD.Text);
                    objProNew.inquiryOwner = Convert.ToString(Session["userName"]); ;
                    objProNew.inquiryOwnerID = Convert.ToDecimal(Session["userID"]); ;
                    objProNew.inquiryStatus = "OPEN";
                    objProNew.inquiryType = txtType.Text;
                    objProNew.isDeleted = false;
                    objProNew.productCode = Convert.ToString(ddlUnit.SelectedValue);
                    objProNew.productID = Convert.ToDecimal(ddProduct.SelectedValue);
                    objProNew.productName = Convert.ToString(ddProduct.SelectedItem.Text);
                    objProNew.productUnitPrice = Convert.ToDecimal(ddlUnit.SelectedItem.Text);
                    objProNew.storeID = 1;

                    if (txtDiscount.Text != "")
                        objProNew.discountedPrice = Convert.ToDecimal(txtDiscount.Text);

                    objEntity.inquiryMSTs.Add(objProNew);
                    objEntity.SaveChanges();
                    Response.Redirect("~/inquiry.aspx", false);

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