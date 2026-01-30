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
    public partial class A_timetable : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
             ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadClass();
                LoadSection();
                LoadPeriod();
                LoadSubject();
                LoadTeacher();
                gvTimeTable.DataBind();
            }
        }

        // ================= DROPDOWNS =================

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
            ddlClass.Items.Insert(0, new ListItem("-- Select --", ""));
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
            ddlSection.Items.Insert(0, new ListItem("-- Select --", ""));
        }

        void LoadPeriod()
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT TimeSlotID, PeriodName FROM TimeSlotMaster", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlPeriod.DataSource = dt;
            ddlPeriod.DataTextField = "PeriodName";
            ddlPeriod.DataValueField = "TimeSlotID";
            ddlPeriod.DataBind();
            ddlPeriod.Items.Insert(0, new ListItem("-- Select --", ""));
        }

        void LoadSubject()
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT SubjectID, SubjectName FROM SubjectMaster WHERE IsActive=1", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlSubject.DataSource = dt;
            ddlSubject.DataTextField = "SubjectName";
            ddlSubject.DataValueField = "SubjectID";
            ddlSubject.DataBind();
            ddlSubject.Items.Insert(0, new ListItem("-- Select --", ""));
        }

        void LoadTeacher()
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT TeacherID, TeacherName FROM add_teacher WHERE Status=1", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlTeacher.DataSource = dt;
            ddlTeacher.DataTextField = "TeacherName";
            ddlTeacher.DataValueField = "TeacherID";
            ddlTeacher.DataBind();
            ddlTeacher.Items.Insert(0, new ListItem("-- Select --", ""));
        }

        // ================= CLASH CHECK =================

        bool IsClassClash()
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT COUNT(*) FROM TimeTableMaster
                WHERE ClassID=@C AND SectionID=@S
                AND DayName=@D AND TimeSlotID=@P
                AND IsActive=1", con);

            cmd.Parameters.AddWithValue("@C", ddlClass.SelectedValue);
            cmd.Parameters.AddWithValue("@S", ddlSection.SelectedValue);
            cmd.Parameters.AddWithValue("@D", ddlDay.SelectedValue);
            cmd.Parameters.AddWithValue("@P", ddlPeriod.SelectedValue);

            con.Open();
            int count = (int)cmd.ExecuteScalar();
            con.Close();

            return count > 0;
        }

        bool IsTeacherClash()
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT COUNT(*) FROM TimeTableMaster
                WHERE TeacherID=@T
                AND DayName=@D AND TimeSlotID=@P
                AND IsActive=1", con);

            cmd.Parameters.AddWithValue("@T", ddlTeacher.SelectedValue);
            cmd.Parameters.AddWithValue("@D", ddlDay.SelectedValue);
            cmd.Parameters.AddWithValue("@P", ddlPeriod.SelectedValue);

            con.Open();
            int count = (int)cmd.ExecuteScalar();
            con.Close();

            return count > 0;
        }

        // ================= SAVE =================

        protected void btnSave_Click(object sender, EventArgs e)
        {
        

            SqlCommand cmd = new SqlCommand(@"
                INSERT INTO TimeTableMaster
                (ClassID, SectionID, DayName, TimeSlotID,
                 SubjectID, TeacherID, AcademicYear, IsActive)
                VALUES (@C,@S,@D,@P,@Sub,@T,@Y,1)", con);

            cmd.Parameters.AddWithValue("@C", ddlClass.SelectedValue);
            cmd.Parameters.AddWithValue("@S", ddlSection.SelectedValue);
            cmd.Parameters.AddWithValue("@D", ddlDay.SelectedValue);
            cmd.Parameters.AddWithValue("@P", ddlPeriod.SelectedValue);
            cmd.Parameters.AddWithValue("@Sub", ddlSubject.SelectedValue);
            cmd.Parameters.AddWithValue("@T", ddlTeacher.SelectedValue);
            cmd.Parameters.AddWithValue("@Y", ddlAcademicYear.SelectedValue);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

        }


        protected void btnViewTT_Click(object sender, EventArgs e)
{
    SqlDataAdapter da = new SqlDataAdapter(@"
        SELECT ts.PeriodName,
        MAX(CASE WHEN DayName='Monday' THEN sm.SubjectName + ' ('+at.TeacherName+')' END) AS Monday,
        MAX(CASE WHEN DayName='Tuesday' THEN sm.SubjectName + ' ('+at.TeacherName+')' END) AS Tuesday,
        MAX(CASE WHEN DayName='Wednesday' THEN sm.SubjectName + ' ('+at.TeacherName+')' END) AS Wednesday,
        MAX(CASE WHEN DayName='Thursday' THEN sm.SubjectName + ' ('+at.TeacherName+')' END) AS Thursday,
        MAX(CASE WHEN DayName='Friday' THEN sm.SubjectName + ' ('+at.TeacherName+')' END) AS Friday,
        MAX(CASE WHEN DayName='Saturday' THEN sm.SubjectName + ' ('+at.TeacherName+')' END) AS Saturday
        FROM TimeTableMaster t
        JOIN TimeSlotMaster ts ON t.TimeSlotID = ts.TimeSlotID
        JOIN SubjectMaster sm ON t.SubjectID = sm.SubjectID
        JOIN add_teacher at ON t.TeacherID = at.TeacherID
        WHERE t.ClassID=@C
        AND t.SectionID=@S
        AND t.AcademicYear=@Y
        AND t.IsActive=1
        GROUP BY ts.PeriodName
        ORDER BY ts.PeriodName", con);

    da.SelectCommand.Parameters.AddWithValue("@C", ddlClass.SelectedValue);
    da.SelectCommand.Parameters.AddWithValue("@S", ddlSection.SelectedValue);
    da.SelectCommand.Parameters.AddWithValue("@Y", ddlAcademicYear.SelectedValue);

    DataTable dt = new DataTable();
    da.Fill(dt);

    gvTimeTable.DataSource = dt;
    gvTimeTable.DataBind();
}

    }
}