<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.set.doa.UserDao" %>
<%@ page import="com.set.model.UserModel"%>
<%@ page import="java.util.*" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<form action="UserInfoServlet" method="post">
	<table>
	<tr> 
		<td>FirstName:</td> 
		<td><input type="text" name="fname"/></td>
	</tr>
	<tr>
		<td>LastName:</td>
	    <td><input type="text" name="lname"/></td>
	</tr>
	<tr>
		<td>phoneno:</td> 
		<td><input type="text" name="phno"/></td>
	</tr>
	<tr>
		<td>email:</td> 
		<td><input type="email" name="email"/></td>
	</tr>
	<tr>
	<td><input type="submit" value="add"></td>
	</tr>
	</table>
	</form>
</div>
<div>
	<table border='1px'>
			<tr>
			    <th>ID</th>
				<th>Name</th>
				<th>PHONE No</th>
				<th>Email</th>
			</tr>
			<%
			//List<UserModel> userList = (List<UserModel>) request.getAttribute("userList");
			UserDao ud=new UserDao();
			List<UserModel> userList = ud.getAllUsers();
			//List<UserModel> userList = (List<UserModel>) request.getAttribute("userList");

			if (userList != null) {
			    for (UserModel u : userList) {
			%>
				<tr>
				    <td><%= u.getId() %></td>
					<td><%out.write(u.getFirstName());%> <%=u.getLastName() %> </td>
					<td><%out.write(u.getphno());%> </td>
					<td><%=u.getEmail()%> </td>
				</tr>
			<%
			}
			}
			%>
			
			
		</table>
</div>
</body>
</html>