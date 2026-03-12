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
    public partial class A_classes : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
            ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadClass();
                LoadSection();
                LoadGrid();
                LoadTeachers();
                LoadTeachers1();
            }
        }

        void LoadClass()
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT ClassID, ClassName FROM ClassMaster", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlClass.DataSource = dt;
            ddlClass.DataTextField = "ClassName";
            ddlClass.DataValueField = "ClassID";
            ddlClass.DataBind();

            ddlClass.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select --", ""));
        }
        void LoadTeachers()
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT TeacherID, TeacherName FROM add_teacher WHERE Status=1", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlTeacher.DataSource = dt;
            ddlTeacher.DataTextField = "TeacherName";
            ddlTeacher.DataValueField = "TeacherID";
            ddlTeacher.DataBind();

            ddlTeacher.Items.Insert(0, new ListItem("-- Select Teacher --", ""));
        }

        void LoadTeachers1()
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT TeacherID, TeacherName FROM add_teacher WHERE Status=1", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlTeacher1.DataSource = dt;
            ddlTeacher1.DataTextField = "TeacherName";
            ddlTeacher1.DataValueField = "TeacherID";
            ddlTeacher1.DataBind();

            ddlTeacher1.Items.Insert(0, new ListItem("-- Select Teacher --", ""));
        }
        void LoadSection()
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT SectionID, SectionName FROM SectionMaster", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlSection.DataSource = dt;
            ddlSection.DataTextField = "SectionName";
            ddlSection.DataValueField = "SectionID";
            ddlSection.DataBind();

            ddlSection.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select --", ""));
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlCommand chk = new SqlCommand(
                @"SELECT COUNT(*) FROM ClassSectionMaster
          WHERE ClassID=@ClassID AND SectionID=@SectionID AND AcademicYear=@Year AND ClassTeacherID=@ClassTeacherID", con);

            chk.Parameters.AddWithValue("@ClassID", ddlClass.SelectedValue);
            chk.Parameters.AddWithValue("@SectionID", ddlSection.SelectedValue);
            chk.Parameters.AddWithValue("@Year", ddlAcademicYear.Text);
            chk.Parameters.AddWithValue("@ClassTeacherID", ddlTeacher1.Text);

            con.Open();
            int exists = (int)chk.ExecuteScalar();
            con.Close();

            if (exists > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                "Swal.fire('Already Exists','Class Section already added!','warning');", true);
                return;
            }

            SqlCommand cmd = new SqlCommand(
                @"INSERT INTO ClassSectionMaster (ClassID, SectionID, AcademicYear,ClassTeacherID)
          VALUES (@ClassID,@SectionID,@Year,@ClassTeacherID)", con);

            cmd.Parameters.AddWithValue("@ClassID", ddlClass.SelectedValue);
            cmd.Parameters.AddWithValue("@SectionID", ddlSection.SelectedValue);
            cmd.Parameters.AddWithValue("@Year", ddlAcademicYear.Text);
            cmd.Parameters.AddWithValue("@ClassTeacherID", ddlTeacher1.Text);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            LoadGrid();
            ClearFields();

            ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                "Swal.fire('Success','Class Section Saved Successfully!','success');", true);
        }
        void ClearFields()
{
    ddlClass.SelectedIndex = 0;
    ddlSection.SelectedIndex = 0;
    ddlTeacher.SelectedIndex = 0;
    ddlTeacher1.SelectedIndex = 0;
    ddlAcademicYear.Text = "";
}

        protected void gvClassSection_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditRow")
            {
                hfClassSectionID.Value = id.ToString();
                LoadTeachers();

                ScriptManager.RegisterStartupScript(
                    this, GetType(), "popup",
                    "$('#editModal').modal('show');", true);
            }

            if (e.CommandName == "DeleteRow")
            {
                SqlCommand cmd = new SqlCommand(
                    "UPDATE ClassSectionMaster SET Status=0 WHERE ClassSectionID=@ID", con);
                cmd.Parameters.AddWithValue("@ID", id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                LoadGrid();
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand(
                @"UPDATE ClassSectionMaster
          SET ClassTeacherID=@TeacherID
          WHERE ClassSectionID=@ID", con);

            cmd.Parameters.AddWithValue("@TeacherID", ddlTeacher.SelectedValue);
            cmd.Parameters.AddWithValue("@ID", hfClassSectionID.Value);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            LoadGrid();
        }

        protected void gvClassSection_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvClassSection.PageIndex = e.NewPageIndex;
            LoadGrid();
        }

        void LoadGrid(string search = "")
        {
            SqlCommand cmd = new SqlCommand(@"
        SELECT cs.ClassSectionID,
               c.ClassName,
               s.SectionName,
               cs.AcademicYear,
               at.TeacherName
        FROM ClassSectionMaster cs
        INNER JOIN ClassMaster c ON cs.ClassID = c.ClassID
        INNER JOIN SectionMaster s ON cs.SectionID = s.SectionID
        LEFT JOIN add_teacher at ON cs.ClassTeacherID = at.TeacherID
        WHERE cs.Status = 1
          AND (
                c.ClassName LIKE '%' + @search + '%'
             OR s.SectionName LIKE '%' + @search + '%'
             OR at.TeacherName LIKE '%' + @search + '%'
             OR cs.AcademicYear LIKE '%' + @search + '%'
          )", con);

            cmd.Parameters.AddWithValue("@search", search);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvClassSection.DataSource = dt;
            gvClassSection.DataBind();
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