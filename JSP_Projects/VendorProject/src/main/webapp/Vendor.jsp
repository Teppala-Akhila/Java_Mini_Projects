<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vendor Registration Form</title>
</head>
<body>
	<%
	String msg = (String) request.getAttribute("successMsg");
	if (msg != null) {
	%>
	    <p style="color: green; font-weight: bold;">
	        <%= msg %>
	    </p>
	<%
	}
	%>
		<form action="VendorServlet" method="post">
			<table>
				<tr>
				<td>VendorName: </td> 
				<td><input type="text" name="vendorname"></td>
				</tr>
				<tr><td colspan="2"><br></td></tr>
				<tr>
				<td>GST Number: </td> 
				<td><input type="text" name="gst"></td>
				</tr>
				<tr><td colspan="2"><br></td></tr>
			    <tr>
				<td>Email: </td> 
				<td><input type="email" name="email"></td>
				</tr>
				<tr><td colspan="2"><br></td></tr>
				<tr>
				<td>Contact Number: </td> 
				<td><input type="text" name="cno"></td>
				</tr>
				<tr><td colspan="2"><br></td></tr>
				<tr>
			    <td><input type="submit" value="submit"></td>
			    </tr>
			</table>
		</form>
</body>
</html>