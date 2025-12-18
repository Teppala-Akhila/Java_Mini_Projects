<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Form</title>
</head>
<body>
	<form action="RegisterServlet" method="post">
		<table>
			<tr>
			<td>UserName: </td> 
			<td><input type="text" name="uname"></td>
			</tr>
			<tr><td colspan="2"><br></td></tr>
			<tr>
			<td>Password: </td> 
			<td><input type="password" name="pass"></td>
			</tr>
			<tr><td colspan="2"><br></td></tr>
		    <tr>
		    <td><input type="submit" value="Register"></td>
		    </tr>
		</table>
	</form>
</body>
</html>