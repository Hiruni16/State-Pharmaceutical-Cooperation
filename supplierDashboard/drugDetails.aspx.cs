using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace State_Pharmaceutical_Cooperation.supplierDashboard
{
    public partial class drugDetails : System.Web.UI.Page
    {
        localhost.SPCService sms = new localhost.SPCService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDrugs();
            }
        }

        private void LoadDrugs()
        {
            try
            {
                DataSet ds = sms.selectAll();
                gvDrugs.DataSource = ds.Tables[0];
                gvDrugs.DataBind();

                if (ds.Tables[0].Rows.Count == 0)
                {
                    lblMessage.Text = "No drugs found.";
                    lblMessage.CssClass = "alert alert-info";
                }
                else
                {
                    lblMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.CssClass = "alert alert-danger";
            }
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

        protected void gvDrugs_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvDrugs.SelectedRow;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("~/Home.aspx");
        }
    }
}