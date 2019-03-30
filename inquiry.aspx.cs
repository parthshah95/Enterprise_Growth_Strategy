using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace  SonyWeb_3
{
    public partial class inquiry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            liVal.Text = "";
        }

        protected void lbtnDetail_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lbtn = (LinkButton)sender;
                Session["inqID"] = Convert.ToInt64(lbtn.CommandArgument);
                Response.Redirect("~/inquiryDetail.aspx",false);
            }
            catch (Exception ex)
            {
                appOperations.LogException(ex, "");
                liVal.Text = ex.Message;
            }
        }

        protected void lbtnFollowup_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lbtn = (LinkButton)sender;
                Session["inqID"] = Convert.ToInt64(lbtn.CommandArgument);
                Response.Redirect("~/followupNew.aspx",false);
            }
            catch (Exception ex)
            {
                appOperations.LogException(ex, "");
                liVal.Text = ex.Message;
            }
        }

        protected void lbtnClose_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lbtn = (LinkButton)sender;
                decimal onjInq = Convert.ToDecimal(lbtn.CommandArgument);
                using (SalesDBEntities1 objEntity = new SalesDBEntities1())
                {
                    inquiryMST objpro = objEntity.inquiryMSTs.FirstOrDefault(Pro => Pro.inquiryMST1 == onjInq);
                    if (objpro != null)
                    {
                        objpro.inquiryStatus = "Close";
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