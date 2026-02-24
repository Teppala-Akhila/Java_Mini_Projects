<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Product | Dreams Soft Solutions</title>

<style>

    :root {
        --primary: #5b189a;
        --primary-light: #7b2cbf;
        --primary-gradient: linear-gradient(135deg, #5b189a 0%, #7b2cbf 100%);
        --text-dark: #1a1a1a;
        --text-light: #6c757d;
        --bg-light: #f5f7fa;
        --bg-lighter: #e9ecef;
        --border: #e1e4e8;
        --shadow-sm: 0 2px 8px rgba(0, 0, 0, 0.06);
        --shadow-md: 0 8px 24px rgba(91, 24, 154, 0.12);
        --shadow-lg: 0 20px 60px rgba(91, 24, 154, 0.15);
        --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        --success: #28a745;
        --warning: #ffc107;
        --error: #dc3545;
    }


    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    html {
        scroll-behavior: smooth;
    }

    body {
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        background: linear-gradient(135deg, var(--bg-light) 0%, var(--bg-lighter) 100%);
        min-height: 100vh;
        padding: 2rem 1rem;
        line-height: 1.6;
        color: var(--text-dark);
    }


    body::before {
        content: '';
        position: fixed;
        top: -30%;
        right: -10%;
        width: 600px;
        height: 600px;
        background: radial-gradient(circle, rgba(123, 44, 191, 0.1) 0%, transparent 70%);
        border-radius: 50%;
        animation: float 20s ease-in-out infinite;
        z-index: -1;
    }

    body::after {
        content: '';
        position: fixed;
        bottom: -20%;
        left: -5%;
        width: 500px;
        height: 500px;
        background: radial-gradient(circle, rgba(91, 24, 154, 0.08) 0%, transparent 70%);
        border-radius: 50%;
        animation: float 25s ease-in-out infinite reverse;
        z-index: -1;
    }

    @keyframes float {
        0%, 100% { transform: translateY(0px); }
        50% { transform: translateY(30px); }
    }


    .product-box {
    width: 100%;
    max-width: 900px;
    margin: 0 auto;

    background: #ffffff;           
    border-radius: 32px;
    padding: 3.5rem;

    /* PURPLE BORDER */
    border: 2px solid #7b2cbf;

  
    box-shadow:
        0 0 0 1px rgba(123, 44, 191, 0.25),
        0 12px 35px rgba(123, 44, 191, 0.35);

    animation: slideInUp 0.8s ease-out;
}


    @keyframes slideInUp {
        from {
            opacity: 0;
            transform: translateY(40px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

 
    .product-box h2 {
        font-size: 2.25rem;
        font-weight: 900;
        background: var(--primary-gradient);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
        margin-bottom: 0.75rem;
        letter-spacing: -0.5px;
        text-align: center;
        position: relative;
        padding-bottom: 1.5rem;
    }

    .product-box h2::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 70px;
        height: 5px;
        background: var(--primary-gradient);
        border-radius: 3px;
    }

   
    form {
        animation: fadeIn 0.8s ease-out 0.2s both;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }

  
    table {
        width: 100%;
        border-collapse: collapse;
    }

    table tr {
        animation: slideInUp 0.6s ease-out;
    }

    table tr:nth-child(n) {
        animation-delay: calc(0.05s * var(--row-index, 1));
    }

    
    table tr td:only-child {
        padding: 1.5rem 0 0.75rem 0;
        border: none;
    }

    table tr td:only-child {
        font-weight: 700;
        color: var(--text-dark);
        font-size: 0.875rem;
        text-transform: uppercase;
        letter-spacing: 0.3px;
    }

    
    table tr td {
        padding: 0 0 1.5rem 0;
        vertical-align: top;
    }

    
    input[type="text"],
    input[type="email"],
    input[type="password"],
    input[type="number"],
    input[type="file"],
    select,
    textarea {
        width: 100%;
        padding: 0.975rem 1.125rem;
        border-radius: 12px;
        border: 2px solid var(--border);
        font-size: 0.95rem;
        transition: var(--transition);
        background: #f8f9fa;
        font-family: inherit;
        color: var(--text-dark);
    }

    input[type="text"]::placeholder,
    input[type="email"]::placeholder,
    input[type="password"]::placeholder,
    input[type="number"]::placeholder,
    select::placeholder,
    textarea::placeholder {
        color: #adb5bd;
    }

    input:focus,
    select:focus,
    textarea:focus {
        outline: none;
        border-color: var(--primary-light);
        background: white;
        box-shadow: 0 0 0 5px rgba(123, 44, 191, 0.12);
        transform: translateY(-2px);
    }

    input:hover,
    select:hover,
    textarea:hover {
        border-color: var(--primary-light);
    }

    textarea {
        resize: vertical;
        min-height: 100px;
    }

    input[type="file"] {
        padding: 0.875rem;
        cursor: pointer;
    }

    input[type="file"]::file-selector-button {
        background: var(--primary-gradient);
        color: white;
        border: none;
        padding: 0.625rem 1.25rem;
        border-radius: 8px;
        cursor: pointer;
        font-weight: 600;
        transition: var(--transition);
        margin-right: 0.75rem;
    }

    input[type="file"]::file-selector-button:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(91, 24, 154, 0.3);
    }

    /* ===== READONLY FIELDS ===== */
    input[readonly] {
        background: #f0f0f0;
        color: var(--text-light);
        cursor: not-allowed;
    }

    /* ===== INPUT HINTS ===== */
    .input-hint {
        font-size: 0.8rem;
        color: var(--text-light);
        margin-top: 0.5rem;
        display: flex;
        align-items: center;
        gap: 0.375rem;
    }

    .input-hint::before {
        content: "ℹ";
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 16px;
        height: 16px;
        background: rgba(123, 44, 191, 0.1);
        border-radius: 50%;
        font-size: 0.75rem;
        color: var(--primary);
    }

    /* ===== ERROR MESSAGES ===== */
    .error-message {
        font-size: 0.8rem;
        color: var(--error);
        margin-top: 0.5rem;
        display: flex;
        align-items: center;
        gap: 0.375rem;
        animation: slideInUp 0.4s ease-out;
    }

    .error-message::before {
        content: "⚠";
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 16px;
        height: 16px;
        background: rgba(220, 53, 69, 0.15);
        border-radius: 50%;
        font-size: 0.75rem;
    }

    input.error,
    select.error,
    textarea.error {
        border-color: var(--error);
        background: #fff5f5;
    }

    /* ===== PRICE INFO ===== */
    .price-info {
        font-size: 0.85rem;
        color: var(--text-light);
        margin-top: 0.5rem;
        padding: 0.75rem 1rem;
        background: rgba(123, 44, 191, 0.05);
        border-radius: 8px;
        border-left: 3px solid var(--primary-light);
    }

    /* ===== IMAGE PREVIEW ===== */
    #imageCount {
        display: block;
        font-size: 0.85rem;
        color: var(--primary);
        font-weight: 600;
        margin-top: 0.75rem;
        margin-bottom: 1rem;
    }

    #previewBox {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(100px, 1fr));
        gap: 12px;
        margin-top: 1rem;
        padding: 1.5rem;
        background: #f8f9fa;
        border-radius: 12px;
        border: 2px dashed var(--border);
    }

    #previewBox img {
        width: 100%;
        height: 100px;
        object-fit: cover;
        border-radius: 8px;
        box-shadow: var(--shadow-sm);
        transition: var(--transition);
    }

    #previewBox img:hover {
        transform: scale(1.05);
        box-shadow: var(--shadow-md);
    }

    /* ===== SUBMIT BUTTON ===== */
    input[type="submit"] {
        width: 100%;
        padding: 1.125rem 2rem !important;
        border: none;
        border-radius: 14px;
        background: var(--primary-gradient);
        color: white;
        font-size: 1.025rem;
        font-weight: 700;
        cursor: pointer;
        transition: var(--transition);
        box-shadow: 0 8px 24px rgba(91, 24, 154, 0.3);
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 0.625rem;
        position: relative;
        overflow: hidden;
        margin-top: 1.5rem;
        text-transform: none;
    }

    input[type="submit"]::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: rgba(255, 255, 255, 0.2);
        transition: var(--transition);
    }

    input[type="submit"]:hover {
        transform: translateY(-3px);
        box-shadow: 0 12px 36px rgba(91, 24, 154, 0.4);
    }

    input[type="submit"]:hover::before {
        left: 100%;
    }

    input[type="submit"]:active {
        transform: translateY(-1px);
    }

    /* ===== RESPONSIVE DESIGN ===== */
    @media (max-width: 768px) {
        .product-box {
            padding: 2.5rem;
            border-radius: 24px;
        }

        .product-box h2 {
            font-size: 1.875rem;
        }

        table tr td:only-child {
            padding: 1.25rem 0 0.625rem 0;
        }

        table tr td {
            padding: 0 0 1.25rem 0;
        }

        input,
        select,
        textarea {
            padding: 0.875rem 1rem;
            font-size: 0.9rem;
        }

        input[type="submit"] {
            padding: 1rem 1.5rem !important;
            font-size: 0.95rem;
        }

        #previewBox {
            grid-template-columns: repeat(auto-fill, minmax(80px, 1fr));
            gap: 10px;
            padding: 1rem;
        }

        #previewBox img {
            height: 80px;
        }
    }

    @media (max-width: 640px) {
        body {
            padding: 1rem;
        }

        .product-box {
            padding: 1.5rem;
            border-radius: 20px;
        }

        .product-box h2 {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
        }

        table tr td:only-child {
            font-size: 0.75rem;
            padding: 1rem 0 0.5rem 0;
        }

        input,
        select,
        textarea {
            padding: 0.75rem 0.875rem;
            font-size: 0.875rem;
            border-radius: 8px;
        }

        input[type="submit"] {
            padding: 0.875rem 1.25rem !important;
            font-size: 0.9rem;
        }

        #previewBox {
            grid-template-columns: repeat(auto-fill, minmax(70px, 1fr));
            gap: 8px;
            padding: 0.75rem;
        }

        #previewBox img {
            height: 70px;
        }

        #imageCount {
            font-size: 0.8rem;
        }
    }

    /* ===== ANIMATIONS ===== */
    @keyframes slideInUp {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    /* ===== FOCUS ANIMATION ===== */
    input:focus,
    select:focus,
    textarea:focus {
        animation: focusPulse 0.4s ease-out;
    }

    @keyframes focusPulse {
        0% {
            box-shadow: 0 0 0 0 rgba(123, 44, 191, 0.4);
        }
        70% {
            box-shadow: 0 0 0 10px rgba(123, 44, 191, 0);
        }
        100% {
            box-shadow: 0 0 0 0 rgba(123, 44, 191, 0);
        }
    }

    /* ===== SECTION DIVIDERS ===== */
    .form-section {
        margin-bottom: 2rem;
        padding-bottom: 2rem;
        border-bottom: 1px solid rgba(91, 24, 154, 0.08);
    }

    .form-section:last-child {
        border-bottom: none;
    }
    .drop-zone {
    border: 2px dashed #7b2cbf;
    border-radius: 14px;
    padding: 30px;
    text-align: center;
    cursor: pointer;
    background: #f8f9fa;
    transition: 0.3s ease;
    font-weight: 600;
    color: #5b189a;
	}
	
	.drop-zone span {
	    color: #7b2cbf;
	    text-decoration: underline;
	}
	
	.drop-zone.dragover {
	    background: #f1e9ff;
	    border-color: #5b189a;
	}
	.preview-item {
    position: relative;
    display: inline-block;
    margin: 6px;
}
.imagePreviewContainer {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
    gap: 14px;
    margin-top: 15px;
    padding: 15px;
    background: #f8f9fa;
    border-radius: 12px;
    border: 2px dashed #ddd;
}
.preview-item img {
    width: 100%;
    height: 110px;
    object-fit: cover;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}

.image-order {
    position: absolute;
    top: 6px;
    left: 6px;
    background: #5b189a;
    color: #fff;
    font-size: 12px;
    font-weight: 700;
    width: 22px;
    height: 22px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
}

.remove-image {
    position: absolute;
    top: 6px;
    right: 6px;
    width: 22px;
    height: 22px;
    background: #dc3545;
    color: #fff;
    border-radius: 50%;
    font-size: 14px;
    font-weight: bold;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
}

.remove-image:hover {
    background: #b02a37;
}
	
	/* ===== LOGOUT BUTTON ===== */
.logout-container {
    position: fixed;
    top: 20px;
    right: 30px;
    z-index: 1000;
}

.logout-btn {
    background: linear-gradient(135deg, #dc3545, #b02a37);
    color: #fff;
    padding: 10px 18px;
    border-radius: 25px;
    text-decoration: none;
    font-size: 14px;
    font-weight: 600;
    box-shadow: 0 6px 18px rgba(220, 53, 69, 0.35);
    transition: 0.3s ease;
}

.logout-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 26px rgba(220, 53, 69, 0.45);
}
	
	    

</style>
</head>

<body>
<%
if (session == null || session.getAttribute("sellerId") == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<%
if ("true".equals(request.getParameter("success"))) {
%>
<div style="color:green;font-weight:600;margin-bottom:15px;">
    ✅ Product added successfully. You can add another product.
</div>
<%
}
%>


<div class="logout-container">
    <a href="logout" class="logout-btn">Logout</a>
</div>


<div class="product-box">
    <h2>Add Products</h2>

    <form action="AddProductServlet"
          method="post"
          enctype="multipart/form-data"
          id="productForm">

        <table>

            <!-- ===== VENDOR NAME ===== -->
            <tr><td>Vendor Name</td></tr>
            <tr>
                <td>
                    <input type="text"
                           name="vendor_name"
                           id="vendor_name"
                           placeholder="Enter your business name"
                           required>
                </td>
            </tr>

            <!-- ===== CATEGORY ===== -->
            <tr><td>Category</td></tr>
            <tr>
                <td>
                    <select name="category"
                            id="category"
                            required
                            onchange="toggleOtherCategory()">
                        <option value="">-- Select Category --</option>
                        <option value="Action Cameras">Action Cameras</option>
                        <option value="Air Conditioners">Air Conditioners</option>
                        <option value="Cameras">Cameras</option>
                        <option value="Chargers">Chargers</option>
                        <option value="Desktops">Desktops</option>
                        <option value="DSLR Cameras">DSLR Cameras</option>
                        <option value="Headphones">Headphones</option>
                        <option value="Home Theatres">Home Theatres</option>
                        <option value="Keyboards & Mouse">Keyboards & Mouse</option>
                        <option value="Laptops">Laptops</option>
                        <option value="Microwaves">Microwaves</option>
                        <option value="Mobile Phones">Mobile Phones</option>
                        <option value="Monitors">Monitors</option>
                        <option value="Power Banks">Power Banks</option>
                        <option value="Refrigerators">Refrigerators</option>
                        <option value="Routers">Routers</option>
                        <option value="Smart Watches">Smart Watches</option>
                        <option value="Speakers">Speakers</option>
                        <option value="Tablets">Tablets</option>
                        <option value="Televisions">Televisions</option>
                        <option value="Washing Machines">Washing Machines</option>
                        <option value="OTHER">Other</option>
                    </select>
                </td>
            </tr>

            <tr id="otherCategoryRow" style="display:none;">
                <td>
                    <input type="text"
                           id="other_category"
                           name="other_category"
                           placeholder="Enter your category">
                </td>
            </tr>

            <!-- ===== PRODUCT CODE (SELLER PRODUCT ID) ===== -->
            <tr><td>Product Code</td></tr>
            <tr>
                <td>
                    <input type="text"
                           name="product_id"
                           id="product_id"
                           placeholder="Enter unique product code"
                           required>
                </td>
            </tr>

            <!-- ===== PRODUCT NAME ===== -->
            <tr><td>Product Name</td></tr>
            <tr>
                <td>
                    <input type="text"
                           name="product_name"
                           id="product_name"
                           placeholder="Enter product name"
                           required>
                </td>
            </tr>

            <!-- ===== BRAND ===== -->
            <tr><td>Brand</td></tr>
            <tr>
                <td>
                    <input type="text"
                           name="brand"
                           id="brand"
                           placeholder="e.g., Apple, Samsung"
                           required>
                </td>
            </tr>

            <!-- ===== MODEL ===== -->
            <tr><td>Model</td></tr>
            <tr>
                <td>
                    <input type="text"
                           name="model"
                           id="model"
                           placeholder="e.g., iPhone 15 Pro"
                           required>
                </td>
            </tr>

            <!-- ===== WARRANTY ===== -->
            <tr><td>Warranty (Months)</td></tr>
            <tr>
                <td>
                    <input type="text"
                           name="warranty"
                           id="warranty"
                           min="0"
                           placeholder="e.g., 12"
                           required>
                </td>
            </tr>

            <!-- ===== DESCRIPTION ===== -->
            <tr><td>Description</td></tr>
            <tr>
                <td>
                    <textarea name="description"
                              id="description"
                              placeholder="Describe your product features..."
                              required></textarea>
                </td>
            </tr>

            <!-- ===== STATUS ===== -->
            <tr><td>Status</td></tr>
            <tr>
                <td>
                    <select name="status" id="status" required>
                        <option value="ACTIVE">Active</option>
                        <option value="INACTIVE">Inactive</option>
                    </select>
                </td>
            </tr>

            <!-- ===== VARIANTS SECTION ===== -->
            <tr>
                <td>
                    <hr>
                    <h3>Product Variants (Color / Storage / Price)</h3>
                </td>
            </tr>

            <tr>
                <td>

                    <div id="variantsContainer"></div>

                    <button type="button"
                            onclick="addVariant()"
                            style="margin-top:10px;
                                   padding:8px 12px;
                                   background:#5b189a;
                                   color:white;
                                   border:none;
                                   border-radius:6px;
                                   cursor:pointer;">
                        + Add Variant
                    </button>

                    <input type="hidden"
                           name="variant_count"
                           id="variant_count"
                           value="0">
                         

                </td>
            </tr>

            <!-- ===== SUBMIT ===== -->
            <tr>
                <td>
                    <input type="submit" value="Add Product">
                </td>
            </tr>

        </table>
    </form>
</div>


<script>

let variantIndex = 0;
let variantFiles = {};
const form = document.getElementById("productForm");

/* ================= ADD VARIANT ================= */

function addVariant() {

    variantIndex++;
    variantFiles[variantIndex] = [];

    document.getElementById("variant_count").value = variantIndex;

    const container = document.getElementById("variantsContainer");

    const block = document.createElement("div");
    block.className = "variant-box";
    block.setAttribute("data-variant", variantIndex);

    block.style.border = "1px solid #ddd";
    block.style.padding = "15px";
    block.style.marginTop = "15px";
    block.style.borderRadius = "10px";

    block.innerHTML = `
        <h4>Variant ${variantIndex}</h4>

        <label>Color</label>
        <input type="text" name="color[]" required>

        <label id="specLabel">Specification</label>

        <select name="spec_value[]" class="spec-value" required>
            <option value="">Select Option</option>
        </select>

        <input type="hidden" name="spec_type[]" class="spec-type">


        <label>SKU</label>
        <input type="text" name="sku[]" required>

        <label>Price</label>
        <input type="text" name="price[]" class="price" required>

        <label>Discount (%)</label>
        <input type="text" name="discount[]" class="discount" value="0">

        <label>Final Price</label>
        <input type="text" class="total" readonly>

        <label>Quantity</label>
        <input type="text" name="quantity[]" required>

        <label>Variant Status</label>
        <select name="variant_status[]">
            <option value="ACTIVE">Active</option>
            <option value="INACTIVE">Inactive</option>
        </select>

        <label>Images</label>
        <div class="drop-zone">
            Drag & Drop or <span>Select</span>
            <input type="file"
                name="variantImages_${variantIndex}"
                class="variant-input"
                data-variant="${variantIndex}"
                multiple
                accept="image/*"
                hidden>

        </div>

        <div class="imagePreviewContainer" id="preview_${variantIndex}" style="margin-top:10px;"></div>

        <br>
        <button type="button"
            style="background:#dc3545;color:white;border:none;padding:6px 12px;border-radius:6px;cursor:pointer;">
            Remove Variant
        </button>
    `;

    container.appendChild(block);

 // ===== DYNAMIC SPEC BASED ON CATEGORY =====

    const category = document.getElementById("category").value;
    const specData = getSpecOptions(category);

    const specSelect = block.querySelector(".spec-value");
    const specTypeInput = block.querySelector(".spec-type");
    const specLabel = block.querySelector("#specLabel");

    specLabel.innerText = specData.type;
    specTypeInput.value = specData.type;

    specSelect.innerHTML = `<option value="">Select ${specData.type}</option>`;

    specData.options.forEach(option => {
        const opt = document.createElement("option");
        opt.value = option;
        opt.textContent = option;
        specSelect.appendChild(opt);
    });

    
    /* ---- PRICE CALCULATION ---- */

    const priceInput = block.querySelector(".price");
    const discountInput = block.querySelector(".discount");

    priceInput.addEventListener("input", () => calculateTotal(block));
    discountInput.addEventListener("input", () => calculateTotal(block));

    /* ---- FILE HANDLING ---- */

    const dropZone = block.querySelector(".drop-zone");
    const fileInput = block.querySelector(".variant-input");

    dropZone.addEventListener("click", () => fileInput.click());

    fileInput.addEventListener("change", function(e) {
        const index = this.getAttribute("data-variant");
        handleVariantFiles(e, index);
    });

    dropZone.addEventListener("dragover", (e) => {
        e.preventDefault();
        dropZone.style.background = "#f3e8ff"; 
    });

    dropZone.addEventListener("dragleave", () => {
        dropZone.style.background = "";
    });

    dropZone.addEventListener("drop", (e) => {
        e.preventDefault();
        dropZone.style.background = "";
        const index = fileInput.getAttribute("data-variant");
        handleVariantFiles({ target: { files: e.dataTransfer.files } }, index);

    });

    /* ---- REMOVE VARIANT ---- */

    const removeBtn = block.querySelector("button");
    removeBtn.addEventListener("click", () => {
        block.remove();
        delete variantFiles[variantIndex];

        // recalculate total variants
        const remaining = document.querySelectorAll(".variant-box").length;
        document.getElementById("variant_count").value = remaining;
    });
}

/* ================= CALCULATE TOTAL ================= */

function calculateTotal(block) {

    let price = parseFloat(block.querySelector(".price").value) || 0;
    let discount = parseFloat(block.querySelector(".discount").value) || 0;

    if (discount < 0) discount = 0;
    if (discount > 100) discount = 100;

    block.querySelector(".discount").value = discount;

    const total = price - (price * discount / 100);

    block.querySelector(".total").value = total.toFixed(2);
}

/* ================= HANDLE FILES ================= */
function handleVariantFiles(event, index) {

    if (!variantFiles[index]) {
        variantFiles[index] = [];
    }

    const files = event.target.files;

    for (let i = 0; i < files.length; i++) {
        const file = files[i];

        if (file.type.startsWith("image/")) {
            variantFiles[index].push(file);
        }
    }

    renderVariantPreview(index);
}

/* ================= IMAGE PREVIEW ================= */

function renderVariantPreview(index) {

    const preview = document.getElementById("preview_" + index);
    if (!preview) return;

    preview.innerHTML = "";

    if (!variantFiles[index]) return;

    variantFiles[index].forEach((file, i) => {

        const reader = new FileReader();

        reader.onload = function (e) {

            const wrapper = document.createElement("div");
            wrapper.className = "preview-item";

            const img = document.createElement("img");
            img.src = e.target.result;

            const order = document.createElement("div");
            order.className = "image-order";
            order.innerText = i + 1;

            const removeBtn = document.createElement("div");
            removeBtn.className = "remove-image";
            removeBtn.innerHTML = "×";

            removeBtn.onclick = function () {
                variantFiles[index].splice(i, 1);
                renderVariantPreview(index);
            };

            wrapper.appendChild(img);
            wrapper.appendChild(order);
            wrapper.appendChild(removeBtn);

            preview.appendChild(wrapper);
        };

        reader.readAsDataURL(file);
    });
}

/* ================= FORM SUBMIT ================= */

	form.addEventListener("submit", function(e) {

	    /* ===== ATTACH VARIANT FILES TO INPUTS BEFORE SUBMIT ===== */

	    Object.keys(variantFiles).forEach(index => {

	        const input = document.querySelector(
	            `input[name="variantImages_${index}"]`
	        );

	        if (input && variantFiles[index]) {

	            const dataTransfer = new DataTransfer();

	            variantFiles[index].forEach(file => {
	                dataTransfer.items.add(file);
	            });

	            input.files = dataTransfer.files;
	        }
	    });

	    /* ===== NOW CONTINUE YOUR VALIDATION ===== */

	    clearAllErrors();
	    let isValid = true;

    const vendorName = document.getElementById('vendor_name').value.trim();
    const category = document.getElementById('category').value;
    const productName = document.getElementById('product_name').value.trim();
    const description = document.getElementById('description').value.trim();

    if (vendorName.length < 3) {
        showError('vendor_name', 'Vendor name must be at least 3 characters');
        isValid = false;
    }

    if (!category) {
        showError('category', 'Please select a category');
        isValid = false;
    }

    if (productName.length < 3) {
        showError('product_name', 'Product name must be at least 3 characters');
        isValid = false;
    }

    if (description.length < 10) {
        showError('description', 'Description must be at least 10 characters');
        isValid = false;
    }

    if (!isValid) {
        e.preventDefault();
        return;
    }
});

 

/* ================= ERROR HANDLING ================= */

function showError(elementId, message) {
    const element = document.getElementById(elementId);
    if (element) {
        element.classList.add('error');
        const errorDiv = document.createElement('div');
        errorDiv.className = 'error-message';
        errorDiv.textContent = message;
        element.parentElement.appendChild(errorDiv);
    }
}

function clearAllErrors() {
    document.querySelectorAll('.error-message').forEach(el => el.remove());
    document.querySelectorAll('input, select, textarea').forEach(el => {
        el.classList.remove('error');
    });
}

/* ================= OTHER CATEGORY ================= */

function toggleOtherCategory() {
    const category = document.getElementById("category").value;
    const otherRow = document.getElementById("otherCategoryRow");
    const otherInput = document.getElementById("other_category");

    if (category === "OTHER") {
        otherRow.style.display = "table-row";
        otherInput.required = true;
    } else {
        otherRow.style.display = "none";
        otherInput.required = false;
        otherInput.value = "";
    }
}

function getSpecOptions(category) {

    // 📱 Mobiles & Tablets
    if (category === "Mobile Phones" || category === "Tablets") {
        return {
            type: "Storage",
            options: ["64 GB", "128 GB", "256 GB", "512 GB", "1 TB"]
        };
    }

    // 💻 Laptops & Desktops
    if (category === "Laptops" || category === "Desktops") {
        return {
            type: "RAM",
            options: ["8 GB", "16 GB", "32 GB", "64 GB"]
        };
    }

    // ❄ Air Conditioners
    if (category === "Air Conditioners") {
        return {
            type: "Capacity",
            options: ["1 Ton", "1.5 Ton", "2 Ton"]
        };
    }

    // 🧺 Washing Machines
    if (category === "Washing Machines") {
        return {
            type: "Capacity",
            options: ["6 KG", "7 KG", "8 KG", "9 KG"]
        };
    }

    // 📺 TVs & Monitors
    if (category === "Televisions" || category === "Monitors") {
        return {
            type: "Screen Size",
            options: ["24 Inch", "32 Inch", "43 Inch", "55 Inch", "65 Inch"]
        };
    }

    // 🧊 Refrigerators
    if (category === "Refrigerators") {
        return {
            type: "Capacity",
            options: ["190 L", "250 L", "350 L", "500 L"]
        };
    }

    // 🔋 Power Banks
    if (category === "Power Banks") {
        return {
            type: "Battery Capacity",
            options: ["10000 mAh", "20000 mAh", "30000 mAh"]
        };
    }

    // 🎧 Audio Devices
    if (category === "Headphones" || 
        category === "Speakers" || 
        category === "Home Theatres") {
        return {
            type: "Output Power",
            options: ["10W", "20W", "50W", "100W"]
        };
    }

    // 📷 Cameras
    if (category === "Cameras" || 
        category === "DSLR Cameras" || 
        category === "Action Cameras") {
        return {
            type: "Resolution",
            options: ["12 MP", "24 MP", "48 MP", "4K"]
        };
    }

    // 🔌 Chargers
    if (category === "Chargers") {
        return {
            type: "Wattage",
            options: ["18W", "25W", "45W", "65W"]
        };
    }

    // ⌨ Accessories
    if (category === "Keyboards & Mouse" || 
        category === "Routers" || 
        category === "Smart Watches") {
        return {
            type: "Model Variant",
            options: ["Standard", "Pro", "Advanced"]
        };
    }

    // 🍽 Microwaves
    if (category === "Microwaves") {
        return {
            type: "Capacity",
            options: ["20 L", "25 L", "30 L"]
        };
    }

    // Default fallback
    return {
        type: "Specification",
        options: []
    };
}

document.getElementById("category").addEventListener("change", function() {

    const blocks = document.querySelectorAll(".variant-box");

    blocks.forEach(block => {

        const specSelect = block.querySelector(".spec-value");
        const specTypeInput = block.querySelector(".spec-type");
        const specLabel = block.querySelector("#specLabel");

        const specData = getSpecOptions(this.value);

        specLabel.innerText = specData.type;
        specTypeInput.value = specData.type;

        specSelect.innerHTML = `<option value="">Select ${specData.type}</option>`;

        specData.options.forEach(option => {
            const opt = document.createElement("option");
            opt.value = option;
            opt.textContent = option;
            specSelect.appendChild(opt);
        });

    });

});
</script>

</body>
</html>