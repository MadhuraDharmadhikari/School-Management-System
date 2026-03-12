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
          
                LoadSubject();
                LoadTeacher();
                LoadTimeTable();
                LoadClassSection();
            }
        }

        // ================= LOAD DROPDOWNS =================


        void LoadClassSection()
        {
            SqlDataAdapter da = new SqlDataAdapter(@"
    SELECT 
    c.ClassID,
    s.SectionID,
    c.ClassName,
    s.SectionName
    FROM ClassSectionMaster cs
    JOIN ClassMaster c ON cs.ClassID = c.ClassID
    JOIN SectionMaster s ON cs.SectionID = s.SectionID
    ", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            rptClassTimeTable.DataSource = dt;
            rptClassTimeTable.DataBind();
        }
        void LoadClass()
        {
            SqlDataAdapter da = new SqlDataAdapter(
            "SELECT ClassID,ClassName FROM ClassMaster", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlClass.DataSource = dt;
            ddlClass.DataTextField = "ClassName";
            ddlClass.DataValueField = "ClassID";
            ddlClass.DataBind();

            ddlClass.Items.Insert(0, new ListItem("--Select--", ""));
        }

        void LoadSection()
        {
            SqlDataAdapter da = new SqlDataAdapter(
            "SELECT SectionID,SectionName FROM SectionMaster", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlSection.DataSource = dt;
            ddlSection.DataTextField = "SectionName";
            ddlSection.DataValueField = "SectionID";
            ddlSection.DataBind();

            ddlSection.Items.Insert(0, new ListItem("--Select--", ""));
        }



        void LoadSubject()
        {
            SqlDataAdapter da = new SqlDataAdapter(
            "SELECT SubjectID,SubjectName FROM SubjectMaster WHERE IsActive=1", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlSubject.DataSource = dt;
            ddlSubject.DataTextField = "SubjectName";
            ddlSubject.DataValueField = "SubjectID";
            ddlSubject.DataBind();

            ddlSubject.Items.Insert(0, new ListItem("--Select--", ""));
        }

        void LoadTeacher()
        {
            SqlDataAdapter da = new SqlDataAdapter(
            "SELECT TeacherID,TeacherName FROM add_teacher WHERE Status=1", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlTeacher.DataSource = dt;
            ddlTeacher.DataTextField = "TeacherName";
            ddlTeacher.DataValueField = "TeacherID";
            ddlTeacher.DataBind();

            ddlTeacher.Items.Insert(0, new ListItem("--Select--", ""));
        }

        // ================= CLEAR FORM =================

        void ClearFields()
        {
            ddlClass.SelectedIndex = 0;
            ddlSection.SelectedIndex = 0;
            ddlDay.SelectedIndex = 0;
            ddlPeriod.SelectedIndex = 0;
            ddlSubject.SelectedIndex = 0;
            ddlTeacher.SelectedIndex = 0;
            ddlAcademicYear.SelectedIndex = 0;
        }

        // ================= SAVE TIMETABLE =================

        protected void btnSave_Click(object sender, EventArgs e)
        {

            SqlCommand cmd = new SqlCommand(@"
            INSERT INTO TimeTableMaster
            (ClassID,SectionID,DayName,TimeSlotID,SubjectID,TeacherID,AcademicYear,IsActive)

            VALUES(@C,@S,@D,@P,@Sub,@T,@Y,1)", con);

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

            ClearFields();
            LoadTimeTable();

            ScriptManager.RegisterStartupScript(this, GetType(), "sweet",
            "Swal.fire({icon:'success',title:'Timetable Saved Successfully',showConfirmButton:false,timer:2000});",
            true);
        }

        // ================= LOAD ALL TIMETABLE GROUPS =================

        void LoadTimeTable()
        {
            SqlDataAdapter da = new SqlDataAdapter(@"

            SELECT DISTINCT
            cm.ClassID,
            cm.ClassName,
            sm.SectionID,
            sm.SectionName

            FROM TimeTableMaster t
            JOIN ClassMaster cm ON t.ClassID = cm.ClassID
            JOIN SectionMaster sm ON t.SectionID = sm.SectionID

            WHERE t.IsActive=1

            ORDER BY cm.ClassName

            ", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            rptClassTimeTable.DataSource = dt;
            rptClassTimeTable.DataBind();
        }

        // ================= LOAD EACH CLASS TIMETABLE =================

        protected void rptClassTimeTable_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                int classID = Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "ClassID"));
                int sectionID = Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "SectionID"));

                GridView gv = (GridView)e.Item.FindControl("gvClassTT");

                SqlDataAdapter da = new SqlDataAdapter(@"

        SELECT
        t.TimeSlotID AS PeriodName,

        MAX(CASE WHEN DayName='Monday'
        THEN sm.SubjectName + ' ('+at.TeacherName+')' END) Monday,

        MAX(CASE WHEN DayName='Tuesday'
        THEN sm.SubjectName + ' ('+at.TeacherName+')' END) Tuesday,

        MAX(CASE WHEN DayName='Wednesday'
        THEN sm.SubjectName + ' ('+at.TeacherName+')' END) Wednesday,

        MAX(CASE WHEN DayName='Thursday'
        THEN sm.SubjectName + ' ('+at.TeacherName+')' END) Thursday,

        MAX(CASE WHEN DayName='Friday'
        THEN sm.SubjectName + ' ('+at.TeacherName+')' END) Friday,

        MAX(CASE WHEN DayName='Saturday'
        THEN sm.SubjectName + ' ('+at.TeacherName+')' END) Saturday

        FROM TimeTableMaster t
        JOIN SubjectMaster sm ON t.SubjectID = sm.SubjectID
        JOIN add_teacher at ON t.TeacherID = at.TeacherID

        WHERE t.ClassID=@C
        AND t.SectionID=@S
        AND t.IsActive=1

        GROUP BY t.TimeSlotID
        ORDER BY t.TimeSlotID

        ", con);

                da.SelectCommand.Parameters.AddWithValue("@C", classID);
                da.SelectCommand.Parameters.AddWithValue("@S", sectionID);

                DataTable dt = new DataTable();
                da.Fill(dt);

                gv.DataSource = dt;
                gv.DataBind();
            }
        }
    }
}