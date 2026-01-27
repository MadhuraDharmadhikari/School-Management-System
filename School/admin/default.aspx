<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site1.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="School.admin._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-body">

        <!-- row -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3">
                    <div class="card" style="background-color:#cd88f5">
                        <div class="stat-widget-two card-body">
                            <div class="card-top">
                                <i class="fas fa-user-graduate fa-3x" style="color:#2f9e44;"></i>
                                <br />
                                <span class="card-title" style="color: #064305; align-items: center; font-size: 28px">Total Students</span>
                            </div>

                            <div class="card-value text-green">
                                <asp:Label ID="txtstudent" runat="server" Text="850" style=" align-items: center; font-size: 25px;"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                  <div class="col-md-3">
                    <div class="card" style="background-color:#a6ee80">
                        <div class="stat-widget-two card-body">
                            <div class="card-top">
                                <i class="fas fa-sack-dollar fa-3x "style="color:#f59f00;"></i>
                                <br />
                                <span class="card-title" style="color: #cc6013; align-items: center; font-size: 28px">Fees</span>
                            </div>

                            <div class="card-value text-green">
                                <asp:Label ID="txttotalfees" runat="server" Text="850" style=" align-items: center; font-size: 25px"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card" style="background-color:#d7bdbd">
                        <div class="stat-widget-two card-body">
                            <div class="card-top">
                               <i class="fas fa-circle-check fa-3x" style="color:#28a745;"></i>
                                <br />
                                <span class="card-title" style="color: #0d09b3; align-items: center; font-size: 28px">Paid Fees</span>
                            </div>

                            <div class="card-value text-green">
                                <asp:Label ID="txtpaidfees" runat="server" Text="850" style="align-items: center; font-size: 25px"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card" style="background-color:#39b8e6">
                        <div class="stat-widget-two card-body">
                            <div class="card-top">
                                <i class="fas fa-hourglass-half fa-3x "  style="color:#c92a2a;"></i>
                                <br />
                                <span class="card-title" style="color: #dd1616; align-items: center; font-size: 28px">Pending Fees</span>
                            </div>
                            <div class="card-value text-green">
                                <asp:Label ID="txtpending" runat="server" Text="850" style="align-items: center; font-size: 30px"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /# card -->
            </div>
            <!-- /# column -->
        </div>
        <div class="row">
            <div class="col-xl-8 col-lg-8 col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Sales Overview</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-xl-12 col-lg-8">
                                <div id="morris-bar-chart"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-lg-4 col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="m-t-10">
                            <h4 class="card-title">Customer Feedback</h4>
                            <h2 class="mt-3">385749</h2>
                        </div>
                        <div class="widget-card-circle mt-5 mb-5" id="info-circle-card">
                            <i class="ti-control-shuffle pa"></i>
                        </div>
                        <ul class="widget-line-list m-b-15">
                            <li class="border-right">92%
                                     <br>
                                <span class="text-success"><i
                                    class="ti-hand-point-up"></i>Positive</span></li>
                            <li>8%
                                     <br>
                                <span class="text-danger"><i
                                    class="ti-hand-point-down"></i>Negative</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Project</h4>
                    </div>
                    <div class="card-body">
                        <div class="current-progress">
                            <div class="progress-content py-2">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="progress-text">Website</div>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="current-progressbar">
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-primary w-40" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
                                                    40%
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="progress-content py-2">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="progress-text">Android</div>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="current-progressbar">
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-primary w-60" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
                                                    60%
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="progress-content py-2">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="progress-text">Ios</div>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="current-progressbar">
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-primary w-70" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100">
                                                    70%
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="progress-content py-2">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="progress-text">Mobile</div>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="current-progressbar">
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-primary w-90" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
                                                    90%
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-body">
                        <div class="testimonial-widget-one p-17">
                            <div class="testimonial-widget-one owl-carousel owl-theme">
                                <div class="item">
                                    <div class="testimonial-content">
                                        <div class="testimonial-text">
                                   <%--         <i class="fa fa-quote-left"></i>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.
                                     consectetur adipisicing elit.
                                     <i class="fa fa-quote-right"></i>--%>
                                        </div>
                                        <div class="media">
                                            <div class="media-body">
                                                <div class="testimonial-author">TYRION LANNISTER</div>
                                                <div class="testimonial-author-position">
                                                    Founder-Ceo. Dell Corp
                                                </div>
                                            </div>
                                            <img class="testimonial-author-img ml-3" src="./images/avatar/1.png" alt="" />
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="testimonial-content">
                                        <div class="testimonial-text">
                                            <i class="fa fa-quote-left"></i>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.
                                     consectetur adipisicing elit.
                                     <i class="fa fa-quote-right"></i>
                                        </div>
                                        <div class="media">
                                            <div class="media-body">
                                                <div class="testimonial-author">TYRION LANNISTER</div>
                                                <div class="testimonial-author-position">
                                                    Founder-Ceo. Dell Corp
                                                </div>
                                            </div>
                                            <img class="testimonial-author-img ml-3" src="./images/avatar/1.png" alt="" />
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="testimonial-content">
                                        <div class="testimonial-text">
                                            <i class="fa fa-quote-left"></i>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.
                                     consectetur adipisicing elit.
                                     <i class="fa fa-quote-right"></i>
                                        </div>
                                        <div class="media">
                                            <div class="media-body">
                                                <div class="testimonial-author">TYRION LANNISTER</div>
                                                <div class="testimonial-author-position">
                                                    Founder-Ceo. Dell Corp
                                                </div>
                                            </div>
                                            <img class="testimonial-author-img ml-3" src="./images/avatar/1.png" alt="" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Web Server</h4>
                    </div>
                    <div class="card-body">
                        <div class="cpu-load-chart">
                            <div id="cpu-load" class="cpu-load"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
