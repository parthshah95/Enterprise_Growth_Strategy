using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SonyWeb_3
{
    public partial class adAddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            liVal.Text = "";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string filename = DateTime.Now.ToString("MM_dd_yy_hh_mm_ss") + Path.GetFileName(flPhoto.PostedFile.FileName);
                flPhoto.SaveAs(Server.MapPath("~/userData/productPic/" + filename));

                using (SalesDBEntities1 objEntity = new SalesDBEntities1())
                {
                    productMST objpro = objEntity.productMSTs.FirstOrDefault(Pro => Pro.productCode == txtCode.Text || Pro.productName == txtName.Text);
                    if (objpro != null)
                    {
                        liVal.Text = "Product Code or Name Already Exists. <br/> Please Enter different Code or Name.";
                        return;
                    }
                    else
                    {
                        productMST objProNew = new productMST();
                        if (ddlCategory.SelectedValue != "0")
                            objProNew.categoryID = Convert.ToDecimal(ddlCategory.SelectedValue);
                        objProNew.productCode = txtCode.Text;
                        objProNew.isActive = true;
                        objProNew.CreatedDate = DateTime.Now;
                        objProNew.CreatedBy = Convert.ToDecimal(Session["userID"]);
                        objProNew.productDesciption = txtDesc.Text;
                        objProNew.productName = txtName.Text;
                        objProNew.UnitPrice = Convert.ToDecimal(txtPrice.Text);
                        objProNew.productPic = "~/userData/productPic/" + filename;

                        objEntity.productMSTs.Add(objProNew);
                        objEntity.SaveChanges();

                       
                        Response.Redirect("~/adProducts.aspx", false);
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