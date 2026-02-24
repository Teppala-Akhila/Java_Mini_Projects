<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Business Bank Details | Dreams Soft Solutions</title>

<style>
    /* ===== ROOT VARIABLES ===== */
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
        --error: #dc3545;
    }

    /* ===== RESET & BASE ===== */
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

    /* ===== ANIMATED BACKGROUND ===== */
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

    /* ===== CONTAINER ===== */
.box {
    width: 100%;
    max-width: 800px;
    margin: 0 auto;

    background: #ffffff;          /* WHITE FORM */
    border-radius: 32px;
    padding: 3.5rem;

    /* PURPLE BORDER */
    border: 2px solid #7b2cbf;

    /* SOFT PURPLE GLOW */
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

    /* ===== TITLE ===== */
    .box h2 {
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

    .box h2::after {
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

    /* ===== FORM ===== */
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

    /* ===== TABLE STRUCTURE ===== */
    .register-table {
        width: 100%;
        border-collapse: collapse;
    }

    .register-table tr {
        animation: slideInUp 0.6s ease-out;
    }

    .register-table tr:nth-child(n) {
        animation-delay: calc(0.1s * var(--row-index, 1));
    }

    .register-table td {
        padding: 1.5rem;
        vertical-align: top;
    }

    .register-table td:first-child {
        padding-left: 0;
    }

    .register-table td:last-child {
        padding-right: 0;
    }

    .register-table tr:not(:last-child) td {
        border-bottom: 1px solid rgba(91, 24, 154, 0.08);
    }

    /* ===== FORM GROUPS ===== */
    .register-table td {
        position: relative;
    }

    /* ===== LABELS ===== */
    label {
        font-size: 0.875rem;
        font-weight: 700;
        color: var(--text-dark);
        margin-bottom: 0.625rem;
        display: block;
        text-transform: uppercase;
        letter-spacing: 0.3px;
    }

    /* ===== INPUT & SELECT ===== */
    input,
    select {
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

    input::placeholder,
    select::placeholder {
        color: #adb5bd;
    }

    input:focus,
    select:focus {
        outline: none;
        border-color: var(--primary-light);
        background: white;
        box-shadow: 0 0 0 5px rgba(123, 44, 191, 0.12);
        transform: translateY(-2px);
    }

    input:hover,
    select:hover {
        border-color: var(--primary-light);
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

    /* Inline error display */
    .register-table td span {
        display: block;
        color: var(--error);
        font-size: 0.8rem;
        margin-top: 0.5rem;
        animation: slideInUp 0.4s ease-out;
    }

    input.error {
        border-color: var(--error);
        background: #fff5f5;
    }

    select.error {
        border-color: var(--error);
        background: #fff5f5;
    }

    /* ===== SUCCESS MESSAGE ===== */
    .success-message {
        padding: 1.125rem 1.375rem;
        border-radius: 14px;
        margin-bottom: 2rem;
        display: flex;
        align-items: center;
        font-size: 0.95rem;
        font-weight: 600;
        animation: slideInUp 0.4s ease-out;
        background: #d4edda;
        color: #155724;
        border: 2px solid #c3e6cb;
    }

    .success-message::before {
        content: "✓";
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 32px;
        height: 32px;
        background: var(--success);
        color: white;
        border-radius: 50%;
        margin-right: 0.875rem;
        font-weight: 800;
        flex-shrink: 0;
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

    /* ===== COLSPAN STYLING ===== */
    .register-table td[colspan="2"] {
        padding-left: 0;
        padding-right: 0;
    }

    /* ===== RESPONSIVE GRID ===== */
    @media (max-width: 768px) {
        .box {
            padding: 2.5rem;
            border-radius: 24px;
        }

        .box h2 {
            font-size: 1.875rem;
        }

        .register-table td {
            padding: 1.25rem 0;
            display: block;
            border: none !important;
            width: 100%;
        }

        .register-table tr {
            display: block;
            margin-bottom: 1.5rem;
            padding-bottom: 1.5rem;
            border-bottom: 1px solid rgba(91, 24, 154, 0.08);
        }

        .register-table tr:last-child {
            border-bottom: none;
            margin-bottom: 0;
        }

        label {
            margin-bottom: 0.75rem;
        }

        input,
        select {
            width: 100%;
        }
    }

    @media (max-width: 640px) {
        body {
            padding: 1rem;
        }

        .box {
            padding: 1.5rem;
            border-radius: 20px;
        }

        .box h2 {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
        }

        label {
            font-size: 0.8rem;
        }

        input,
        select {
            padding: 0.875rem 1rem;
            font-size: 0.9rem;
        }

        input[type="submit"] {
            padding: 1rem 1.5rem !important;
            font-size: 0.95rem;
        }

        .register-table td {
            padding: 1rem 0;
        }

        .register-table tr {
            margin-bottom: 1.25rem;
            padding-bottom: 1.25rem;
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
    select:focus {
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
    .box {
    width: 100%;
    max-width: 800px;
    margin: 0 auto;

    background: #ffffff;          /* WHITE FORM */
    border-radius: 32px;
    padding: 3.5rem;

    /* PURPLE BORDER */
    border: 2px solid #7b2cbf;

    /* SOFT PURPLE GLOW */
    box-shadow:
        0 0 0 1px rgba(123, 44, 191, 0.25),
        0 12px 35px rgba(123, 44, 191, 0.35);

    animation: slideInUp 0.8s ease-out;
}

</style>
</head>

<body>

<%
    String error = request.getParameter("error");
    String success = request.getParameter("success");

    Integer sellerId = (Integer) session.getAttribute("sellerId");
    if (sellerId == null) {
        response.sendRedirect("register.jsp");
        return;
    }
%>


<div class="box">
   <h2>Business Bank Details</h2>

<!-- REGISTER SUCCESS -->
<% if ("registered".equals(success)) { %>
    <div class="success-message">
        Registration completed successfully!
    </div>
<% } %>

    <!-- ===== BANK DETAILS FORM ===== -->
    <form action="BusinessBankServlet" method="post" id="bankForm">
        <table class="register-table">

            <!-- ===== ACCOUNT TYPE ===== -->
            <tr style="--row-index: 1;">
                <td colspan="2">
                    <label for="account_type">Account Type</label>
                    <select name="account_type" id="account_type" required>
                        <option value="">-- Select Account Type --</option>
                        <option value="Current">Current Account</option>
                        <option value="Overdraft">Overdraft Account</option>
                        <option value="Savings">Savings Account</option>
                    </select>
                    <div class="input-hint">Select the type of bank account you want to use</div>
                </td>
            </tr>

            <!-- ===== ACCOUNT HOLDER NAME ===== -->
            <tr style="--row-index: 2;">
                <td colspan="2">
                    <label for="account_holder_name">Account Holder Name</label>
                    <input 
                        type="text" 
                        id="account_holder_name"
                        name="account_holder_name" 
                        placeholder="Full name as per bank account"
                        required
                    >
                    <div class="input-hint">Must match the name registered with your bank</div>
                </td>
            </tr>

            <!-- ===== BANK & BRANCH ===== -->
            <tr style="--row-index: 3;">
    <td>
        <label for="bank_name">Bank Name</label>
        <select id="bank_name" name="bank_name" onchange="onBankChange()" required>
            <option value="">-- Select Bank --</option>

            <!-- Public Sector Banks -->
            <option value="SBI">State Bank of India</option>
            <option value="CANARA">Canara Bank</option>
            <option value="UNION">Union Bank of India</option>
            <option value="INDIAN">Indian Bank</option>
            <option value="BOB">Bank of Baroda</option>
            <option value="BOI">Bank of India</option>

            <!-- Private Sector Banks -->
            <option value="HDFC">HDFC Bank</option>
            <option value="ICICI">ICICI Bank</option>
            <option value="AXIS">Axis Bank</option>
            <option value="IDFC">IDFC First Bank</option>
            <option value="KOTAK">Kotak Mahindra Bank</option>
            <option value="FEDERAL">Federal Bank</option>
            <option value="YES">Yes Bank</option>

            <!-- Small Finance Banks -->
            <option value="AU">AU Small Finance Bank</option>
            <option value="EQUITAS">Equitas Small Finance Bank</option>
            <option value="UJJIVAN">Ujjivan Small Finance Bank</option>

            <!-- Fallback -->
            <option value="OTHER">Other Bank</option>
        </select>
    </td>

    <td>
        <label for="branch_name">Branch Name</label>
        <select id="branch_name" name="branch_name" onchange="onBranchChange()" required>
            <option value="">-- Select Branch --</option>
        </select>
    </td>
</tr>

  

            <!-- ===== IFSC & ACCOUNT NUMBER ===== -->
            <tr style="--row-index: 4;">
    <td>
        <label for="ifsc">IFSC Code</label>

        <input 
            type="text"
            id="ifsc"
            name="ifsc"
            maxlength="11"
            style="text-transform: uppercase"
            placeholder="Auto-filled or enter manually"
            readonly
            required
        >

        <span id="ifscMsg" style="font-size:13px;"></span>
        <div class="input-hint">
            IFSC will be auto-filled when bank & branch are selected
        </div>
    </td>

    <td>
        <label for="account_number">Account Number</label>
        <input 
            type="text"
            id="account_number"
            name="account_number"
            maxlength="18"
            placeholder="Enter bank account number"
            required
        >

        <span id="accError" class="error-message" style="display:none;">
            Account number must be between 9 to 18 digits
        </span>
    </td>
</tr>


            <!-- ===== CONFIRM ACCOUNT NUMBER ===== -->
            <tr style="--row-index: 5;">
                <td colspan="2">
                    <label for="confirm_account_number">Confirm Account Number</label>
                    <input 
    type="text"
    id="confirm_account_number"
    name="confirm_account_number"
    maxlength="18"
    oninput="validateAccountMatch()"
    required
>
                   <span id="confirmAccError" class="error-message" style="display:none;">
    Account numbers do not match
</span>
                    <% if ("acc_invalid".equals(error)) { %>
                        <span class="error-message">Account number must be 9–18 digits (numbers only)</span>
                    <% } else if ("acc_mismatch".equals(error)) { %>
                        <span class="error-message">Account number do not match</span>
                    <% } else { %>
                    <% } %>
                </td>
            </tr>

            <!-- ===== SUBMIT BUTTON ===== -->
            <tr style="--row-index: 6;">
                <td colspan="2">
                    <input type="submit" value="Save Bank Details">
                </td>
            </tr>

        </table>
    </form>
</div>

<script>
/* ================= ELEMENTS ================= */
let bankSelect = document.getElementById("bank_name");
let branchSelect = document.getElementById("branch_name");
const ifscInput = document.getElementById("ifsc");

const accInput = document.getElementById("account_number");
const confirmAccInput = document.getElementById("confirm_account_number");

const accError = document.getElementById("accError");
const confirmAccError = document.getElementById("confirmAccError");
const ifscMsg = document.getElementById("ifscMsg");

/* ================= BANK DATA (AP & TS – MAJOR CITIES) ================= */
const bankData = {

    /* ================= SBI ================= */
    SBI: {
        "Hyderabad": "SBIN0000300",
        "Secunderabad": "SBIN0000846",
        "Vijayawada": "SBIN0000458",
        "Guntur": "SBIN0000848",
        "Visakhapatnam": "SBIN0000957",
        "Tirupati": "SBIN0000887",
        "Warangal": "SBIN0003186"
    },

    /* ================= HDFC ================= */
    HDFC: {
        "Hyderabad": "HDFC0000001",
        "Secunderabad": "HDFC0000410",
        "Vijayawada": "HDFC0000736",
        "Guntur": "HDFC0000737",
        "Visakhapatnam": "HDFC0000751",
        "Tirupati": "HDFC0000750",
        "Warangal": "HDFC0001990"
    },

    /* ================= ICICI ================= */
    ICICI: {
        "Hyderabad": "ICIC0000007",
        "Secunderabad": "ICIC0000008",
        "Vijayawada": "ICIC0000076",
        "Guntur": "ICIC0000133",
        "Visakhapatnam": "ICIC0000075",
        "Tirupati": "ICIC0001020",
        "Warangal": "ICIC0001040"
    },

    /* ================= AXIS ================= */
    AXIS: {
        "Hyderabad": "UTIB0000008",
        "Secunderabad": "UTIB0000009",
        "Vijayawada": "UTIB0000045",
        "Guntur": "UTIB0000132",
        "Visakhapatnam": "UTIB0000010",
        "Tirupati": "UTIB0000372",
        "Warangal": "UTIB0000318"
    },

    /* ================= CANARA ================= */
    CANARA: {
        "Hyderabad": "CNRB0000301",
        "Secunderabad": "CNRB0000841",
        "Vijayawada": "CNRB0002472",
        "Guntur": "CNRB0002827",
        "Visakhapatnam": "CNRB0000334",
        "Tirupati": "CNRB0002804",
        "Warangal": "CNRB0003186"
    },

    /* ================= UNION ================= */
    UNION: {
        "Hyderabad": "UBIN0801234",
        "Secunderabad": "UBIN0800846",
        "Vijayawada": "UBIN0805800",
        "Guntur": "UBIN0801937",
        "Visakhapatnam": "UBIN0800615",
        "Tirupati": "UBIN0811200",
        "Warangal": "UBIN0805600"
    },

    /* ================= INDIAN ================= */
    INDIAN: {
        "Hyderabad": "IDIB000A029",
        "Secunderabad": "IDIB000S016",
        "Vijayawada": "IDIB000V006",
        "Guntur": "IDIB000G017",
        "Visakhapatnam": "IDIB000V020",
        "Tirupati": "IDIB000T012",
        "Warangal": "IDIB000W012"
    },

    /* ================= BOB ================= */
    BOB: {
        "Hyderabad": "BARB0HYDERA",
        "Secunderabad": "BARB0SECUND",
        "Vijayawada": "BARB0VIJAYW",
        "Guntur": "BARB0GUNTUR",
        "Visakhapatnam": "BARB0VISAKH",
        "Tirupati": "BARB0TIRUPA",
        "Warangal": "BARB0WARANG"
    },

    /* ================= KOTAK ================= */
    KOTAK: {
        "Hyderabad": "KKBK0007460",
        "Secunderabad": "KKBK0007461",
        "Vijayawada": "KKBK0007476",
        "Guntur": "KKBK0007477",
        "Visakhapatnam": "KKBK0007478",
        "Tirupati": "KKBK0007479",
        "Warangal": "KKBK0007480"
    },

    /* ================= IDFC FIRST ================= */
    IDFC: {
        "Hyderabad": "IDFB0080101",
        "Secunderabad": "IDFB0080102",
        "Vijayawada": "IDFB0021211",
        "Guntur": "IDFB0021212",
        "Visakhapatnam": "IDFB0021213",
        "Tirupati": "IDFB0021214",
        "Warangal": "IDFB0021215"
    },

    /* ================= FEDERAL ================= */
    FEDERAL: {
        "Hyderabad": "FDRL0001101",
        "Secunderabad": "FDRL0001102",
        "Vijayawada": "FDRL0001376",
        "Guntur": "FDRL0001377",
        "Visakhapatnam": "FDRL0001378",
        "Tirupati": "FDRL0001379",
        "Warangal": "FDRL0001380"
    },

    /* ================= YES BANK ================= */
    YES: {
        "Hyderabad": "YESB0000001",
        "Secunderabad": "YESB0000002",
        "Vijayawada": "YESB0000486",
        "Guntur": "YESB0000487",
        "Visakhapatnam": "YESB0000488",
        "Tirupati": "YESB0000489",
        "Warangal": "YESB0000490"
    },

    /* ================= SMALL FINANCE ================= */
    AU: {
        "Hyderabad": "AUBL0002001",
        "Vijayawada": "AUBL0002456"
    },

    EQUITAS: {
        "Hyderabad": "ESFB0001001",
        "Vijayawada": "ESFB0001045"
    },

    UJJIVAN: {
        "Hyderabad": "UJVN0001601",
        "Vijayawada": "UJVN0001743"
    }
};


/* ================= BANK CHANGE ================= */
function onBankChange() {
    const bank = bankSelect.value;

    branchSelect.innerHTML = '<option value="">-- Select Branch --</option>';
    ifscInput.value = "";
    ifscInput.readOnly = true;

    if (bank === "OTHER") {
        enableManualEntry();
        return;
    }

    if (!bankData[bank]) return;

    Object.keys(bankData[bank]).forEach(branch => {
        const opt = document.createElement("option");
        opt.value = branch;
        opt.textContent = branch;
        branchSelect.appendChild(opt);
    });

    const otherOpt = document.createElement("option");
    otherOpt.value = "OTHER_BRANCH";
    otherOpt.textContent = "Other Branch";
    branchSelect.appendChild(otherOpt);
}

/* ================= BRANCH CHANGE ================= */
function onBranchChange() {
    const bank = bankSelect.value;
    const branch = branchSelect.value;

    // If user selects Other Branch
    if (branch === "OTHER_BRANCH") {
        enableOtherBranchEntry();
        return;
    }

    // Auto-fill IFSC if available
    if (bankData[bank] && bankData[bank][branch]) {
        ifscInput.value = bankData[bank][branch];

        // ✅ ALLOW USER TO EDIT IFSC
        ifscInput.readOnly = false;
    } else {
        ifscInput.value = "";
        ifscInput.readOnly = false;
    }
}


/* ================= OTHER BRANCH ================= */
function enableOtherBranchEntry() {
    branchSelect.outerHTML =
        `<input type="text" id="branch_name" name="branch_name"
         placeholder="Enter Branch Name" required>`;
    branchSelect = document.getElementById("branch_name");
    ifscInput.readOnly = false;
}

/* ================= MANUAL BANK ================= */
function enableManualEntry() {
    bankSelect.outerHTML =
        `<input type="text" id="bank_name" name="bank_name"
         placeholder="Enter Bank Name" required>`;
    branchSelect.outerHTML =
        `<input type="text" id="branch_name" name="branch_name"
         placeholder="Enter Branch Name" required>`;

    bankSelect = document.getElementById("bank_name");
    branchSelect = document.getElementById("branch_name");
    ifscInput.readOnly = false;
}

/* ================= ACCOUNT VALIDATION ================= */
accInput.addEventListener("input", () => {
    accInput.value = accInput.value.replace(/[^0-9]/g, '');
    accError.style.display = accInput.value.length < 9 ? "block" : "none";
    validateAccountMatch();
});

confirmAccInput.addEventListener("input", validateAccountMatch);

function validateAccountMatch() {
    confirmAccError.style.display =
        confirmAccInput.value && accInput.value !== confirmAccInput.value
            ? "block" : "none";
}

/* ================= IFSC VALIDATION ================= */
ifscInput.addEventListener("input", () => {
    ifscInput.value = ifscInput.value.toUpperCase().replace(/[^A-Z0-9]/g, '');
    const regex = /^[A-Z]{4}0[A-Z0-9]{6}$/;
    ifscMsg.textContent = regex.test(ifscInput.value)
        ? ""
        : "Invalid IFSC (Example: SBIN0001707)";
});
</script>


</body>
</html>