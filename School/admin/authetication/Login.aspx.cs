using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Admin_1.admin.authetication
{
    public partial class Login : System.Web.UI.Page
    { // Connection from Web.config
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: any code on page load
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            try
            {
                // Close connection if already open
                if (con.State == System.Data.ConnectionState.Open)
                    con.Close();

                // Query to check email and password
                SqlCommand cmd = new SqlCommand("SELECT * FROM Users WHERE Email=@Email AND Password=@Password", con);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim()); // Use hashed password in real apps

                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();

                if (sdr.HasRows)
                {
                    sdr.Read();
                    // Store session info
                    Session["UserID"] = sdr["UserID"].ToString();
                    Session["UserEmail"] = sdr["Email"].ToString();

                    Response.Redirect("~/admin/default.aspx"); // Redirect to profile/dashboard
                }
                else
                {
                    // Invalid login alert using SweetAlert
                    this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Invalid User..!','','error');", true);
                }

                sdr.Close();
            }
            catch (Exception ex)
            {
                // Optional: display error
                Response.Write("Error: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

      
    }
}