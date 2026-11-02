using System;
using System.Net.Mail;
using System.Web.UI;

namespace State_Pharmaceutical_Cooperation
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                // Here you would typically:
                // 1. Validate the input
                // 2. Save to database
                // 3. Send email notification
                // 4. Show success message

                // Example email sending (you'll need to configure SMTP settings)
                /*
                MailMessage mail = new MailMessage();
                mail.To.Add("info@spc.lk");
                mail.From = new MailAddress(txtEmail.Text);
                mail.Subject = "Contact Form: " + ddlSubject.SelectedItem.Text;
                mail.Body = $"Name: {txtName.Text}\nEmail: {txtEmail.Text}\nSubject: {ddlSubject.SelectedItem.Text}\nMessage: {txtMessage.Text}";

                SmtpClient smtp = new SmtpClient();
                smtp.Send(mail);
                */

                //// Clear the form
                //txtName.Text = "";
                //txtEmail.Text = "";
                //ddlSubject.SelectedIndex = 0;
                //txtMessage.Text = "";

                // Show success message
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Thank you for your message. We will get back to you soon.');", true);
            }
            catch (Exception ex)
            {
                // Log the error and show error message
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('An error occurred. Please try again later.');", true);
            }
        }
    }
}