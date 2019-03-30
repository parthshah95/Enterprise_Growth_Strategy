using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace  SonyWeb_3
{
    public partial class mailNew : System.Web.UI.Page
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

                    messageMail objProNew = new messageMail();
                    objProNew.messageDate =DateTime.Now;
                    objProNew.isDeleted = false;
                    objProNew.isImportant = false;
                    objProNew.receiverID = Convert.ToInt64(ddlStore.SelectedValue);
                    objProNew.messageDetail = txtDetail.Text;
                    objProNew.senderID = Convert.ToDecimal(Session["userID"]);

                    objEntity.messageMails.Add(objProNew);
                    objEntity.SaveChanges();




                    Response.Redirect("~/mails.aspx", false);

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