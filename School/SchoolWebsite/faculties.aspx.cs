using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace School.SchoolWebsite
{
    public partial class faculties : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
     ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTeachers();
            }
        }

        private void LoadTeachers()
        {
            SqlCommand cmd = new SqlCommand(@"
SELECT
    T.TeacherID,
    T.TeacherName,
    T.PhoneNumber,
    T.Department,
    T.Qualification,
    Subjects = STUFF((
        SELECT DISTINCT ', ' + S2.SubjectName
        FROM ClassSubjectAllocation CSA2
        INNER JOIN SubjectMaster S2 
            ON CSA2.SubjectID = S2.SubjectID
        WHERE CSA2.TeacherID = T.TeacherID
          AND CSA2.IsActive = 1
        FOR XML PATH(''), TYPE
    ).value('.', 'NVARCHAR(MAX)'), 1, 2, '')
FROM Add_Teacher T
WHERE EXISTS (
    SELECT 1
    FROM ClassSubjectAllocation CSA
    WHERE CSA.TeacherID = T.TeacherID
      AND CSA.IsActive = 1
)
", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptTeachers.DataSource = dt;
            rptTeachers.DataBind();
        }

    }
}