using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;

namespace State_Pharmaceutical_Cooperation
{
    public partial class SupplierRegForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnRegister_Click1(object sender, EventArgs e)
        {
            try
            {
                SPCService client = new SPCService();

                int id = int.Parse(txtSupplierID.Text);
                string companyName = txtCompanyName.Text;
                string email = txtEmail.Text;
                int contactNumber = int.Parse(txtContactNo.Text);
                string businessaddress = txtAddress.Text;
                string password = txtPassword.Text;
                bool IsActive = true;

                int result = client.insertSupplier(id, companyName, email, contactNumber, businessaddress, password);

                if (result > 0)
                {
                    lblMessage.Text = "Supplier Registration Successfull!";
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
