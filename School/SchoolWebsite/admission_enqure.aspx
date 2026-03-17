<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolWebsite/School.Master" AutoEventWireup="true" CodeBehind="admission_enqure.aspx.cs" Inherits="School.SchoolWebsite.admission_enqure" %>
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
 <br />
<br />
    <div style="
        max-width: 800px;
        margin: auto;
        padding: 40px;
        background-color:#fff;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.2)";"">
      
           <h2 style="color: rgb(22, 22, 87);font-size: 3rem;">Admission  Form</h2><br />

        <div class="row">
            <div class="col-md-6">
               <asp:Label runat="server" Text="Parent Name"  Font-Bold="true" Style="margin-top: 10px" />
               <asp:TextBox ID="txtParentName" CssClass="form-control card-title" runat="server"  style=" margin-top:10px"  placeholder="Parent Name"/>
            </div>
                <div class="col-md-6">

         <asp:Label runat="server" Text="Email Address"  Font-Bold="true" Style="margin-top: 10px" />
        <asp:TextBox ID="txtEmail" CssClass="form-control card-title" runat="server" TextMode="Email"  style=" margin-top:10px; margin-bottom:20px"  placeholder="Email Address"/>
            </div>

            <div class="col-md-6">
        <asp:Label runat="server" Text="Phone Number"  Font-Bold="true" Style="margin-top: 10px" />
        <asp:TextBox ID="txtPhone"  CssClass="form-control card-title" runat="server" TextMode="Phone" style=" margin-top:10px; margin-bottom:20px"  placeholder="Phone Number"/>
            </div>
         <div class="col-md-6">
          <asp:Label ID="Label6" runat="server" Text="Address" Font-Bold="true" Style="margin-top: 10px"></asp:Label>
       <asp:TextBox ID="txtcity" CssClass="form-control card-title" runat="server" Text="" Style="margin-top: 10px" placeholder="Address"></asp:TextBox>
        </div>
        
              <div class="col-md-6">
      <asp:Label ID="Label7" runat="server" Text="Student Name" Font-Bold="true" Style="margin-top: 10px"></asp:Label>
      <asp:TextBox ID="txtstnm" CssClass="form-control" runat="server" Text="" Style="margin-top: 10px" placeholder="Student Name"></asp:TextBox>
  </div>
  <div class="col-md-6">
      <asp:Label ID="Label1" runat="server" Text="Date of Birth" Font-Bold="true" Style="margin-top: 10px"> </asp:Label>
      <asp:TextBox ID="txtdbt" CssClass="form-control" runat="server" Text="" Style="margin-top: 10px" TextMode="Date"></asp:TextBox>
  </div>
  <div class="col-md-6">
      <asp:Label ID="Label2" runat="server" Text="Gender" Font-Bold="true" Style="margin-top: 10px"> </asp:Label>
      <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control"  Style="margin-top: 10px"></asp:DropDownList>
  </div>
  
     <div class="col-md-6">
           <asp:Label ID="Label3" runat="server" Text="Class*" Font-Bold="true" Style="margin-top: 10px"> </asp:Label>
             <asp:DropDownList ID="ddlclass" runat="server" CssClass="form-control"  Style="margin-top: 10px" ></asp:DropDownList>
      </div>



          <div class="col-md-5"> </div>
          <div class="col-md-1">
             <asp:Button ID="btnSubmit" runat="server" Onclientclick="return valid()" Text="Submit"     CssClass="btn btn-success" Style="font-weight: 500;margin-top: 20px" OnClick="btnSubmit_Click" />
         </div>
             </div>
    </div>
    <br />
    <br />

        <script>

            function valid() {

                var parent = document.getElementById('<%=txtParentName.ClientID%>').value.trim();
                var email = document.getElementById('<%=txtEmail.ClientID%>').value.trim();
                var phone = document.getElementById('<%=txtPhone.ClientID%>').value.trim();
                var city = document.getElementById('<%=txtcity.ClientID%>').value.trim();
                var sname = document.getElementById('<%=txtstnm.ClientID%>').value.trim();
                var sdbt = document.getElementById('<%=txtdbt.ClientID%>').value.trim();
                var Grade = document.getElementById('<%=ddlclass.ClientID%>').value;
                var Gender = document.getElementById('<%=ddlGender.ClientID%>').value;

                let mobilecon = /^[6-9]\d{9}$/;
                let emailcon = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

                if (parent === "" || email === "" || phone === "" || city === "" || sname === "" || sdbt === "" || Grade === "0" || Gender === "") {
                    swal("Please fill all details to proceed..!", "", "warning");
                    return false;
                }
                if (!emailcon.test(email)) {
                    swal("Please enter a valid Email ID.", "", "warning");
                    return false;
                }

                if (!mobilecon.test(phone)) {
                    swal("Please enter a valid 10-digit mobile number.", "", "warning");
                    return false;
                }



                return true;
            }
        </script>
    <script type="text/javascript">
        function clearForm() {
   <%--     document.getElementById('<%= txtaddno.ClientID %>').value = "";--%>
            document.getElementById('<%= txtParentName.ClientID %>').value = "";
            document.getElementById('<%= txtEmail.ClientID %>').value = "";
            document.getElementById('<%= txtPhone.ClientID %>').value = "";
            document.getElementById('<%= txtcity.ClientID %>').value = "";

            document.getElementById('<%= txtstnm.ClientID %>').value = "";
            document.getElementById('<%= txtdbt.ClientID %>').value = "";
            document.getElementById('<%= ddlclass.ClientID %>').selectedIndex = 0;
            document.getElementById('<%= ddlGender.ClientID %>').selectedIndex = 0;
        }
    </script>
</asp:Content>
