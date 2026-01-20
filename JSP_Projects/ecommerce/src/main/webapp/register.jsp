<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Register</title>

<link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="login-box">
    <h2>Create Account</h2>

    <form action="RegisterServlet" method="post">

        <div class="form-grid">

            <div>
                <label>Vendor Username</label>
                <input type="text" name="username" placeholder="Enter username" required>
            </div>

            <div>
                <label>GST Number</label>
                <input type="text" name="gst" placeholder="Enter GST number">
            </div>

            <div>
                <label>Email</label>
                <input type="email" name="email" placeholder="Enter email" required>
            </div>

            <div>
                <label>Phone Number</label>
                <input type="number" name="phone" placeholder="Enter phone number">
            </div>

            <div class="full">
                <label>Password</label>
                <input type="password" name="password" placeholder="Enter password" required>
            </div>

            <div class="full">
                <label>Confirm Password</label>
                <!-- ✅ FIX: name MUST be confirmPassword -->
                <input type="password" name="confirmPassword" placeholder="Re-enter password" required>
            </div>

        </div>

        <input type="submit" value="Register">

        <div class="register">
            Already have an account?
            <a href="login.jsp">Login</a>
        </div>

    </form>
</div>

</body>
</html>
