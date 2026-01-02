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
    public partial class _default : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudentCount();
            }
        }


        void LoadStudentCount()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("SELECT COUNT(StudentId) FROM Students", con);

            con.Open();
            lblStduent.Text = cmd.ExecuteScalar().ToString();
            con.Close();
            LoadTeacher();
        }
        void LoadTeacher()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("Select  COUNT(TeacherId) From Teachers", con);
            con.Open();
            lblTeacher.Text = cmd.ExecuteScalar().ToString();
            con.Close();
        }
    }
}