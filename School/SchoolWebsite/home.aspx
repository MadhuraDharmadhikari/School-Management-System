<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolWebsite/School.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="School.SchoolWebsite.home" %>
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

    <!--    /* Make the image fully responsive */-->

    <div"container-fluid">

        <div id="demoo" class="carousel slide" data-ride="carousel">

            <!-- Indicators -->
            <ul class="carousel-indicators">
                <li data-target="#demoo" data-slide-to="0" class="active"></li>
                <li data-target="#demoo" data-slide-to="1"></li>
                <li data-target="#demoo" data-slide-to="2"></li>
                <li data-target="#demoo" data-slide-to="3"></li>
            </ul>

            <!-- The slideshow -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="image/school.jpg" class="img-fluid" alt="Los " style="width: 100rem; height: 35rem;">
                    <div class="carousel-caption" style="background: rgba(0,0,0,0.5); text-align: center; border-radius: 10px;">
                        <p style="font-size: 35px">Shaping Futures with Excellence</p>
                        <p>A World-Class Learning Environment</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="image/5.jpg" class="img-fluid" alt="Los Angeles" style="width:100rem; height: 35rem;">
                    <div class="carousel-caption" style="background: rgba(0,0,0,0.5); text-align: center; border-radius: 10px;">
                        <p style="font-size: 35px">Inspiring Curiosity, Creating Thinkers</p>
                        <p>Learning That Goes Beyond the Classroom</p>
                    </div>

                </div>
                <div class="carousel-item">
                    <img src="image/6.jpg" class="img-fluid" alt="Chicago" style="width:100rem; height: 35rem;">
                    <div class="carousel-caption" style="background: rgba(0,0,0,0.5); text-align: center; border-radius: 10px;">
                        <p style="font-size: 35px">Where Little Minds Begin Big Dreams</p>
                        <p>A Joyful Start to Lifelong Learning</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="image/17.jpg" class="img-fluid" alt="New York" style="width:100rem; height: 35rem;">
                    <div class="carousel-caption" style="background: rgba(0,0,0,0.5); text-align: center; border-radius: 10px;">
                        <p style="font-size: 35px">Learning by Doing, Leading by Innovation</p>
                        <p>Preparing Students for Tomorrow’s World</p>
                    </div>
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demoo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demoo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>

        <section class="wf100 emergency-numbers">
            <div class="slogan-scroll-wrapper">
                <div class="slogan-scroll">
                    <div class="slogan-block">
                        <i class="fas fa-book-open" style="color: #2c7be5;"></i>
                        <span>Learning Today, Leading Tomorrow</span>
                    </div>
                    <div class="slogan-block">
                        <i class="fas fa-graduation-cap" style="color: #6f42c1;"></i>
                        <span>Nurturing Minds, Shaping Futures</span>
                    </div>
                    <div class="slogan-block">
                        <i class="fas fa-seedling" style="color: #28a745;"></i>
                        <span>Growing Curious Minds</span>
                    </div>
                    <div class="slogan-block">
                        <i class="fas fa-lightbulb" style="color: #ffc107;"></i>
                        <span>Inspiring Young Minds</span>

                    </div>
                    <div class="slogan-block">
                        <i class="fas fa-child" style="color: #ff6f61;"></i>
                        <span>Where Every Child Shines</span>
                    </div>
                    <div class="slogan-block">
                        <i class="fas fa-smile-beam" style="color: #fd7e14;"></i>
                        <span>Happy Learning, Bright Futures</span>
                    </div>
                    <div class="slogan-block">
                        <i class="fas fa-heart" style="color: #e63946;"></i>
                        <span>Education with Values</span>
                    </div>
                    <div class="slogan-block">
                        <i class="fas fa-balance-scale" style="color: #343a40;"></i>
                        <span>Knowledge, Discipline, Success</span>
                    </div>
                    <div class="slogan-block">
                        <i class="fas fa-rocket" style="color: #17a2b8;"></i>
                        <span>Preparing Students for Tomorrow</span>
                    </div>
                    <div class="slogan-block">
                        <i class="fas fa-chart-line" style="color: #20c997;"></i>
                        <span>Empowering Students to Achieve More</span>
                    </div>
                </div>
            </div>
        </section>

        <br>

        <h1 style="font-family: 'Montserrat', sans-serif; font-weight: 700; color: #e0211b; text-align: center">About SGIS Kolhapur</h1>
        <p style="font-size: 18px; line-height: 1.8; color: #2c2c2c; margin: 0; text-align: center">
            Sanjay Ghodawat International School Kolhapur offers a future-ready learning environment that prepares students for life with academic
        <br />
            excellence, strong values and a commitment to holistic growth. The institution provides globally recognised curricula such as Cambridge,
        <br />
            IBDP and CBSE supported  by proven outcomes, along with extensive opportunities in sports, arts, leadership and co-curricular activities.
        <br />
            Students learn in a safe and disciplined atmosphere where they receive consistent care, individual guidance and a balanced blend of
        <br />
            international outlook and Indian values. Under the leadership of highly accomplished educators, the campus offers world-class facilities
        <br />
            that encourage innovation, creativity and the development of essential life skills. The school nurtures respect, empathy, character and 
        <br />
            responsibility, enabling students to grow into confident, capable and compassionate global citizens.
        </p>

        <br />



        <div class="col-12 col-md-6 col-lg-4">
        </div>


        <!-- WHY SGIS -->
        <div class="container-fluid"
            style="padding: 70px 80px; text-align: center; background: #fff4f2;">
            <h1 class="slider-heading">Why SGIS?</h1>

            <div class="row justify-content-center" style="margin-top: 40px;">

                <div class="col-md mb-4">
                    <div style="background: #fff; padding: 30px; border-radius: 12px; box-shadow: 0 5px 20px rgba(0,0,0,0.1);">
                        <i class="fas fa-chalkboard-teacher" style="font-size:40px;color:#2c7be5;"></i>
                        <h4> <a  href="classroom.aspx"
                            style="text-decoration: none;  cursor: pointer;">Smart<br /> Classrooms</a></h4>
                        <p>Interactive teaching with digital boards & modern learning tools</p>
                    </div>
                </div>


                <div class="col-md mb-4">
                    <div style="background: #fff; padding: 30px; border-radius: 12px; box-shadow: 0 5px 20px rgba(0,0,0,0.1);">
                     <i class="fas fa-book-reader" style="font-size:40px;color:#28a745;"></i>
                        <h4><a  href="library.aspx"
                            style="text-decoration: none;  cursor: pointer;">Knowledge-Rich Library</a></h4>
                        <p>Well-stocked library with digital resources & quiet study spaces</p>
                    </div>
                </div>

                <div class="col-md mb-4">
                    <div style="background: #fff; padding: 30px; border-radius: 12px; box-shadow: 0 5px 20px rgba(0,0,0,0.1);">
                   <i class="fas fa-microscope" style="font-size:40px;color:#fd7e14;"></i>
                        <h4><a  href="laboratories.aspx"
                            style="text-decoration: none;  cursor: pointer;">Advanced Laboratories</a></h4>
                        <p>Fully equipped labs for hands-on practical learning</p>
                    </div>
                </div>

                <div class="col-md mb-4">
                    <div style="background: #fff; padding: 30px; border-radius: 12px; box-shadow: 0 5px 20px rgba(0,0,0,0.1);">
                    <i class="fas fa-futbol" style="font-size:40px;color:#e83e8c;"></i>
                        <h4><a  href="playground.aspx" style="text-decoration: none;  cursor: pointer;">Spacious Playground</a></h4>
                        <p>Well-maintained grounds for sports & physical development</p>
                    </div>
                </div>

            </div>
        </div>

        <!-- STATS -->
        <div class="container-fluid"
            style="padding: 70px 80px; text-align: center; background: #f8f7f4">

            <h2 style="color: #764d08; font-size: 36px; margin-bottom: 20px;">Mordern Infrastructure & Facilities
            </h2>

            <div class="row justify-content-center" style="margin-top: 40px;">

                <div class="col-md mb-4">
                    <div style="background: #fff; padding: 30px; border-radius: 12px; box-shadow: 0 5px 20px rgba(0,0,0,0.1);">
                        <h4 style="color: #c89b2c;">15+</h4>
                        <h5 style="color: #c89b2c;">Years of Excellence</h5>
                    </div>
                </div>
                <div class="col-md mb-4">
                    <div style="background: #fff; padding: 30px; border-radius: 12px; box-shadow: 0 5px 20px rgba(0,0,0,0.1);">
                        <h4 style="color: #c89b2c;">5000+</h4>
                        <h5 style="color: #c89b2c;">Students</h5>
                    </div>
                </div>
                <div class="col-md mb-4">
                    <div style="background: #fff; padding: 30px; border-radius: 12px; box-shadow: 0 5px 20px rgba(0,0,0,0.1);">
                        <h4 style="color: #c89b2c;">100+</h4>
                        <h5 style="color: #c89b2c;">Awards</h5>
                    </div>
                </div>
                <div class="col-md mb-4">
                    <div style="background: #fff; padding: 30px; border-radius: 12px; box-shadow: 0 5px 20px rgba(0,0,0,0.1);">
                        <h4 style="color: #c89b2c;">50+</h4>
                        <h5 style="color: #c89b2c;">Certified Teachers</h5>
                    </div>
                </div>
            </div>

        </div>


    </div>


    <%--<!--2nd page about school and princeple-->

  <div class="container-fluid">
    <div class="row">
        <div class="col-sm-6">
    <div class="box">
      <h4 style="color: red;"> Welcome to Sanjay Ghodawat International School</h4>
