<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>
<style>
body{
    font-family: Arial;
    background:#f5f7fa;
}
.box{
    width:400px;
    margin:100px auto;
    background:#fff;
    padding:30px;
    border-radius:10px;
    box-shadow:0 5px 20px rgba(0,0,0,0.1);
}
input{
    width:100%;
    padding:10px;
    margin:10px 0;
}
button{
    width:100%;
    padding:10px;
    background:#5b189a;
    color:#fff;
    border:none;
    font-size:16px;
}
.error{color:red;}
.success{color:green;}
</style>
</head>
<body>

<div class="box">
<h2>Forgot Password</h2>

<%
String error = request.getParameter("error");
String success = request.getParameter("success");
%>

<% if("email".equals(error)){ %>
<p class="error">Email not registered</p>
<% } %>

<% if("nomatch".equals(error)){ %>
<p class="error">Passwords do not match</p>
<% } %>

<% if("true".equals(success)){ %>
<p class="success">Password updated successfully. Please login.</p>
<% } %>

<form action="ForgotPasswordServlet" method="post">
    <input type="email" name="email" placeholder="Enter registered email" required>
    <input type="password" name="new_password" placeholder="New password" required>
    <input type="password" name="confirm_password" placeholder="Confirm password" required>
    <button type="submit">Reset Password</button>
</form>

</div>
</body>
</html>