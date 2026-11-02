using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace State_Pharmaceutical_Cooperation
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        localhost.SPCService spc = new localhost.SPCService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDrugsDropdown();
            }
        }

        private void LoadDrugsDropdown()
        {
            try
            {
                DataSet ds = spc.selectAll();
                ddlDrugs.DataSource = ds.Tables[0];
                ddlDrugs.DataTextField = "DrugName";
                ddlDrugs.DataValueField = "DrugID";
                ddlDrugs.DataBind();
                ddlDrugs.Items.Insert(0, new ListItem("Select a Drug", ""));
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "error",
                    $"alert('Error loading drugs: {ex.Message}');", true);
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                string selectedDrugID = ddlDrugs.SelectedValue;

                if (string.IsNullOrEmpty(selectedDrugID))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "error",
                        "alert('Please select a drug to search.');", true);
                    gvDrugs.Visible = false;
                    return;
                }

                DataSet ds = spc.selectAll();
                DataTable dt = ds.Tables[0];

                DataRow[] filteredRows = dt.Select($"DrugID = '{selectedDrugID}'");

                if (filteredRows.Length > 0)
                {
                    DataTable filteredDt = dt.Clone();
                    foreach (DataRow row in filteredRows)
                    {
                        filteredDt.ImportRow(row);
                    }

                    gvDrugs.DataSource = filteredDt;
                    gvDrugs.DataBind();
                    gvDrugs.Visible = true;
                }
                else
                {
                    gvDrugs.Visible = false;
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "error",
                    $"alert('Error searching drugs: {ex.Message}');", true);
            }
        }
    }
}
