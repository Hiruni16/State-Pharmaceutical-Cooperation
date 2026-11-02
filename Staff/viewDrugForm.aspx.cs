using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace State_Pharmaceutical_Cooperation.Staff
{
    public partial class viewDrugForm : System.Web.UI.Page
    {
        localhost.SPCService sms = new localhost.SPCService();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkDashboard_Click1(object sender, EventArgs e)
        {
            Response.Redirect("staffHomePage.aspx");

        }

        protected void lnkViewTender_Click(object sender, EventArgs e)
        {
            Response.Redirect("tenderView.aspx");

        }

        protected void lnkOrders_Click1(object sender, EventArgs e)
        {
            Response.Redirect("orderHistory.aspx");

        }

        protected void lnkSuppliers_Click1(object sender, EventArgs e)
        {
            Response.Redirect("supplierView.aspx");

        }

        protected void lnkPharmacy_Click1(object sender, EventArgs e)
        {
            Response.Redirect("pharmacyView.aspx");

        }

        protected void lnkDrugs_Click3(object sender, EventArgs e)
        {
            Response.Redirect("viewDrugForm.aspx");

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(txtDrugID.Text);
                string drugname = txtDrugName.Text;
                string manufacture = txtManufacturer.Text;
                string price = txtPrice.Text;
                string stock = txtStock.Text;
                if (sms.drugInsert(id, drugname, manufacture, price, stock)>0)
                    {
                    lblMessage.Text = "Drug Record Added";
                }

            }
            catch(Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(txtDrugID.Text);
                string drugname = txtDrugName.Text;
                string manufacture = txtManufacturer.Text;
                string price = txtPrice.Text;
                string stock = txtStock.Text;
                if (sms.drugUpdate(id, drugname, manufacture, price, stock) > 0)
                {
                    lblMessage.Text = "Drug Record Updated!";
                }
            }
            catch(Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(txtDrugID.Text);
              
                if (sms.drugDelete(id) > 0)
                {
                    lblMessage.Text = "Drug Record Deleted!";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(txtDrugID.Text);

                Array list = sms.findDrugByID(id);

                if(list.Length > 0)
                {
                    txtDrugName.Text = list.GetValue(1).ToString();
                    txtManufacturer.Text = list.GetValue(2).ToString();
                    txtPrice.Text = list.GetValue(3).ToString();
                    txtStock.Text = list.GetValue(4).ToString();
                }
                else
                {
                    lblMessage.Text = "No Drug Record Found!";
                }

            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtDrugID.Text = null;
            txtDrugName.Text= null;
            txtManufacturer.Text = null;
            txtPrice.Text = null;
            txtStock.Text = null;
            txtDrugID.Focus();
        }

        protected void btnAllDrugs_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet ds = sms.selectAll();
                gvDrugs.DataSource = ds.Tables[0];
                gvDrugs.DataBind();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        protected void gvDrugs_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvDrugs.SelectedRow;

            txtDrugID.Text = row.Cells[1].Text;
            txtDrugName.Text = row.Cells[2].Text;
            txtManufacturer.Text= row.Cells[3].Text;
            txtPrice.Text= row.Cells[4].Text;
            txtStock.Text= row.Cells[5].Text;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("~/Home.aspx");
        }
    }
}