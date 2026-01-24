<%@ Page Title="" Language="C#" MasterPageFile="~/SchoolWebsite/School.Master" AutoEventWireup="true" CodeBehind="admission_info.aspx.cs" Inherits="School.SchoolWebsite.admission_info" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.5.0/css/all.min.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

          <%-- photo sections--%>

   <div class="container-fluid" style="padding: 0; position: relative;">

       <!-- Image -->
       <img src="image/ad1.jpg"
           style="width: 100%; height: 450px; object-fit: cover; box-shadow: inset 0 0 120px rgba(0,0,0,0.5);">

       <!-- Overlay -->
       <div style="position: absolute; top: 0; left: 0; width: 100%; height: 450px; background: rgba(0,0,0,0.45);">
       </div>

       <!-- Center Title -->
       <div style="position: absolute; top: 0; left: 0; width: 100%; height: 450px; display: flex; align-items: center; justify-content: center; text-align: center;">
           <p style="color: #fff; font-size: 48px; font-weight: 700; letter-spacing: 2px; text-shadow: 0 6px 18px rgba(0,0,0,0.7); margin: 0;">
              Admission Criteria
           </p>
       </div>

   </div>
    <br /><br />
        <div class="row">
      
                 <div class="col-md-7">
         <h1 style="color: #e1261c; font-size: 42px; font-weight: 700; margin-bottom: 10px; font-family: Arial, Helvetica, sans-serif; padding: 10px 10px 10px 10px">Admission Criteria</h1>
         <p style="font-size: 18px; line-height: 1.8; color: #1f2a44; max-width: 1100px; font-family: Arial, Helvetica, sans-serif;padding: 10px 10px 30px 10px"">
                 Admissions begin with an application review followed by an age-appropriate assessment. For Kindergarten,
             younger learners participate in a child-friendly interaction and developmental observation. For EY2, EY3 and Primary onwards,
             students appear for a written assessment and an interaction to understand their readiness. Parents are expected to share complete academic,
             behavioural and medical information to ensure appropriate support planning.
             Admission is confirmed subject to seat availability, completion of documents and the school’s evaluation process.
         </p>
     </div>
        <div class="col-md-5">
            <img src="image/ad2.jpg"
                style="width: 100%; max-width: 500px; border-radius: 14px; box-shadow: 0 10px 25px rgba(0,0,0,0.15);">
        </div>
   
        <div class="col-md-1">
        </div>
            </div>





    <!--admission_info-->
        <div class="container-fluid">
<%--            <div class="row">
                <div class="col-sm-6">
               <img src="image/1.jpg" style="width: 33rem; height: 16rem;" class="img-fluid">
                </div>
                <div class="col-sm-6">
                <h3 > <pre style="color: crimson;">ADMISSION  INFOR</pre></h3>
                <p>Names of prospective students are registered from December onwards. Parents have to collect the application form from the school office and do the registration. After the sorting of the admission form the child will be called for a written assessment. In case of K.G a personal interaction of the child with the class teacher and parents.

For grades 1 and above a small assessment test will be conducted of the subject English, Science and Math. Admission Test will follow a personal interaction of the child & the parents with the principal. The results of admission procedure will be declared within 24 hours.</p>
                </div>
            </div>--%>
     <br />
          <table class="table table-bordered">
    <thead>
      <tr style="background-color: goldenrod;">
        <th>Sr.No</th>
        <th>Course ID</th>
        <th>Age Group</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td>Nursery</td>
        <td>2 years 8 months on 1st June</td>
      </tr>
      
      <tr>
        <td>2</td>
        <td>Pre Transition (LKG)</td>
        <td>3 years 8 months on 1st June</td>
      </tr>	
      <tr>
        <td>3</td>
        <td>Transition (LKG)</td>
        <td>4 years 8 months on 1st June</td>
      </tr>
      
      <tr>
        <td>4</td>
        <td>Grade I</td>
        <td>5 years 8 months on 1st June</td>
      </tr>
    </tbody>
  </table>
             </div>

<%--  <p>Fees are inclusive of School Uniforms, House Uniform, Shoes, Text Books, Note Books, School Bag, Meals Charges, Special Days, Sports and Performing Arts, Library Fees and Post School Activities, Remedial Teaching, Competitive Exam Coaching, Training for External Competitions. Etc

School Fees Exclude Transportation, External Examination Fees, Check Point Grade V, Check Point Grade VIII, IGCSE Grade X, A & AS level of Cambridge, Examination Fees.

Fees are acceptable in the form of CASH, NEFT, Demand Draft , CTS Cheque</p>--%>
    <br />

           <div class="row">
     
                <div class="col-md-7">
        <h1 style="color: #e1261c; font-size: 42px; font-weight: 700; margin-bottom: 10px; font-family: Arial, Helvetica, sans-serif; padding: 10px 10px 10px 10px">Documents Required</h1>
  
<i class="fa-solid fa-star" style="font-size:16px;color:#d11f1f;margin-right:6px;vertical-align:middle; padding:6px 10px 6px 10px"></i>
<span style="vertical-align:middle;font-size:24px;">Original Birth Certificate</span><br />
<i class="fa-solid fa-star" style="font-size:16px;color:#d11f1f;margin-right:6px;vertical-align:middle; padding:6px 10px 6px 10px"></i>
<span style="vertical-align:middle;font-size:24px;">Previous academic records (if applicable)</span><br />
<i class="fa-solid fa-star" style="font-size:16px;color:#d11f1f;margin-right:6px;vertical-align:middle; padding:6px 10px 6px 10px"></i>
<span style="vertical-align:middle;font-size:24px;">SEN or medical reports (if applicable)</span><br />
<i class="fa-solid fa-star" style="font-size:16px;color:#d11f1f;margin-right:6px;vertical-align:middle; padding:6px 10px 6px 10px"></i>
<span style="vertical-align:middle;font-size:24px;">Five passport-size photographs of the child</span><br />
<i class="fa-solid fa-star" style="font-size:16px;color:#d11f1f;margin-right:6px;vertical-align:middle; padding:6px 10px 6px 10px"></i>
<span style="vertical-align:middle;font-size:24px;">Two passport-size photographs of each parent</span><br />
<i class="fa-solid fa-star" style="font-size:16px;color:#d11f1f;margin-right:6px;vertical-align:middle; padding:6px 10px 6px 10px"></i>
<span style="vertical-align:middle;font-size:24px;">Aadhaar card copies of the child and both parents</span><br />


    </div>
       <div class="col-md-5">
           <img src="image/ad3.jpg"
               style="width: 100%; max-width: 500px; border-radius: 14px; box-shadow: 0 10px 25px rgba(0,0,0,0.15);">
       </div>
  
     <br /><br />  
               <div class="col-md-5"></div>
          <div class="col-sm-4" style="padding:60px 60px 30px 60px">
              <a runat="server" href="~/SchoolWebsite/admission_enqure.aspx" id="enqure">
            <button type="button" onclick="openPopup()"style="background-color:#df1f1f;border-color: #df1f1f; color: #e6e6e0; font-size: 2rem; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">Apply Now</button>
            </a>
                  </div>
           
           </div>
    <br /><br /><br />

       

   

</asp:Content>
