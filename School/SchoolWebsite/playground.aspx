<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolWebsite/School.Master" AutoEventWireup="true" CodeBehind="playground.aspx.cs" Inherits="School.SchoolWebsite.playground" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
         <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="StyleSheet1.css" />
    <link rel="stylesheet" href="css/main.css" />
    <%--    <link rel="stylesheet" href="StyleSheet2.css" />--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
  <%-- photo sections--%>

   <div class="container-fluid" style="padding: 0; position: relative;">

       <!-- Image -->
       <img src="image/school.jpg"
           style="width: 100%; height: 450px; object-fit: cover; box-shadow: inset 0 0 120px rgba(0,0,0,0.5);">

       <!-- Overlay -->
       <div style="position: absolute; top: 0; left: 0; width: 100%; height: 450px; background: rgba(0,0,0,0.45);">
       </div>

       <!-- Center Title -->
       <div style="position: absolute; top: 0; left: 0; width: 100%; height: 450px; display: flex; align-items: center; justify-content: center; text-align: center;">
           <p style="color: #fff; font-size: 48px; font-weight: 700; letter-spacing: 2px; text-shadow: 0 6px 18px rgba(0,0,0,0.7); margin: 0;">
               Playgrounds
           </p>
       </div>

   </div>


   <div style="width: 100%; padding: 60px 80px 20px 80px; background: #ffffff; box-sizing: border-box;">

       <!-- TITLE -->
       <h1 style="color: #e1261c; font-size: 42px; font-weight: 700; margin-bottom: 25px; font-family: Arial, Helvetica, sans-serif;">SGIS Kolhapur Playgrounds
       </h1>

       <!-- DESCRIPTION -->
       <p style="font-size: 18px; line-height: 1.8; color: #1f2a44; max-width: 1100px; font-family: Arial, Helvetica, sans-serif;">
           Sanjay Ghodawat International School offers a spacious and well-maintained playground that provides students with ample space for physical activity, recreation and social engagement.
           The outdoor area is designed to meet the needs of learners across different age groups, with facilities that support a 
           variety of sports and free-play activities. The playground plays an important role in promoting fitness, teamwork and a healthy balance between academics and outdoor movement.
       </p>

   </div>

 <%--  card sections--%>

   <div style="padding: 0px 40px 60px 40px; background: #ffffff;">

       <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 20px;">

           <!-- Card 1 -->
           <div style="background: #eef4ff; border-radius: 12px; overflow: hidden; box-shadow: 0 6px 20px rgba(0,0,0,0.12);">
               <img src="image/play1.jpg" style="width: 100%; height: 200px; object-fit: cover;">
               <div style="padding: 15px; text-align: center;">
                   <h4 style="margin: 0; font-size: 18px; color: #0b2c5d; font-weight: 600;">Team Sports Training
                   </h4>
               </div>
           </div>

           <!-- Card 2 -->
           <div style="background: #eef4ff; border-radius: 12px; overflow: hidden; box-shadow: 0 6px 20px rgba(0,0,0,0.12);">
               <img src="image/play2.jpg" style="width: 100%; height: 200px; object-fit: cover;">
               <div style="padding: 15px; text-align: center;">
                   <h4 style="margin: 0; font-size: 18px; color: #0b2c5d; font-weight: 600;">Cricket Excellence
                   </h4>
               </div>
           </div>

           <!-- Card 3 -->
           <div style="background: #eef4ff; border-radius: 12px; overflow: hidden; box-shadow: 0 6px 20px rgba(0,0,0,0.12);">
               <img src="image/play3.jpg" style="width: 100%; height: 200px; object-fit: cover;">
               <div style="padding: 15px; text-align: center;">
                   <h4 style="margin: 0; font-size: 18px; color: #0b2c5d; font-weight: 600;">Active Play Zone
                   </h4>
               </div>
           </div>

           <!-- Card 4 -->
           <div style="background: #eef4ff; border-radius: 12px; overflow: hidden; box-shadow: 0 6px 20px rgba(0,0,0,0.12);">
               <img src="image/play4.jpg" style="width: 100%; height: 200px; object-fit: cover;">
               <div style="padding: 15px; text-align: center;">
                   <h4 style="margin: 0; font-size: 18px; color: #0b2c5d; font-weight: 600;">Outdoor Activity Frame
                   </h4>
               </div>
           </div>
       </div>
   </div>
</asp:Content>
