<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Register</title>
<link rel="stylesheet" href="css/auth.css">
</head>

<body>
<div class="center-page">

    <div class="auth-box">
        <h2>Create Account</h2>

        <form action="RegisterServlet" method="post">

            <div class="form-grid">

                <div>
                    <label>Vendor Username</label>
                    <input type="text" name="username" required>
                </div>

                <div>
                    <label>GST Number</label>
                    <input type="text" name="gst">
                </div>

                <div>
                    <label>Email</label>
                    <input type="email" name="email" required>
                </div>

                <div>
                    <label>Phone Number</label>
                    <input type="number" name="phone">
                </div>

                <div class="full">
                    <label>Password</label>
                    <input type="password" name="password" required>
                </div>

                <div class="full">
                    <label>Confirm Password</label>
                    <input type="password" name="confirmPassword" required>
                </div>

            </div>

            <input type="submit" value="Register">

            <div class="register">
                Already have an account?
                <a href="login.jsp">Login</a>
            </div>

        </form>
    </div>

</div>
</body>
</html>
