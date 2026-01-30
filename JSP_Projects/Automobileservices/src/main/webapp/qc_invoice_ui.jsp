<%@ page import="com.model.InvoiceImageModel"%>
<%@ page import="com.model.InvoiceDetailsModel"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QC Invoice Entry</title>

<style>
/* ===== YOUR ORIGINAL CSS (UNCHANGED) ===== */
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
	background: #fff;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 30px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
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
	font-weight: 600;
}

.logout {
	background: #2563eb;
	color: #fff;
	border: none;
	padding: 10px 22px;
	border-radius: 6px;
	cursor: pointer;
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
	background: #fff;
	padding: 22px;
	border-radius: 12px;
	box-shadow: 0 15px 30px rgba(37, 99, 235, 0.15);
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
	color: #fff;
	border: none;
	padding: 10px;
	border-radius: 8px;
	cursor: pointer;
	flex: 1;
}

.image-box {
	width: 75%;
	background: #fff;
	border-radius: 12px;
	box-shadow: 0 15px 30px rgba(37, 99, 235, 0.15);
	position: relative;
	min-height: 340px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.invoice-img {
	max-width: 100%;
	max-height: 100%;
	transition: transform 0.2s;
}

.zoom-controls {
	position: absolute;
	bottom: 20px;
	left: 50%;
	transform: translateX(-50%);
	display: flex;
	gap: 40px;
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

.table-box {
	margin-top: 25px;
	background: #fff;
	padding: 15px;
	border-radius: 12px;
	box-shadow: 0 15px 30px rgba(37, 99, 235, 0.15);
	overflow-x: auto;
}

table {
	width: 100%;
	border-collapse: collapse;
	min-width: 900px;
}

th {
	background: #2563eb;
	color: white;
	padding: 10px;
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
	padding: 6px 10px;
	border-radius: 4px;
	cursor: pointer;
	font-size: 12px;
}

input:disabled {
	background: #e5e7eb;
	font-weight: 600;
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

/* ===== SKIP MODAL (UNCHANGED) ===== */
.skip-overlay {
	display: none;
	position: fixed;
	inset: 0;
	background: rgba(15, 23, 42, 0.55);
	z-index: 9999;
	align-items: center;
	justify-content: center;
}

.skip-card {
	width: 380px;
	background: #fff;
	border-radius: 14px;
}

.skip-header {
	background: #2563eb;
	color: #fff;
	padding: 14px 18px;
	display: flex;
	justify-content: space-between;
}

.skip-body {
	padding: 20px;
}

.skip-footer {
	padding: 16px;
	display: flex;
	gap: 12px;
}

input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

.header-right {
	display: flex;
	align-items: center;
	gap: 30px;
}

input[type=number] {
	-moz-appearance: textfield;
}
</style>
</head>

<body>

	<%
	Boolean noQcData = (Boolean) request.getAttribute("noQcData");

	if (Boolean.TRUE.equals(noQcData)) {
	%>
	<h2 style="text-align: center; margin-top: 40px;">No invoice
		available for QC</h2>
	<%
	return;
	}

	InvoiceImageModel img = (InvoiceImageModel) request.getAttribute("image");
	InvoiceDetailsModel inv = (InvoiceDetailsModel) request.getAttribute("invoice");
	%>

	<%
	String[] itemNo = inv.getItemNo().split(",");
	String[] itemName = inv.getItemName().split(",");
	String[] qty = inv.getQuantity().split(",");
	String[] price = inv.getPrice().split(",");
	String[] cgst = inv.getCgst().split(",");
	String[] sgst = inv.getSgst().split(",");
	String[] total = inv.getItemTotal().split(",");
	%>

	<div class="header">
		<div class="logo">
			<img src="<%=request.getContextPath()%>/images/dss logo.jpeg">
			<strong>Dreams Soft Solutions</strong>
		</div>
		<div class="header-right">
			<div class="timer" id="timer">Time: --</div>
			<div class="user-info">
				Welcome, <strong><%=session.getAttribute("username")%></strong>
			</div>
			<a href="logout"><button class="logout">Logout</button></a>
		</div>
		<a href="logout"><button class="logout" type="button">Logout</button></a>
	</div>

	<div class="main">

		<div class="top-section">

			<div class="form-box">
				<h3>QC Invoice Details</h3>


				<div class="form-group">
					<label>Vendor Name</label><input class="freeze-field">
				</div>
				<div class="form-group">
					<label>Invoice Number</label><input class="freeze-field">
				</div>
				<div class="form-group">
					<label>Invoice Issue Date</label><input class="freeze-field">
				</div>
				<div class="form-group">
					<label>P.O.#</label><input class="freeze-field">
				</div>
				<div class="form-group">
					<label>Invoice Total(&#8377;)</label><input class="freeze-field">
				</div>
				<div class="checkbox-group">
					<input type="checkbox" id="imgNotClearChk"
						onclick="toggleSkipBtn()"> Image is not clear <label
						style="font-size: 14px;"> </label>
					<div id="checkboxError"
						style="color: #dc2626; font-size: 13px; margin-top: 6px; display: none;">
						Please select "Image is not clear" before skipping.</div>

				</div>
				<div class="footer-actions">
					<button class="action-btn" type="button" onclick="edit(this)">Save</button>
					<button class="action-btn" type="button" id="skipBtn" disabled
						onclick="openSkipModal()">Skip</button>
					<form method="post"
						action="<%=request.getContextPath()%>/QCServlet" style="flex: 1;">

						<input type="hidden" name="imageId"
							value="<%=img.getImageId()%>"> <input type="hidden"
							name="action" value="submit">

						<button class="action-btn" type="submit">Submit</button>


						<div id="skipModal" class="skip-overlay">

							<div class="skip-card">

								<div class="skip-header">
									<h3>Skip Authentication</h3>
									<span class="skip-close" onclick="closeSkipModal()">&times;</span>
								</div>

								<div class="skip-body">
									<div class="form-group">
										<label>Username</label> <input type="text" id="skipUsername"
											placeholder="Enter username">
									</div>

									<div class="form-group">
										<label>Password</label> <input type="password"
											id="skipPassword" placeholder="Enter password">
									</div>

									<div id="skipError" class="skip-error">Invalid username
										or password</div>
								</div>

								<div class="skip-footer">
									<button class="btn-confirm" type="button"
										onclick="validateSkip()">Confirm</button>
									<button class="btn-cancel" type="button"
										onclick="closeSkipModal()">Cancel</button>
								</div>

							</div>
						</div>
					</form>
				</div>

			</div>

			<div class="image-box">
				<div
					style="position: absolute; top: 16px; left: 20px; background: #2563eb; color: white; padding: 6px 14px; border-radius: 999px; font-size: 14px; font-weight: 600; z-index: 20; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);">
					Invoice ID :
					<%=img.getImageId()%>
				</div>
				<img id="invoiceImage"
					src="<%=request.getContextPath()%>/invoice_images/<%=img.getImagePath()%>"
					class="invoice-img">
				<div class="zoom-controls">
					<button class="zoom-btn" onclick="zoomIn()">+</button>
					<button class="zoom-btn" onclick="zoomOut()">−</button>
				</div>
			</div>

		</div>

		<div class="table-box">
			<table id="invoiceTable">
				<tr>
					<th>Item No</th>
					<th>Name</th>
					<th>Qty</th>
					<th>Price(&#8377;)</th>
					<th>CGST(%)</th>
					<th>SGST(%)</th>
					<th>Total(&#8377;)</th>
					<th>Action</th>
				</tr>

				<%
				for (int i = 0; i < itemNo.length; i++) {
				%>
				<tr class="item-row">
					<td><input value="<%=itemNo[i]%>" disabled></td>
					<td><input value="<%=itemName[i]%>" disabled></td>
					<td><input class="quantity" value="<%=qty[i]%>" disabled></td>
					<td><input class="price" value="<%=price[i]%>" disabled></td>
					<td><input class="itemCGST" value="<%=cgst[i]%>" disabled></td>
					<td><input class="itemSGST" value="<%=sgst[i]%>" disabled></td>
					<td><input value="<%=total[i]%>" disabled></td>
					<td>
						<button type="button" class="row-btn" onclick="addRow(this)">Add</button>
						<button type="button" class="row-btn" onclick="editRow(this)">Edit</button>
						<button type="button" class="row-btn" onclick="deleteRow(this)">Delete</button>
					</td>
				</tr>
				<%
				}
				%>
				<tr id="subTotalRow">
					<td colspan="6" style="text-align: right; font-weight: 600;">Sub
						Total</td>
					<td><input id="subTotal" readonly></td>
					<td></td>
				</tr>
			</table>
		</div>

	</div>

	<script>
let zoomLevel = 1;

function zoomIn(){ zoomLevel+=0.1; invoiceImage.style.transform=`scale(${zoomLevel})`; }
function zoomOut(){ if(zoomLevel>0.5){ zoomLevel-=0.1; invoiceImage.style.transform=`scale(${zoomLevel})`; }}

function editRow(btn) {
    const row = btn.closest(".item-row");
    const inputs = row.querySelectorAll("input");

    if (btn.innerText === "Edit") {
        inputs.forEach(i => {
            if (!i.classList.contains("itemTotal")) {
                i.disabled = false;
            }
        });
        btn.innerText = "Save";
        btn.style.background = "#16a34a";
    } else {
        inputs.forEach(i => i.disabled = true);
        btn.innerText = "Edit";
        btn.style.background = "#2563eb";
        calculateSubTotal();
    }
}

function deleteRow(button) {
    const row = button.closest("tr");

    const totalItemRows =
        document.querySelectorAll(".row-btn[onclick^='deleteRow']").length;

    if (totalItemRows <= 1) {
        alert("At least one item row is required.");
        return;
    }

    row.remove();
    calculateSubTotal();

    const rows = document.querySelectorAll("tr.item-row");
    rows.forEach(r => {
        const addBtn = r.querySelector("button[onclick^='addRow']");
        if (addBtn) addBtn.disabled = false;
    });
}

function addRow(btn) {
    const row = btn.closest("tr");
    const inputs = row.querySelectorAll("input");

    for (let i of inputs) {
        if (!i.value.trim()) {
            alert("Fill all fields before adding");
            return;
        }
    }

    inputs.forEach(i => i.disabled = true);

    const newRow = row.cloneNode(true);
    newRow.classList.add("item-row");

    newRow.querySelectorAll("input").forEach(i => {
        i.value = "";
        i.disabled = false;
    });

    const table = document.getElementById("invoiceTable");
    const subtotalRow = document.getElementById("subTotalRow");

    subtotalRow.remove();
    table.appendChild(newRow);
    table.appendChild(subtotalRow);
}


function calculateRowTotal(el) {
    const row = el.closest("tr");

    const qty   = parseFloat(row.querySelector(".quantity").value) || 0;
    const price = parseFloat(row.querySelector(".price").value) || 0;
    const cgst  = parseFloat(row.querySelector(".itemCGST").value) || 0;
    const sgst  = parseFloat(row.querySelector(".itemSGST").value) || 0;

    const baseAmount = qty * price;
    const gstAmount = baseAmount * (cgst + sgst) / 100;
    const total = baseAmount + gstAmount;

    row.querySelector(".itemTotal").value = total.toFixed(2);
    calculateSubTotal();
}

function calculateSubTotal() {
    let sum = 0;
    document.querySelectorAll("#invoiceTable .item-row").forEach(row => {
        const val = parseFloat(row.cells[6].children[0].value) || 0;
        sum += val;
    });
    document.getElementById("subTotal").value = sum.toFixed(2);
}

function clearCheckboxError(){ document.getElementById("checkboxError").style.display="none"; }


function edit(btn) {
    const freezeInputs = document.querySelectorAll(".freeze-field");

    if (btn.innerText === "Save") {
        freezeInputs.forEach(i => i.disabled = true);
        btn.innerText = "Edit";
        btn.style.background = "#16a34a";
    } else {
        freezeInputs.forEach(i => i.disabled = false);
        btn.innerText = "Save";
        btn.style.background = "#2563eb";
    }
}

window.onload = function() {
    document.querySelectorAll(".item-row").forEach(row => {
        calculateRowTotal(row.cells[2].children[0]);
    });
};


function toggleSkipBtn() {
    var chk = document.getElementById("imgNotClearChk");
    var skipBtn = document.getElementById("skipBtn");
    skipBtn.disabled = !chk.checked;
}
function openSkipModal() {
    document.getElementById("skipModal").style.display = "flex";
}

function closeSkipModal() {
    document.getElementById("skipModal").style.display = "none";
    document.getElementById("skipUsername").value = "";
    document.getElementById("skipPassword").value = "";
    document.getElementById("skipError").style.display = "none";
}

function validateSkip() {
    const user = document.getElementById("skipUsername").value.trim();
    const pass = document.getElementById("skipPassword").value.trim();

    if (user === "dreams" && pass === "dreams") {
        closeSkipModal();
        alert("Skip authorized successfully");
    } else {
        document.getElementById("skipError").style.display = "block";
    }
}

/* =====================================================
SUBMIT VALIDATION (DATE + TOTAL CHECK)
===================================================== */
document.getElementById("invoiceForm").addEventListener("submit", function (e) {

 // enable disabled inputs before submit
 this.querySelectorAll("input:disabled").forEach(i => i.disabled = false);

 /* ===== DATE VALIDATION (FROM VERIFY JSP – UNCHANGED) ===== */
 const dateInput =
     document.querySelectorAll(".form-box .freeze-field")[2].value.trim();

 if (!dateInput) {
     alert("Please enter Invoice Issue Date.");
     e.preventDefault();
     return;
 }

 const datePattern = /^(\d{2})-(\d{2})-(\d{4})$/;
 if (!datePattern.test(dateInput)) {
     alert("Invoice Date must be in DD-MM-YYYY format.");
     e.preventDefault();
     return;
 }

 const parts = dateInput.split("-");
 const enteredDate = new Date(parts[2], parts[1] - 1, parts[0]);

 if (
     enteredDate.getDate() != parts[0] ||
     enteredDate.getMonth() != parts[1] - 1 ||
     enteredDate.getFullYear() != parts[2]
 ) {
     alert("Invalid Invoice Date.");
     e.preventDefault();
     return;
 }

 const today = new Date();
 today.setHours(0, 0, 0, 0);

 if (enteredDate > today) {
     alert("Invoice Date cannot be a future date.");
     e.preventDefault();
     return;
 }


/* ===== TOTAL VALIDATION (ALREADY WORKING) ===== */
const invoiceTotal =
    parseFloat(document.querySelectorAll(".form-box .freeze-field")[4].value);
const subTotal =
    parseFloat(document.getElementById("subTotal").value);

if (isNaN(invoiceTotal) || isNaN(subTotal)) {
    alert("Invoice Total and Item totals are required.");
    e.preventDefault();
    return;
}

if (invoiceTotal.toFixed(2) !== subTotal.toFixed(2)) {
    alert(
        "Invoice Total and Item Sub Total must match.\n\n" +
        "Invoice Total: " + invoiceTotal.toFixed(2) + "\n" +
        "Sub Total: " + subTotal.toFixed(2)
    );
    e.preventDefault();
    return;
}

// ✅ All validations passed → submit allowed
});

</script>

</body>
</html>
