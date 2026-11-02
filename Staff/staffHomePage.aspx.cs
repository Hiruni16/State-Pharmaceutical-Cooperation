using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace State_Pharmaceutical_Cooperation.Staff
{
    public partial class staffHomePage : System.Web.UI.Page
    {
        localhost.SPCService sms = new localhost.SPCService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStaff();
            }
        }
        private void LoadStaff()
        {
            try
            {
                DataSet ds = sms.getAllStaff();
                gvStaff.DataSource = ds.Tables[0];
                gvStaff.DataBind();

                if (ds.Tables[0].Rows.Count == 0)
                {
                    lblMessage.Text = "No staff found.";
                    lblMessage.CssClass = "alert alert-info";
                }
                else
                {
                    lblMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.CssClass = "alert alert-danger";
            }
        }

        protected void lnkDrugs_Click(object sender, EventArgs e)
        {
        }

        protected void lnkDrugs_Click1(object sender, EventArgs e)
        {
        }

        protected void lnkOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("orderHistory.aspx");
        }

        protected void lnkSuppliers_Click(object sender, EventArgs e)
        {
            Response.Redirect("supplierView.aspx");
        }

        protected void lnkPharmacy_Click(object sender, EventArgs e)
        {
            Response.Redirect("pharmacyView.aspx");

        }

        protected void lnkDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("staffHomePage.aspx");

        }

        protected void lnkDrugs_Click2(object sender, EventArgs e)
        {

        }

        protected void lnkDashboard_Click1(object sender, EventArgs e)
        {
            Response.Redirect("staffHomePage.aspx");

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

        protected void lnkViewTender_Click(object sender, EventArgs e)
        {
            Response.Redirect("tenderView.aspx");

        }

        protected void gvStaff_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvStaff.SelectedRow;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("~/Home.aspx");
        }
    }
}