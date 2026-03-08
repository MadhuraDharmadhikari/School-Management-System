using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace School.SchoolWebsite
{
    public partial class admission_enqure : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindClass();
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
                    ClearControls();

                    // Remove session so it won’t repeat
                    Session.Remove("AdmissionSuccess");
                }
            }
        }

        private void BindClass()
        {
            SqlCommand cmd = new SqlCommand("SELECT ClassID, ClassName FROM ClassMaster", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlclass.DataSource = dt;
            ddlclass.DataTextField = "ClassName";
            ddlclass.DataValueField = "ClassID"; // or GenderID
            ddlclass.DataBind();

            ddlclass.Items.Insert(0, new ListItem("-- Select Class --", "0"));
            BindGender();
        }
        private void BindGender()
        {
            SqlCommand cmd = new SqlCommand("SELECT GenderID, GenderName FROM GenderMaster", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlGender.DataSource = dt;
            ddlGender.DataTextField = "GenderName";
            ddlGender.DataValueField = "GenderName"; // or GenderID
            ddlGender.DataBind();

            ddlGender.Items.Insert(0, new ListItem("-- Select Gender --", ""));
         
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(
ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO Add_Student (ParentName, ParentEmail, ParentPhone, ParentAddress, Class,DOB,StudentName,Gender,AdmissionStatus) " +
                    "VALUES (@ParentName, @ParentEmail, @ParentPhone, @ParentAddress, @Class,@DOB,@StudentName,@Gender,@AdmissionStatus)", con);
              
                cmd.Parameters.AddWithValue("@ParentName", txtParentName.Text.Trim());
                cmd.Parameters.AddWithValue("@ParentEmail", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@ParentPhone", txtPhone.Text.Trim());
                cmd.Parameters.AddWithValue("@ParentAddress", txtcity.Text.Trim());
                cmd.Parameters.AddWithValue("@DOB", txtdbt.Text.Trim());
                cmd.Parameters.AddWithValue("@StudentName", txtstnm.Text.Trim());
                cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Class", ddlclass.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@AdmissionStatus", "Pending");


                con.Open();
                cmd.ExecuteNonQuery();
            }
                ClearControls();

            // Set success flag
            Session["AdmissionSuccess"] = true;

            // Redirect (VERY IMPORTANT)
            Response.Redirect("admission_enqure.aspx");


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
            txtcity.Text = "";
            ddlclass.SelectedIndex = 0;
            ddlGender.SelectedIndex = 0;
            txtdbt.Text = "";
            txtstnm.Text = "";

        }
    }
}
    

