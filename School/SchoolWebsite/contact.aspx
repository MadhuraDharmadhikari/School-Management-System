<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolWebsite/School.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="School.SchoolWebsite.contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.5.0/css/all.min.css" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
  <div class="row" style=" background: #f8f7f4"">
        <div class="col-md-6" style="margin-top:80px;">
            <i class="fa-solid fa-location-dot" style="color:#d11f1f; font-size:28px;margin-left:50px"></i>
            <span style="color: #e1261c; font-size: 32px; font-weight: 700; margin: 10px 10px 10px 10px; font-family: Arial, Helvetica, sans-serif;">Our Location </span><br />
  <h5 style="padding-left: 6rem;">Campus:<br />Gat No. 555, Kolhapur–Sangli Highway,<br />Atigre, Tal. Hatkanangale,<br />Dist. Kolhapur – 416118<br />Maharashtra, India</h5>
 
            <i class="fa-solid fa-mobile-screen-button"  style="color:#d11f1f; font-size:28px;margin-left:50px"></i>
<span style="color: #e1261c; font-size: 32px; font-weight: 700; margin: 10px 10px 10px 10px; font-family: Arial, Helvetica, sans-serif;">Phone</span><br />
   <h5 style="padding-left: 6rem;">Cell No. : +91 77200 12058</h5>
   <h5 style="padding-left: 6rem;">Land Line No. : +91 230 - 2689700</h5>
   <h5 style="padding-left: 6rem;">Fax No. : +91 231 - 2600999</h5>
            <i class="fa-solid fa-envelope-open" style="color:#d11f1f; font-size:28px;margin-left:50px"></i>
            <span style="color: #e1261c; font-size: 32px; font-weight: 700; margin: 10px 10px 10px 10px; font-family: Arial, Helvetica, sans-serif;">Email Us</span><br />
<h5 style=" padding-left: 6rem;margin-bottom:40px">principal@sgischool.in</h5>
                 <div style="display:flex; align-items:center; gap:5px;">
            <h5 style="color: #032186; font-size: 20px; font-weight: 700; margin-left:5px; font-family: Arial, Helvetica, sans-serif;">Your feedback helps us improve our school services.</h5>  
            <a runat="server" href="feedback.aspx" id="enqure"> 
              <button type="button" onclick="openPopup()"style="background-color:#e1261c;border-color: #e1261c; color: #e6e6e0; font-size: 1rem; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">Feedback</button>
               </a>
              </div><br />
          <div style="display:flex; align-items:center; gap:5px;">
            <h5 style="color: rgb(22, 22, 87); font-size: 20px; font-weight: 700; margin-left:5px; font-family: Arial, Helvetica, sans-serif;">Submit a quick enquiry and we’ll respond soon.</h5>  
            <a runat="server" href="enqure.aspx" id="A1"> 
           <button type="button" onclick="openPopup()"style="background-color:#e1261c;border-color: #e1261c; color: #e6e6e0; font-size: 1rem; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">Enquiry Form</button>
            </a>
           </div>
        </div>






        <div class="col-md-6">
                 <div style="max-width: 800px;margin: 40px 40px 40px 20px;padding: 40px;background-color:#fff;border-radius: 8px;box-shadow: 0 2px 5px rgba(0,0,0,0.2)";">
     
       <h2 style="color: rgb(22, 22, 87);font-size: 3rem;">Contact Us</h2><br />
                       <p>Please fill out the form below. We will get back to you soon.</p>
                  <div class="row">
                  
            <div class="col-md-6">
               <asp:Label runat="server" Text="Full Name*" style="font-weight: 500;" Font-Bold="true" />
               <asp:TextBox ID="txtParentName"  CssClass="form-control card-title" runat="server" style=" margin-top:10px"  placeholder="Full Name"/>
            </div>
                <div class="col-md-6">

         <asp:Label runat="server" Text="Email Address*" style="font-weight: 500;" Font-Bold="true" />
        <asp:TextBox ID="txtEmail" runat="server"  CssClass="form-control card-title" TextMode="Email" style=" margin-top:10px; margin-bottom:20px"  placeholder="Email Address"/>
            </div>

            <div class="col-md-6">
        <asp:Label runat="server" Text="Phone Number*" style="font-weight: 500;" Font-Bold="true" />
        <asp:TextBox ID="txtPhone" runat="server"  CssClass="form-control card-title" TextMode="Phone" style=" margin-top:10px; margin-bottom:20px"  placeholder="Phone Number"/>
            </div>
         <div class="col-md-6">
         <asp:Label runat="server" Text="Subject*" style="font-weight: 500;" Font-Bold="true" />
        <asp:TextBox ID="txtsub" runat="server"  CssClass="form-control card-title"  style=" margin-top:10px ; margin-bottom:20px"  placeholder="Subject"/>
            </div>
            <div class="col-md-12">
         <asp:Label runat="server" Text="Additional Message (optional)*" style="font-weight: 500;"  Font-Bold="true" />
        <asp:TextBox ID="txtMessage" runat="server"  CssClass="form-control card-title" TextMode="MultiLine" Rows="4"   style=" margin-top:10px ; margin-bottom:20px" placeholder="Additional Message"/>
            </div>
        </div>

        <asp:Button ID="btnSubmit" runat="server"  Text="Submit Enquiry" CssClass="btn btn-success" OnClientClick="return valid();" OnClick="btnSubmit_Click" />

    </div>
                  </div>
              </div>
          
     <script>

         function valid() {
             var parent = document.getElementById('<%=this.txtParentName.ClientID %>').value.trim();
             var email = document.getElementById('<%=this.txtEmail.ClientID%>').value.trim();
             var phone = document.getElementById('<%=this.txtPhone.ClientID%>').value.trim();
             var city = document.getElementById('<%=this.txtsub.ClientID%>').value.trim();
             var msg = document.getElementById('<%=this.txtMessage.ClientID%>').value.trim();

             let mobilecon = /^\d{10}$/;
             let emailcon = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

             if (parent === "" || email === "" || phone === "" || city === "" || msg === "") {
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
 <script type="text/javascript">
     function clearForm() {
<%--     document.getElementById('<%= txtaddno.ClientID %>').value = "";--%>
         document.getElementById('<%= txtParentName.ClientID %>').value = "";
         document.getElementById('<%= txtEmail.ClientID %>').value = "";
         document.getElementById('<%= txtPhone.ClientID %>').value = "";
         document.getElementById('<%= txtsub.ClientID %>').value = "";
         document.getElementById('<%= txtMessage.ClientID %>').value = "";
      
     }
 </script>
      
</asp:Content>
