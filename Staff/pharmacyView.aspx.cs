using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;

namespace State_Pharmaceutical_Cooperation.Staff
{
    public partial class pharmacyView : System.Web.UI.Page
    {
        localhost.SPCService sms = new localhost.SPCService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPharmacy();
            }
        }
        private void LoadPharmacy()
        {
            try
            {
                DataSet ds = sms.getAllPharmacies();
                gvPharmacies.DataSource = ds.Tables[0];
                gvPharmacies.DataBind();

                if (ds.Tables[0].Rows.Count == 0)
                {
                    lblMessage.Text = "No staff found.";
                }
                else
                {
                    lblMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }
        protected void gvPharmacies_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeletePharmacy")
            {
                try
                {
                    int id = Convert.ToInt32(e.CommandArgument);

                    Business.Pharmacy pharmacy = new Business.Pharmacy();
                    pharmacy.PharmacyID = id;

                    int result = pharmacy.deletePharmacy();

                    if (result > 0)
                    {
                        lblMessage.Text = "Pharmacy deleted successfully.";
                        BindGridView();
                    }
                    else
                    {
                        lblMessage.Text = "Failed to delete pharmacy.";
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
        }

        private void BindGridView()
        {
            try
            {
                DataSet ds = sms.getAllPharmacies();
                gvPharmacies.DataSource = ds.Tables[0];
                gvPharmacies.DataBind();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading pharmacies: " + ex.Message;
                lblMessage.CssClass = "alert alert-danger";
            }
        }

        protected void lnkDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("staffHomePage.aspx");

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

        protected void lnkDrugs_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewDrugForm.aspx");

        }

        protected void lnkViewTender_Click(object sender, EventArgs e)
        {
            Response.Redirect("tenderView.aspx");

        }

        protected void btnAllDrugs_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet ds = sms.selectAll();
                gvPharmacies.DataSource = ds.Tables[0];
                gvPharmacies.DataBind();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        protected void gvPharmacies_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvPharmacies.SelectedRow;

        }

        protected void gvPharmacy_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("~/Home.aspx");
        }
    }
}


