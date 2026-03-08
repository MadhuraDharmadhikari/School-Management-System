<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site1.Master" AutoEventWireup="true" CodeBehind="enqurgrid.aspx.cs" Inherits="School.admin.enqurgrid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="content-body">
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
                            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                            <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-secondary ml-2" OnClick="btnReset_Click" />
                        </div>
                    </div>
                </div>
            </div>
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

<!-- GridView -->
             <div class="card m-4">
      <div class="card-body">
          <h5 class="card-title">Pending Students</h5>
<asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="false"
    CssClass="table table-bordered"
    OnRowCommand="gvStudents_RowCommand">

    <Columns>

       

        <asp:BoundField DataField="StudentName" HeaderText="Student Name" />

        <asp:BoundField DataField="Class" HeaderText="Class" />



        <asp:BoundField DataField="ParentName" HeaderText="Parent Name" />

         <asp:BoundField DataField="ParentPhone" HeaderText="Phone" />

         <asp:BoundField DataField="AdmissionStatus" HeaderText="Admission Status" />


        <asp:TemplateField HeaderText="Action">
            <ItemTemplate>

                <asp:LinkButton ID="btnEdit"
                    runat="server"
                    Text="Edit"
                    CssClass="btn btn-primary btn-sm"
                    CommandName="EditStudent"
                    CommandArgument='<%# Eval("StudentID") %>'>
                </asp:LinkButton>

            </ItemTemplate>
        </asp:TemplateField>

    </Columns>

</asp:GridView>


<!-- Hidden ID -->
<asp:HiddenField ID="hfStudentID" runat="server" />


<!-- EDIT MODAL -->
<div class="modal fade" id="editModal">
<div class="modal-dialog modal-lg">
<div class="modal-content">

<div class="modal-header">
<h4>Edit Student</h4>
</div>

<div class="modal-body">

<div class="row">

<div class="col-md-4">
Admission No
<asp:TextBox ID="txtaddno" runat="server" CssClass="form-control"></asp:TextBox>
</div>

<div class="col-md-4">
Admission Date
<asp:TextBox ID="txtadddt" runat="server" CssClass="form-control"></asp:TextBox>
</div>

<div class="col-md-4">
Class
<asp:TextBox ID="txtClass" runat="server" CssClass="form-control"></asp:TextBox>
</div>

<div class="col-md-4">
Section
<asp:DropDownList ID="ddlsection" runat="server" CssClass="form-control">
<asp:ListItem>A</asp:ListItem>
<asp:ListItem>B</asp:ListItem>
<asp:ListItem>C</asp:ListItem>
</asp:DropDownList>
</div>

<div class="col-md-4">
Student Name
<asp:TextBox ID="txtstnm" runat="server" CssClass="form-control"></asp:TextBox>
</div>

<div class="col-md-4">
DOB
<asp:TextBox ID="txtdbt" runat="server" CssClass="form-control"></asp:TextBox>
</div>

<div class="col-md-4">
Gender
<asp:TextBox ID="txtgen" runat="server" CssClass="form-control"></asp:TextBox>
</div>

<div class="col-md-4">
Parent Name
<asp:TextBox ID="txtprnm" runat="server" CssClass="form-control"></asp:TextBox>
</div>

<div class="col-md-4">
Parent Phone
<asp:TextBox ID="txtprph" runat="server" CssClass="form-control"></asp:TextBox>
</div>

<div class="col-md-4">
Parent Email
<asp:TextBox ID="txtprem" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="col-md-4">
Parent Address
<asp:TextBox ID="txtpradd" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="col-md-4">
Total Fees
<asp:TextBox ID="txttotalfee" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
</div>

<div class="col-md-4">
Paid Amount
<asp:TextBox ID="txtpaidfee" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtpaidfee_TextChanged"></asp:TextBox>
</div>

<div class="col-md-4">
Pending Amount
<asp:TextBox ID="txtpendingfee" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
</div>

<div class="col-md-4">
Payment Mode
<asp:DropDownList ID="ddlPaymentMode" runat="server" CssClass="form-control">
<asp:ListItem Value="">Select</asp:ListItem>
<asp:ListItem>Cash</asp:ListItem>
<asp:ListItem>UPI</asp:ListItem>
<asp:ListItem>Card</asp:ListItem>
</asp:DropDownList>
</div>

</div>

</div>

<div class="modal-footer">

<asp:Button ID="btnUpdateStudent"
runat="server"
Text="Update"
CssClass="btn btn-success"
OnClick="btnUpdateStudent_Click" />

</div>

</div>
</div>
</div>          </div>
        
            </div>
           </div>
</asp:Content>
