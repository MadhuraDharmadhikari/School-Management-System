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
      
        <h2 style="color: rgb(22, 22, 87);font-size: 3rem;">Admission Enquiry Form</h2><br />

        <div class="row">
            <div class="col-md-6">
               <asp:Label runat="server" Text="Parent Name*" style="font-weight: 500;" />
               <asp:TextBox ID="txtParentName" runat="server" Width="100%" style=" margin-top:10px"  placeholder="Parent Name"/>
            </div>
                <div class="col-md-6">

         <asp:Label runat="server" Text="Email Address*" style="font-weight: 500;" />
        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" Width="100%" style=" margin-top:10px; margin-bottom:20px"  placeholder="Email Address"/>
            </div>

            <div class="col-md-6">
        <asp:Label runat="server" Text="Phone Number*" style="font-weight: 500;" />
        <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" Width="100%" style=" margin-top:10px; margin-bottom:20px"  placeholder="Phone Number"/>
            </div>
         <div class="col-md-6">
         <asp:Label runat="server" Text="City*" style="font-weight: 500;" />
        <asp:TextBox ID="txtcity" runat="server" Width="100%" style=" margin-top:10px ; margin-bottom:20px"  placeholder="City"/>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This is requrie"></asp:RequiredFieldValidator>
            </div>

       <div class="col-md-6">
    <asp:Label runat="server" Text="Select Curriculum*" style="font-weight: 500;" />
    <asp:TextBox ID="txtselect" runat="server" TextMode="Phone" Width="100%" style=" margin-top:10px; margin-bottom:20px"  placeholder="Select Curriculum"/>
        </div>
     <div class="col-md-6">
     <asp:Label runat="server" Text="Select Grade*" style="font-weight: 500;" />
    <asp:TextBox ID="txtselegrade" runat="server" Width="100%" style=" margin-top:10px ; margin-bottom:20px"  placeholder="Select Grade"/>
        </div>

            <div class="col-md-12">
         <asp:Label runat="server" Text="Additional Message (optional)*" style="font-weight: 500;" />
        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="4" Width="100%"  style=" margin-top:10px ; margin-bottom:20px" placeholder="Additional Message"/>
            </div>
        </div>

        <asp:Button ID="btnSubmit" runat="server" Onclientclick="return valid()" Text="Submit Enquiry"  CssClass="btn btn-success" style="font-weight: 500;" OnClick="btnSubmit_Click" />
    </div>
    <br />
    <br />

        <script>

            function valid() {
                var parent = document.getElementById('<%=this.txtParentName.ClientID %>').value.trim();
                  var email = document.getElementById('<%=this.txtEmail.ClientID%>').value.trim();
                 var phone = document.getElementById('<%=this.txtPhone.ClientID%>').value.trim();
                var city = document.getElementById('<%=this.txtcity.ClientID%>').value.trim();
                var selectcir = document.getElementById('<%=this.txtselect.ClientID%>').value.trim();
                var Grade = document.getElementById('<%=this.txtselegrade.ClientID%>').value.trim();
                var msg = document.getElementById('<%=this.txtMessage.ClientID%>').value.trim();

                let mobilecon = /^\d{10}$/;
                let emailcon = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

                if (parent === "" || email === "" || clas === "" || phone === "" || city === "" || selectcir === "" || msg === "" || Grade === "") {
                    swal("Please fill all details to proceed..!", "", "warning");
                    return false;
                }

                if (!mobilecon.test(phone)) {
                    swal("Please enter a valid 10-digit contact number.", "", "warning");
                    return false;
                }

                if (!emailcon.test(email)) {
                    swal("Please enter a valid Email ID.", "", "warning");
                    return false;
                }

                return true;
            }
        </script>

</asp:Content>
