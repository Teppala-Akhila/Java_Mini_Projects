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

/* ===== HEADER ===== */
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
    height: 65px;
}

.logo strong {
    font-size: 20px;
    color: #1e40af;
}

.header-right {
    display: flex;
    align-items: center;
    gap: 25px;
}

.timer {
    font-weight: 600;
    color: #2563eb;
}

.logout {
    background: #2563eb;
    color: #fff;
    border: none;
    padding: 10px 22px;
    border-radius: 6px;
    cursor: pointer;
}

/* ===== MAIN ===== */
.main {
    padding: 20px;
}

.top-section {
    display: flex;
    gap: 20px;
}

/* ===== FORM BOX ===== */
.form-box {
    width: 25%;
    background: #ffffff;
    padding: 22px;
    border-radius: 12px;
    box-shadow: 0 15px 30px rgba(37,99,235,0.15);
}

.form-box h3 {
    color: #1d4ed8;
    margin-bottom: 18px;
}

.form-group {
    margin-bottom: 14px;
}

.form-group label {
    font-size: 13px;
    font-weight: 600;
    margin-bottom: 5px;
    display: block;
}

.form-group input {
    width: 100%;
    padding: 10px;
    border-radius: 6px;
    border: 1px solid #c7d2fe;
}

.checkbox-group {
    display: flex;
    align-items: center;
    gap: 10px;
}

.checkbox-group input {
    width: 18px;
    height: 18px;
    accent-color: #2563eb;
}

.footer-actions {
    display: flex;
    gap: 10px;
    margin-top: 18px;
}

.action-btn {
    flex: 1;
    background: #2563eb;
    color: white;
    border: none;
    padding: 10px;
    border-radius: 8px;
    cursor: pointer;
}

/* ===== IMAGE BOX ===== */
.image-box {
    width: 75%;
    background: #ffffff;
    border-radius: 12px;
    box-shadow: 0 15px 30px rgba(37,99,235,0.15);
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    min-height: 340px;
}

.invoice-img {
    max-width: 100%;
    max-height: 100%;
    transition: transform 0.2s;
}

.zoom-controls {
    position: absolute;
    bottom: 20px;
    display: flex;
    gap: 20px;
}

.zoom-btn {
    width: 44px;
    height: 44px;
    border-radius: 50%;
    background: #2563eb;
    color: #fff;
    font-size: 24px;
    border: none;
    cursor: pointer;
}

/* ===== TABLE ===== */
.table-box {
    margin-top: 25px;
    background: #ffffff;
    padding: 15px;
    border-radius: 12px;
    box-shadow: 0 15px 30px rgba(37,99,235,0.15);
    overflow-x: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
    min-width: 1100px;
}

