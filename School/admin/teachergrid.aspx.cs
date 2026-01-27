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
    public partial class teachergrid : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDepartments();
                BindDesignations();
                BindGrid();
            }
        }

        private void BindDepartments()
        {
            SqlCommand cmd = new SqlCommand("SELECT DepartmentID, DepartmentName FROM Departments", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlSearchDept.DataSource = dt;
            ddlSearchDept.DataTextField = "DepartmentName";
            ddlSearchDept.DataValueField = "DepartmentName";
            ddlSearchDept.DataBind();
            ddlSearchDept.Items.Insert(0, new ListItem("-- Select Department --", ""));
        }

        private void BindDesignations()
        {
            SqlCommand cmd = new SqlCommand("SELECT DesignationID, DesignationName FROM Designation", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlSearchDesig.DataSource = dt;
            ddlSearchDesig.DataTextField = "DesignationName";
            ddlSearchDesig.DataValueField = "DesignationName";
            ddlSearchDesig.DataBind();
            ddlSearchDesig.Items.Insert(0, new ListItem("-- Select Designation --", ""));
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string name = txtSearchName.Text.Trim();
            string dept = ddlSearchDept.SelectedValue;
            string desig = ddlSearchDesig.SelectedValue;

            string query = "SELECT * FROM Add_Teacher WHERE 1=1";

            if (!string.IsNullOrEmpty(name))
                query += " AND TeacherName LIKE @Name";

            if (!string.IsNullOrEmpty(dept))
                query += " AND Department = @Department";

            if (!string.IsNullOrEmpty(desig))
                query += " AND Designation = @Designation";

            SqlCommand cmd = new SqlCommand(query, con);

            if (!string.IsNullOrEmpty(name))
                cmd.Parameters.AddWithValue("@Name", "%" + name + "%");
            if (!string.IsNullOrEmpty(dept))
                cmd.Parameters.AddWithValue("@Department", dept);
            if (!string.IsNullOrEmpty(desig))
                cmd.Parameters.AddWithValue("@Designation", desig);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvTeachers.DataSource = dt;
            gvTeachers.DataBind();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtSearchName.Text = "";
            ddlSearchDept.SelectedIndex = 0;
            ddlSearchDesig.SelectedIndex = 0;
            BindGrid();
        }

        private void BindGrid()
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM Add_Teacher", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvTeachers.DataSource = dt;
            gvTeachers.DataBind();
        }


        protected void gvTeachers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvTeachers.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvTeachers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvTeachers.EditIndex = -1;
            BindGrid();
        }

        protected void gvTeachers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string teacherCode = gvTeachers.DataKeys[e.RowIndex].Value.ToString();

            GridViewRow row = gvTeachers.Rows[e.RowIndex];

            string teacherName = ((TextBox)row.Cells[1].Controls[0]).Text.Trim();
            string department = ((TextBox)row.Cells[2].Controls[0]).Text.Trim();
            string designation = ((TextBox)row.Cells[3].Controls[0]).Text.Trim();
            string joiningDate = ((TextBox)row.Cells[4].Controls[0]).Text.Trim();
            string dob = ((TextBox)row.Cells[5].Controls[0]).Text.Trim();
            string gender = ((TextBox)row.Cells[6].Controls[0]).Text.Trim();
            string address = ((TextBox)row.Cells[7].Controls[0]).Text.Trim();
            string phone = ((TextBox)row.Cells[8].Controls[0]).Text.Trim();
            string email = ((TextBox)row.Cells[9].Controls[0]).Text.Trim();
            string qualification = ((TextBox)row.Cells[10].Controls[0]).Text.Trim();
            string experience = ((TextBox)row.Cells[11].Controls[0]).Text.Trim();
            string salary = ((TextBox)row.Cells[12].Controls[0]).Text.Trim();

            SqlCommand cmd = new SqlCommand(@"UPDATE Add_Teacher 
                                             SET TeacherCode=@TeacherCode,TeacherName=@TeacherName, Department=@Department, Designation=@Designation,
                                                 JoiningDate=@JoiningDate, DateOfBirth=@DateOfBirth, Gender=@Gender,
                                                 Address=@Address, PhoneNumber=@PhoneNumber, EmailAddress=@EmailAddress,
                                                 Qualification=@Qualification, ExperienceYears=@ExperienceYears, Salary=@Salary
                                             WHERE TeacherID=@TeacherID", con);

            cmd.Parameters.AddWithValue("@TeacherCode", teacherCode);
            cmd.Parameters.AddWithValue("@TeacherName", teacherName);
            cmd.Parameters.AddWithValue("@Department", department);
            cmd.Parameters.AddWithValue("@Designation", designation);
            cmd.Parameters.AddWithValue("@JoiningDate", joiningDate);
            cmd.Parameters.AddWithValue("@DateOfBirth", dob);
            cmd.Parameters.AddWithValue("@Gender", gender);
            cmd.Parameters.AddWithValue("@Address", address);
            cmd.Parameters.AddWithValue("@PhoneNumber", phone);
            cmd.Parameters.AddWithValue("@EmailAddress", email);
            cmd.Parameters.AddWithValue("@Qualification", qualification);
            cmd.Parameters.AddWithValue("@ExperienceYears", experience);
            cmd.Parameters.AddWithValue("@Salary", salary);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            gvTeachers.EditIndex = -1;
            BindGrid();
        }

        protected void gvTeachers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string teacherCode = gvTeachers.DataKeys[e.RowIndex].Value.ToString();
            SqlCommand cmd = new SqlCommand("DELETE FROM Add_Teacher WHERE TeacherCode=@TeacherCode", con);
            cmd.Parameters.AddWithValue("@TeacherCode", teacherCode);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            BindGrid();
        }

        protected void gvTeachers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditTeacher")
            {
                string teacherCode = e.CommandArgument.ToString();

                SqlCommand cmd = new SqlCommand(
                    "SELECT * FROM Add_Teacher WHERE TeacherID=@TeacherID", con);
                cmd.Parameters.AddWithValue("@TeacherID", teacherCode);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    hfTeacherCode.Value = dr["TeacherID"].ToString();
                    txtid.Text = dr["TeacherCode"].ToString();
                    txtTeachenm.Text = dr["TeacherName"].ToString();
                    txtdepart.Text = dr["Department"].ToString();
                    txtdesignation.Text = dr["Designation"].ToString();
                    txtquli.Text = dr["Qualification"].ToString();
                    txteper.Text = dr["ExperienceYears"].ToString();
                    txtSalaryModal.Text = dr["Salary"].ToString();
                    txtPhoneModal.Text = dr["PhoneNumber"].ToString();
                }

                dr.Close();
                con.Close();

                // OPEN MODAL
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModal", @"
                    var myModal = new bootstrap.Modal(document.getElementById('editModal'));
                    myModal.show();
                    ", true);

            }
        }

        protected void gvTeachers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTeachers.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        private string SortDirection
        {
            get { return ViewState["SortDirection"] as string ?? "ASC"; }
            set { ViewState["SortDirection"] = value; }
        }

        protected void gvTeachers_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dt = GetTeachersData();

            SortDirection = SortDirection == "ASC" ? "DESC" : "ASC";
            dt.DefaultView.Sort = e.SortExpression + " " + SortDirection;

            gvTeachers.DataSource = dt;
            gvTeachers.DataBind();
        }

        private DataTable GetTeachersData()
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT * FROM Add_Teacher", con);

            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }



        protected void btnUpdateTeacher_Click1(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand(@"
            UPDATE Add_Teacher SET
                TeacherCode = @TeacherCode,
                TeacherName = @TeacherName,
                Department = @Department,
                Designation = @Designation,
                Qualification = @Qualification,
                ExperienceYears = @Experience,
                Salary = @Salary,
                PhoneNumber = @Phone
            WHERE TeacherID = @TeacherID", con);


            cmd.Parameters.AddWithValue("@TeacherID", hfTeacherCode.Value);
            cmd.Parameters.AddWithValue("@TeacherCode", txtid.Text);
            cmd.Parameters.AddWithValue("@TeacherName", txtTeachenm.Text);
            cmd.Parameters.AddWithValue("@Department", txtdepart.Text);
            cmd.Parameters.AddWithValue("@Designation", txtdesignation.Text);
            cmd.Parameters.AddWithValue("@Qualification", txtquli.Text);
            cmd.Parameters.AddWithValue("@Experience", txteper.Text);
            cmd.Parameters.AddWithValue("@Salary", txtSalaryModal.Text);
            cmd.Parameters.AddWithValue("@Phone", txtPhoneModal.Text);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            BindGrid();

            ScriptManager.RegisterStartupScript(this, GetType(), "HideModal", @"
            var modalEl = document.getElementById('editModal');
            var modal = bootstrap.Modal.getInstance(modalEl);
            modal.hide();
            ", true);


        }

        protected void btnCloseModal_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(
                this,
                GetType(),
                "CloseModal",
                @"
        var modalEl = document.getElementById('editModal');
        var modal = bootstrap.Modal.getInstance(modalEl);
        if (modal) {
            modal.hide();
        }
        ",
                true
            );
        }

    }
}