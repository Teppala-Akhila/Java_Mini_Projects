<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QC Invoice Entry</title>

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

.main {
    padding: 20px;
}

.top-section {
    display: flex;
    gap: 20px;
}

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

.image-box {
    width: 75%;
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
    justify-content: flex-start;  /* move buttons to left */
    gap: 15px;
    margin-top: 20px;
    padding-left: 20px;           /* slight left shift */
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
            <h3>Invoice Details</h3>

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
            Invoice Image will appear here
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
function addRow(button) {
    const row = button.closest("tr");
    const table = document.getElementById("invoiceTable");
    const inputs = row.querySelectorAll("input");

    for (let input of inputs) {
        if (input.value.trim() === "") {
            alert("Please fill all fields before adding next row");
            return;
        }
    }

    inputs.forEach(input => input.disabled = true);

    const newRow = row.cloneNode(true);
    const newInputs = newRow.querySelectorAll("input");

    newInputs.forEach(input => {
        input.value = "";
        input.disabled = false;
    });

    newRow.querySelector("button:nth-child(3)").innerText = "Edit";
    table.appendChild(newRow);
    newInputs[0].focus();
}

function editRow(button) {
    const row = button.closest("tr");
    const inputs = row.querySelectorAll("input");

    if (button.innerText === "Edit") {
        inputs.forEach(input => input.disabled = false);
        button.innerText = "Save";
    } else {
        for (let input of inputs) {
            if (input.value.trim() === "") {
                alert("Fields cannot be empty");
                return;
            }
        }
        inputs.forEach(input => input.disabled = true);
        button.innerText = "Edit";
    }
}

function deleteRow(button) {
    button.closest("tr").remove();
}
</script>

</body>
</html>
