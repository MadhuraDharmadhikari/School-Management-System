<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site1.Master" AutoEventWireup="true" CodeBehind="contactgrid.aspx.cs" Inherits="School.admin.contactgrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-body">
        <!-- row -->
        <!-- Search Filters -->
        <div class="card m-4">
            <div class="card-body">
                <h5 class="card-title">Search Contact member</h5>
                <div class="row">
                    <div class="col-md-3">
                        <asp:TextBox ID="txtSearchName" runat="server" CssClass="form-control" Placeholder="Full Name"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                        <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-secondary ml-2" OnClick="btnReset_Click" />
                    </div>
                </div>
            </div>
        </div>


        <div class="card m-3">
            <div class="card-body">
                <h3 class="card-title mb-4">Registered Contact Us</h3>

                <div class="table-responsive">
                    <asp:GridView ID="gvStudents" runat="server"
                        CssClass="table table-bordered table-striped"
                        AutoGenerateColumns="False"
                        DataKeyNames="ContactId"
                        AllowPaging="True"
                        PageSize="10"
                        OnRowCommand="gvStudents_RowCommand"
                        OnPageIndexChanging="gvStudents_PageIndexChanging">

                        <Columns>

                            <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                            <asp:BoundField DataField="EmailAddress" HeaderText="Email Address" />
                            <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                            <asp:BoundField DataField="Subject" HeaderText="Subject" />
                            <asp:BoundField DataField="AdditionalMessage" HeaderText="Additional Message" />

                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>

                                    <asp:Button ID="btnContact" runat="server"
                                        CssClass="btn btn-primary btn-sm"
                                        Text='<%# Convert.ToBoolean(Eval("IsContacted")) ? "Contacted" : "Contact" %>'
                                        CommandName="Contact"
                                        CommandArgument='<%# Eval("ContactId") %>'
                                        Enabled='<%# !Convert.ToBoolean(Eval("IsContacted")) %>' />

                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
