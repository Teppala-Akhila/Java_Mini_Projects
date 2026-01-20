<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.set.model.ProductModel" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
</head>

<body>

<h2>Product List</h2>

<%
List<ProductModel> products =
    (List<ProductModel>) request.getAttribute("products");

if (products != null && !products.isEmpty()) {
    for (ProductModel p : products) {
%>

<div>
    <img src="<%= p.getImagePath() %>" width="180" height="150" alt="Product Image"><br>

    <strong><%= p.getProductName() %></strong><br>
    Brand: <%= p.getBrand() %><br>
    Color: <%= p.getColor() %><br>
    Price: ₹ <%= p.getPrice() %><br>
    Discount: <%= p.getDiscount() %> %<br>
    Final Price: ₹ <%= p.getFinalPrice() %><br>
    Quantity: <%= p.getQuantity() %><br>
    Status: <%= p.getStatus() %><br>

    <hr>
</div>

<%
    }
} else {
%>

<p>No products available.</p>

<%
}
%>

</body>
</html>
































