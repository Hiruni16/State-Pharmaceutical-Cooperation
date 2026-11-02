using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;

namespace State_Pharmaceutical_Cooperation.pharmacyDashboard
{
    public partial class orderDrugsForm : System.Web.UI.Page
    {
        localhost.SPCService sms = new localhost.SPCService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDrugs();
            }
        }

        protected void lnkOrderDrugs_Click(object sender, EventArgs e)
        {
            Response.Redirect("orderDrugsForm.aspx");

        }

        protected void lnkDrugs_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewDrug.aspx");

        }

        protected void lnkDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("pharmacyPanel.aspx");

        }

        protected void ddlDrug_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDrugs();
        }

        private void LoadDrugs()
        {
            try
            {
                SPCService service = new SPCService();
                DataSet ds = service.selectAll();

                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    ddlDrug.DataSource = ds.Tables[0];
                    ddlDrug.DataTextField = "DrugName"; 
                    ddlDrug.DataValueField = "DrugID"; 
                    ddlDrug.DataBind();
                }

                ddlDrug.Items.Insert(0, new ListItem("-- Select Drug --", ""));
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading drugs: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnSubmitOrder_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlDrug.SelectedIndex == 0)
                {
                    lblMessage.Text = "Please select a drug.";
                    lblMessage.Visible = true;
                    return;
                }

                Order order = new Order
                {
                    OrderDate = Convert.ToDateTime(txtOrderDate.Text),
                    DrugName = ddlDrug.SelectedItem.Text, // Get selected drug name
                    Quantity = Convert.ToInt32(txtQuantity.Text),
                    DeliveryDate = Convert.ToDateTime(txtDeliveryDate.Text),
                    Priority = ddlPriority.SelectedValue,
                    Notes = txtNotes.Text
                };

                int result = order.insertOrder();
                if (result > 0)
                {
                    lblMessage.Text = "Order placed successfully!";                    
                }
                else
                {
                    lblMessage.Text = "Failed to place the order.";
                }

                lblMessage.Visible = true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.Visible = true;
            }
        }

       

        protected void btnClear_Click(object sender, EventArgs e)
        {
            // Clear all form fields
            txtOrderDate.Text = string.Empty;
            ddlDrug.SelectedIndex = 0;
            txtQuantity.Text = string.Empty;
            txtDeliveryDate.Text = string.Empty;
            ddlPriority.SelectedIndex = 0;
            txtNotes.Text = string.Empty;

            // Clear any validation messages
            lblMessage.Visible = false;

            // Clear validation summary if it exists
            if (Page.Validators != null)
            {
                foreach (BaseValidator validator in Page.Validators)
                {
                    validator.Enabled = true;
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("~/Home.aspx");
        }
    }
}