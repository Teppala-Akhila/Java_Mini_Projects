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

/* HEADER */
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
    max-width: 200px;
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

/* MAIN */
.main {
    padding: 20px;
}

.top-section {
    display: flex;
    gap: 20px;
}

/* FORM */
.form-box {
    width: 25%;
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

.footer-actions {
    display: flex;
    gap: 12px;
    margin-top: 18px;
}

.action-btn {
    background: #2563eb;
    color: white;
    border: none;
    padding: 8px 18px;
    border-radius: 8px;
    font-size: 13px;
    cursor: pointer;
}

/* IMAGE */
.image-box {
    width: 75%;
    background: #ffffff;
    border-radius: 12px;
    box-shadow: 0 15px 30px rgba(37,99,235,0.15);
    position: relative;
    overflow: hidden;
    min-height: 340px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.invoice-img {
    max-width: 100%;
    max-height: 100%;
    transition: transform 0.2s ease-in-out;
}

.zoom-controls {
    position: absolute;
    bottom: 20px;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    gap: 50px;
}

.zoom-btn {
    width: 44px;
    height: 44px;
    border-radius: 50%;
    background: #2563eb;
    color: #ffffff;
    font-size: 24px;
    font-weight: bold;
    border: none;
    cursor: pointer;
}

/* TABLE */
.table-box {
    margin-top: 25px;
    background: #ffffff;
    padding: 15px;
    border-radius: 12px;
    box-shadow: 0 15px 30px rgba(37,99,235,0.15);
    overflow-x: auto; /* RESPONSIVE FIX */
}

table {
    width: 100%;
    border-collapse: collapse;
    min-width: 900px; /* prevents column squeezing */
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

/* ACTION COLUMN FIX */
td:last-child {
    display: flex;
    gap: 6px;
    white-space: nowrap;
}

.row-btn {
    background: #2563eb;
    color: white;
    border: none;
    padding: 6px 10px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 12px;
}

/* RESPONSIVE BREAKPOINTS */
@media (max-width: 1200px) {
    .top-section {
        flex-direction: column;
    }

    .form-box,
    .image-box {
        width: 100%;
    }
}

@media (max-width: 768px) {
    .row-btn {
        padding: 5px 8px;
        font-size: 11px;
    }

    th, td {
        font-size: 12px;
    }
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

    <div class="top-section">
        <div class="form-box">
            <h3>BPO Invoice Details</h3>
            <div class="form-group"><label>Vendor Name</label><input></div>
            <div class="form-group"><label>Invoice Number</label><input></div>
            <div class="form-group"><label>Invoice Issue Date</label><input></div>
            <div class="form-group"><label>P.O.#</label><input></div>
            <div class="form-group"><label>Invoice Total</label><input></div>

            <div class="footer-actions">
                <button class="action-btn">Skip</button>
                <button class="action-btn">Hold</button>
                <button class="action-btn">Submit</button>
            </div>
        </div>

        <div class="image-box">
            <img id="invoiceImage"
                 src="<%= request.getContextPath() %>/images/sample-invoice.png"
                 class="invoice-img">
            <div class="zoom-controls">
                <button class="zoom-btn" onclick="zoomIn()">+</button>
                <button class="zoom-btn" onclick="zoomOut()">&#8722;</button>
            </div>
        </div>
    </div>

    <div class="table-box">
        <table id="invoiceTable">
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
                    <button class="row-btn" onclick="addRow(this)">Add</button>
                    <button class="row-btn" onclick="editRow(this)">Edit</button>
                    <button class="row-btn" onclick="deleteRow(this)">Delete</button>
                </td>
            </tr>
        </table>
    </div>

</div>

<script>
let zoomLevel = 1;

function zoomIn() {
    zoomLevel += 0.1;
    document.getElementById("invoiceImage").style.transform = `scale(${zoomLevel})`;
}

function zoomOut() {
    if (zoomLevel > 0.5) {
        zoomLevel -= 0.1;
        document.getElementById("invoiceImage").style.transform = `scale(${zoomLevel})`;
    }
}

function addRow(button) {
    const row = button.closest("tr");
    const inputs = row.querySelectorAll("input");

    for (let input of inputs) {
        if (!input.value.trim()) {
            alert("Fill all fields");
            return;
        }
    }

    inputs.forEach(i => i.disabled = true);

    const newRow = row.cloneNode(true);
    newRow.querySelectorAll("input").forEach(i => {
        i.value = "";
        i.disabled = false;
    });

    row.closest("table").appendChild(newRow);
}

function editRow(btn) {
    const row = btn.closest("tr");
    const inputs = row.querySelectorAll("input");

    if (btn.innerText === "Edit") {
        inputs.forEach(i => i.disabled = false);
        btn.innerText = "Save";
    } else {
        inputs.forEach(i => i.disabled = true);
        btn.innerText = "Edit";
    }
}

function deleteRow(btn) {
    btn.closest("tr").remove();
}
</script>

</body>
</html>
