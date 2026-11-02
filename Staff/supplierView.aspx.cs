using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;

namespace State_Pharmaceutical_Cooperation.Staff
{
    public partial class supplierView : System.Web.UI.Page
    {
        localhost.SPCService sms = new localhost.SPCService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSuppliers();
            }
        }

        private void LoadSuppliers()
        {
            try
            {
                DataSet ds = sms.getAllSupplier();
                gvSupplier.DataSource = ds.Tables[0];
                gvSupplier.DataBind();

                if (ds.Tables[0].Rows.Count == 0)
                {
                    lblMessage.Text = "No suppliers found.";
                    lblMessage.CssClass = "alert alert-info";
                    lblMessage.Visible = true;
                }
                else
                {
                    lblMessage.Visible = false;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.CssClass = "alert alert-danger";
                lblMessage.Visible = true;
            }
        }

        protected void gvSupplier_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteSupplier")
            {
                try
                {
                    int id = Convert.ToInt32(e.CommandArgument);
                    int result = sms.deleteSupplier(id); // Use the web service method directly

                    if (result > 0)
                    {
                        lblMessage.Text = "Supplier deleted successfully";
                    }
                    else
                    {
                        lblMessage.Text = "Failed to delete supplier";
                    }

                    LoadSuppliers(); // Refresh the grid after deletion
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                }

                lblMessage.Visible = true;
            }
        }
       

        protected void gvSupplier_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvSupplier.SelectedRow;

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("~/Home.aspx");
        }

        #region Navigation Methods
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
        #endregion
    }
}