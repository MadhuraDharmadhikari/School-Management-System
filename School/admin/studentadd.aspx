<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site1.Master" AutoEventWireup="true" CodeBehind="studentadd.aspx.cs" Inherits="School.admin.studentadd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-body">

        <!-- row -->
        <div class="container-fluid">
            <div class="row">
               
                    <div class="card">
                        <div class="stat-widget-two card-body">
                            <h2 class="card-title" style="font-size: 25px">Student Admission Form</h2>
                            <div class="row">
                                <div class="col-md-3 mt-4">
                                    <asp:Label ID="Label5" runat="server" Text="Admission No" Font-Bold="true" Style="margin-top: 10px"></asp:Label>
                                    <asp:TextBox ID="txtaddno" CssClass="form-control card-title" runat="server" Text="" Style="margin-top: 10px" placeholder="Admission No"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mt-4">
                                    <asp:Label ID="Label6" runat="server" Text="Admission Date" Font-Bold="true" Style="margin-top: 10px"></asp:Label>
                                    <asp:TextBox ID="txtadddt" CssClass="form-control card-title" runat="server" Text="" Style="margin-top: 10px" TextMode="Date" placeholder="Admission Date"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mt-4">
                                    <asp:Label ID="Label3" runat="server" Text="Class" Font-Bold="true" Style="margin-top: 10px"> </asp:Label>
                                       <asp:DropDownList ID="ddlclass" runat="server" CssClass="form-control"  Style="margin-top: 10px"   AutoPostBack="true" OnSelectedIndexChanged="ddlclass_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="col-md-3 mt-4">
                                    <asp:Label ID="Label4" runat="server" Text="Section" Font-Bold="true" Style="margin-top: 10px"> </asp:Label>
                                          <asp:DropDownList ID="ddlsection" runat="server" CssClass="form-control"  Style="margin-top: 10px"></asp:DropDownList>
                                </div>
                                <div class="col-md-6 mt-3">
                                    <asp:Label ID="Label7" runat="server" Text="Student Name" Font-Bold="true" Style="margin-top: 10px"></asp:Label>
                                    <asp:TextBox ID="txtstnm" CssClass="form-control card-title" runat="server" Text="" Style="margin-top: 10px" placeholder="Student Name"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mt-3">
                                    <asp:Label ID="Label1" runat="server" Text="Date of Birth" Font-Bold="true" Style="margin-top: 10px"> </asp:Label>
                                    <asp:TextBox ID="txtdbt" CssClass="form-control card-title" runat="server" Text="" Style="margin-top: 10px" TextMode="Date"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mt-3">
                                    <asp:Label ID="Label2" runat="server" Text="Gender" Font-Bold="true" Style="margin-top: 10px"> </asp:Label>
                                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control"  Style="margin-top: 10px"></asp:DropDownList>
                                </div>
                                <div class="col-md-6 mt-3">
                                    <asp:Label ID="Label8" runat="server" Text="Parent Name" Font-Bold="true" Style="margin-top: 10px"> </asp:Label>
                                    <asp:TextBox ID="txtprnm" CssClass="form-control card-title" runat="server" Text="" Style="margin-top: 10px" placeholder="Parent Name"></asp:TextBox>
                                </div>
                                <div class="col-md-6 mt-3">
                                    <asp:Label ID="Label9" runat="server" Text="Parent Addres" Font-Bold="true" Style="margin-top: 10px"> </asp:Label>
                                    <asp:TextBox ID="txtpradd" CssClass="form-control card-title" runat="server" Text="" Style="margin-top: 10px" placeholder="Parent Addres"></asp:TextBox>
                                </div>
                                <div class="col-md-6 mt-3">
                                    <asp:Label ID="Label10" runat="server" Text="Parent Phone" Font-Bold="true" Style="margin-top: 10px"> </asp:Label>
                                    <asp:TextBox ID="txtprph" CssClass="form-control card-title" TextMode="Phone" runat="server" Text="" Style="margin-top: 10px" placeholder="Parent Phone"></asp:TextBox>
                                </div>
                                <div class="col-md-6 mt-3">
                                    <asp:Label ID="Label11" runat="server" Text="Parent Email" Font-Bold="true" Style="margin-top: 10px"> </asp:Label>
                                    <asp:TextBox ID="txtprem" CssClass="form-control card-title" runat="server" TextMode="Email" Text="" Style="margin-top: 10px" placeholder="Parent Email"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mt-3">
                                    <asp:Label ID="Label12" runat="server" Text="Total Fees" Font-Bold="true" Style="margin-top: 10px"> </asp:Label>
                                    <asp:TextBox ID="txttotalfee" CssClass="form-control card-title" runat="server" Text="" Style="margin-top: 10px" placeholder="Total Fees"    ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mt-3">
                                    <asp:Label ID="Label13" runat="server" Text="Paid Amount" Font-Bold="true" Style="margin-top: 10px"> </asp:Label>
                                    <asp:TextBox ID="txtpaidfee" CssClass="form-control card-title" runat="server" Text="" Style="margin-top: 10px" placeholder="Paid Amount" AutoPostBack="true" OnTextChanged="txtPaidAmount_TextChanged"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mt-3">
                                    <asp:Label ID="Label14" runat="server" Text="Pending Amount" Font-Bold="true" Style="margin-top: 10px"> </asp:Label>
                                    <asp:TextBox ID="txtpendingfee" CssClass="form-control card-title" runat="server" Text="" Style="margin-top: 10px" placeholder="Pending Amount" ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mt-3">
                                    <asp:Label ID="Label15" runat="server" Text="Payment Mode" Font-Bold="true" Style="margin-top: 10px"> </asp:Label>

                                    <asp:DropDownList ID="ddlPaymentMode" runat="server" CssClass="form-control card-title" Style="margin-top: 10px">
                                        <asp:ListItem Text="-- Select Payment Mode --" Value="" />
                                        <asp:ListItem Text="Cash" Value="Cash" />
                                        <asp:ListItem Text="Online" Value="Online" />
                                        <asp:ListItem Text="UPI" Value="UPI" />
                                        <asp:ListItem Text="Cheque" Value="Cheque" />
                                    </asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="row g-3">
                        <div class="col-md-5"></div>
                        <div class="col-md-6">
                            <asp:Button ID="submit" runat="server" Text="Submit" BackColor="#00CC00" Onclientclick="return valid();"  ForeColor="White" BorderColor="#009933" CssClass="btn" OnClick="submit_Click" />
                        </div>
                    </div>
                    <br />
                </div>
        </div>
    </div>

    
        <script>

            function valid() {
        <%--        var addno = document.getElementById('<%=this.txtaddno.ClientID %>').value.trim();--%>
                var adddt = document.getElementById('<%=this.txtadddt.ClientID%>').value.trim();
                var clas = document.getElementById('<%=this.ddlclass.ClientID%>').value.trim();
                var section= document.getElementById('<%=this.ddlsection.ClientID%>').value.trim();
                var stnm = document.getElementById('<%=this.txtstnm.ClientID%>').value.trim();
                var stdt = document.getElementById('<%=this.txtdbt.ClientID%>').value.trim();
                var stgen = document.getElementById('<%=this.ddlGender.ClientID%>').value.trim();
                var prnm = document.getElementById('<%=this.txtprnm.ClientID%>').value.trim();
                var pradd = document.getElementById('<%=this.txtpradd.ClientID%>').value.trim();
                var prphn= document.getElementById('<%=this.txtprph.ClientID%>').value.trim();
                var prem= document.getElementById('<%=this.txtprem.ClientID%>').value.trim();
                var paidfees = document.getElementById('<%=this.txtpaidfee.ClientID%>').value.trim();
                var paymanetmode = document.getElementById('<%=this.ddlPaymentMode.ClientID%>').value.trim();

                let mobilecon = /^\d{10}$/;
                let emailcon = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

                if ( adddt === "" || clas === "" || section === "" || stnm === "" || stdt === "" || stgen === "" || prnm === "" || pradd === "" || prphn === "" || prem === "" || paidfees === "" || paymanetmode === "") {
                    swal("Please fill all details to proceed..!", "", "warning");
                    return false;
                }

                if (!mobilecon.test(prphn)) {
                    swal("Please enter a valid 10-digit contact number.", "", "warning");
                    return false;
                }

                if (!emailcon.test(prem)) {
                    swal("Please enter a valid Email ID.", "", "warning");
                    return false;
                }

                return true;
            }

        </script>
    <script type="text/javascript">
        function clearForm() {
       <%--     document.getElementById('<%= txtaddno.ClientID %>').value = "";--%>
        document.getElementById('<%= txtadddt.ClientID %>').value = "";
        document.getElementById('<%= txtstnm.ClientID %>').value = "";
        document.getElementById('<%= txtdbt.ClientID %>').value = "";
        document.getElementById('<%= txtprnm.ClientID %>').value = "";
        document.getElementById('<%= txtpradd.ClientID %>').value = "";
        document.getElementById('<%= txtprph.ClientID %>').value = "";
        document.getElementById('<%= txtprem.ClientID %>').value = "";
        document.getElementById('<%= txttotalfee.ClientID %>').value = "";
        document.getElementById('<%= txtpaidfee.ClientID %>').value = "";
        document.getElementById('<%= txtpendingfee.ClientID %>').value = "";

        document.getElementById('<%= ddlclass.ClientID %>').selectedIndex = 0;
        document.getElementById('<%= ddlsection.ClientID %>').selectedIndex = 0;
        document.getElementById('<%= ddlGender.ClientID %>').selectedIndex = 0;
        document.getElementById('<%= ddlPaymentMode.ClientID %>').selectedIndex = 0;
        }
    </script>
</asp:Content>
