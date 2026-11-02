using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;


namespace State_Pharmaceutical_Cooperation
{
    public partial class PharmacyRegForm : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                SPCService client = new SPCService();

                int id = int.Parse(txtPharmacyID.Text);
                string pharmacyName = txtAddress.Text;
                string email = txtEmail.Text;
                int phoneNumber = int.Parse(txtPhone.Text);
                string address = txtAddress.Text;
                string password = txtPassword.Text;
                bool IsActive = true;

                int result = client.insertPharmacy(id, pharmacyName, email, phoneNumber, address, password);

                if (result > 0)
                {
                    lblMessage.Text = "Pharmacy Registration Successfull!";
                }
                else
                {
                    lblMessage.Text = "Registration Failed Try Again";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }
    }
}
