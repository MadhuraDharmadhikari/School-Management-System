<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="changepassword.aspx.cs" Inherits="School.admin.authetication.changepassword" %>


<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Change Password</title>

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
                                <h4 class="text-center mb-4">Change Password</h4>

                                <form runat="server">

                                    <div class="form-group">
                                        <asp:Label runat="server" Text="New Password" Font-Bold="true" />
                                        <asp:TextBox ID="txtNewPassword" runat="server"
                                            CssClass="form-control"
                                            TextMode="Password"
                                            Placeholder="Enter new password" />
                                    </div>

                                    <div class="text-center mt-4">
                                        <asp:Button ID="btnSave" runat="server"
                                            Text="Save Password"
                                            CssClass="btn btn-success btn-block"
                                            OnClick="btnSave_Click" />
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