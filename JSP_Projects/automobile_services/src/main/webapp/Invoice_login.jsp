<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BPO Invoice Entry</title>

<style>
* {
    box-sizing: border-box;
    font-family: "Segoe UI", Arial, sans-serif;
}

body {
    margin: 0;
    background: linear-gradient(135deg, #e8f1ff, #f5f9ff);
    color: #1e293b;
}

.header {
    height: 85px;
    background: #ffffff;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 30px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.08);
}

.logo {
    display: flex;
    align-items: center;
    gap: 14px;
}

.logo img {
    height: 85px;
    max-width: 500px;
    object-fit: contain;
}

.logo strong {
    font-size: 20px;
    color: #1e40af;
    font-weight: 600;
}

.header-right {
    display: flex;
    align-items: center;
    gap: 30px;
}

.timer {
    font-weight: 600;
    font-size: 15px;
    color: #2563eb;
}

.logout {
    background: #2563eb;
    color: #fff;
    border: none;
    padding: 10px 22px;
    border-radius: 6px;
    cursor: pointer;
    font-size: 14px;
}

.main {
    padding: 20px;
}

.top-section {
    display: flex;
    gap: 20px;
}

.form-box {
    width: 40%;
    background: #ffffff;
    padding: 22px;
    border-radius: 12px;
    box-shadow: 0 15px 30px rgba(37,99,235,0.15);
}

.form-box h3 {
    margin-bottom: 18px;
    color: #1d4ed8;
}

.form-group {
    margin-bottom: 14px;
}

.form-group label {
    font-size: 13px;
    font-weight: 600;
    display: block;
    margin-bottom: 5px;
}

.form-group input {
    width: 100%;
    padding: 10px;
    border-radius: 6px;
    border: 1px solid #c7d2fe;
}

.image-box {
    width: 60%;
    background: #ffffff;
    border-radius: 12px;
    box-shadow: 0 15px 30px rgba(37,99,235,0.15);
    display: flex;
    align-items: center;
    justify-content: center;
    color: #94a3b8;
    font-size: 16px;
    min-height: 340px;
}

.table-box {
    margin-top: 25px;
    background: #ffffff;
    padding: 15px;
    border-radius: 12px;
    box-shadow: 0 15px 30px rgba(37,99,235,0.15);
}

table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background: #2563eb;
    color: white;
    padding: 10px;
    font-size: 14px;
}

td {
    border: 1px solid #e2e8f0;
    padding: 8px;
}

td input {
    width: 100%;
    padding: 7px;
    border-radius: 4px;
    border: 1px solid #c7d2fe;
}

.row-btn {
    background: #2563eb;
    color: white;
    border: none;
    padding: 6px 12px;
    margin: 2px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 12px;
}

.footer-actions {
    display: flex;
    justify-content: flex-end;
    gap: 15px;
    margin-top: 20px;
}

.action-btn {
    background: #2563eb;
    color: white;
    border: none;
    padding: 10px 24px;
    border-radius: 8px;
    font-size: 14px;
    cursor: pointer;
}
</style>
</head>

<body>

<div class="header">
    <div class="logo">
        <img src="<%= request.getContextPath() %>/images/dreams-soft-logo.jpeg" alt="Dreams Soft">
        <strong>Dreams Soft Solutions</strong>
    </div>

    <div class="header-right">
        <div class="timer">Time: 00:45:12</div>
        <button class="logout">Logout</button>
    </div>
</div>

<div class="main">

    <div class="top-section">

        <div class="form-box">
            <h3>Invoice Details</h3>

            <div class="form-group">
                <label>Vendor Name</label>
                <input type="text">
            </div>

            <div class="form-group">
                <label>Invoice Number</label>
                <input type="text">
            </div>

            <div class="form-group">
                <label>Invoice Issue Date</label>
                <input type="date">
            </div>

            <div class="form-group">
                <label>CGST Number</label>
                <input type="text">
            </div>

            <div class="form-group">
                <label>SGST Number</label>
                <input type="text">
            </div>

            <div class="form-group">
                <label>Total Price</label>
                <input type="text">
            </div>
        </div>

        <div class="image-box">
            Invoice Image will appear here
        </div>
    </div>

    <div class="table-box">
        <table>
            <tr>
                <th>Item No</th>
                <th>Item Name</th>
                <th>Price</th>
                <th>CGST</th>
                <th>SGST</th>
                <th>Total</th>
                <th>Action</th>
            </tr>

            <tr>
                <td><input></td>
                <td><input></td>
                <td><input></td>
                <td><input></td>
                <td><input></td>
                <td><input></td>
                <td>
                    <button class="row-btn">Add</button>
                    <button class="row-btn">Update</button>
                    <button class="row-btn">Delete</button>
                </td>
            </tr>
        </table>
    </div>

    <div class="footer-actions">
        <button class="action-btn">Skip</button>
        <button class="action-btn">Hold</button>
        <button class="action-btn">Update</button>
    </div>

</div>

</body>
</html>
