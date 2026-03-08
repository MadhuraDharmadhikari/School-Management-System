using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace School.admin
{
    public partial class teacheradd : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGender();
                GenerateAdmissionNo();
                txtSalary.ReadOnly = true;
            }
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
            BindDepart();
        }

        private void BindDepart()
        {
            SqlCommand cmd = new SqlCommand("SELECT DepartmentID, DepartmentName FROM Departments", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddldeprt.DataSource = dt;
            ddldeprt.DataTextField = "DepartmentName";
            ddldeprt.DataValueField = "DepartmentName"; // or GenderID
            ddldeprt.DataBind();

            ddldeprt.Items.Insert(0, new ListItem("-- Select Department --", ""));
            BindDesignation();
        }

        private void BindDesignation()
        {
            SqlCommand cmd = new SqlCommand("SELECT DesignationID, DesignationName FROM Designation", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddldesigtination.DataSource = dt;
            ddldesigtination.DataTextField = "DesignationName";
            ddldesigtination.DataValueField = "DesignationID"; // or GenderID
            ddldesigtination.DataBind();

            ddldesigtination.Items.Insert(0, new ListItem("-- Select Department --", ""));
            BindQulification();
        }

        private void BindQulification()
        {
            SqlCommand cmd = new SqlCommand("SELECT QualificationID, QualificationName FROM Qualifications", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlquali.DataSource = dt;
            ddlquali.DataTextField = "QualificationName";
            ddlquali.DataValueField = "QualificationName"; // or GenderID
            ddlquali.DataBind();

            ddlquali.Items.Insert(0, new ListItem("-- Select Qualifications --", ""));
            BindExperiance();
        }

        private void BindExperiance()
        {
            SqlCommand cmd = new SqlCommand("SELECT ExperienceID, ExperienceRange FROM Experience", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlexp.DataSource = dt;
            ddlexp.DataTextField = "ExperienceRange";
            ddlexp.DataValueField = "ExperienceID"; // or GenderID
            ddlexp.DataBind();

            ddlexp.Items.Insert(0, new ListItem("-- Select Experience --", ""));
            //BindDepart();
        }
        protected void Salary_Changed(object sender, EventArgs e)
        {
            GenerateSalary();
        }
        private void GenerateSalary()
        {
            if (ddldesigtination.SelectedIndex == 0 || ddlexp.SelectedIndex == 0)
            {
                txtSalary.Text = "";
                return;
            }

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(@"
            SELECT BasicSalary 
            FROM SalaryStructure
            WHERE DesignationID = @DesignationID
              AND ExperienceID = @ExperienceID", con);

                cmd.Parameters.AddWithValue("@DesignationID", ddldesigtination.SelectedValue);
                cmd.Parameters.AddWithValue("@ExperienceID", ddlexp.SelectedValue);

                con.Open();
                object salary = cmd.ExecuteScalar();
                con.Close();

                txtSalary.Text = salary != null ? salary.ToString() : "0";
            }
        }








        protected void submit_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(
                    ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(@" INSERT INTO Add_Teacher(TeacherCode,TeacherName,Department,Designation,JoiningDate,DateOfBirth,Gender,Address,PhoneNumber,EmailAddress,Qualification,Salary,ExperienceYears)
                  VALUES(@TeacherCode,@TeacherName,@Department,@Designation,@JoiningDate,@DateOfBirth,@Gender,@Address,@PhoneNumber,@EmailAddress,@Qualification,@Salary,@ExperienceYears)", con);
                DateTime dtAdd_Reg = Convert.ToDateTime(txtjondt.Text);
                DateTime dtBirth_Date = Convert.ToDateTime(txtbdt.Text);

                cmd.Parameters.AddWithValue("@TeacherCode", txtTeacherId.Text.Trim());
                cmd.Parameters.AddWithValue("@JoiningDate", dtAdd_Reg.ToString("yyyy-MM-dd"));
                cmd.Parameters.AddWithValue("@Department", ddldeprt.SelectedValue);
                cmd.Parameters.AddWithValue("@Designation", ddldesigtination.SelectedValue);
                cmd.Parameters.AddWithValue("@TeacherName", txtTeacherName.Text.Trim());
                cmd.Parameters.AddWithValue("@DateOfBirth", dtBirth_Date.ToString("yyyy-MM-dd"));
                cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhone.Text.Trim());
                cmd.Parameters.AddWithValue("@EmailAddress", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Qualification", ddlquali.SelectedValue);
                cmd.Parameters.AddWithValue("@ExperienceYears", ddlexp.SelectedValue);
                cmd.Parameters.AddWithValue("@Salary", txtSalary.Text.Trim());

                con.Open();
                cmd.ExecuteNonQuery();
   
            }
 ClearControls();
            GenerateAdmissionNo();
            ScriptManager.RegisterStartupScript(
this,
GetType(),
"success",
"swal('Registered Successfully!', '', 'success');",
true
);
            GenerateAdmissionNo();
        }
        private void ClearControls()
        {
            txtTeacherId.Text = "";
            txtjondt.Text = "";
            txtTeacherName.Text = "";
            txtbdt.Text = "";
            txtAddress.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            txtSalary.Text = "";
  

            ddldeprt.SelectedIndex = 0;
            ddldesigtination.SelectedIndex = 0;
            ddlGender.SelectedIndex = 0;
            ddlquali.SelectedIndex = 0;
            ddlexp.SelectedIndex = 0;

        }

        private void GenerateAdmissionNo()
        {
            int next = 1;

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT ISNULL(MAX(CAST(TeacherCode AS INT)),0) FROM Add_Teacher", con);

                con.Open();
                next = Convert.ToInt32(cmd.ExecuteScalar()) + 1;
                con.Close();
            }

            txtTeacherId.Text = next.ToString("000");
        }


    }
}