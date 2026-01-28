using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace School.SchoolWebsite
{
    public partial class contact : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(
ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO ContactUs(FullName, EmailAddress, PhoneNumber, Subject,AdditionalMessage) " +
                    "VALUES (@FullName, @EmailAddress, @PhoneNumber, @Subject, @AdditionalMessage)", con);

                cmd.Parameters.AddWithValue("@FullName", txtParentName.Text.Trim());
                cmd.Parameters.AddWithValue("@EmailAddress", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhone.Text.Trim());
                cmd.Parameters.AddWithValue("@Subject", txtsub.Text.Trim());
              
                cmd.Parameters.AddWithValue("@AdditionalMessage", txtMessage.Text.Trim());

                con.Open();
                cmd.ExecuteNonQuery();
            }
            ClearControls();

            // Clear fields


            // Show SweetAlert without page reload
            ScriptManager.RegisterStartupScript(
        this,
        GetType(),
        "success",
        "swal('Registered Successfully!', '', 'success');",
        true
    );

        }
        private void ClearControls()
        {
            txtParentName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtsub.Text = "";
            txtMessage.Text = "";
        }
    }
}

