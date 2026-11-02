using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace State_Pharmaceutical_Cooperation.supplierDashboard
{
    public partial class TenderForm : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("supplierHomePanel.aspx");

        }

        protected void lnkDrugs_Click(object sender, EventArgs e)
        {
            Response.Redirect("drugDetails.aspx");

        }

        protected void lnkTender_Click(object sender, EventArgs e)
        {
            Response.Redirect("TenderForm.aspx");

        }

        protected void btnSubmitTender_Click(object sender, EventArgs e)
        {   
                try
                {
                    SPCService client = new SPCService();

                    string tenderTitle = txtTenderTitle.Text;
                    string email = txtEmail.Text;
                    string phoneNumber = txtPhone.Text;
                    string drugName = txtDrugName.Text;
                    int quantity = Convert.ToInt32(txtQuantity.Text);
                    decimal unitPrice = Convert.ToDecimal(txtUnitPrice.Text);
                    string manufacturer = txtManufacturer.Text;
                    DateTime expiryDate = Convert.ToDateTime(txtExpiryDate.Text);
                    string description = txtDescription.Text;
                    

                    int result = client.insertTender(tenderTitle, email, phoneNumber, drugName,
                        quantity, unitPrice, manufacturer, expiryDate, description);

                    if (result > 0)
                    {
                        lblMessage.Text = "Tender submitted successfully!";         
                    }
                    else
                    {
                        lblMessage.Text = "Failed to submit tender.";                    
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            // Clear all form fields
            txtTenderTitle.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtDrugName.Text = string.Empty;
            txtQuantity.Text = string.Empty;
            txtUnitPrice.Text = string.Empty;
            txtManufacturer.Text = string.Empty;
            txtExpiryDate.Text = string.Empty;
            txtDescription.Text = string.Empty;

            // Clear any messages
            lblMessage.Text = string.Empty;
            lblMessage.CssClass = "message";

            // Reset validation if any exists
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