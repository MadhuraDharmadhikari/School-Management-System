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
    public partial class enqurgrid : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindClassDropdown();
                BindSection();
                BindStudentGrid();
            }
        }

        // ================= SECTION DROPDOWN =================
        private void BindSection()
        {
            SqlCommand cmd = new SqlCommand("SELECT SectionName FROM SectionMaster", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlsection.DataSource = dt;
            ddlsection.DataTextField = "SectionName";
            ddlsection.DataValueField = "SectionName";
            ddlsection.DataBind();

            ddlsection.Items.Insert(0, new ListItem("-- Select Section --", ""));
        }

        // ================= CLASS DROPDOWN =================
        private void BindClassDropdown()
        {
            SqlCommand cmd = new SqlCommand("SELECT ClassName FROM ClassMaster", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlSearchClass.DataSource = dt;
            ddlSearchClass.DataTextField = "ClassName";
            ddlSearchClass.DataValueField = "ClassName";
            ddlSearchClass.DataBind();

            ddlSearchClass.Items.Insert(0, new ListItem("-- Select Class --", ""));
        }

        // ================= GRID BIND =================
        private void BindStudentGrid(string name = "", string className = "")
        {
            string query = "SELECT * FROM Add_Student WHERE AdmissionStatus='Pending'";

            if (!string.IsNullOrEmpty(name))
                query += " AND StudentName LIKE @name";

            if (!string.IsNullOrEmpty(className))
                query += " AND Class=@class";

            SqlCommand cmd = new SqlCommand(query, con);

            if (!string.IsNullOrEmpty(name))
                cmd.Parameters.AddWithValue("@name", "%" + name + "%");

            if (!string.IsNullOrEmpty(className))
                cmd.Parameters.AddWithValue("@class", className);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvStudents.DataSource = dt;
            gvStudents.DataBind();
        }

        // ================= GRID PAGING =================
        protected void gvStudents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvStudents.PageIndex = e.NewPageIndex;
            BindStudentGrid(txtSearchName.Text.Trim(), ddlSearchClass.SelectedValue);
        }

        // ================= SEARCH =================
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindStudentGrid(txtSearchName.Text.Trim(), ddlSearchClass.SelectedValue);
        }

        // ================= RESET =================
        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtSearchName.Text = "";
            ddlSearchClass.SelectedIndex = 0;
            BindStudentGrid();
        }

        // ================= EDIT BUTTON =================
        protected void gvStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditStudent")
            {
                int studentID = Convert.ToInt32(e.CommandArgument);

                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Add_Student WHERE StudentID=@id", con))
                {
                    cmd.Parameters.AddWithValue("@id", studentID);

                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        hfStudentID.Value = dr["StudentID"].ToString();

                        //txtaddno.Text = studentID.ToString("001");
                        txtadddt.Text = DateTime.Now.ToString("yyyy-MM-dd");

                        txtstnm.Text = dr["StudentName"].ToString();

                        if (dr["DOB"] != DBNull.Value)
                            txtdbt.Text = Convert.ToDateTime(dr["DOB"]).ToString("yyyy-MM-dd");

                        txtClass.Text = dr["Class"].ToString();

                        if (ddlsection.Items.FindByValue(dr["Section"].ToString()) != null)
                            ddlsection.SelectedValue = dr["Section"].ToString();

                        txtgen.Text = dr["Gender"].ToString();

                        txtprnm.Text = dr["ParentName"].ToString();
                        txtpradd.Text = dr["ParentAddress"].ToString();
                        txtprph.Text = dr["ParentPhone"].ToString();
                        txtprem.Text = dr["ParentEmail"].ToString();

                        decimal fees = GetClassFees(dr["Class"].ToString());

                        txttotalfee.Text = fees.ToString();
                        txtpaidfee.Text = "0";
                        txtpendingfee.Text = fees.ToString();
                    }

                    dr.Close();
                    con.Close();
                }

                ScriptManager.RegisterStartupScript(this, GetType(),
                    "OpenModal", "$('#editModal').modal('show');", true);
                GenerateAdmissionNo();
            }
        }
        private void GenerateAdmissionNo()
        {
            int next = 1;

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT ISNULL(MAX(CAST(AdmissionNo AS INT)),0) FROM Add_Student", con);

                con.Open();
                next = Convert.ToInt32(cmd.ExecuteScalar()) + 1;
                con.Close();
            }

            txtaddno.Text = next.ToString("000");
        }
        // ================= CLASS FEES =================
        private decimal GetClassFees(string className)
        {
            decimal fees = 0;

            SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString);

            SqlCommand cmd = new SqlCommand("SELECT TotalFees FROM ClassMaster WHERE ClassName=@class", con2);
            cmd.Parameters.AddWithValue("@class", className);

            con2.Open();
            object result = cmd.ExecuteScalar();

            if (result != null)
                fees = Convert.ToDecimal(result);

            con2.Close();

            return fees;
        }


        // ================= AUTO PENDING =================

        protected void txtpaidfee_TextChanged(object sender, EventArgs e)
        {
            decimal totalFees = 0;
            decimal paidAmount = 0;

            decimal.TryParse(txttotalfee.Text, out totalFees);
            decimal.TryParse(txtpaidfee.Text, out paidAmount);

            if (paidAmount > totalFees)
            {
                txtpaidfee.Text = "";
                txtpendingfee.Text = totalFees.ToString();

                ScriptManager.RegisterStartupScript(this, GetType(),
                "msg", "alert('Paid Amount cannot be greater than Total Fees');", true);
            }
            else
            {
                decimal pending = totalFees - paidAmount;
                txtpendingfee.Text = pending.ToString();
            }

            // reopen modal after postback
            ScriptManager.RegisterStartupScript(this, GetType(),
            "open", "$('#editModal').modal('show');", true);
        }

        protected void btnUpdateStudent_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(hfStudentID.Value))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "msg",
                        "Swal.fire('Error','Student ID missing','error');", true);
                    return;
                }

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand(@"
        UPDATE Add_Student SET
        AdmissionNo=@AdmissionNo,
        AdmissionDate=@AdmissionDate,
        Class=@Class,
        Section=@Section,
        StudentName=@StudentName,
        DOB=@DOB,
        Gender=@Gender,
        ParentName=@ParentName,
        ParentAddress=@ParentAddress,
        ParentPhone=@ParentPhone,
        ParentEmail=@ParentEmail,
        TotalFees=@TotalFees,
        PaidAmount=@PaidAmount,
        PendingAmount=@PendingAmount,
        PaymentMode=@PaymentMode,
        AdmissionStatus='Confirm'
        WHERE StudentID=@StudentID", con);

                    cmd.Parameters.AddWithValue("@StudentID", Convert.ToInt32(hfStudentID.Value));
                    cmd.Parameters.AddWithValue("@AdmissionNo", txtaddno.Text);
                    cmd.Parameters.AddWithValue("@AdmissionDate", txtadddt.Text);
                    cmd.Parameters.AddWithValue("@Class", txtClass.Text);
                    cmd.Parameters.AddWithValue("@Section", ddlsection.SelectedValue);
                    cmd.Parameters.AddWithValue("@StudentName", txtstnm.Text);

                    if (!string.IsNullOrEmpty(txtdbt.Text))
                        cmd.Parameters.AddWithValue("@DOB", Convert.ToDateTime(txtdbt.Text));
                    else
                        cmd.Parameters.AddWithValue("@DOB", DBNull.Value);

                    cmd.Parameters.AddWithValue("@Gender", txtgen.Text);
                    cmd.Parameters.AddWithValue("@ParentName", txtprnm.Text);
                    cmd.Parameters.AddWithValue("@ParentAddress", txtpradd.Text);
                    cmd.Parameters.AddWithValue("@ParentPhone", txtprph.Text);
                    cmd.Parameters.AddWithValue("@ParentEmail", txtprem.Text);
                    cmd.Parameters.AddWithValue("@TotalFees", Convert.ToDecimal(txttotalfee.Text));
                    cmd.Parameters.AddWithValue("@PaidAmount", Convert.ToDecimal(txtpaidfee.Text));
                    cmd.Parameters.AddWithValue("@PendingAmount", Convert.ToDecimal(txtpendingfee.Text));

                    cmd.Parameters.AddWithValue("@PaymentMode",
                        string.IsNullOrEmpty(ddlPaymentMode.SelectedValue) ? "Cash" : ddlPaymentMode.SelectedValue);

                    con.Open();
                    int rows = cmd.ExecuteNonQuery();

                    if (rows > 0)
                    {
                        BindStudentGrid();

                        ScriptManager.RegisterStartupScript(this, GetType(), "success",
                            "Swal.fire('Success','Admission Confirmed Successfully','success');$('#editModal').modal('hide');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "error",
                            "Swal.fire('Error','Update failed','error');$('#editModal').modal('show');", true);
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "error",
                    "Swal.fire('Error','" + ex.Message.Replace("'", "") + "','error');", true);
            }
        }
        // ================= DELETE =================
        protected void gvStudents_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvStudents.DataKeys[e.RowIndex].Value);

            SqlCommand cmd = new SqlCommand("DELETE FROM Add_Student WHERE StudentID=@id", con);
            cmd.Parameters.AddWithValue("@id", id);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            BindStudentGrid();
        }

        // ================= CLOSE MODAL =================
        protected void btnCloseModal_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(),
                "close", "$('#editModal').modal('hide');", true);
        }
    }
}