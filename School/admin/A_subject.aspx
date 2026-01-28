<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site1.Master" AutoEventWireup="true" CodeBehind="A_subject.aspx.cs" Inherits="School.admin.A_subject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-body">
        <div class="container-fluid mt-4">
            <h5>📚 Subject Allocation</h5>

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
                        Text="Save"
                        CssClass="btn btn-primary"
                        OnClick="btnSave_Click" />
                </div>
            </div>

            <!-- GRID -->
            <div class="card">
                <div class="card-body">
                    <asp:GridView ID="gvSubjects" runat="server"
                        AutoGenerateColumns="False"
                        CssClass="table table-bordered mt-4"
                        AllowPaging="true"
                        PageSize="10"
                        OnPageIndexChanging="gvSubjects_PageIndexChanging"
                        OnRowCommand="gvSubjects_RowCommand">

                        <Columns>
                            <asp:BoundField DataField="ClassName" HeaderText="Class" />
                            <asp:BoundField DataField="SectionName" HeaderText="Section" />
                            <asp:BoundField DataField="SubjectName" HeaderText="Subject" />
                            <asp:BoundField DataField="TeacherName" HeaderText="Teacher" />
                            <asp:BoundField DataField="AcademicYear" HeaderText="Year" />

                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEdit" runat="server"
                                        CommandName="EditRow"
                                        CommandArgument='<%# Eval("CSA_ID") %>'
                                        CssClass="btn btn-sm btn-primary">
                                       Edit
                                    </asp:LinkButton>

                                    <asp:LinkButton ID="btnDelete" runat="server"
                                        CommandName="DeleteRow"
                                        CommandArgument='<%# Eval("CSA_ID") %>'
                                        CssClass="btn btn-sm btn-danger"
                                        OnClientClick="return confirm('Are you sure you want to delete?');">
                                         Delete
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                    <!-- EDIT MODAL -->
                    <div class="modal fade" id="editModal" tabindex="-1">
                        <div class="modal-dialog">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <h5>Edit Subject Allocation</h5>
                                    <asp:LinkButton ID="btnCloseModal" runat="server" CssClass="btn-close" OnClick="btnCloseModal_Click"> </asp:LinkButton>
                                </div>

                                <div class="modal-body">
                                    <asp:HiddenField ID="hfCSAID" runat="server" />

                                    <asp:DropDownList ID="ddlEditSubject" runat="server" CssClass="form-control mb-2" />
                                    <asp:DropDownList ID="ddlEditTeacher" runat="server" CssClass="form-control mb-2" />
                                </div>

                                <div class="modal-footer">
                                    <asp:Button ID="btnUpdate" runat="server"
                                        Text="Update"
                                        CssClass="btn btn-success"
                                        OnClick="btnUpdate_Click" />
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>



        </div>
    </div>

</asp:Content>
