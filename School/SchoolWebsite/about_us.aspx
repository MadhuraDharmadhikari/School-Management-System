<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolWebsite/School.Master" AutoEventWireup="true" CodeBehind="about_us.aspx.cs" Inherits="School.SchoolWebsite.about_us" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">


    <div class="container-fluid" style="padding: 0; position: relative;">

        <!-- Image -->
        <img src="image/school1.jpg"
            style="width: 100%; height: 450px; object-fit: cover; box-shadow: inset 0 0 120px rgba(0,0,0,0.5);">

        <!-- Overlay -->
        <div style="position: absolute; top: 0; left: 0; width: 100%; height: 450px; background: rgba(0,0,0,0.45);">
        </div>

        <!-- Center Title -->
        <div style="position: absolute; top: 0; left: 0; width: 100%; height: 450px; display: flex; align-items: center; justify-content: center; text-align: center;">
            <p style="color: #fff; font-size: 48px; font-weight: 700; letter-spacing: 2px; text-shadow: 0 6px 18px rgba(0,0,0,0.7); margin: 0;">
                About Us
            </p>
        </div>

    </div>


    <div style="width: 100%; padding: 60px 80px 20px 80px; background: #ffffff; box-sizing: border-box;">

        <!-- TITLE -->
        <h1 style="color: #e1261c; font-size: 42px; font-weight: 700; margin-bottom: 25px; font-family: Arial, Helvetica, sans-serif;">Our Story
        </h1>

        <!-- DESCRIPTION -->
        <p style="font-size: 18px; line-height: 1.8; color: #1f2a44; max-width: 1100px; font-family: Arial, Helvetica, sans-serif;">
            Sanjay Ghodawat International School Kolhapur was established with a clear purpose: to offer an education that blends excellence, ethics and innovation. 
           Founded under the Sanjay Ghodawat Group, one of Western Maharashtra’s most respected and forward-thinking organisations,
           the school was created as a place where learning grows beyond the classroom and students develop into global citizens rooted in strong Indian values.
        </p>

    </div>

    <div class="row">
        <div class="col-md-1">
        </div>
        <div class="col-md-5">
            <img src="image/Vision.jpg"
                style="width: 100%; max-width: 500px; border-radius: 14px; box-shadow: 0 10px 25px rgba(0,0,0,0.15);">
        </div>
        <div class="col-md-5">
            <h1 style="color: #e1261c; font-size: 42px; font-weight: 700; margin-bottom: 25px; font-family: Arial, Helvetica, sans-serif; padding-top: 30px">Vision</h1>
            <p style="font-size: 18px; line-height: 1.8; color: #1f2a44; max-width: 1100px; font-family: Arial, Helvetica, sans-serif;">
                       Sanjay Ghodawat International School envisions becoming a premier institution recognised for excellence in education and holistic development.
                       We strive to create an environment that nurtures curiosity, innovation and lifelong learning, preparing students to excel in a knowledge-driven world and a dynamic global economy.
                       Our goal is to shape adaptable, responsible and forward-thinking individuals who make meaningful contributions to society.
            </p>
        </div>
        <div class="col-md-1">
        </div>
        <div class="col-md-1">
        </div>
        <div class="col-md-5">
            <h1 style="color: #e1261c; font-size: 42px; font-weight: 700; margin-bottom: 25px; font-family: Arial, Helvetica, sans-serif; padding-top: 30px">Mission</h1>
            <p style="font-size: 18px; line-height: 1.8; color: #1f2a44; max-width: 1100px; font-family: Arial, Helvetica, sans-serif;">
                Sanjay Ghodawat International School aims to nurture responsible global citizens by instilling the values of love, empathy, respect and discipline.
                       We strive to deliver academic excellence that empowers students to realise their dreams and build rewarding careers. By offering global exposure across Arts, Science,
                       Commerce and co-curricular fields, we broaden their intellectual horizon and inspire curiosity, 
                       creativity and critical thinking. Through guided independence, we help students develop confidence, self-reliance and a spirit ready to make a positive impact on the world.
            </p>
        </div>
        <div class="col-md-5">
            <img src="image/Mission.jpg"
                style="width: 100%; max-width: 500px; border-radius: 14px; box-shadow: 0 10px 25px rgba(0,0,0,0.15);">
        </div>

    </div>
    <div class="row">
        <div class="col-md-4"></div>
                <div class="col-md-6">
                     <h1 style="color: #e1261c; font-size: 42px; font-weight: 700; margin-bottom: 25px; font-family: Arial, Helvetica, sans-serif;  padding-top:30px">School's Achievements</h1>
                </div>
                <div class="col-md-2"></div>
         
    </div>
        
                  <div class="row">

             <div class="col-sm-4">

                 <div class="card text-left">
                   <img class="card-img-top" src="image/aw1.png" alt="">
                   <div class="card-body">
                     <h4 class="card-title" style="text-align: center; color: rgb(71, 22, 117);padding-bottom:29px">Global Education Award 2025</h4>
                   </div>
                 </div>
             </div>

             <div class="col-sm-4">
                 <div class="card text-left">
                     
                   <img class="card-img-top" src="image/aw2.jpg" alt="">
                   <div class="card-body">
                     <h4 class="card-title" style="text-align: center; color: rgb(71, 22, 117);">SCOO News – Global Education Awards 2025</h4>
                   </div>
                 </div>
             </div>

             <div class="col-sm-4">
                 <div class="card text-left">
                   <img class="card-img-top img-fulid" src="image/aw3.jpg" alt="">
                   <div class="card-body">
                     <h4 class="card-title"  style="text-align: center; color: rgb(71, 22, 117);">Maharashtra’s Top 5 Day-Cum-Boarding Schools</h4>
                   </div>
                 </div>
             </div>
         </div>

    <br /><br /><br /><br />


    <%-- <br>
    <br>
    <br>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-4">
                <img src="image/12.jpg" class="img-fluid" style="width: 22rem; height: 37rem;"><br>
            </div>
            <div class="col-sm-8">
                <p style="color: crimson; font-size: 20px;">About Sanjay Ghodawat International School, Belagavi</p>
                <h3 style="color: rgb(9, 9, 86); font-weight: 700; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;">We Ensure Better Education For A Better World</h3>
                <p>Welcome to SGIS, where we empower our students to explore their passions and interests through our state-of-the-art facilities. Our labs, dance studio, art studio, music room, sports facilities, food facilities, and transport services are meticulously designed to inspire and nurture creativity, innovation, and growth. At SGIS, we foster a culture of excellence and provide our students with the resources and support they need to excel in their academic pursuits. Join us at SGIS and unleash your full potential in a dynamic and vibrant learning community.</p>
                <br>
                <br>
                <div class="row">
                    <div class="col-sm-4" style="padding-left: 2rem;">
                        <h3 style="color: rgb(45, 4, 83);">Our Mission</h3>
                        <p>To be a professionally managed premier institution within all judging parameters that provides an environment nurtures excellence, holistic growth and prepares students for a knowledge society and a global economy by developing lifelong learning skills</p>
                    </div>
                    <div class="col-sm-4" style="padding-left: 2rem;">
                        <h3 style="color: rgb(45, 4, 83);">Our Vision</h3>
                        <p>Sanjay Ghodawat International School aims to provide an exciting all round education to create global citizens through traditional values of love, empathy, respect and discipline</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <br>
    <!--Images-->
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3">
                <img src="image/12.jpg" style="width: 17rem; height: 20rem;" class="d-block" alt="">
            </div>
            <div class="col-sm-3">
                <img src="image/13.jpg" style="width: 17rem; height: 20rem;" class="d-block" alt="">
            </div>
            <div class="col-sm-3">
                <img src="image/14.jpg" style="width: 17rem; height: 20rem;" class="d-block" alt="">
            </div>
            <div class="col-sm-3">
                <img src="image/16.jpg" style="width: 17rem; height: 20rem;" class="d-block" alt="">
            </div>
        </div>
        <br>
        <br>
        <p>
            Sanjay Ghodawat International School is young, youthful & lustrous. Since its inception, it has developed into a high seat of learning, imparting quality education, generating competent pupils to face the scientific, technological, managerial and social challenges in the fast evolving global scenario with a high degree of credibility, integrity, ethical standards and social concerns.

Education at SGIS is like a multifaceted crystal cornucopia of academics, sports, spirituality, creativity and imagination. The state of the art infrastructure, in the ever prevailing functional discipline imparts mental peace for children’s growth. Besides sheer academics, the children learn the genuine importance of being organized and methodical in their work.

Our students learn from the experienced, dedicated and tremendously talented faculty, who challenge, inspire, encourage and nurture the tender minds to reach greater levels of perception. There is a wide range of extra-curricular activities on daily basis. Music, drama, sports, art and various other club activities give children a wide range of choices that appeal to different interests and skills
        </p>
    </div>--%>
</asp:Content>