th {
    background: #2563eb;
    color: white;
    padding: 12px;
    text-align: center;
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

/* 🔒 Frozen input look */
td input:disabled {
    background-color: #e5e7eb;
    color: #475569;
    font-weight: 600;
    cursor: not-allowed;
}

.action-cell {
    display: flex;
    gap: 6px;
    justify-content: center;
}

.row-btn {
    background: #2563eb;
    color: white;
    border: none;
    padding: 6px 10px;
    border-radius: 4px;
    cursor: pointer;
}
</style>
</head>

<body>

<div class="header">
    <div class="logo">
        <img src="<%= request.getContextPath() %>/images/dreams-soft-logo.jpeg">
        <strong>Dreams Soft Solutions</strong>
    </div>
    <div class="header-right">
        <div class="timer">Time: 00:45:12</div>
        <button class="logout">Logout</button>
    </div>
</div>

<div class="main">
<form method="post" action="InvoiceServlet" id="invoiceForm">

<div class="top-section">

<div class="form-box">
    <h3>Verify Invoice Details</h3>

    <div class="form-group">
        <label>Vendor Name</label>
        <input type="text" name="vendorName">
    </div>

    <div class="form-group">
        <label>Invoice Number</label>
        <input type="text" name="invoiceNumber">
    </div>

    <div class="form-group">
        <label>Invoice Issue Date</label>
        <input type="text" name="invoiceDate">
    </div>

    <div class="form-group">
        <label>P.O.#</label>
        <input type="text" name="poNumber">
    </div>

    <div class="form-group">
        <label>Invoice Total</label>
        <input type="text" name="invoiceTotal">
    </div>

    <div class="checkbox-group">
        <input type="checkbox" name="imageNotClear">
        <label>Image is not clear</label>
    </div>

    <div class="footer-actions">
        <button class="action-btn" type="submit" name="actionStatus" value="SKIP">Skip</button>
        <button class="action-btn" type="submit" name="actionStatus" value="HOLD">Hold</button>
        <button class="action-btn" type="submit" name="actionStatus" value="SUBMIT">Submit</button>
    </div>
</div>

<div class="image-box">
    <img id="invoiceImage"
         src="<%= request.getContextPath() %>/images/sample-invoice.png"
         class="invoice-img">
    <div class="zoom-controls">
        <button type="button" class="zoom-btn" onclick="zoomIn()">+</button>
        <button type="button" class="zoom-btn" onclick="zoomOut()">&#8722;</button>
    </div>
</div>

</div>

<div class="table-box">
<table id="invoiceTable">
<tr>
    <th>Item No</th>
    <th>Item Name</th>
    <th>Quantity</th>
    <th>Price</th>
    <th>CGST</th>
    <th>SGST</th>
    <th>Total</th>
    <th>Action</th>
</tr>

<tr>
    <td><input name="itemNo"></td>
    <td><input name="itemName"></td>
    <td><input name="quantity"></td>
    <td><input name="price" oninput="calculateRowTotal(this)"></td>
	<td><input name="cgst" oninput="calculateRowTotal(this)"></td>
	<td><input name="sgst" oninput="calculateRowTotal(this)"></td>
	<td><input name="total" readonly></td>
    
    <td class="action-cell">
        <button type="button" class="row-btn" onclick="addRow(this)">Add</button>
        <button type="button" class="row-btn" onclick="editRow(this)">Edit</button>
        <button type="button" class="row-btn" onclick="deleteRow(this)">Delete</button>
    </td>
</tr>
<tr id="subtotalRow">
    <td colspan="6" style="text-align:right; font-weight:600;">Sub Total</td>
    <td>
        <input type="text" id="subTotal" readonly
               style="font-weight:700; background:#e5e7eb;">
    </td>
    <td></td>
</tr>

</table>
</div>

</form>
</div>

<script>
let zoomLevel = 1;

function zoomIn() {
    zoomLevel += 0.1;
    invoiceImage.style.transform = `scale(${zoomLevel})`;
}

function zoomOut() {
    if (zoomLevel > 0.6) {
        zoomLevel -= 0.1;
        invoiceImage.style.transform = `scale(${zoomLevel})`;
    }
}

function addRow(btn) {
    const row = btn.closest("tr");
    const inputs = row.querySelectorAll("input");

    // Validation
    for (let i of inputs) {
        if (!i.value.trim()) {
            alert("Fill all fields before adding.");
            return;
        }
        i.disabled = true;
    }

    btn.disabled = true;

    // Clone row
    const newRow = row.cloneNode(true);
    newRow.querySelectorAll("input").forEach(i => {
        i.value = "";
        i.disabled = false;
    });

    newRow.querySelectorAll(".row-btn")[0].disabled = false;

    const table = document.getElementById("invoiceTable");
    const subtotalRow = document.getElementById("subtotalRow");

    // Remove subtotal row
    subtotalRow.remove();

    // Add new row
    table.appendChild(newRow);

    // Re-add subtotal row at the end
    table.appendChild(subtotalRow);

    calculateSubTotal();
}

function editRow(btn) {
    const row = btn.closest("tr");
    const inputs = row.querySelectorAll("input");

    if (btn.innerText === "Edit") {
        inputs.forEach(i => i.disabled = false);
        btn.innerText = "Save";
        btn.style.background = "#16a34a";
    } else {
        inputs.forEach(i => i.disabled = true);
        btn.innerText = "Edit";
        btn.style.background = "#2563eb";
    }
}

function deleteRow(btn) {
    btn.closest("tr").remove();
}

document.getElementById("invoiceForm").addEventListener("submit", function () {
    const disabledInputs = this.querySelectorAll("input:disabled");
    disabledInputs.forEach(input => input.disabled = false);
});

function calculateRowTotal(element) {
    const row = element.closest("tr");

    const price = parseFloat(row.querySelector("input[name='price']")?.value) || 0;
    const cgst  = parseFloat(row.querySelector("input[name='cgst']")?.value) || 0;
    const sgst  = parseFloat(row.querySelector("input[name='sgst']")?.value) || 0;

    const total = price + cgst + sgst;

    const totalField = row.querySelector("input[name='total']");
    if (totalField) {
        totalField.value = total.toFixed(2);
    }
}

function calculateRowTotal(element) {
    const row = element.closest("tr");

    const price = parseFloat(row.querySelector("input[name='price']")?.value) || 0;
    const cgst  = parseFloat(row.querySelector("input[name='cgst']")?.value) || 0;
    const sgst  = parseFloat(row.querySelector("input[name='sgst']")?.value) || 0;

    const total = price + cgst + sgst;

    const totalField = row.querySelector("input[name='total']");
    if (totalField) {
        totalField.value = total.toFixed(2);
    }

    calculateSubTotal(); 
}

function calculateSubTotal() {
    let subTotal = 0;

    document.querySelectorAll("input[name='total']").forEach(input => {
        const value = parseFloat(input.value);
        if (!isNaN(value)) {
            subTotal += value;
        }
    });

    document.getElementById("subTotal").value = subTotal.toFixed(2);
}
</script>

</body>
</html>
