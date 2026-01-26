using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace School.admin
{
    public partial class studentadd : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindGender();
                //txtaddno.Text = GenerateAdmissionNo();
                txtaddno.ReadOnly = true;
                GenerateAdmissionNo();
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
            BindClass();
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
            BindSection();
        }

        protected void ddlclass_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlclass.SelectedValue == "0")
            {
                txttotalfee.Text = "";
                return;
            }

            using (SqlCommand cmd = new SqlCommand(
                "SELECT TotalFees FROM ClassMaster WHERE ClassID = @ClassID", con))
            {
                cmd.Parameters.Add("@ClassID", SqlDbType.Int)
                    .Value = Convert.ToInt32(ddlclass.SelectedValue);

                con.Open();
                object fee = cmd.ExecuteScalar();
                con.Close();

                if (fee != null)
                {
                    txttotalfee.Text = fee.ToString();
                }
            }
        }


        protected void txtPaidAmount_TextChanged(object sender, EventArgs e)
        {
            decimal total = 0, paid = 0;

            decimal.TryParse(txttotalfee.Text, out total);
            decimal.TryParse(txtpaidfee.Text, out paid);

            if (paid > total)
            {
                txtpaidfee.Text = "";
                txtpendingfee.Text = total.ToString("0.00");
                return;
            }

            txtpendingfee.Text = (total - paid).ToString("0.00");
        }




        private void BindSection()
        {
            SqlCommand cmd = new SqlCommand("SELECT SectionID, SectionName FROM SectionMaster", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlsection.DataSource = dt;
            ddlsection.DataTextField = "SectionName";
            ddlsection.DataValueField = "SectionName"; // or GenderID
            ddlsection.DataBind();

            ddlsection.Items.Insert(0, new ListItem("-- Select Section --", ""));
        }



        protected void submit_Click(object sender, EventArgs e)
        {
          
            using (SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(@" INSERT INTO Add_Student(AdmissionNo,AdmissionDate, Class, Section, StudentName, DOB, Gender,ParentName, ParentAddress, ParentPhone, ParentEmail,TotalFees, PaidAmount, PendingAmount, PaymentMode)
                  VALUES(@AdmissionNo,@AdmissionDate, @Class, @Section, @StudentName, @DOB, @Gender, @ParentName, @ParentAddress, @ParentPhone, @ParentEmail, @TotalFees, @PaidAmount, @PendingAmount, @PaymentMode )", con);
                DateTime dtAdd_Reg = Convert.ToDateTime(txtadddt.Text);
                DateTime dtBirth_Date = Convert.ToDateTime(txtdbt.Text);

                cmd.Parameters.AddWithValue("@AdmissionNo", txtaddno.Text.Trim());
                cmd.Parameters.AddWithValue("@AdmissionDate", dtAdd_Reg.ToString("yyyy-MM-dd"));
                cmd.Parameters.AddWithValue("@Class", ddlclass.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Section", ddlsection.SelectedValue);
                cmd.Parameters.AddWithValue("@StudentName", txtstnm.Text.Trim());
                cmd.Parameters.AddWithValue("@DOB", dtBirth_Date.ToString("yyyy-MM-dd"));
                cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                cmd.Parameters.AddWithValue("@ParentName", txtprnm.Text.Trim());
                cmd.Parameters.AddWithValue("@ParentAddress", txtpradd.Text.Trim());
                cmd.Parameters.AddWithValue("@ParentPhone", txtprph.Text.Trim());
                cmd.Parameters.AddWithValue("@ParentEmail", txtprem.Text.Trim());
                cmd.Parameters.AddWithValue("@TotalFees", txttotalfee.Text.Trim());
                cmd.Parameters.AddWithValue("@PaidAmount", txtpaidfee.Text.Trim());
                cmd.Parameters.AddWithValue("@PendingAmount", txtpendingfee.Text.Trim());
                cmd.Parameters.AddWithValue("@PaymentMode", ddlPaymentMode.SelectedItem.Text.Trim());
                con.Open();
                cmd.ExecuteNonQuery();
            }
    ClearControls();
            GenerateAdmissionNo();

            // Show SweetAlert without page reload
            ScriptManager.RegisterStartupScript(
        this,
        GetType(),
        "success",
        "swal('Registered Successfully!', '', 'success');",
        true
    );
            GenerateAdmissionNo();

            //Response.Redirect("studentadd.aspx", false);
            //Context.ApplicationInstance.CompleteRequest();
        }

        private void ClearControls()
        {
            txtaddno.Text = "";
            txtaddno.Text = "";
            txtadddt.Text = "";
            txtstnm.Text = "";
            txtdbt.Text = "";
            txtprnm.Text = "";
            txtpradd.Text = "";
            txtprph.Text = "";
            txtprem.Text = "";
            txttotalfee.Text = "";
            txtpaidfee.Text = "";
            txtpendingfee.Text = "";

            ddlclass.SelectedIndex = 0;
            ddlsection.SelectedIndex = 0;
            ddlGender.SelectedIndex = 0;
            ddlPaymentMode.SelectedIndex = 0;
            
        }

        private string GenerateAdmissionNo()
        {
            string admissionNo = "001";

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT MAX(AdmissionNo) FROM Add_Student", con);

                con.Open();
                object result = cmd.ExecuteScalar();
                con.Close();

                int next = 1;

                if (result != DBNull.Value && result != null)
                {
                    next = Convert.ToInt32(result) + 1;
                }

                admissionNo = next.ToString("000");
            }

            return admissionNo;
        }


    }
}