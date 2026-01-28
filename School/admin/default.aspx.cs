using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
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
                LoadStudentChart();
                LoadLast7DaysEnquiry();
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



        private void LoadStudentChart()
        {
            StringBuilder classList = new StringBuilder();
            StringBuilder boysList = new StringBuilder();
            StringBuilder girlsList = new StringBuilder();

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"
                        SELECT 
                            C.ClassName,
                            ISNULL(SUM(CASE WHEN S.Gender = 'Male' THEN 1 ELSE 0 END),0) AS Boys,
                            ISNULL(SUM(CASE WHEN S.Gender = 'Female' THEN 1 ELSE 0 END),0) AS Girls
                        FROM ClassMaster C
                        LEFT JOIN Add_Student S
                            ON LTRIM(RTRIM(C.ClassName)) = LTRIM(RTRIM(S.Class))
                        GROUP BY C.ClassName
                        ORDER BY 
                            CASE C.ClassName
                                WHEN 'Nursery' THEN 1
                                WHEN 'Junior KG' THEN 2
                                WHEN 'Senior KG' THEN 3
                                WHEN '1st' THEN 4
                                WHEN '2nd' THEN 5
                                WHEN '3rd' THEN 6
                                WHEN '4th' THEN 7
                                WHEN '5th' THEN 8
                                WHEN '6th' THEN 9
                                WHEN '7th' THEN 10
                                WHEN '8th' THEN 11
                                WHEN '9th' THEN 12
                                WHEN '10th' THEN 13
                                ELSE 99
                            END;
                        ";

                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    classList.Append("\"" + dr["ClassName"] + "\",");
                    boysList.Append(dr["Boys"] + ",");
                    girlsList.Append(dr["Girls"] + ",");
                }
            }

            hfClassLabels.Value = "[" + classList.ToString().TrimEnd(',') + "]";
            hfBoysData.Value = "[" + boysList.ToString().TrimEnd(',') + "]";
            hfGirlsData.Value = "[" + girlsList.ToString().TrimEnd(',') + "]";
        }
        void LoadLast7DaysEnquiry()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"
                SELECT ParentName, EmailAddress, PhoneNumber, Address, Class
                FROM fastAdmissionEnquiry
                WHERE CreatedDate >= CAST(GETDATE() - 6 AS DATE)
                ORDER BY CreatedDate DESC";

                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();

                gvFastEnquiry.DataSource = cmd.ExecuteReader();
                gvFastEnquiry.DataBind();
            }
        }

    }

}





