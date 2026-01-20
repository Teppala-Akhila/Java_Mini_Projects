<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Login</title>

<!-- ✅ correct css -->
<link rel="stylesheet" href="css/auth.css">

</head>

<body>

<!-- ✅ USE auth-box (matches CSS) -->
<div class="auth-box">

    <h2>User Login</h2>

    <form action="LoginServlet" method="post">

        <label>Username or Email</label>
        <input type="text" name="username"
               placeholder="Enter username or email" required>

        <label>Password</label>
        <input type="password" name="password"
               placeholder="Enter password" required>

        <div class="forgot">
            <a href="ForgotPassword.jsp">Forgot Password?</a>
        </div>

        <input type="submit" value="Login">
    </form>

    <div class="register">
        New User? <a href="register.jsp">Register</a>
    </div>

</div>

</body>
</html>