<p>Sanjay Ghodawat International School is the most immaculate location and the optimum platform to transmit quality education through holistic approach. The school, away from the hustle and bustle of the city, in complete picturesque environment, provides a clean and conducive atmosphere for children to learn. The infrastructure, with all modern amenities, offers the students a very comfortable environment to stay and learn.
    Besides providing comprehensive education intellectually, socially, emotionally and physically, SGIS offers guidance in critical thinking, social openness and purposeful research.Students are given an opportunity to develop their innate talents as well as to be aware of national and global issues.
Home Assignments are given to encourage and develop independent study skills and to complement particular fields of study.
</p>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Blanditiis, odit.</p>
    <a type="button" class="btn btn-primary" data-toggle="collapse" data-target="#demo" >read more</a>
    <div id="demo" class="collapse">
     <p>  A home task timetable is issued to all students who are required to complete the work assigned by the subject teacher.
Limited strength in the class allows the teachers to pay personal care and attention to the children and help in monitoring all aspects of progress and welfare of the children. Regular parent meets are organized to oversee children's progress
Sanjay Ghodawat International School is young, youthful & lustrous. Since its inception, it has developed into a high seat of learning, imparting quality education, generating competent pupils to face the scientific, technological, managerial and social challenges in the fast evolving global scenario with a high degree of credibility, integrity, ethical standards and social concerns.
Education at SGIS is like a multifaceted crystal cornucopia of academics, sports, spirituality, creativity and imagination. The state of the art infrastructure, in the ever prevailing functional discipline imparts mental peace for children's growth. Besides sheer academics, the children learn the genuine importance of being organized and methodical in their work.
Our students learn from the experienced, dedicated and tremendously talented faculty, who challenge, inspire, encourage and nurture the tender minds to reach greater levels of perception. There is a wide range of extra-curricular activities on daily basis. Music, drama, sports, art and various other club activities give children a wide range of choices that appeal to different interests and skills.
</p>
    </div>
  </div></div>

        <div class="col-sm-4">
    <div class="box" style="background-color:whitesmoke; box-shadow: 10px 10px 8px 10px #888888;">
        
             <img src="image/8.jpg" class="img-fluid " alt="Director">
            
            <h6 style="padding-top: 1rem; text-align: center; color: rgb(19, 19, 66);">Mrs. Sasmita Mohanty <br>Director</h6>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Blanditiis, odit.</p>
            <p style="text-align: center;">Dear Parents, teachers, students and parents, It gives me immense pleasure that the Sanjay Ghodawat International school . </p>
    <a type="button" class="btn btn-primary" data-toggle="collapse" data-target="#demo2" >read more</a>
    <div id="demo2" class="collapse">
 <p> Belgaum branch is completing 5 years and we are publishing the second edition of our school magazine, Footprint. We have to accept that there is no greater victory in life of human being than a victory of the mind. Education is the single largest factor that shapes the head, heart and mind thereby developing an all-round personalities.
At SGIS, the uniqueness of each child is recognized, nurtured and treasured. Our focus is to develop our students as global citizens with tolerance, respect and appreciation of diverse cultures, religions for a life time learning experience. I am sure that the school under the guidance of its Principal and with the dedicated efforts of its staff will continue to march ahead to achieve an even higher level of excellence.

</p>    
</div>
  </div>
        </div></div></div>
        
        <br><br>--%>
</asp:Content>
