<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add Product</title>

<style>
/* ===== GLOBAL ===== */
body {
    margin: 0;
    min-height: 100vh;
    background: linear-gradient(135deg, #fff7ed, #ffedd5);
    display: flex;
    justify-content: center;
    align-items: center;
    font-family: "Segoe UI", Arial, sans-serif;
    color: #7c2d12;
}

/* ===== CARD ===== */
.product-box {
    width: 420px;
    background: #ffffff;
    padding: 32px 28px;
    border-radius: 14px;
    box-shadow: 0 16px 35px rgba(251,146,60,0.35);
    border: 1px solid #fed7aa;
}

.product-box h2 {
    text-align: center;
    margin-bottom: 22px;
    color: #9a3412;
}

/* ===== INPUTS ===== */
.product-box input,
.product-box select {
    width: 100%;
    padding: 10px 12px;
    margin-bottom: 14px;
    border-radius: 8px;
    border: 1px solid #fdba74;
    font-size: 14px;
}

.product-box input[type="file"] {
    padding: 6px;
}

.product-box select {
    background: #fff;
}

/* ===== BUTTON ===== */
.product-box input[type="submit"] {
    background: #f97316;
    color: #fff;
    font-weight: 600;
    border: none;
    cursor: pointer;
    margin-top: 10px;
    transition: background 0.2s ease;
}

.product-box input[type="submit"]:hover {
    background: #ea580c;
}
</style>

</head>
<body>

<div class="product-box">
    <h2>Add Product</h2>

    <form action="ProductServlet" method="post" enctype="multipart/form-data">

        <input type="number" name="productId" placeholder="Product ID" required>

        <input type="text" name="productName" placeholder="Product Name" required>

        <input type="text" name="brand" placeholder="Brand" required>

        <input type="text" name="color" placeholder="Color" required>

        <input type="number" step="0.01" name="price" placeholder="Price" required>

        <input type="number" name="stock" placeholder="Stock" required>

        <label>Product Image</label>
        <input type="file" name="productImage" accept="image/*" required>

        <select name="status" required>
            <option value="ACTIVE">ACTIVE</option>
            <option value="INACTIVE">INACTIVE</option>
        </select>

        <input type="submit" value="Add Product">

    </form>
</div>

</body>
</html>
