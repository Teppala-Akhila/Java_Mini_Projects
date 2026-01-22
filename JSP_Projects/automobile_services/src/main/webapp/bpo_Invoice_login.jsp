<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BPO Invoice Entry</title>

<style>
/* ===== YOUR EXISTING CSS (UNCHANGED) ===== */
* { box-sizing: border-box; font-family: "Segoe UI", Arial, sans-serif; }
body { margin: 0; background: linear-gradient(135deg, #e8f1ff, #f5f9ff); color: #1e293b; }

.header {
    height: 85px; background: #ffffff; display: flex;
    align-items: center; justify-content: space-between;
    padding: 0 30px; box-shadow: 0 2px 10px rgba(0,0,0,0.08);
}
.logo { display: flex; align-items: center; gap: 14px; }
.logo img { height: 65px; max-width: 200px; object-fit: contain; }
.logo strong { font-size: 20px; color: #1e40af; font-weight: 600; }
.header-right { display: flex; align-items: center; gap: 30px; }
.timer { font-weight: 600; font-size: 15px; color: #2563eb; }
.logout { background: #2563eb; color: #fff; border: none; padding: 10px 22px; border-radius: 6px; }

.main { padding: 20px; }
.top-section { display: flex; gap: 20px; }

.form-box {
    width: 25%; background: #ffffff; padding: 22px;
    border-radius: 12px; box-shadow: 0 15px 30px rgba(37,99,235,0.15);
}
.form-box h3 { margin-bottom: 18px; color: #1d4ed8; }
.form-group { margin-bottom: 14px; }
.form-group label { font-size: 13px; font-weight: 600; display: block; margin-bottom: 5px; }
.form-group input {
    width: 100%; padding: 10px; border-radius: 6px;
    border: 1px solid #c7d2fe;
}

.footer-actions { display: flex; gap: 12px; margin-top: 18px; }
.action-btn {
    background: #2563eb; color: white; border: none;
    padding: 8px 18px; border-radius: 8px; cursor: pointer;
}

.image-box {
    width: 75%; background: #ffffff; border-radius: 12px;
    box-shadow: 0 15px 30px rgba(37,99,235,0.15);
    position: relative; min-height: 340px;
    display: flex; align-items: center; justify-content: center;
}
.invoice-img { max-width: 100%; max-height: 100%; transition: transform 0.2s; }

.zoom-controls {
    position: absolute; bottom: 20px; left: 50%;
    transform: translateX(-50%); display: flex; gap: 50px;
}
.zoom-btn {
    width: 44px; height: 44px; border-radius: 50%;
    background: #2563eb; color: #fff; font-size: 24px;
    border: none; cursor: pointer;
}

.table-box {
    margin-top: 25px; background: #ffffff; padding: 15px;
    border-radius: 12px; box-shadow: 0 15px 30px rgba(37,99,235,0.15);
    overflow-x: auto;
}
table { width: 100%; border-collapse: collapse; min-width: 900px; }
th { background: #2563eb; color: white; padding: 10px; }
td { border: 1px solid #e2e8f0; padding: 8px; }
td input { width: 100%; padding: 7px; border-radius: 4px; border: 1px solid #c7d2fe; }
td:last-child { display: flex; gap: 6px; }

.row-btn {
    background: #2563eb; color: white; border: none;
    padding: 6px 10px; border-radius: 4px; cursor: pointer;
}

.checkbox-group {
    display: flex; align-items: center; gap: 10px;
}
.checkbox-group input { width: 18px; height: 18px; accent-color: #2563eb; }
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

<form method="post" action="InvoiceServlet">

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
            <input type="number" name="invoiceTotal">
        </div>

        <div class="form-group checkbox-group">
            <input type="checkbox" id="imageNotClear" name="imageNotClear">
            <label for="imageNotClear">Image is not clear</label>
        </div>

        <div class="footer-actions">
            <button class="action-btn" type="submit" name="actionStatus" value="SKIP">Skip</button>
            <button class="action-btn" type="submit" name="actionStatus" value="HOLD">Hold</button>
            <button class="action-btn" type="submit" name="actionStatus" value="SUBMIT"
        onclick="handleSubmit()">Submit</button>
            
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
            <th>Price</th>
            <th>CGST</th>
            <th>SGST</th>
            <th>Total</th>
            <th>Action</th>
        </tr>

        <tr>
            <td><input name="itemNo"></td>
            <td><input name="itemName"></td>
            <td><input name="price"></td>
            <td><input name="cgst"></td>
            <td><input name="sgst"></td>
            <td><input name="total"></td>
            <td>
                <button type="button" class="row-btn" onclick="addRow(this)">Add</button>
                <button type="button" class="row-btn" onclick="editRow(this)">Edit</button>
                <button type="button" class="row-btn" onclick="deleteRow(this)">Delete</button>
            </td>
        </tr>
    </table>
</div>

</form>
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
    const currentRow = button.closest("tr");
    const inputs = currentRow.querySelectorAll("input");

    for (let input of inputs) {
        if (!input.value.trim()) {
            alert("Please fill all fields before adding a new row.");
            return;
        }
    }

   
    inputs.forEach(input => input.disabled = true);

   
    button.disabled = true;

    
    const newRow = currentRow.cloneNode(true);

    
    newRow.querySelectorAll("input").forEach(input => {
        input.value = "";
        input.disabled = false;
    });

    
    newRow.querySelector(".row-btn").disabled = false;

    document.getElementById("invoiceTable").appendChild(newRow);
}


function editRow(btn) {
    const inputs = btn.closest("tr").querySelectorAll("input");
    inputs.forEach(i => i.disabled = !i.disabled);
}
function deleteRow(btn) {
    btn.closest("tr").remove();
}
</script>
<script>
function handleSubmit() {
    setTimeout(() => {
        document.querySelector("form").reset();
        loadNextImage();
    }, 500);
}

let imageIndex = 1;

function loadNextImage() {
    imageIndex++;
    document.getElementById("invoiceImage").src =
        "<%= request.getContextPath() %>/images/sample-invoice.png?img=" + imageIndex;
}
</script>


</body>
</html>