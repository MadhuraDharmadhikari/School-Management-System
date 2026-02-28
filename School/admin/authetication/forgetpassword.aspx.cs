using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace School.admin.authetication
{
    public partial class forgetpassword : System.Web.UI.Page
    {

            SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString);

        protected void btnNext_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT UserID FROM Users WHERE Email=@Email", con);

            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());

            con.Open();
            object user = cmd.ExecuteScalar();
            con.Close();

            if (user != null)
            {
                Session["ResetEmail"] = txtEmail.Text.Trim();
                Response.Redirect("changepassword.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "alert",
                    "alert('Email not found');",
                    true);
            }
        }
        }
    }