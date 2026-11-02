using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace State_Pharmaceutical_Cooperation
{
    public partial class staffLoginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                SPCService spcService = new SPCService();
                bool isValid = spcService.staffLogin(txtEmail.Text.Trim(), txtPassword.Text.Trim());

                if (isValid)
                {
                    // Store email in session for future use
                    Session["StaffEmail"] = txtEmail.Text.Trim();
                    Response.Redirect("Staff/staffHomePage.aspx");
                }
                else
                {
                    // Show error message
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                        "alert", "alert('Invalid email or password!');", true);
                }
            }
            catch (Exception ex)
            {
                // Show error message
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert", $"alert('Error: {ex.Message}');", true);
            }
        }
    }
}