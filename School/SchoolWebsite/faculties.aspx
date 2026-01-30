<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolWebsite/School.Master" AutoEventWireup="true" CodeBehind="faculties.aspx.cs" Inherits="School.SchoolWebsite.faculties" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
          <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .faculty-card {
    background: #fff;
    border-radius: 15px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.08);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    overflow: hidden;
}

.faculty-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 12px 35px rgba(0,0,0,0.15);
}

.faculty-header {
    height: 90px;
    
}

.avatar-circle {
    width: 90px;
    height: 90px;
    background:#e1261c;
    color: #ffffff;
    border-radius: 50%;
    font-size: 40px;
    font-weight: 700;
    line-height: 90px;
    margin: auto;
    border: 4px solid  #e1261c;
}

.faculty-name {
    font-weight: 600;
    margin-top: 15px;
    color: #333;
}

.faculty-info {
    font-size: 14px;
    color: #555;
    line-height: 1.6;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
  
    <h2 class="text-center m-4 font-weight-bold">
        Our Faculty
    </h2>
   <div class="row justify-content-center my-5">
<asp:Repeater ID="rptTeachers" runat="server">
    <ItemTemplate>
        <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
            <div class="faculty-card text-center ">

                <!-- Top Color Bar -->
                <div class="faculty-header"></div>

                <!-- Avatar -->
                <div class="avatar-circle mt-n5">
                    <%# Eval("TeacherName").ToString().Substring(0,1) %>
                </div>

                <div class="card-body px-3">
                    <h5 class="faculty-name">
                        <%# Eval("TeacherName") %>
                    </h5>

                    <hr />

                    <p class="faculty-info">
                        🎓 <b>Qualification:</b> <%# Eval("Qualification") %><br />
                        🏫 <b>Department:</b> <%# Eval("Department") %><br />
                        📚 <b>Subjects:</b> <%# Eval("Subjects") %><br />
                        📞 <b>Mobile:</b> <%# Eval("PhoneNumber") %>
                    </p>
                </div>

            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>
</div>


</asp:Content>
