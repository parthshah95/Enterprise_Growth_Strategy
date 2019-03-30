using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SonyWeb_3
{
    public partial class adAddPCategory : System.Web.UI.Page
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
                    categoryMST objcat = objEntity.categoryMSTs.FirstOrDefault(cat => cat.catName == txtCat.Text);
                    if (objcat != null)
                    {
                        liVal.Text = "Category Already Exists. <br/> Please Enter different Category.";
                        return;
                    }
                    else
                    {
                        categoryMST objcatNew = new categoryMST();

                        objcatNew.catName = txtCat.Text;
                        objcatNew.catCode = "S";
                        objcatNew.isActive = true;
                        objcatNew.CreatedDate = DateTime.Now;
                        objcatNew.categoryID = Convert.ToDecimal(Session["userID"]);
                        if (ddlCategory.SelectedValue != "0")
                            objcatNew.parentcategoryID = Convert.ToDecimal(ddlCategory.SelectedValue);

                        objEntity.categoryMSTs.Add(objcatNew);
                        objEntity.SaveChanges();
                        Response.Redirect("~/adPCategory.aspx", false);
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