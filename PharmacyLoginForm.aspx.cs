using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace State_Pharmaceutical_Cooperation
{
    public partial class PharmacyLoginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                SPCService spcService = new SPCService();

                string email = txtEmail.Text.Trim();
                string password = txtPassword.Text.Trim();

                bool isValidLogin = spcService.pharmacyLogin(email, password);

                if (isValidLogin)
                {
                    Session["PharmacyEmail"] = email;

                    Response.Redirect("~/pharmacyDashboard/pharmacyPanel.aspx");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Invalid email or password. Please try again.');", true);
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    "alert('An error occurred: " + ex.Message + "');", true);
            }
        }
    }
}