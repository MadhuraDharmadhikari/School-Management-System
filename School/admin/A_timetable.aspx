<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site1.Master" AutoEventWireup="true" CodeBehind="A_timetable.aspx.cs" Inherits="School.admin.A_timetable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-body">
        <div class="container-fluid mt-4">
            <h4>📅 Timetable Management</h4>

            <!-- ADD FORM -->
            <div class="card mb-4">
                <div class="card-body">
                    <div class="row">

                        <div class="col-md-4 mb-3">
                            <label>Class</label>
                            <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>

                        <div class="col-md-4 mb-3">
                            <label>Section</label>
                            <asp:DropDownList ID="ddlSection" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label>Days</label>
                            <asp:DropDownList ID="ddlDay" runat="server" CssClass="form-control">
                                <asp:ListItem>Monday</asp:ListItem>
                                <asp:ListItem>Tuesday</asp:ListItem>
                                <asp:ListItem>Wednesday</asp:ListItem>
                                <asp:ListItem>Thursday</asp:ListItem>
                                <asp:ListItem>Friday</asp:ListItem>
                                <asp:ListItem>Saturday</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label>Period</label>
                             <asp:DropDownList ID="ddlPeriod" runat="server" CssClass="form-control" />
                        </div>

                        <div class="col-md-4 mb-3">
                            <label>Subject</label>
                            <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control" />
                        </div>
                        <div class="col-md-4 mb-3">
                            <label>Teacher</label>
                            <asp:DropDownList ID="ddlTeacher" runat="server" CssClass="form-control" />
                        </div>
                        <div class="col-md-4 mb-3">
                            <label>Academic Year</label>
                            <asp:DropDownList ID="ddlAcademicYear" runat="server" CssClass="form-control">
                                <asp:ListItem Text="-- Select --" Value=""></asp:ListItem>
                                <asp:ListItem>2024-25</asp:ListItem>
                                <asp:ListItem>2025-26</asp:ListItem>
                                <asp:ListItem>2026-27</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                    </div>

                    <asp:Button ID="btnSave" runat="server"
                        Text="Save Timetable"
                        CssClass="btn btn-primary"
                        OnClick="btnSave_Click" />
                </div>
            </div>

            <!-- FULL TIMETABLE GRID -->
<div class="card mt-4">
    <div class="card-body">
        <h5>📊 Class Timetable View</h5>

        <asp:Button ID="btnViewTT" runat="server"
            Text="View Timetable"
            CssClass="btn btn-info mb-3"
            OnClick="btnViewTT_Click" />

        <asp:GridView ID="gvTimeTable" runat="server"
            CssClass="table table-bordered text-center"
            AutoGenerateColumns="true" />
    </div>
</div>


        </div>
    </div>
</asp:Content>
