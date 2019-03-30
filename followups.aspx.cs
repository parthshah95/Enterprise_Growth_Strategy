using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace  SonyWeb_3
{
    public partial class followups : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbtnClose_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lbtn = (LinkButton)sender;
                decimal onjInq = Convert.ToDecimal(lbtn.CommandArgument);
                using (SalesDBEntities1 objEntity = new SalesDBEntities1())
                {
                    followup objpro = objEntity.followups.FirstOrDefault(Pro => Pro.followupID == onjInq);
                    if (objpro != null)
                    {
                        objpro.isActive = false;
                        objpro.isDone = true;
                        objEntity.SaveChanges();
                    }
                }
                gvProduct.DataBind();
            }
            catch (Exception ex)
            {
                appOperations.LogException(ex, "");
                liVal.Text = ex.Message;
            }
        }
    }
}