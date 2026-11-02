using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace State_Pharmaceutical_Cooperation.pharmacyDashboard
{
    public partial class pharmacyDashboard : System.Web.UI.Page
    {
        localhost.SPCService sms = new localhost.SPCService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPharmacies();
            }
        }

        private void LoadPharmacies()
        {
            try
            {
                DataSet ds = sms.getAllPharmacies();
                gvPharmacies.DataSource = ds.Tables[0];
                gvPharmacies.DataBind();

                if (ds.Tables[0].Rows.Count == 0)
                {
                    lblMessage.Text = "No pharmacy found.";
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
        protected void lnkPharmacy_Click(object sender, EventArgs e)
        {

        }

        //protected void lnkDrugs_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("viewDrug.aspx");

        //}

        //protected void lnkDashboard_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("pharmacyPanel.aspx");

        //}

        //protected void lnkOrders_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("orderDrug.aspx");

        //}

        protected void gvPharmacies_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvPharmacies.SelectedRow;

        }

        protected void lnkOrderForm_Click(object sender, EventArgs e)
        {
            

        }

        protected void lnkOrderDrugs_Click(object sender, EventArgs e)
        {
            Response.Redirect("orderDrugsForm.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("~/Home.aspx");
        }
    }
}