<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site1.Master" AutoEventWireup="true" CodeBehind="feedbackgrid.aspx.cs" Inherits="School.admin.feedbackgrid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-body">
        <!-- row -->
        <!-- Search Filters -->
        <div class="card m-4">
            <div class="card-body">
                <h5 class="card-title">Search Feedback member</h5>
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
                <h3 class="card-title mb-4">Registered Feedback</h3>

                <div class="table-responsive">
                    <asp:GridView ID="gvStudents" runat="server"
                        CssClass="table table-bordered table-striped"
                        AutoGenerateColumns="False"
                        DataKeyNames="Id"
                        AllowPaging="True"
                        PageSize="10"
                        OnPageIndexChanging="gvStudents_PageIndexChanging">

                        <Columns>

                            <asp:BoundField DataField="ParentName" HeaderText="Full Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email Address" />
                                <asp:BoundField DataField="Phone" HeaderText="Phone Number" />
                            <asp:BoundField DataField="City" HeaderText="City" />
                            <asp:BoundField DataField="FeedbackType" HeaderText="Feedback Type" />
                            <asp:BoundField DataField="Rating" HeaderText="Rate" />
                            <asp:BoundField DataField="Message" HeaderText="feedback Message" />
                        
               
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
