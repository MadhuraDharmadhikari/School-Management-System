<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site1.Master" AutoEventWireup="true" CodeBehind="studentgrid.aspx.cs" Inherits="School.admin.studentgrid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="content-body">

        <!-- row -->
             <!-- Search Filters -->
            <div class="card m-4">
                <div class="card-body">
                    <h5 class="card-title">Search Students</h5>
                    <div class="row">
                        <div class="col-md-3">
                            <asp:TextBox ID="txtSearchName" runat="server" CssClass="form-control" Placeholder="Student Name"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlSearchClass" runat="server" CssClass="form-control">
                                <asp:ListItem Text="-- Select Class --" Value="" />
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlSearchSection" runat="server" CssClass="form-control">
                                <asp:ListItem Text="-- Select Section --" Value="" />
                            </asp:DropDownList>
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
                    <h3 class="card-title mb-4">Registered Students</h3>
                 <%--   Gridview--%>
                    <div class="table-responsive">
                <asp:GridView ID="gvStudents" runat="server"
    CssClass="table table-bordered table-striped"
    AutoGenerateColumns="False"
    DataKeyNames="StudentID"
    AllowPaging="True"
    PageSize="10"

    OnPageIndexChanging="gvStudents_PageIndexChanging"
    OnRowEditing="gvStudents_RowEditing"
    OnRowUpdating="gvStudents_RowUpdating"
    OnRowCancelingEdit="gvStudents_RowCancelingEdit"
    OnRowDeleting="gvStudents_RowDeleting"
    OnRowCommand="gvStudents_RowCommand">
                        
                        <Columns>
                                   
                            <asp:BoundField DataField="AdmissionNo" HeaderText="Admission No" />
    
                              <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                            <asp:BoundField DataField="Class" HeaderText="Class" />
              
                           
                            <asp:BoundField DataField="TotalFees" HeaderText="Total Fees" />
                            <asp:BoundField DataField="PaidAmount" HeaderText="Paid Amount" />
                            <asp:BoundField DataField="PendingAmount" HeaderText="Pending Amount" />
                             <asp:BoundField DataField="ParentPhone" HeaderText="Parent Phone" />
<%--                            <asp:BoundField DataField="PaymentMode" HeaderText="Payment Mode" />--%>

                                   
        <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                <asp:LinkButton ID="btnEdit" runat="server"
                    CssClass="btn btn-sm btn-primary"
                    CommandName="EditStudent"
                    CommandArgument='<%# Eval("StudentID") %>'>
                    Edit
                </asp:LinkButton>

                <asp:LinkButton ID="btnDelete" runat="server"
                    CssClass="btn btn-sm btn-danger ms-1"
                    CommandName="Delete"
                    CommandArgument='<%# Eval("StudentID") %>'
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
                <h5 class="modal-title">Edit Student</h5>
               <asp:LinkButton ID="btnCloseModal" runat="server" CssClass="btn-close"  OnClick="btnCloseModal_Click"> </asp:LinkButton>
            </div>

            <div class="modal-body">

                <asp:HiddenField ID="hfStudentID" runat="server" />
                <div class="row">
                   <div class="col-md-4 mb-3">
       <asp:Label ID="Label5" runat="server" Text="Admission No" Font-Bold="true" Style="margin-top: 10px"></asp:Label>
       <asp:TextBox ID="txtaddno" CssClass="form-control card-title" runat="server" Text="" Style="margin-top: 10px" ReadOnly="true"></asp:TextBox>
           </div>

                <div class="mb-3 col-md-4 ">
                    <asp:Label ID="Label1" runat="server" Text="Student Name" Font-Bold="true" Style="margin-top: 10px"></asp:Label>
                    <asp:TextBox ID="txtStudentName" runat="server" CssClass="form-control" Style="margin-top: 10px" />
                </div>

                <div class="mb-3 col-md-4">
                   <asp:Label ID="Label2" runat="server" Text="Class" Font-Bold="true" Style="margin-top: 10px"></asp:Label>
                    <asp:TextBox ID="txtClass" runat="server" CssClass="form-control" Style="margin-top: 10px"/>
                </div>

                <div class="mb-3 col-md-4">
                        <asp:Label ID="Label3" runat="server" Text="Total Fees" Font-Bold="true" Style="margin-top: 10px"></asp:Label>
                    <asp:TextBox ID="txtTotalFees" runat="server" CssClass="form-control" Style="margin-top: 10px"  />
                </div>

                <div class="mb-3 col-md-4">
                        <asp:Label ID="Label4" runat="server" Text="Paid Amount" Font-Bold="true" Style="margin-top: 10px"></asp:Label>
                    <asp:TextBox ID="txtPaidAmount" runat="server" CssClass="form-control" Style="margin-top: 10px"  OnTextChanged="txtPaidAmount_TextChanged"  AutoPostBack="true"/>
                </div>

                <div class="mb-3 col-md-4">
                        <asp:Label ID="Label6" runat="server" Text="Pending Amount" Font-Bold="true" Style="margin-top: 10px"></asp:Label>
                    <asp:TextBox ID="txtPaymentMode" runat="server" CssClass="form-control" Style="margin-top: 10px" ReadOnly="true"/>
                </div>
</div>
            </div>

            <div class="modal-footer">
                <asp:Button ID="btnUpdateStudent" runat="server"
                    CssClass="btn btn-success"
                    Text="Update"
                    OnClick="btnUpdateStudent_Click" />
            </div>

        </div>
    </div>
</div>

                </div>
            </div>
        </div>
  
            
</asp:Content>
