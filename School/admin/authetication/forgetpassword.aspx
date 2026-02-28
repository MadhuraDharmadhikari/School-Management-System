<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgetpassword.aspx.cs" Inherits="School.admin.authetication.forgetpassword" %>


<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Forgot Password</title>

    <link rel="icon" type="image/png" sizes="16x16" href="../images/favicon.png" />
    <link href="../css/style.css" rel="stylesheet" />
</head>

<body class="h-100">

<div class="authincation h-100">
    <div class="container-fluid h-100">
        <div class="row justify-content-center h-100 align-items-center">
            <div class="col-md-4">
                <div class="authincation-content">
                    <div class="row no-gutters">
                        <div class="col-xl-12">
                            <div class="auth-form">
                                <h4 class="text-center mb-4">Forgot Password</h4>

                                <form runat="server">

                                    <div class="form-group">
                                        <asp:Label runat="server" Text="Email" Font-Bold="true" />
                                        <asp:TextBox ID="txtEmail" runat="server"
                                            CssClass="form-control"
                                            TextMode="Email"
                                            Placeholder="hello@example.com" />
                                    </div>

                                    <div class="text-center mt-4">
                                        <asp:Button ID="btnNext" runat="server"
                                            Text="Next"
                                            CssClass="btn btn-primary btn-block"
                                            OnClick="btnNext_Click" />
                                    </div>

                                    <div class="text-center mt-3">
                                        <a href="Login.aspx">Back to Login</a>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="../vendor/global/global.min.js"></script>
<script src="../js/quixnav-init.js"></script>
<script src="../js/custom.min.js"></script>

</body>
</html>