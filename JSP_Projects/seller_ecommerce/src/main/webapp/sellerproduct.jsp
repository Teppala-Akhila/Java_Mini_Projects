<%@ page import="java.util.*, com.dao.SellerProductDao" %>

<%
Integer sellerId = (Integer) session.getAttribute("sellerId");

if (sellerId == null) {
    response.sendRedirect("login.jsp");
    return;
}

List<Map<String,Object>> products =
    SellerProductDao.getProductsBySeller(sellerId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Products</title>

<style>
body {
    font-family: Segoe UI;
    background: #f3f4f6;
    padding: 30px;
}

.container {
    background: white;
    padding: 25px;
    border-radius: 16px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.1);
}

h2 {
    color: #6B2C91;
    margin-bottom: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 12px;
    border-bottom: 1px solid #ddd;
}

th {
    background: #6B2C91;
    color: white;
}

.badge {
    padding: 5px 10px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: bold;
}

.active {
    background: #dcfce7;
    color: #166534;
}

.inactive {
    background: #fee2e2;
    color: #991b1b;
}
</style>
</head>

<body>

<div class="container">
<h2>My Products</h2>

<% if(products.isEmpty()) { %>
    <p>No products added yet.</p>
<% } else { %>

<table>
<tr>
    <th>Product Code</th>
    <th>Name</th>
    <th>Brand</th>
    <th>Category</th>
    <th>Status</th>
</tr>

<% for(Map<String,Object> p : products) { %>
<tr>
    <td><%= p.get("product_id") %></td>
    <td><%= p.get("product_name") %></td>
    <td><%= p.get("brand") %></td>
    <td><%= p.get("category") %></td>
    <td>
        <span class="badge <%= p.get("status").equals("ACTIVE") ? "active" : "inactive" %>">
            <%= p.get("status") %>
        </span>
    </td>
</tr>
<% } %>

</table>

<% } %>

</div>

</body>
</html>