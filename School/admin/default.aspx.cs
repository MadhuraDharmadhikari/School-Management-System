using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
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
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Add_Student", con);

            con.Open();
            txtstudent.Text = cmd.ExecuteScalar().ToString();
            con.Close();
            LoadTeacher();
        }
        void LoadTeacher()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("Select  SUM(PaidAmount) From Add_Student", con);
            con.Open();
            txtpaidfees.Text = cmd.ExecuteScalar().ToString();
            con.Close();
            LoadTotalFeesCollected();
        }

        void LoadTotalFeesCollected()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("Select  SUM(TotalFees) From Add_Student", con);
            con.Open();
            txttotalfees.Text = cmd.ExecuteScalar().ToString();
            con.Close();
            LoadPendingCollected();
        }

        void LoadPendingCollected()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("Select  SUM(PendingAmount) From Add_Student", con);
            con.Open();
            txtpending.Text = cmd.ExecuteScalar().ToString();
            con.Close();

        }



        //private void LoadTotalFeesCollected()
        //{
        //    SqlCommand cmd = new SqlCommand(
        //        "SELECT ISNULL(SUM(PaidAmount),0) FROM StudentFees", con);

        //    con.Open();
        //    decimal total = Convert.ToDecimal(cmd.ExecuteScalar());
        //    con.Close();

        //    txttotalfees.Text = total.ToString("₹ 0.00");
    }

    }
