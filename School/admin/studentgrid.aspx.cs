using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace School.admin
{
    public partial class studentgrid : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString);
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindClassDropdown();
                BindSectionDropdown();
                BindStudentGrid();
            }
        }

        private void BindClassDropdown()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT ClassID, ClassName FROM ClassMaster", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                ddlSearchClass.DataSource = dt;
                ddlSearchClass.DataTextField = "ClassName";
                ddlSearchClass.DataValueField = "ClassName";
                ddlSearchClass.DataBind();
                ddlSearchClass.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select Class --", ""));
            }
        }

        private void BindSectionDropdown()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT SectionID, SectionName FROM SectionMaster", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                ddlSearchSection.DataSource = dt;
                ddlSearchSection.DataTextField = "SectionName";
                ddlSearchSection.DataValueField = "SectionName";
                ddlSearchSection.DataBind();
                ddlSearchSection.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select Section --", ""));
            }
        }

        private void BindStudentGrid(string nameFilter = "", string classFilter = "", string sectionFilter = "")
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString))
            {
                string query = "SELECT * FROM Add_Student WHERE 1=1";
                if (!string.IsNullOrEmpty(nameFilter))
                    query += " AND StudentName LIKE @Name";
                if (!string.IsNullOrEmpty(classFilter))
                    query += " AND Class = @Class";
                if (!string.IsNullOrEmpty(sectionFilter))
                    query += " AND Section = @Section";

                SqlCommand cmd = new SqlCommand(query, con);

                if (!string.IsNullOrEmpty(nameFilter))
                    cmd.Parameters.AddWithValue("@Name", "%" + nameFilter + "%");
                if (!string.IsNullOrEmpty(classFilter))
                    cmd.Parameters.AddWithValue("@Class", classFilter);
                if (!string.IsNullOrEmpty(sectionFilter))
                    cmd.Parameters.AddWithValue("@Section", sectionFilter);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvStudents.DataSource = dt;
                gvStudents.DataBind();
            }
        }

        // GridView Paging
        protected void gvStudents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvStudents.PageIndex = e.NewPageIndex;
            BindStudentGrid(txtSearchName.Text.Trim(),
                            ddlSearchClass.SelectedValue,
                            ddlSearchSection.SelectedValue);
        }

        // Search button
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindStudentGrid(txtSearchName.Text.Trim(), ddlSearchClass.SelectedValue, ddlSearchSection.SelectedValue);
        }

        // Reset button
        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtSearchName.Text = "";
            ddlSearchClass.SelectedIndex = 0;
            ddlSearchSection.SelectedIndex = 0;
            BindStudentGrid();
        }

        // Edit
        protected void gvStudents_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            gvStudents.EditIndex = e.NewEditIndex;
            BindStudentGrid(txtSearchName.Text.Trim(), ddlSearchClass.SelectedValue, ddlSearchSection.SelectedValue);
        }

        // Cancel Edit
        protected void gvStudents_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            gvStudents.EditIndex = -1;
            BindStudentGrid(txtSearchName.Text.Trim(), ddlSearchClass.SelectedValue, ddlSearchSection.SelectedValue);
        }

        // Update
        protected void gvStudents_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int studentID = Convert.ToInt32(gvStudents.DataKeys[e.RowIndex].Value);
            GridViewRow row = gvStudents.Rows[e.RowIndex];

            string admissionno = ((TextBox)row.Cells[1].Controls[0]).Text.Trim();
            string studentName = ((TextBox)row.Cells[2].Controls[0]).Text.Trim();
            string className = ((TextBox)row.Cells[3].Controls[0]).Text.Trim();
            string totalFees = ((TextBox)row.Cells[4].Controls[0]).Text.Trim();
            string paidAmount = ((TextBox)row.Cells[5].Controls[0]).Text.Trim();
            string pendingAmt = ((TextBox)row.Cells[6].Controls[0]).Text.Trim();

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(@"
            UPDATE Add_Student SET
                AdmissionNo = @AdmissionNo,
                StudentName = @StudentName,
                Class = @Class,
                TotalFees = @TotalFees,
                PaidAmount = @PaidAmount,
                PendingAmount = @PendingAmount
            WHERE StudentID = @StudentID", con);

                cmd.Parameters.AddWithValue("@AdmissionNo", admissionno);
                cmd.Parameters.AddWithValue("@StudentName", studentName);
                cmd.Parameters.AddWithValue("@Class", className);
                cmd.Parameters.AddWithValue("@TotalFees", totalFees);
                cmd.Parameters.AddWithValue("@PaidAmount", paidAmount);
                cmd.Parameters.AddWithValue("@PendingAmount", pendingAmt);
                cmd.Parameters.AddWithValue("@StudentID", studentID);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            gvStudents.EditIndex = -1;
            BindStudentGrid(txtSearchName.Text.Trim(),
                            ddlSearchClass.SelectedValue,
                            ddlSearchSection.SelectedValue);
        }

        protected void gvStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditStudent")
            {
                int studentID = Convert.ToInt32(e.CommandArgument);

                using (SqlConnection con = new SqlConnection(
                    ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand(
                        "SELECT * FROM Add_Student WHERE StudentID=@StudentID", con);

                    cmd.Parameters.AddWithValue("@StudentID", studentID);
                    con.Open();

                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        hfStudentID.Value = studentID.ToString();
                        txtaddno.Text = dr["AdmissionNo"].ToString();
                        txtStudentName.Text = dr["StudentName"].ToString();
                        txtClass.Text = dr["Class"].ToString();
                        txtTotalFees.Text = dr["TotalFees"].ToString();
                        txtPaidAmount.Text = dr["PaidAmount"].ToString();
                        txtPaymentMode.Text = dr["PendingAmount"].ToString();
                    }
                }

                // OPEN MODAL
                ScriptManager.RegisterStartupScript(this, GetType(),
                    "OpenModal", "$('#editModal').modal('show');", true);
            }
        }


        protected void txtPaidAmount_TextChanged(object sender, EventArgs e)
        {
            decimal total = 0, paid = 0;

            decimal.TryParse(txtTotalFees.Text, out total);
            decimal.TryParse(txtPaidAmount.Text, out paid);

            if (paid > total)
            {
                txtPaidAmount.Text = "";
                txtPaymentMode.Text = total.ToString("0.00");
            }
            else
            {
                txtPaymentMode.Text = (total - paid).ToString("0.00");
            }

            ScriptManager.RegisterStartupScript(this, GetType(),
                "open", "$('#editModal').modal('show');", true);
        }

        protected void btnUpdateStudent_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand(@"
        UPDATE Add_Student SET
            AdmissionNo = @AdmissionNo,
            StudentName = @StudentName,
            Class = @Class,
            TotalFees = @TotalFees,
            PaidAmount = @PaidAmount,
            PendingAmount = @PendingAmount
        WHERE StudentID = @StudentID", con);

            cmd.Parameters.AddWithValue("@AdmissionNo", txtaddno.Text);
            cmd.Parameters.AddWithValue("@StudentName", txtStudentName.Text);
            cmd.Parameters.AddWithValue("@Class", txtClass.Text);
            cmd.Parameters.AddWithValue("@TotalFees", txtTotalFees.Text);
            cmd.Parameters.AddWithValue("@PaidAmount", txtPaidAmount.Text);
            cmd.Parameters.AddWithValue("@PendingAmount", txtPaymentMode.Text);
            cmd.Parameters.AddWithValue("@StudentID", hfStudentID.Value);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            BindStudentGrid();

            ScriptManager.RegisterStartupScript(this, GetType(),
                "close", "$('#editModal').modal('hide');", true);
        }


        // Delete
        protected void gvStudents_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int studentID = Convert.ToInt32(gvStudents.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Add_Student WHERE StudentID=@StudentID", con);
                cmd.Parameters.AddWithValue("@StudentID", studentID);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            BindStudentGrid(txtSearchName.Text.Trim(), ddlSearchClass.SelectedValue, ddlSearchSection.SelectedValue);
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
