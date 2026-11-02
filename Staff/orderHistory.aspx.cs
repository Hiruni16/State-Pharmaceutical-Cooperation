using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;

namespace State_Pharmaceutical_Cooperation.Staff
{
    public partial class orderHistory : System.Web.UI.Page
    {
        localhost.SPCService sms = new localhost.SPCService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrder();
            }
        }

        private void LoadOrder()
        {
            try
            {
                DataSet ds = sms.getAllOrders();
                gvOrderHistory.DataSource = ds.Tables[0];
                gvOrderHistory.DataBind();

                if (ds.Tables[0].Rows.Count == 0)
                {
                    lblMessage.Text = "No Order found.";
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
                lblMessage.Visible = true;
            }
        }

        protected void gvOrderHistory_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteOrder")
            {
                try
                {
                    // Get the OrderID from the CommandArgument
                    int orderId = Convert.ToInt32(e.CommandArgument);

                    // Create Order object and set the ID
                    Business.Order order = new Business.Order();
                    order.OrderID = orderId;

                    // Call delete method
                    int result = order.deleteOrder();

                    if (result > 0)
                    {
                        // Success message
                        lblMessage.Text = "Order deleted successfully";

                        // Refresh the GridView
                        BindGridView();
                    }
                    else
                    {
                        // Error message
                        lblMessage.Text = "Failed to delete order";
                    }
                }
                catch (Exception ex)
                {
                    // Exception handling
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
        }

        // Method to bind data to GridView
        private void BindGridView()
        {
            try
            {
                Business.Order order = new Business.Order();
                DataSet ds = order.selectAll();
                gvOrderHistory.DataSource = ds;
                gvOrderHistory.DataBind();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading orders: " + ex.Message;
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

        protected void gvOrderHistory_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvOrderHistory.SelectedRow;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("~/Home.aspx");
        }
    }
}
