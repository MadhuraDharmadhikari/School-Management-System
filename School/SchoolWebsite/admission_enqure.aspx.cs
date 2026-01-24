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
    public partial class admission_enqure : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO AdmissionEnquiry (ParentName, EmailAddress, PhoneNumber, City, Curriculum, Grade, AdditionalMessage) " +
                    "VALUES (@ParentName, @EmailAddress, @PhoneNumber, @City, @Curriculum, @Grade, @AdditionalMessage)", con);

                cmd.Parameters.AddWithValue("@ParentName", txtParentName.Text.Trim());
                cmd.Parameters.AddWithValue("@EmailAddress", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhone.Text.Trim());
                cmd.Parameters.AddWithValue("@City", txtcity.Text.Trim());
                cmd.Parameters.AddWithValue("@Curriculum", txtselect.Text.Trim());
                cmd.Parameters.AddWithValue("@Grade", txtselegrade.ToString().Trim());
                cmd.Parameters.AddWithValue("@AdditionalMessage", txtMessage.Text.Trim());

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                // Clear fields
                txtParentName.Text = "";
                txtEmail.Text = "";
                txtPhone.Text = "";
                txtcity.Text = "";
                txtselect.Text = "";
                txtselegrade.Text = "";
                txtMessage.Text = "";

                // SweetAlert success
                this.ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "SweetAlert",
                    "swal('Registered Successfully..!','','success');",
                    true
                );
            }
            catch (Exception ex)
            {
                this.ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "SweetAlert",
                    $"swal('Error','{ex.Message}','error');",
                    true
                );
            }
        }

    }
}
