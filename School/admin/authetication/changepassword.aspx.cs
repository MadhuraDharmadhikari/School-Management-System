using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace School.admin.authetication
{
    public partial class changepassword : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(
            ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["ResetEmail"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["ResetEmail"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                SqlCommand cmd = new SqlCommand(
                    "UPDATE Users SET Password=@Password WHERE Email=@Email", con);

                cmd.Parameters.AddWithValue("@Password", txtNewPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", Session["ResetEmail"].ToString());

                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
                Session.Remove("ResetEmail");
                Response.Redirect("Login.aspx");
            }
        }
    }
    }