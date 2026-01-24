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
                                <asp:TextBox ID="txtTeacherId" CssClass="form-control card-title" runat="server" Style="margin-top: 10px" placeholder="Teacher ID"></asp:TextBox>
                            </div>

                            <!-- Joining Date -->
                            <div class="col-md-3 mt-4">
                                <asp:Label ID="LabelT2" runat="server" Text="Joining Date" Font-Bold="true"></asp:Label>
                                <asp:TextBox ID="txtJoiningDate" CssClass="form-control card-title" runat="server" Style="margin-top: 10px" TextMode="Date"></asp:TextBox>
                            </div>

                            <!-- Department -->
                            <div class="col-md-3 mt-4">
                                <asp:Label ID="LabelT3" runat="server" Text="Department" Font-Bold="true"></asp:Label>
                                <asp:DropDownList ID="ddldeprt" runat="server" CssClass="form-control"  Style="margin-top: 10px"></asp:DropDownList>
                            </div>

                            <!-- Designation -->
                            <div class="col-md-3 mt-4">
                                <asp:Label ID="LabelT4" runat="server" Text="Designation" Font-Bold="true"></asp:Label>
                                 <asp:DropDownList ID="ddldesigtination" runat="server" CssClass="form-control"  Style="margin-top: 10px"></asp:DropDownList>
                            </div>

                            <!-- Teacher Name -->
                            <div class="col-md-6 mt-3">
                                <asp:Label ID="LabelT5" runat="server" Text="Teacher Name" Font-Bold="true"></asp:Label>
                                <asp:TextBox ID="txtTeacherName" CssClass="form-control card-title" runat="server" Style="margin-top: 10px" placeholder="Teacher Name"></asp:TextBox>
                            </div>

                            <!-- DOB -->
                            <div class="col-md-3 mt-3">
                                <asp:Label ID="LabelT6" runat="server" Text="Date of Birth" Font-Bold="true"></asp:Label>
                                <asp:TextBox ID="txtDOB" CssClass="form-control card-title" runat="server" Style="margin-top: 10px" TextMode="Date"></asp:TextBox>
                            </div>

                            <!-- Gender -->
                            <div class="col-md-3 mt-3">
                                <asp:Label ID="LabelT7" runat="server" Text="Gender" Font-Bold="true"></asp:Label>
                               <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control"  Style="margin-top: 10px"></asp:DropDownList>
                            </div>

                            <!-- Address -->
                            <div class="col-md-6 mt-3">
                                <asp:Label ID="LabelT8" runat="server" Text="Address" Font-Bold="true"></asp:Label>
                                <asp:TextBox ID="txtAddress" CssClass="form-control card-title" runat="server" Style="margin-top: 10px" placeholder="Address"></asp:TextBox>
                            </div>

                            <!-- Phone -->
                            <div class="col-md-3 mt-3">
                                <asp:Label ID="LabelT9" runat="server" Text="Phone Number" Font-Bold="true"></asp:Label>
                                <asp:TextBox ID="txtPhone" CssClass="form-control card-title" runat="server" Style="margin-top: 10px" placeholder="Phone Number"></asp:TextBox>
                            </div>

                            <!-- Email -->
                            <div class="col-md-3 mt-3">
                                <asp:Label ID="LabelT10" runat="server" Text="Email Address" Font-Bold="true"></asp:Label>
                                <asp:TextBox ID="txtEmail" CssClass="form-control card-title" runat="server" Style="margin-top: 10px" placeholder="Email Address"></asp:TextBox>
                            </div>

                            <!-- Qualification -->
                            <div class="col-md-6 mt-3">
                                <asp:Label ID="LabelT11" runat="server" Text="Qualification" Font-Bold="true"></asp:Label>
                               <asp:DropDownList ID="ddlquali" runat="server" CssClass="form-control"  Style="margin-top: 10px"></asp:DropDownList>
                            </div>

                            <!-- Experience -->
                            <div class="col-md-3 mt-3">
                                <asp:Label ID="LabelT13" runat="server" Text="Experience (Years)" Font-Bold="true"></asp:Label>
                               <asp:DropDownList ID="ddlexp" runat="server" CssClass="form-control"  Style="margin-top: 10px"></asp:DropDownList>
                            </div>

                            <!-- Salary -->
                            <div class="col-md-3 mt-3">
                                <asp:Label ID="LabelT12" runat="server" Text="Salary" Font-Bold="true"></asp:Label>
                                <asp:TextBox ID="txtSalary" CssClass="form-control card-title" runat="server" Style="margin-top: 10px" placeholder="Salary"></asp:TextBox>
                            </div>


                        </div>
                    </div>
                </div>
                <div class="row g-3">
                    <div class="col-md-5"></div>
                    <div class="col-md-6">
                        <asp:Button ID="submit" runat="server" Text="Submit" BackColor="#00CC00" ForeColor="White" BorderColor="#009933" CssClass="btn" OnClick="submit_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
