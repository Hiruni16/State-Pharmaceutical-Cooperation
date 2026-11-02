using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;

namespace State_Pharmaceutical_Cooperation.supplierDashboard
{
    public partial class supplierDashboard : System.Web.UI.Page
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
                gvSuppliers.DataSource = ds.Tables[0];
                gvSuppliers.DataBind();

                if (ds.Tables[0].Rows.Count == 0)
                {
                    lblMessage.Text = "No suppliers found.";
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
            Response.Redirect("drugDetails.aspx");

        }

        protected void lnkTender_Click(object sender, EventArgs e)
        {
            Response.Redirect("TenderForm.aspx");

        }

        protected void lnkDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("supplierHomePanel.aspx");

        }

        protected void btnAllDrugs_Click(object sender, EventArgs e)
        {
           
        }

        protected void gvSuppliers_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvSuppliers.SelectedRow;       
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("~/Home.aspx");
        }
    }
}