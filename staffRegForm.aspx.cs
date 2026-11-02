using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;


namespace State_Pharmaceutical_Cooperation
{
    public partial class staffRegForm : System.Web.UI.Page
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

                int id = int.Parse(txtStaffID.Text);
                string username = txtUsername.Text;
                string stafftype = ddlStaffType.Text;
                string locationId = ddlLocation.Text;
                string email = txtEmail.Text;
                int phoneNumber = int.Parse(txtPhone.Text);
                string password = txtPassword.Text;
                bool IsActive = true;

                int result = client.insertStaff(id, username, stafftype, locationId, email, phoneNumber, password);

                if (result > 0)
                {
                    lblMessage.Text = "Staff Registration Successfull!";
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
