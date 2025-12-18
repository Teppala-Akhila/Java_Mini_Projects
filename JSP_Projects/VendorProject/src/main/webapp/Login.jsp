<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>
</head>
<body>
	<form action="LoginServlet" method="post"></form>
		<table>
			<tr>
			<td>UserName: </td> 
			<td><input type="text" name="username"></td>
			</tr>
			<tr><td colspan="2"><br></td></tr>
			<tr>
			<td>Password: </td> 
			<td><input type="password" name="pswd"></td>
			</tr>
			<tr><td colspan="2"><br></td></tr>
			<tr>
			<td colspan="2" align="right">
			<a href="ForgotPassword.jsp">Forgot Password?</a>
		    </tr>
		    <tr><td colspan="2"><br></td></tr>
		    <tr>
		    <td><input type="submit" value="Login"></td>
		    <td><input type="submit" value="Register"></td>
		    </tr>
		</table>
	</form>
</body>
</html>