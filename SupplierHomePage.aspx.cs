using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace State_Pharmaceutical_Cooperation
{
    public partial class SupplierHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load supplier information
                LoadSupplierInfo();
                // Load dashboard metrics
                LoadDashboardMetrics();
                // Load notifications
                LoadNotifications();
            }
        }

        private void LoadSupplierInfo()
        {
            // TODO: Get this from your database/session
            lblSupplierName.Text = "Supplier Name";
            lblLastLogin.Text = DateTime.Now.ToString("MMM dd, yyyy HH:mm tt");
        }

        private void LoadDashboardMetrics()
        {
            // TODO: Get these values from your database
            lblPendingOrders.Text = "12";
            lblUrgentOrders.Text = "4";
            lblDeliveryRate.Text = "98.5%";
            lblQualityIssues.Text = "2";
            lblMonthlyRevenue.Text = "$45,289";
            lblRevenueChange.Text = "+12%";
        }

        private void LoadNotifications()
        {
            // TODO: Get these from your database
            var notifications = new List<NotificationItem>
            {
                new NotificationItem { Title = "New Order #12345", Message = "Received 30 minutes ago" },
                new NotificationItem { Title = "Inventory Alert", Message = "Low stock on Item SKU-789" },
                new NotificationItem { Title = "Payment Received", Message = "Invoice #789 has been paid" }
            };

            rptNotifications.DataSource = notifications;
            rptNotifications.DataBind();
        }

        protected void btnViewOrders_Click(object sender, EventArgs e)
        {
            // TODO: Implement navigation to orders page
            Response.Redirect("ViewOrders.aspx");
        }

        protected void btnUpdateInventory_Click(object sender, EventArgs e)
        {
            // TODO: Implement navigation to inventory page
            Response.Redirect("UpdateInventory.aspx");
        }

        protected void btnDeliverySchedule_Click(object sender, EventArgs e)
        {
            // TODO: Implement navigation to delivery schedule page
            Response.Redirect("DeliverySchedule.aspx");
        }

        protected void btnReportIssue_Click(object sender, EventArgs e)
        {
            // TODO: Implement navigation to issue reporting page
            Response.Redirect("ReportIssue.aspx");
        }
    }

    public class NotificationItem
    {
        public string Title { get; set; }
        public string Message { get; set; }
    }
}