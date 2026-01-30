<%@ page import="com.model.InvoiceImageModel" %>
<%@ page import="com.model.InvoiceDetailsModel" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QC Invoice Entry</title>

<style>
/* ===== YOUR ORIGINAL CSS (UNCHANGED) ===== */
* { box-sizing: border-box; font-family: "Segoe UI", Arial, sans-serif; }
body { margin: 0; background: linear-gradient(135deg, #e8f1ff, #f5f9ff); color: #1e293b; }
.header { height: 85px; background: #fff; display: flex; align-items: center; justify-content: space-between; padding: 0 30px; box-shadow: 0 2px 10px rgba(0,0,0,0.08); }
.logo { display: flex; align-items: center; gap: 14px; }
.logo img { height: 65px; }
.logo strong { font-size: 20px; color: #1e40af; font-weight: 600; }
.logout { background: #2563eb; color: #fff; border: none; padding: 10px 22px; border-radius: 6px; cursor: pointer; }
.main { padding: 20px; }
.top-section { display: flex; gap: 20px; }
.form-box { width: 25%; background: #fff; padding: 22px; border-radius: 12px; box-shadow: 0 15px 30px rgba(37,99,235,0.15); }
.form-group { margin-bottom: 14px; }
.form-group label { font-size: 13px; font-weight: 600; display: block; margin-bottom: 5px; }
.form-group input { width: 100%; padding: 10px; border-radius: 6px; border: 1px solid #c7d2fe; }
.footer-actions { display: flex; gap: 12px; margin-top: 18px; }
.action-btn { background: #2563eb; color: #fff; border: none; padding: 10px; border-radius: 8px; cursor: pointer; flex: 1; }
.image-box { width: 75%; background: #fff; border-radius: 12px; box-shadow: 0 15px 30px rgba(37,99,235,0.15); position: relative; min-height: 340px; display: flex; align-items: center; justify-content: center; }
.invoice-img { max-width: 100%; max-height: 100%; transition: transform 0.2s; }
.zoom-controls { position: absolute; bottom: 20px; left: 50%; transform: translateX(-50%); display: flex; gap: 40px; }
.zoom-btn { width: 44px; height: 44px; border-radius: 50%; background: #2563eb; color: #fff; font-size: 24px; border: none; cursor: pointer; }
.table-box { margin-top: 25px; background: #fff; padding: 15px; border-radius: 12px; box-shadow: 0 15px 30px rgba(37,99,235,0.15); overflow-x: auto; }
table { width: 100%; border-collapse: collapse; min-width: 900px; }
th { background: #2563eb; color: white; padding: 10px; }
td { border: 1px solid #e2e8f0; padding: 8px; }
td input { width: 100%; padding: 7px; border-radius: 4px; border: 1px solid #c7d2fe; }
.row-btn { background: #2563eb; color: white; border: none; padding: 6px 10px; border-radius: 4px; cursor: pointer; font-size: 12px; }
input:disabled { background: #e5e7eb; font-weight: 600; }
.checkbox-group { display: flex; align-items: center; gap: 10px; }
.checkbox-group input { width: 18px; height: 18px; accent-color: #2563eb; }

/* ===== SKIP MODAL (UNCHANGED) ===== */
.skip-overlay { display:none; position:fixed; inset:0; background:rgba(15,23,42,0.55); z-index:9999; align-items:center; justify-content:center; }
.skip-card { width:380px; background:#fff; border-radius:14px; }
.skip-header { background:#2563eb; color:#fff; padding:14px 18px; display:flex; justify-content:space-between; }
.skip-body { padding:20px; }
.skip-footer { padding:16px; display:flex; gap:12px; }
</style>
</head>

<body>

<%
Boolean noQcData = (Boolean) request.getAttribute("noQcData");

if (Boolean.TRUE.equals(noQcData)) {
%>
    <h2 style="text-align:center;margin-top:40px;">
        No invoice available for QC
    </h2>
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
    <a href="logout"><button class="logout" type="button">Logout</button></a>
</div>

<div class="main">

<div class="top-section">

<div class="form-box">
<h3>QC Invoice Details</h3>

<div class="form-group"><label>Vendor Name</label><input class="freeze-field"></div>
<div class="form-group"><label>Invoice Number</label><input class="freeze-field"></div>
<div class="form-group"><label>Invoice Issue Date</label><input class="freeze-field"></div>
<div class="form-group"><label>P.O.#</label><input class="freeze-field"></div>
<div class="form-group"><label>Invoice Total</label><input class="freeze-field"></div>

<div class="checkbox-group">
<input type="checkbox" id="imgNotClearChk" onclick="clearCheckboxError()"> 
<label>Image is not clear</label>
</div>

<div id="checkboxError" style="color:red;display:none;">
Please select "Image is not clear" before skipping.
</div>

<div class="footer-actions">
<button class="action-btn" type="button" onclick="edit(this)">Edit</button>
<button class="action-btn" type="button">Next</button>
<button class="action-btn" type="button" onclick="handleSkipClick()">Skip</button>
<button class="action-btn" type="button">Submit</button>
</div>

</div>

<div class="image-box">
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
<th>Item No</th><th>Name</th><th>Qty</th><th>Price</th>
<th>CGST</th><th>SGST</th><th>Total</th><th>Action</th>
</tr>

<% for(int i=0;i<itemNo.length;i++){ %>
<tr class="item-row">
<td><input value="<%=itemNo[i]%>" disabled></td>
<td><input value="<%=itemName[i]%>" disabled></td>
<td><input class="quantity" value="<%=qty[i]%>" disabled></td>
<td><input class="price" value="<%=price[i]%>" disabled></td>
<td><input class="itemCGST" value="<%=cgst[i]%>" disabled></td>
<td><input class="itemSGST" value="<%=sgst[i]%>" disabled></td>
<td><input value="<%=total[i]%>" disabled></td>
<td><button class="row-btn" onclick="editRow(this)">Edit</button></td>
</tr>
<% } %>

</table>
</div>

</div>

<script>
let zoomLevel = 1;

function zoomIn(){ zoomLevel+=0.1; invoiceImage.style.transform=`scale(${zoomLevel})`; }
function zoomOut(){ if(zoomLevel>0.5){ zoomLevel-=0.1; invoiceImage.style.transform=`scale(${zoomLevel})`; }}

function editRow(btn){
const row=btn.closest("tr");
row.querySelectorAll("input").forEach(i=>i.disabled=!i.disabled);
btn.innerText = btn.innerText==="Edit"?"Save":"Edit";
}

function handleSkipClick(){
const chk=document.getElementById("imgNotClearChk");
const err=document.getElementById("checkboxError");
if(!chk.checked){ err.style.display="block"; return; }
document.getElementById("skipModal").style.display="flex";
}
function clearCheckboxError(){ document.getElementById("checkboxError").style.display="none"; }
</script>

</body>
</html>
