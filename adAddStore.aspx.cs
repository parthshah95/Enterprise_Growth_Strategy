using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SonyWeb_3
{
    public partial class adAddStore : System.Web.UI.Page
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
                    storeMST objpro = objEntity.storeMSTs.FirstOrDefault(Pro => Pro.storeName == txtName.Text);
                    if (objpro != null)
                    {
                        liVal.Text = "Store Name Already Exists. <br/> Please Enter different Name.";
                        return;
                    }
                    else
                    {
                        storeMST objProNew = new storeMST();
                        if (ddlAccount.SelectedValue != "0")
                            objProNew.accountID = Convert.ToDecimal(ddlAccount.SelectedValue);
                        objProNew.State = txtState.Text;
                        objProNew.isActive = true;
                        objProNew.CreatedDate = DateTime.Now;
                        objProNew.AddressLine1 = txtAddLine1.Text;
                        objProNew.AddressLine2 = txtAddressLine2.Text;
                        objProNew.City = txtCity.Text;
                        objProNew.storeDetail = txtDesc.Text;
                        objProNew.CreatedBy = Convert.ToDecimal(Session["userID"]);
                        objProNew.ContactDetail = txtContact.Text;
                        objProNew.storeHolder = txtManager.Text;
                        objProNew.storeName = txtName.Text;
                        objEntity.storeMSTs.Add(objProNew);
                        objEntity.SaveChanges();
                        Response.Redirect("~/adStores.aspx", false);
                    }
                }
            }
            catch (Exception ex)
            {
                appOperations.LogException(ex, "Category Save");
                liVal.Text = ex.Message;
            }
        }
    }
}