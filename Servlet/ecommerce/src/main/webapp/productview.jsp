<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.set.model.ProductModel" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>

<link rel="stylesheet" href="css/product.css">

</head>
<body>

<h2>Products</h2>

<div class="product-grid">

<%
List<ProductModel> products =
    (List<ProductModel>) request.getAttribute("products");

if (products != null && !products.isEmpty()) {
    for (ProductModel p : products) {
%>

    <div class="product-card">

        <!-- Product Image -->
        <img src="<%= p.getImagePath() %>" alt="Product Image">

        <!-- Product Name -->
        <div class="product-name">
            <%= p.getProductName() %>
        </div>

        <!-- MRP & Discount -->
        <div class="price-row">
            <span class="mrp">₹ <%= p.getPrice() %></span>
            <span class="discount"><%= p.getDiscount() %>% OFF</span>
        </div>

        <!-- Final Price -->
        <div class="final-price">
            ₹ <%= p.getFinalPrice() %>
        </div>

        <!-- Add to Cart -->
        <form action="AddToCartServlet" method="post">
            <input type="hidden" name="productId" value="<%= p.getId() %>">
            <button type="submit" class="cart-btn">Add to Cart</button>
        </form>

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
