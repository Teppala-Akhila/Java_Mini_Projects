<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.set.model.ProductModel" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>

<style>
body {
    font-family: "Segoe UI", Arial, sans-serif;
    background: linear-gradient(135deg, #fff7ed, #ffedd5);
    margin: 0;
    padding: 30px;
    color: #7c2d12;
}

h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #9a3412;
}

.product-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
    gap: 20px;
}

.card {
    border: 1px solid #fdba74;
    border-radius: 14px;
    padding: 15px;
    background: #ffffff;
    box-shadow: 0 10px 25px rgba(251,146,60,0.25);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.card:hover {
    transform: translateY(-4px);
    box-shadow: 0 16px 35px rgba(251,146,60,0.35);
}

.card img {
    width: 100%;
    height: 150px;
    object-fit: cover;
    border-radius: 10px;
    margin-bottom: 10px;
}

.card h4 {
    margin: 6px 0;
    font-size: 16px;
    color: #7c2d12;
}

.card p {
    margin: 4px 0;
    font-size: 14px;
    color: #78350f;
}

.price {
    font-weight: 700;
    color: #c2410c;
}
</style>
</head>

<body>

<h2>🛒 Product List</h2>

<div class="product-grid">

<%
List<ProductModel> products =
    (List<ProductModel>) request.getAttribute("products");

if (products != null && !products.isEmpty()) {
    for (ProductModel p : products) {
%>

<div class="card">
    <img src="<%= p.getImageUrl() %>" alt="Product Image">

    <h4><%= p.getProductName() %></h4>
    <p><%= p.getBrand() %> | <%= p.getColor() %></p>
    <p class="price">₹ <%= p.getPrice() %></p>
    <p>Stock: <%= p.getStock() %></p>
    <p>Status: <%= p.getStatus() %></p>
</div>

<%
    }
} else {
%>

<p>No products available.</p>

<%
}
%>

</div>

</body>
</html>
