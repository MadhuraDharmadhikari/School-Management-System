<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Admin_1.admin.authetication.Register" %>

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
    <div class="authincation h-100">
        <div class="container-fluid h-100">
            <div class="row justify-content-center h-100 align-items-center">
                <div class="col-md-6">
                    <div class="authincation-content">
                        <div class="row no-gutters">
                            <div class="col-xl-12">
                                <div class="auth-form">
                                    <h4 class="text-center mb-4">Sign up your account</h4>
                                    <form runat="server">
                                        <div class="form-group">
                                            <asp:Label ID="Label1" runat="server" Text="Username" AssociatedControlID="txtEmail" Font-Bold="True"></asp:Label>
                                            <asp:TextBox ID="txtuser" runat="server" placeholder="Username" CssClass="form-control" ></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="lblEmail" runat="server" Text="Email" AssociatedControlID="txtEmail" Font-Bold="True"></asp:Label>
                                            <asp:TextBox ID="txtEmail" runat="server" placeholder="hello@examplegmail.com" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="lblPassword" runat="server" Text="Password" AssociatedControlID="txtPassword" Font-Bold="True"></asp:Label>
                                            <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" CssClass="form-control" TextMode="Password"></asp:TextBox>

                                        </div>
                                        <div class="text-center mt-4">
                                            <button type="submit" class="btn btn-primary btn-block">Sign me up</button>
                                        </div>
                                    </form>
                                    <div class="new-account mt-3">
                                        <p>Already have an account? <a class="text-primary" href="page-login.html">Sign in</a></p>
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
    <!--endRemoveIf(production)-->
</body>
</html>
