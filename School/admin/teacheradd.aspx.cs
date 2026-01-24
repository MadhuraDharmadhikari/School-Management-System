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
            ddldesigtination.DataValueField = "DesignationName"; // or GenderID
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
            ddlexp.DataValueField = "ExperienceRange"; // or GenderID
            ddlexp.DataBind();

            ddlexp.Items.Insert(0, new ListItem("-- Select Experience --", ""));
            //BindDepart();
        }





        protected void submit_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(
                    ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(@" INSERT INTO Add_Teacher(TeacherCode,TeacherName,Department,Designation,JoiningDate,DateOfBirth,Gender,Address,PhoneNumber,EmailAddress,Qualification,Salary,ExperienceYears)
                  VALUES(@TeacherCode,@TeacherName,@Department,@Designation,@JoiningDate,@DateOfBirth,@Gender,@Address,@PhoneNumber,@EmailAddress,@Qualification,@Salary,@ExperienceYears)", con);
                DateTime dtAdd_Reg = Convert.ToDateTime(txtJoiningDate.Text);
                DateTime dtBirth_Date = Convert.ToDateTime(txtDOB.Text);

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
                //txtStudentName.Text = "";
                //txtDOB.Text = "";
                //txtClass.Text = "";
                //txtParentName.Text = "";
                //txtPhone.Text = "";
                //txtEmail.Text = "";
                //txtMessage.Text = "";


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Registered Successfully..!','','success');", true);
            }
        }
    }
}