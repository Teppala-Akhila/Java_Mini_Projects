<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
<link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="product-box">

    <h2>Add Product</h2>

    <form action="ProductAddServlet" method="post" enctype="multipart/form-data">

        <!-- Basic Details -->
        <input type="text" name="productCode" placeholder="Product ID" required>
        <input type="text" name="productName" placeholder="Product Name" required>
        <input type="text" name="category" placeholder="Category" required>
        <input type="text" name="brand" placeholder="Brand" required>
        <input type="text" name="modelNumber" placeholder="Model Number" required>
        <input type="text" name="model" placeholder="Model" required>
        <input type="text" name="color" placeholder="Color" required>

        <!-- Stock & Pricing -->
        <input type="number" name="quantity" placeholder="Quantity" required>
        <input type="number" step="0.01" name="price" placeholder="Price" required>
        <input type="number" name="discount" placeholder="Discount (%)" required>
        <input type="number" name="warrantyMonths" placeholder="Warranty (Months)" required>

        <!-- Image -->
        <label>Product Image</label>
        <input type="file" name="productImage" accept="image/*" required>

        <!-- Status -->
        <select name="status" required>
            <option value="">Select Status</option>
            <option value="Available">Available</option>
            <option value="Out of Stock">Out of Stock</option>
        </select>

        <!-- Description -->
        <textarea name="description" placeholder="Product Description"></textarea>

        <input type="submit" value="Add Product">

    </form>

</div>

</body>
</html>
