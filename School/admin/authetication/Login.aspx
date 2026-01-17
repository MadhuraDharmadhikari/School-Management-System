<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Admin_1.admin.authetication.Login" %>

<!DOCTYPE html>

<html lang="en" class="h-100">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Focus - Bootstrap Admin Dashboard </title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../images/favicon.png" />
    <link href="../css/style.css" rel="stylesheet" />

</head>

<body class="h-100">

    <a href="~/SchoolWebsite/home.aspx" runat="server" id="admin"
        style="position: fixed; bottom: 20px; right: 20px; background-color: #093cc7; color: Black; padding: 10px 16px; border-radius: 6px; text-decoration: none; z-index: 1000; font-weight: bold;">Go TO Home
    </a>
    <!-- Navbar -->
    <div class="authincation h-100">
        <div class="container-fluid h-100">
            <div class="row justify-content-center h-100 align-items-center">
                <div class="col-md-4">
                    <div class="authincation-content">
                        <div class="row no-gutters">
                            <div class="col-xl-12">
                                <div class="auth-form">
                                    <h4 class="text-center mb-4">Login your account</h4>
                                    <form runat="server">
                                        <div class="form-group">
                                            <asp:Label ID="lblEmail" runat="server" Text="Email" AssociatedControlID="txtEmail" Font-Bold="True"></asp:Label>
                                            <asp:TextBox ID="txtEmail" runat="server" placeholder="hello@examplegmail.com" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="lblPassword" runat="server" Text="Password" AssociatedControlID="txtPassword" Font-Bold="True"></asp:Label>
                                            <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" CssClass="form-control" TextMode="Password"></asp:TextBox>

                                        </div>
                                        <div class="form-row d-flex justify-content-between mt-4 mb-2">
                                            <div class="form-group">
                                                <div class="form-check ml-2">
                                                    <input class="form-check-input" type="checkbox" id="basic_checkbox_1" />
                                                    <label class="form-check-label" for="basic_checkbox_1">Remember me</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <a href="page-forgot-password.html">Forgot Password?</a>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <asp:Button ID="btnSignIn" runat="server" Text="Sign me in" CssClass="btn btn-primary btn-block" OnClick="btnSignIn_Click" />
                                        </div>
                                    </form>
                                    <div class="new-account mt-3">
                                        <p>Don't have an account? <a class="text-primary" href="./page-register.html">Sign up</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="../vendor/global/global.min.js"></script>
    <script src="../js/quixnav-init.js"></script>
    <script src="../js/custom.min.js"></script>

</body>

</html>
