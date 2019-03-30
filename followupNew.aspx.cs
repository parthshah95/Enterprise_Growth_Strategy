using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace  SonyWeb_3
{
    public partial class followupNew : System.Web.UI.Page
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

                    followup objProNew = new followup();
                    objProNew.followupDate = Convert.ToDateTime(txtFD.Text);
                    objProNew.isActive = true;
                    objProNew.isDone = false;
                    objProNew.inquiryID = Convert.ToInt64(ddlStore.SelectedValue);
                    objProNew.followupDetail = txtDetail.Text;

                    objEntity.followups.Add(objProNew);
                    objEntity.SaveChanges();




                    Response.Redirect("~/followups.aspx", false);

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