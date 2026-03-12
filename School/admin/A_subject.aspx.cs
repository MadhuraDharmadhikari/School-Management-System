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
    public partial class A_subject : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
              ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindSubject();
                BindTeacher();
                BindClass();
                BindSection();
                BindGrid();
                BindEditSubject();
            }
        }

        // CLEAR FIELDS
        void ClearFields()
        {
            ddlClass.SelectedIndex = 0;
            ddlSection.SelectedIndex = 0;
            ddlSubject.SelectedIndex = 0;
            ddlTeacher.SelectedIndex = 0;
            ddlAcademicYear.SelectedIndex = 0;
        }

        // SUBJECT
        void BindSubject()
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT SubjectID,SubjectName FROM SubjectMaster", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlSubject.DataSource = dt;
            ddlSubject.DataTextField = "SubjectName";
            ddlSubject.DataValueField = "SubjectID";
            ddlSubject.DataBind();

            ddlSubject.Items.Insert(0, new ListItem("-- Select Subject --", ""));
        }

        // CLASS
        void BindClass()
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT ClassID,ClassName FROM ClassMaster", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlClass.DataSource = dt;
            ddlClass.DataTextField = "ClassName";
            ddlClass.DataValueField = "ClassID";
            ddlClass.DataBind();

            ddlClass.Items.Insert(0, new ListItem("-- Select Class --", ""));
        }

        // SECTION
        void BindSection()
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT SectionID,SectionName FROM SectionMaster", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlSection.DataSource = dt;
            ddlSection.DataTextField = "SectionName";
            ddlSection.DataValueField = "SectionID";
            ddlSection.DataBind();

            ddlSection.Items.Insert(0, new ListItem("-- Select Section --", ""));
        }

        // TEACHER
        void BindTeacher()
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT TeacherID,TeacherName FROM add_teacher WHERE Status=1", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlTeacher.DataSource = dt;
            ddlTeacher.DataTextField = "TeacherName";
            ddlTeacher.DataValueField = "TeacherID";
            ddlTeacher.DataBind();

            ddlTeacher.Items.Insert(0, new ListItem("-- Select Teacher --", ""));
        }

        // GRID
        void BindGrid()
        {
            string q = @"
            SELECT 
                a.CSA_ID,
                c.ClassName,
                s.SectionName,
                sm.SubjectName,
                t.TeacherName,
                a.AcademicYear
            FROM ClassSubjectAllocation a
            JOIN ClassMaster c ON a.ClassID=c.ClassID
            JOIN SectionMaster s ON a.SectionID=s.SectionID
            JOIN SubjectMaster sm ON a.SubjectID=sm.SubjectID
            JOIN add_teacher t ON a.TeacherID=t.TeacherID
            WHERE a.IsActive=1";

            SqlDataAdapter da = new SqlDataAdapter(q, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvSubjects.DataSource = dt;
            gvSubjects.DataBind();
        }

        // SUBJECT DUPLICATE
        bool IsDuplicate()
        {
            SqlCommand cmd = new SqlCommand(@"
            SELECT COUNT(*) FROM ClassSubjectAllocation
            WHERE ClassID=@C
            AND SectionID=@S
            AND SubjectID=@Sub
            AND AcademicYear=@Y
            AND IsActive=1", con);

            cmd.Parameters.AddWithValue("@C", ddlClass.SelectedValue);
            cmd.Parameters.AddWithValue("@S", ddlSection.SelectedValue);
            cmd.Parameters.AddWithValue("@Sub", ddlSubject.SelectedValue);
            cmd.Parameters.AddWithValue("@Y", ddlAcademicYear.SelectedValue);

            con.Open();
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();

            return count > 0;
        }

        // TEACHER DUPLICATE
        bool IsTeacherDuplicate()
        {
            SqlCommand cmd = new SqlCommand(@"
            SELECT COUNT(*) FROM ClassSubjectAllocation
            WHERE ClassID=@C
            AND SectionID=@S
            AND TeacherID=@T
            AND AcademicYear=@Y
            AND IsActive=1", con);

            cmd.Parameters.AddWithValue("@C", ddlClass.SelectedValue);
            cmd.Parameters.AddWithValue("@S", ddlSection.SelectedValue);
            cmd.Parameters.AddWithValue("@T", ddlTeacher.SelectedValue);
            cmd.Parameters.AddWithValue("@Y", ddlAcademicYear.SelectedValue);

            con.Open();
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();

            return count > 0;
        }

        // SAVE
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (ddlClass.SelectedIndex == 0 ||
                ddlSection.SelectedIndex == 0 ||
                ddlSubject.SelectedIndex == 0 ||
                ddlTeacher.SelectedIndex == 0 ||
                ddlAcademicYear.SelectedIndex == 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(),
                    "err", "swal('Error','Please fill all fields','error');", true);
                return;
            }

            if (IsDuplicate())
            {
                ScriptManager.RegisterStartupScript(this, GetType(),
                    "dup", "swal('Duplicate','Subject already allocated for this class & section','warning');", true);
                return;
            }

            if (IsTeacherDuplicate())
            {
                ScriptManager.RegisterStartupScript(this, GetType(),
                    "dup2", "swal('Teacher Assigned','Teacher already allocated for this class','warning');", true);
                return;
            }

            SqlCommand cmd = new SqlCommand(@"
            INSERT INTO ClassSubjectAllocation
            (ClassID,SectionID,SubjectID,TeacherID,AcademicYear,IsActive)
            VALUES(@C,@S,@Sub,@T,@Y,1)", con);

            cmd.Parameters.AddWithValue("@C", ddlClass.SelectedValue);
            cmd.Parameters.AddWithValue("@S", ddlSection.SelectedValue);
            cmd.Parameters.AddWithValue("@Sub", ddlSubject.SelectedValue);
            cmd.Parameters.AddWithValue("@T", ddlTeacher.SelectedValue);
            cmd.Parameters.AddWithValue("@Y", ddlAcademicYear.SelectedValue);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            ScriptManager.RegisterStartupScript(this, GetType(),
                "save", "swal('Success','Subject Assigned Successfully','success');", true);

            BindGrid();
            ClearFields();
        }

        // GRID PAGING
        protected void gvSubjects_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSubjects.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        // GRID COMMAND
        protected void gvSubjects_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                hfCSAID.Value = e.CommandArgument.ToString();

                BindEditSubject();
                BindEditTeacher();

                SqlCommand cmd = new SqlCommand(
                    "SELECT SubjectID,TeacherID FROM ClassSubjectAllocation WHERE CSA_ID=@ID", con);

                cmd.Parameters.AddWithValue("@ID", hfCSAID.Value);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    ddlEditSubject.SelectedValue = dr["SubjectID"].ToString();
                    ddlEditTeacher.SelectedValue = dr["TeacherID"].ToString();
                }

                con.Close();

                ScriptManager.RegisterStartupScript(this, GetType(),
                    "show", "$('#editModal').modal('show');", true);
            }

            else if (e.CommandName == "DeleteRow")
            {
                SqlCommand cmd = new SqlCommand(
                    "UPDATE ClassSubjectAllocation SET IsActive=0 WHERE CSA_ID=@ID", con);

                cmd.Parameters.AddWithValue("@ID", e.CommandArgument);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                ScriptManager.RegisterStartupScript(this, GetType(),
                    "del", "swal('Deleted','Record Deleted Successfully','success');", true);

                BindGrid();
            }
        }

        // EDIT SUBJECT
        void BindEditSubject()
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT SubjectID,SubjectName FROM SubjectMaster", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlEditSubject.DataSource = dt;
            ddlEditSubject.DataTextField = "SubjectName";
            ddlEditSubject.DataValueField = "SubjectID";
            ddlEditSubject.DataBind();
        }

        // EDIT TEACHER
        void BindEditTeacher()
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT TeacherID,TeacherName FROM add_teacher WHERE Status=1", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlEditTeacher.DataSource = dt;
            ddlEditTeacher.DataTextField = "TeacherName";
            ddlEditTeacher.DataValueField = "TeacherID";
            ddlEditTeacher.DataBind();
        }

        // UPDATE
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand(@"
            UPDATE ClassSubjectAllocation
            SET SubjectID=@Sub,TeacherID=@T
            WHERE CSA_ID=@ID", con);

            cmd.Parameters.AddWithValue("@Sub", ddlEditSubject.SelectedValue);
            cmd.Parameters.AddWithValue("@T", ddlEditTeacher.SelectedValue);
            cmd.Parameters.AddWithValue("@ID", hfCSAID.Value);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            ScriptManager.RegisterStartupScript(this, GetType(), "sweet",
                  "Swal.fire({icon:'success',title:'Timetable Saved Successfully',showConfirmButton:false,timer:2000});",
                  true);

            BindGrid();

            ScriptManager.RegisterStartupScript(this, GetType(),
                "hide", "$('#editModal').modal('hide');", true);
        }

        // CLOSE MODAL
        protected void btnCloseModal_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(
                this,
                GetType(),
                "CloseModal",
                "$('#editModal').modal('hide');",
                true);
        }
    }
}