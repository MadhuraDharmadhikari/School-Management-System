<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site1.Master" AutoEventWireup="true" CodeBehind="A_timetable.aspx.cs" Inherits="School.admin.A_timetable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-body">
<div class="container-fluid mt-4">

<h4>📅 Timetable Management</h4>

<div class="card mb-4">
<div class="card-body">

<div class="row">

<div class="col-md-4">
<label>Class</label>
<asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"></asp:DropDownList>
</div>

<div class="col-md-4">
<label>Section</label>
<asp:DropDownList ID="ddlSection" runat="server" CssClass="form-control"></asp:DropDownList>
</div>

<div class="col-md-4">
<label>Day</label>
<asp:DropDownList ID="ddlDay" runat="server" CssClass="form-control">
<asp:ListItem>Monday</asp:ListItem>
<asp:ListItem>Tuesday</asp:ListItem>
<asp:ListItem>Wednesday</asp:ListItem>
<asp:ListItem>Thursday</asp:ListItem>
<asp:ListItem>Friday</asp:ListItem>
<asp:ListItem>Saturday</asp:ListItem>
</asp:DropDownList>
</div>

<div class="col-md-4 mt-3">
<label>Period</label>
<asp:DropDownList ID="ddlPeriod" runat="server" CssClass="form-control">
    <asp:ListItem>P1</asp:ListItem>
<asp:ListItem>P2</asp:ListItem>
<asp:ListItem>P3</asp:ListItem>
<asp:ListItem>Luch</asp:ListItem>
<asp:ListItem>P4</asp:ListItem>
<asp:ListItem>P5</asp:ListItem>
</asp:DropDownList>
</div>

<div class="col-md-4 mt-3">
<label>Subject</label>
<asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control"></asp:DropDownList>
</div>

<div class="col-md-4 mt-3">
<label>Teacher</label>
<asp:DropDownList ID="ddlTeacher" runat="server" CssClass="form-control"></asp:DropDownList>
</div>

<div class="col-md-4 mt-3">
<label>Academic Year</label>
<asp:DropDownList ID="ddlAcademicYear" runat="server" CssClass="form-control">
<asp:ListItem Text="--Select--" Value=""></asp:ListItem>
<asp:ListItem>2024-25</asp:ListItem>
<asp:ListItem>2025-26</asp:ListItem>
<asp:ListItem>2026-27</asp:ListItem>
</asp:DropDownList>
</div>

</div>

<br />

<asp:Button ID="btnSave" runat="server"
Text="Save Timetable"
CssClass="btn btn-primary"
OnClick="btnSave_Click" />

</div>
</div>

<div class="card">
<div class="card-body">



<!-- HEADER -->
<asp:Repeater ID="rptClassTimeTable" runat="server" 
    OnItemDataBound="rptClassTimeTable_ItemDataBound">

<ItemTemplate>

<div style="page-break-after:always; margin-bottom:40px;">

<h3 style="text-align:center;">
Class : <%# Eval("ClassName") %> 
&nbsp;&nbsp; Section : <%# Eval("SectionName") %>
</h3>

<asp:GridView ID="gvClassTT" runat="server"
CssClass="table table-bordered text-center"
AutoGenerateColumns="false">

<Columns>

<asp:BoundField DataField="PeriodName" HeaderText="Period"/>

<asp:BoundField DataField="Monday" HeaderText="Monday"/>
<asp:BoundField DataField="Tuesday" HeaderText="Tuesday"/>
<asp:BoundField DataField="Wednesday" HeaderText="Wednesday"/>
<asp:BoundField DataField="Thursday" HeaderText="Thursday"/>
<asp:BoundField DataField="Friday" HeaderText="Friday"/>
<asp:BoundField DataField="Saturday" HeaderText="Saturday"/>

</Columns>

</asp:GridView>
    </div>
</ItemTemplate>

</asp:Repeater>
</div>
</div>

</div>
</div>
</asp:Content>