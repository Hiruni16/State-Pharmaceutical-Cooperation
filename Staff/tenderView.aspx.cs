using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace State_Pharmaceutical_Cooperation.Staff
{
    public partial class tenderView : System.Web.UI.Page
    {
        localhost.SPCService sms = new localhost.SPCService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTender();
            }
        }

        private void LoadTender()
        {
            try
            {
                DataSet ds = sms.getAllTenders();
                gvTender.DataSource = ds.Tables[0];
                gvTender.DataBind();

                if (ds.Tables[0].Rows.Count == 0)
                {
                    lblMessage.Text = "No tender found.";
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
        protected void gvTender_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteTender")
            {
                try
                {
                    int tenderID = Convert.ToInt32(e.CommandArgument);
                    bool isDeleted = sms.DeleteTender(tenderID);

                    if (isDeleted)
                    {
                        lblMessage.Text = "Tender deleted successfully.";
                    }
                    else
                    {
                        lblMessage.Text = "Failed to delete tender.";
                    }

                    // Reload the grid regardless of success/failure
                    LoadTender();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                }
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

        protected void gvTender_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvTender.SelectedRow;

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("~/Home.aspx");
        }
    }
}