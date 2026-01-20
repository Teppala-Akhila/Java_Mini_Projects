<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Login</title>

<link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="login-box">
    <h2>User Login</h2> 

    <form action="LoginServlet" method="post">

        <div>
            <label>Username or Email</label>
            <input type="text" name="username"
                   placeholder="Enter username or email"
                   required>
        </div>

        <div>
            <label>Password</label>
            <input type="password" name="password"
                   placeholder="Enter password"
                   required>
        </div>

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
