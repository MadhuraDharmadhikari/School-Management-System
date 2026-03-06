<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site1.Master" AutoEventWireup="true" CodeBehind="adminprof.aspx.cs" Inherits="School.admin.adminprof" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>

.profile-card{
    background:#fff;
    border-radius:12px;
    padding:25px;
    max-width:400px;
    margin:30px auto;
    box-shadow:0 5px 15px rgba(0,0,0,0.1);
}

.profile-header{
    text-align:center;
    margin-bottom:20px;
}

.avatar{
    width:100px;
    height:100px;
    border-radius:50%;
    border:3px solid #4f46e5;
}

.name{
    font-size:20px;
    font-weight:600;
    margin-top:8px;
}

.role{
    background:#eef2ff;
    color:#4338ca;
    padding:4px 12px;
    border-radius:15px;
    font-size:12px;
    display:inline-block;
}

.info-row{
    display:flex;
    justify-content:space-between;
    padding:8px 0;
    border-bottom:1px solid #eee;
}

.label{
    font-weight:600;
    color:#444;
}

.value{
    color:#333;
}

.textbox{
    width:220px;
    padding:5px;
    border:1px solid #ccc;
    border-radius:5px;
}

.btn{
    padding:7px 18px;
    border:none;
    border-radius:6px;
    cursor:pointer;
}

.edit-btn{
    background:#4f46e5;
    color:white;
}

.save-btn{
    background:#16a34a;
    color:white;
}

</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="content-body">
<div class="profile-card">

<div class="profile-header">

<img src="https://cdn-icons-png.flaticon.com/512/1077/1077114.png" class="avatar"/>

<div class="name">
<asp:Label ID="lblName" runat="server"></asp:Label>
</div>

<div class="role">Super Admin</div>

</div>


<div class="info-row">
<span class="label">Admin ID</span>
<span class="value">
<asp:Label ID="lblAdminID" runat="server"></asp:Label>
</span>
</div>


<div class="info-row">
<span class="label">Username</span>

<asp:Label ID="lblUsername" runat="server" CssClass="value"></asp:Label>

<asp:TextBox ID="txtUsername" runat="server" CssClass="textbox" Visible="false"></asp:TextBox>
</div>


<div class="info-row">
<span class="label">Email</span>

<asp:Label ID="lblEmail2" runat="server" CssClass="value"></asp:Label>

<asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" Visible="false"></asp:TextBox>
</div>


<div class="info-row">
<span class="label">Created On</span>
<span class="value">
<asp:Label ID="lblCreatedOn" runat="server"></asp:Label>
</span>
</div>


<div class="info-row">
<span class="label">Last Login</span>
<span class="value">
<asp:Label ID="lblLastLogin" runat="server"></asp:Label>
</span>
</div>


<div class="info-row">
<span class="label">Current Device</span>
<span class="value">
<asp:Label ID="lblDevice" runat="server"></asp:Label>
</span>
</div>

<br />

<center>

<asp:Button ID="btnEdit" runat="server"
Text="Edit Profile"
CssClass="btn edit-btn"
OnClick="btnEdit_Click"/>

<asp:Button ID="btnSave" runat="server"
Text="Save"
CssClass="btn save-btn"
Visible="false"
OnClick="btnSave_Click"/>

</center>

</div>
            </div>

</asp:Content>