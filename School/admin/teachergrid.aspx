<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site1.Master" AutoEventWireup="true" CodeBehind="teachergrid.aspx.cs" Inherits="School.admin.teachergrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-body">
        <div class="container-fluid">

            <div class="card m-3">
                <div class="card-body">
                    <h5 class="card-title">Search Teachers</h5>
                    <div class="row">
                        <!-- Teacher Name -->
                        <div class="col-md-3">
                            <asp:TextBox ID="txtSearchName" runat="server" CssClass="form-control" Placeholder="Teacher Name"></asp:TextBox>
                        </div>

                        <!-- Department -->
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlSearchDept" runat="server" CssClass="form-control">
                                <asp:ListItem Text="-- Select Department --" Value="" />
                            </asp:DropDownList>
                        </div>

                        <!-- Designation -->
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlSearchDesig" runat="server" CssClass="form-control">
                                <asp:ListItem Text="-- Select Designation --" Value="" />
                            </asp:DropDownList>
                        </div>

                        <!-- Buttons -->
                        <div class="col-md-3">
                            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                            <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-secondary ms-2" OnClick="btnReset_Click" />
                        </div>
                    </div>
                </div>
            </div>


            <div class="card mt-3">
                <div class="card-body">
                    <h2 class="card-title">Registered Teachers</h2>
                      <div class="table-responsive">
                    <asp:GridView ID="gvTeachers" runat="server"
                        CssClass="table table-bordered table-striped"
                        AutoGenerateColumns="False"
                        AllowPaging="true"
                        AllowSorting="true"
                        PageSize="10"
                        DataKeyNames="TeacherID"
                        OnPageIndexChanging="gvTeachers_PageIndexChanging"
                        OnSorting="gvTeachers_Sorting"
                        OnRowCommand="gvTeachers_RowCommand"
                        OnRowDeleting="gvTeachers_RowDeleting">


                        <Columns>
                            <asp:BoundField DataField="TeacherCode" HeaderText="Teacher ID" ReadOnly="True" />
                            <asp:BoundField DataField="TeacherName" HeaderText="Teacher Name" />
                            <asp:BoundField DataField="Department" HeaderText="Department" />
                            <asp:BoundField DataField="Designation" HeaderText="Designation" />

                            <asp:BoundField DataField="Qualification" HeaderText="Qualification" />
                            <asp:BoundField DataField="ExperienceYears" HeaderText="Experience" />
                            <asp:BoundField DataField="Salary" HeaderText="Salary" />
                            <asp:BoundField DataField="PhoneNumber" HeaderText="Phone" />



                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEdit"
                                        runat="server"
                                        CssClass="btn btn-sm btn-primary"
                                        CommandName="EditTeacher"
                                        CommandArgument='<%# Eval("TeacherCode") %>'>
                    Edit
                                    </asp:LinkButton>

                                    <asp:LinkButton ID="btnDelete"
                                        runat="server"
                                        CssClass="btn btn-sm btn-danger ms-2"
                                        CommandName="Delete"
                                        CommandArgument='<%# Eval("TeacherCode") %>'
                                        OnClientClick="return confirm('Are you sure?');">
                    Delete
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                          </div>
                    <!-- EDIT MODAL -->
                    <div class="modal fade" id="editModal" tabindex="-1">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <h5 class="modal-title">Edit Teacher</h5>
                                    <asp:LinkButton ID="btnCloseModal" runat="server" CssClass="btn-close"  OnClick="btnCloseModal_Click"> </asp:LinkButton>
                                </div>

                                <div class="modal-body">

                                    <asp:HiddenField ID="hfTeacherCode" runat="server" />

                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <asp:Label ID="Label1" runat="server" Text="Teacher ID" Font-Bold="true"></asp:Label>
                                            <asp:TextBox ID="txtid" runat="server" CssClass="form-control" />
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <asp:Label ID="lblTeacherName" runat="server" Text="Teacher Name" Font-Bold="true"></asp:Label>
                                            <asp:TextBox ID="txtTeachenm" runat="server" CssClass="form-control" />
                                        </div>

                                        <div class="col-md-6 mb-3">
                                            <asp:Label ID="lblDepartment" runat="server" Text="Department" Font-Bold="true"></asp:Label>
                                            <asp:TextBox ID="txtdepart" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>

                                        <div class="col-md-6 mb-3">
                                            <asp:Label ID="lblDesignation" runat="server" Text="Designation" Font-Bold="true"></asp:Label>
                                            <asp:TextBox ID="txtdesignation" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>

                                        <div class="col-md-6 mb-3">
                                            <asp:Label ID="lblQualification" runat="server" Text="Qualification" Font-Bold="true"></asp:Label>
                                            <asp:TextBox ID="txtquli" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>

                                        <div class="col-md-6 mb-3">
                                            <asp:Label ID="lblExperience" runat="server" Text="Experience (Years)" Font-Bold="true"></asp:Label>
                                            <asp:TextBox ID="txteper" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>

                                        <div class="col-md-6 mb-3">
                                            <asp:Label ID="lblSalary" runat="server" Text="Salary" Font-Bold="true"></asp:Label>
                                            <asp:TextBox ID="txtSalaryModal" runat="server" CssClass="form-control" ReadOnly="true" />
                                        </div>

                                        <div class="col-md-6 mb-3">
                                            <asp:Label ID="lblPhone" runat="server" Text="Phone" Font-Bold="true"></asp:Label>
                                            <asp:TextBox ID="txtPhoneModal" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>

                                </div>

                                <div class="modal-footer">
                                    <asp:Button ID="btnCancel" runat="server"
                                        CssClass="btn btn-secondary"
                                        Text="Cancel"
                                        OnClientClick="closeEditModal(); return false;" />

                                    <asp:Button ID="btnUpdateTeacher" runat="server" CssClass="btn btn-success" Text="Update" OnClick="btnUpdateTeacher_Click1" />
                                </div>

                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>

</asp:Content>
