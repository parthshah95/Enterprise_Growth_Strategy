using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace  SonyWeb_3
{
    public partial class customerNew : System.Web.UI.Page
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
                    customerMST objProNew = new customerMST();
                    objProNew.cellNumber = txtCell.Text;
                    objProNew.companyName = txtCompany.Text;
                    objProNew.CreatedBy = Convert.ToDecimal(Session["userID"]);
                    objProNew.CreatedDate = DateTime.Now;
                    objProNew.customerStatusID = Convert.ToInt64(ddlStatus.SelectedValue);
                    objProNew.customerTypeID = Convert.ToInt64(ddlType.SelectedValue);
                    objProNew.firstName = txtFName.Text;
                    objProNew.homeNumber = txtHome.Text;
                    objProNew.isActive = true;
                    objProNew.isDeleted = false;
                    objProNew.lastName = txtLName.Text;
                    objProNew.middelName = txtMName.Text;

                    objEntity.customerMSTs.Add(objProNew);
                    objEntity.SaveChanges();
                    Response.Redirect("~/customers.aspx", false);

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