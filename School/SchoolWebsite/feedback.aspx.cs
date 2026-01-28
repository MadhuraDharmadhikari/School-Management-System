using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace School.SchoolWebsite
{
    public partial class feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                if (Session["AdmissionSuccess"] != null)
                {
                    ScriptManager.RegisterStartupScript(
                        this,
                        GetType(),
                        "success",
                        "swal('Registered Successfully!', '', 'success');",
                        true
                    );

                    // Clear form after success
                    ClearForm();

                    // Remove session so it won’t repeat
                    Session.Remove("AdmissionSuccess");
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int rating = Convert.ToInt32(hfRating.Value);

            SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString);

            SqlCommand cmd = new SqlCommand(
                "INSERT INTO Feedback (ParentName, Email, Phone, City, FeedbackType, Message, Rating) " +
                "VALUES (@ParentName, @Email, @Phone, @City, @FeedbackType, @Message, @Rating)", con);

            cmd.Parameters.AddWithValue("@ParentName", txtParentName.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
            cmd.Parameters.AddWithValue("@City", txtcity.Text);
            cmd.Parameters.AddWithValue("@FeedbackType", ddlFeedbackType.SelectedValue);
            cmd.Parameters.AddWithValue("@Message", txtMessage.Text);
            cmd.Parameters.AddWithValue("@Rating", rating);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            ClearForm();
            // Set success flag
            Session["AdmissionSuccess"] = true;

            // Redirect (VERY IMPORTANT)
            Response.Redirect("feedback.aspx");
            ScriptManager.RegisterStartupScript(

                this,
                GetType(),
                "success",
                "swal('Registered Successfully!', '', 'success');",
                true
                );
        }


        private void ClearForm()
        {
            txtParentName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtcity.Text = "";
            txtMessage.Text = "";

            ddlFeedbackType.SelectedIndex = 0;
            hfRating.Value = "";
        }

    }
}