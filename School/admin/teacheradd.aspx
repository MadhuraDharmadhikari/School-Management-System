<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site1.Master" AutoEventWireup="true" CodeBehind="teacheradd.aspx.cs" Inherits="School.admin.teacheradd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-body">

        <!-- row -->
        <div class="container-fluid">
            <div class="row">
                <div class="card">
                    <div class="stat-widget-two card-body">
                        <h2 class="card-title" style="font-size: 25px">Teacher Registration Form</h2>

                        <div class="row">
                            <!-- Teacher ID -->
                            <div class="col-md-3 mt-4">
                                <asp:Label ID="LabelT1" runat="server" Text="Teacher ID" Font-Bold="true"></asp:Label>
                                <asp:TextBox ID="txtTeacherId" CssClass="form-control" runat="server" Style="margin-top: 10px" BackColor="#f0f0f0" placeholder="Teacher ID"></asp:TextBox>
                            </div>

                            <!-- Joining Date -->
                            <div class="col-md-3 mt-4">
                                <asp:Label ID="LabelT2" runat="server" Text="Joining Date" Font-Bold="true"></asp:Label>
                                <asp:TextBox ID="txtjondt" CssClass="form-control" runat="server" Style="margin-top: 10px" TextMode="Date"></asp:TextBox>
                            </div>



                                   <!-- Qualification -->
                           <div class="col-md-6 mt-3">
                               <asp:Label ID="LabelT11" runat="server" Text="Qualification" Font-Bold="true"></asp:Label>
                              <asp:DropDownList ID="ddlquali" runat="server" CssClass="form-control"  Style="margin-top: 10px"></asp:DropDownList>
                           </div>

                            <!-- Teacher Name -->
                            <div class="col-md-6 mt-3">
                                <asp:Label ID="LabelT5" runat="server" Text="Teacher Name" Font-Bold="true"></asp:Label>
                                <asp:TextBox ID="txtTeacherName" CssClass="form-control" runat="server" Style="margin-top: 10px" placeholder="Teacher Name"></asp:TextBox>
                            </div>

                            <!-- DOB -->
                            <div class="col-md-3 mt-3">
                                <asp:Label ID="LabelT6" runat="server" Text="Date of Birth" Font-Bold="true"></asp:Label>
                                <asp:TextBox ID="txtbdt" CssClass="form-control" runat="server" Style="margin-top: 10px" TextMode="Date"></asp:TextBox>
                            </div>

                            <!-- Gender -->
                            <div class="col-md-3 mt-3">
                                <asp:Label ID="LabelT7" runat="server" Text="Gender" Font-Bold="true"></asp:Label>
                               <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control"  Style="margin-top: 10px"></asp:DropDownList>
                            </div>

                            <!-- Address -->
                            <div class="col-md-6 mt-3">
                                <asp:Label ID="LabelT8" runat="server" Text="Address" Font-Bold="true"></asp:Label>
                                <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" Style="margin-top: 10px" placeholder="Address"></asp:TextBox>
                            </div>

                            <!-- Phone -->
                            <div class="col-md-3 mt-3">
                                <asp:Label ID="LabelT9" runat="server" Text="Phone Number" Font-Bold="true"></asp:Label>
                                <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server" Style="margin-top: 10px" placeholder="Phone Number"></asp:TextBox>
                            </div>

                            <!-- Email -->
                            <div class="col-md-3 mt-3">
                                <asp:Label ID="LabelT10" runat="server" Text="Email Address" Font-Bold="true"></asp:Label>
                                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" Style="margin-top: 10px" placeholder="Email Address"></asp:TextBox>
                            </div>

                                                 <!-- Department -->
                            <div class="col-md-3 mt-4">
                                <asp:Label ID="LabelT3" runat="server" Text="Department" Font-Bold="true"></asp:Label>
                                <asp:DropDownList ID="ddldeprt" runat="server" CssClass="form-control"  Style="margin-top: 10px"></asp:DropDownList>
                            </div>

                            <!-- Designation -->
                            <div class="col-md-3 mt-4">
                                <asp:Label ID="LabelT4" runat="server" Text="Designation" Font-Bold="true"></asp:Label>
                                 <asp:DropDownList ID="ddldesigtination" runat="server" CssClass="form-control"  Style="margin-top: 10px" AutoPostBack="true"   OnSelectedIndexChanged="Salary_Changed"></asp:DropDownList>
                            </div>

                            <!-- Experience -->
                            <div class="col-md-3 mt-3">
                                <asp:Label ID="LabelT13" runat="server" Text="Experience (Years)" Font-Bold="true"></asp:Label>
                               <asp:DropDownList ID="ddlexp" runat="server" CssClass="form-control"  Style="margin-top: 10px" AutoPostBack="true"   OnSelectedIndexChanged="Salary_Changed"></asp:DropDownList>
                            </div>

                            <!-- Salary -->
                            <div class="col-md-3 mt-3">
                                <asp:Label ID="LabelT12" runat="server" Text="Salary" Font-Bold="true"></asp:Label>
                                <asp:TextBox ID="txtSalary" CssClass="form-control" runat="server" Style="margin-top: 10px" placeholder="Salary" ReadOnly="true"  BackColor="#f0f0f0"></asp:TextBox>
                            </div>


                        </div>
                    </div>
                </div>
                <div class="row g-3">
                    <div class="col-md-5"></div>
                    <div class="col-md-6">
                        <asp:Button ID="submit" runat="server" Text="Submit" BackColor="#00CC00" ForeColor="White" Onclientclick="return valid();" BorderColor="#009933" CssClass="btn" OnClick="submit_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

        <script>

        function valid() {
    <%--        var addno = document.getElementById('<%=this.txtaddno.ClientID %>').value.trim();--%>
            var teachid = document.getElementById('<%=this.txtTeacherId.ClientID%>').value.trim();
            var tejdt = document.getElementById('<%=this.txtjondt.ClientID%>').value.trim();
            var tedeprt= document.getElementById('<%=this.ddldeprt.ClientID%>').value.trim();
            var tedesig = document.getElementById('<%=this.ddldesigtination.ClientID%>').value.trim();
            var teanm = document.getElementById('<%=this.txtTeacherName.ClientID%>').value.trim();
            var tebdt = document.getElementById('<%=this.txtbdt.ClientID%>').value.trim();
            var tegender = document.getElementById('<%=this.ddlGender.ClientID%>').value.trim();
            var teadd = document.getElementById('<%=this.txtAddress.ClientID%>').value.trim();
            var tephone= document.getElementById('<%=this.txtPhone.ClientID%>').value.trim();
            var teaem = document.getElementById('<%=this.txtEmail.ClientID%>').value.trim();
            var tequli = document.getElementById('<%=this.ddlquali.ClientID%>').value.trim();
            var teexp = document.getElementById('<%=this.ddlexp.ClientID%>').value.trim();
            var tesalary = document.getElementById('<%=this.txtSalary.ClientID%>').value.trim();

            let mobilecon = /^\d{10}$/;
            let emailcon = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if (teachid === "" || tejdt === "" || tedeprt === "" || tedesig === "" || teanm === "" || tebdt === "" || tegender === "" || teadd === "" || tephone === "" || teaem === "" || tequli === "" || teexp === "" || tesalary === "") {
                swal("Please fill all details to proceed..!", "", "warning");
                return false;
            }

            if (!mobilecon.test(tephone)) {
                swal("Please enter a valid 10-digit contact number.", "", "warning");
                return false;
            }

            if (!emailcon.test(teaem)) {
                swal("Please enter a valid Email ID.", "", "warning");
                return false;
            }

            return true;
        }

        </script>
<script type="text/javascript">
    function clearForm() {
   <%--     document.getElementById('<%= txtaddno.ClientID %>').value = "";--%>
    document.getElementById('<%= txtTeacherId.ClientID %>').value = "";
    document.getElementById('<%= txtjondt.ClientID %>').value = "";
    document.getElementById('<%= txtTeacherName.ClientID %>').value = "";
    document.getElementById('<%= txtbdt.ClientID %>').value = "";
    document.getElementById('<%= txtAddress.ClientID %>').value = "";
    document.getElementById('<%= txtPhone.ClientID %>').value = "";
    document.getElementById('<%= txtEmail.ClientID %>').value = "";
    document.getElementById('<%= txtSalary.ClientID %>').value = "";


    document.getElementById('<%= ddldeprt.ClientID %>').selectedIndex = 0;
    document.getElementById('<%= ddldesigtination.ClientID %>').selectedIndex = 0;
    document.getElementById('<%= ddlGender.ClientID %>').selectedIndex = 0;
    document.getElementById('<%= ddlquali.ClientID %>').selectedIndex = 0;
    document.getElementById('<%= ddlexp.ClientID %>').selectedIndex = 0;
    }
</script>

</asp:Content>
