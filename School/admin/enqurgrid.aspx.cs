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
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindStudentGrid();
            }
        }
        private void BindStudentGrid(string nameFilter = "")
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString))
            {
                string query = "SELECT * FROM AdmissionEnquiry WHERE 1=1";
                if (!string.IsNullOrEmpty(nameFilter))
                    query += " AND ParentName LIKE @Name";

                SqlCommand cmd = new SqlCommand(query, con);

                if (!string.IsNullOrEmpty(nameFilter))
                    cmd.Parameters.AddWithValue("@Name", "%" + nameFilter + "%");

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
            BindStudentGrid(txtSearchName.Text.Trim());
        }

        // Search button
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindStudentGrid(txtSearchName.Text.Trim());
        }

        // Reset button
        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtSearchName.Text = "";
            BindStudentGrid();
        }
    }
}