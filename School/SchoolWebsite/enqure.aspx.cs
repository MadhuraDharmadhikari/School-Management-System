using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace School.SchoolWebsite
{
    public partial class enqure : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                if (Session["AdmissionSuccess"] != null)
                {
                    ScriptManager.RegisterStartupScript(
                        this,
                        GetType(),
                        "success",
                        "swal('Submit Successfully!', '', 'success');",
                        true
                    );

                    // Clear form after success
                    ClearControls();

                    // Remove session so it won’t repeat
                    Session.Remove("AdmissionSuccess");
                }
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(
ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO fastAdmissionEnquiry (ParentName, EmailAddress, PhoneNumber, Address, Class, AdditionalMessage,CreatedDate) " +
                    "VALUES (@ParentName, @EmailAddress, @PhoneNumber, @Address, @Class, @AdditionalMessage, GETDATE())", con);

                cmd.Parameters.AddWithValue("@ParentName", txtParentName.Text.Trim());
                cmd.Parameters.AddWithValue("@EmailAddress", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhone.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtcity.Text.Trim());
                cmd.Parameters.AddWithValue("@Class", ddlclas.Text.Trim());
                cmd.Parameters.AddWithValue("@AdditionalMessage", txtMessage.Text.Trim());

                con.Open();
                cmd.ExecuteNonQuery();
            }
            ClearControls();

            // Set success flag
            Session["AdmissionSuccess"] = true;

            // Redirect (VERY IMPORTANT)
            Response.Redirect("enqure.aspx");


            // Show SweetAlert without page reload
            ScriptManager.RegisterStartupScript(
        this,
        GetType(),
        "success",
        "swal('Submit Successfully!', '', 'success');",
        true
    );

        }
        private void ClearControls()
        {
            txtParentName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtcity.Text = "";
            ddlclas.Text = "";
            txtMessage.Text = "";
        }
    }
}


