<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site1.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="School.admin._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-body">
        <%--Cards--%>
        <!-- row -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3">
                    <div class="card" style="background-color: #cd88f5">
                        <div class="stat-widget-two card-body">
                            <div class="card-top">
                                <i class="fas fa-user-graduate fa-3x" style="color: #2f9e44;"></i>
                                <br />
                                <span class="card-title" style="color: #064305; align-items: center; font-size: 28px">Total Students</span>
                            </div>

                            <div class="card-value text-green">
                                <asp:Label ID="txtstudent" runat="server" Text="850" Style="align-items: center; font-size: 25px;"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card" style="background-color: #a6ee80">
                        <div class="stat-widget-two card-body">
                            <div class="card-top">
                                <i class="fas fa-sack-dollar fa-3x " style="color: #f59f00;"></i>
                                <br />
                                <span class="card-title" style="color: #cc6013; align-items: center; font-size: 28px">Fees</span>
                            </div>

                            <div class="card-value text-green">
                                <asp:Label ID="txttotalfees" runat="server" Text="850" Style="align-items: center; font-size: 25px"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card" style="background-color: #d7bdbd">
                        <div class="stat-widget-two card-body">
                            <div class="card-top">
                                <i class="fas fa-circle-check fa-3x" style="color: #28a745;"></i>
                                <br />
                                <span class="card-title" style="color: #0d09b3; align-items: center; font-size: 28px">Paid Fees</span>
                            </div>

                            <div class="card-value text-green">
                                <asp:Label ID="txtpaidfees" runat="server" Text="850" Style="align-items: center; font-size: 25px"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card" style="background-color: #39b8e6">
                        <div class="stat-widget-two card-body">
                            <div class="card-top">
                                <i class="fas fa-hourglass-half fa-3x " style="color: #c92a2a;"></i>
                                <br />
                                <span class="card-title" style="color: #dd1616; align-items: center; font-size: 28px">Pending Fees</span>
                            </div>
                            <div class="card-value text-green">
                                <asp:Label ID="txtpending" runat="server" Text="850" Style="align-items: center; font-size: 25px"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%-- Graph repesentation --%>
        <asp:HiddenField ID="hfClassLabels" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hfStudentData" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hfBoysData" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hfGirlsData" runat="server" ClientIDMode="Static" />
        <div class="card m-4">
            <div class="card-body">
                <h5 class="card-title">Class Wise Student Count</h5>
                <canvas id="studentChart"></canvas>
            </div>
        </div>

        <%--   Today's Admission Section Grid view--%>

   <div class="card m-4">
    <div class="card-body">
        <h5 class="card-title">Last 7 Days Enquiries</h5>

        <asp:GridView ID="gvFastEnquiry" runat="server"
            CssClass="table table-bordered table-striped"
            AutoGenerateColumns="false"
            EmptyDataText="No enquiries in last 7 days">

            <Columns>
                <asp:BoundField DataField="ParentName" HeaderText="Parent Name" />
                <asp:BoundField DataField="EmailAddress" HeaderText="Email Address" />
                <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                <asp:BoundField DataField="Address" HeaderText="Address" />
                <asp:BoundField DataField="Class" HeaderText="Class" />
            </Columns>
        </asp:GridView>
    </div>
</div>


    </div>
    <%--Graph script--%>
    <script>
        var classLabels = JSON.parse(document.getElementById('hfClassLabels').value);
        var boysData = JSON.parse(document.getElementById('hfBoysData').value);
        var girlsData = JSON.parse(document.getElementById('hfGirlsData').value);

        new Chart(document.getElementById("studentChart"), {
            type: 'bar',
            data: {
                labels: classLabels,
                datasets: [
                    {
                        label: 'Boys',
                        data: boysData,
                        backgroundColor: '#339af0'
                    },
                    {
                        label: 'Girls',
                        data: girlsData,
                        backgroundColor: '#f783ac'
                    }
                ]
            },
            options: {
                responsive: true,
                scales: {
                    x: { stacked: true },
                    y: { stacked: true, beginAtZero: true }
                }
            }
        });
    </script>


</asp:Content>
