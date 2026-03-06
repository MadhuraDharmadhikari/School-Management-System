using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace School.admin
{
    public partial class adminprof : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfile();
            }
        }

        private void LoadProfile()
        {
            int adminId = Convert.ToInt32(Session["UserID"] ?? 1);

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT UserID, Email FROM Users WHERE UserID=@UserID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserID", adminId);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    string email = dr["Email"].ToString();
                    string username = email.Split('@')[0];

                    lblAdminID.Text = dr["UserID"].ToString();
                    lblUsername.Text = username;
                    lblName.Text = username;
                    lblEmail2.Text = email;

                    lblCreatedOn.Text = DateTime.Now.ToShortDateString();
                    lblLastLogin.Text = "Today";
                    lblDevice.Text = Request.Browser.Browser;
                }
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            txtUsername.Text = lblUsername.Text;
            txtEmail.Text = lblEmail2.Text;

            lblUsername.Visible = false;
            lblEmail2.Visible = false;

            txtUsername.Visible = true;
            txtEmail.Visible = true;

            btnEdit.Visible = false;
            btnSave.Visible = true;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int adminId = Convert.ToInt32(Session["UserID"] ?? 1);

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "UPDATE Users SET Email=@Email WHERE UserID=@UserID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@UserID", adminId);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            LoadProfile();

            txtUsername.Visible = false;
            txtEmail.Visible = false;

            lblUsername.Visible = true;
            lblEmail2.Visible = true;

            btnEdit.Visible = true;
            btnSave.Visible = false;
        }
    }
}