<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dreams Soft Solutions | Seller Login</title>

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
        display: flex;
        justify-content: center;
        align-items: center;
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
    .container {
        width: 100%;
        max-width: 1200px;
        display: grid;
        grid-template-columns: 380px 1fr;
        gap: 3rem;
        align-items: start;
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

    /* ===== LEFT SIDEBAR ===== */
    .sidebar {
        display: flex;
        flex-direction: column;
        gap: 1.5rem;
        position: sticky;
        top: 2rem;
    }

    /* Logo Card */
    .logo-card {
        background: white;
        border-radius: 24px;
        padding: 2.5rem 2rem;
        text-align: center;
        box-shadow: var(--shadow-md);
        transition: var(--transition);
        border: 2px solid transparent;
    }

    .logo-card:hover {
        transform: translateY(-8px);
        box-shadow: var(--shadow-lg);
        border-color: var(--primary-light);
    }

    .logo-card img {
        width: 140px;
        height: auto;
        margin-bottom: 1.5rem;
        border-radius: 12px;
        object-fit: cover;
        transition: var(--transition);
    }

    .logo-card:hover img {
        transform: scale(1.05);
    }

    .logo-card h2 {
        font-size: 1.25rem;
        font-weight: 900;
        background: var(--primary-gradient);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
        letter-spacing: 0.5px;
        text-transform: uppercase;
    }

    /* Info Card */
    .info-card {
        background: var(--primary-gradient);
        color: white;
        border-radius: 24px;
        padding: 2.5rem;
        box-shadow: 0 15px 40px rgba(91, 24, 154, 0.25);
        transition: var(--transition);
        position: relative;
        overflow: hidden;
    }

    .info-card::before {
        content: '';
        position: absolute;
        top: -50%;
        right: -20%;
        width: 300px;
        height: 300px;
        background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
        border-radius: 50%;
        animation: float 15s ease-in-out infinite;
    }

    .info-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 20px 50px rgba(91, 24, 154, 0.3);
    }

    .info-card h3 {
        font-size: 1.375rem;
        margin-bottom: 1.5rem;
        font-weight: 800;
        position: relative;
        z-index: 1;
    }

    .info-card ul {
        list-style: none;
        margin-bottom: 2rem;
        position: relative;
        z-index: 1;
    }

    .info-card li {
        padding: 0.875rem 0;
        font-size: 0.975rem;
        display: flex;
        align-items: center;
        border-bottom: 1px solid rgba(255, 255, 255, 0.15);
        transition: var(--transition);
    }

    .info-card li:hover {
        padding-left: 8px;
    }

    .info-card li:last-child {
        border-bottom: none;
    }

    .info-card li::before {
        content: "✓";
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 28px;
        height: 28px;
        background: rgba(255, 255, 255, 0.25);
        border-radius: 50%;
        margin-right: 0.875rem;
        font-weight: 800;
        font-size: 0.875rem;
        flex-shrink: 0;
        transition: var(--transition);
    }

    .info-card li:hover::before {
        background: rgba(255, 255, 255, 0.4);
        transform: scale(1.2) rotate(360deg);
    }

    .info-card .cta {
        background: rgba(255, 255, 255, 0.18);
        padding: 1.25rem;
        border-radius: 14px;
        text-align: center;
        font-weight: 700;
        font-size: 0.975rem;
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.25);
        position: relative;
        z-index: 1;
        cursor: pointer;
        transition: var(--transition);
    }

    .info-card .cta:hover {
        background: rgba(255, 255, 255, 0.25);
        transform: translateY(-2px);
    }

    /* ===== FORM CARD ===== */
    .form-card {
		    background: #ffffff;                 /* keep form white */
		    border-radius: 32px;
		    padding: 3.5rem;
		
		    /* PURPLE BORDER */
		    border: 2px solid #7b2cbf;
		
		    /* SOFT PURPLE GLOW */
		    box-shadow:
		        0 0 0 1px rgba(123, 44, 191, 0.25),
		        0 12px 35px rgba(123, 44, 191, 0.35);
		
		    animation: slideInRight 0.8s ease-out;
		}

    @keyframes slideInRight {
        from {
            opacity: 0;
            transform: translateX(40px);
        }
        to {
            opacity: 1;
            transform: translateX(0);
        }
    }

    .form-header {
        margin-bottom: 2.5rem;
        position: relative;
    }

    .form-title {
        font-size: 2.25rem;
        font-weight: 900;
        background: var(--primary-gradient);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
        margin-bottom: 0.75rem;
        letter-spacing: -0.5px;
    }

    .form-subtitle {
        color: var(--text-light);
        font-size: 0.975rem;
        font-weight: 500;
    }

    .divider {
        height: 5px;
        width: 70px;
        background: var(--primary-gradient);
        border-radius: 3px;
        margin: 1.25rem 0 0 0;
    }

    /* ===== MESSAGES ===== */
    .error-box {
        padding: 1.125rem 1.375rem;
        border-radius: 14px;
        margin-bottom: 1.5rem;
        display: flex;
        align-items: center;
        font-size: 0.95rem;
        font-weight: 600;
        animation: slideInUp 0.4s ease-out;
        background: #f8d7da;
        color: #721c24;
        border: 2px solid #f5c6cb;
    }

    .error-box::before {
        content: "⚠";
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 32px;
        height: 32px;
        background: #dc3545;
        color: white;
        border-radius: 50%;
        margin-right: 0.875rem;
        font-size: 0.875rem;
        flex-shrink: 0;
    }

    .success-box {
        padding: 1.125rem 1.375rem;
        border-radius: 14px;
        margin-bottom: 1.5rem;
        display: flex;
        align-items: center;
        font-size: 0.95rem;
        font-weight: 600;
        animation: slideInUp 0.4s ease-out;
        background: #d4edda;
        color: #155724;
        border: 2px solid #c3e6cb;
    }

    .success-box::before {
        content: "✓";
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 32px;
        height: 32px;
        background: #28a745;
        color: white;
        border-radius: 50%;
        margin-right: 0.875rem;
        font-weight: 800;
        flex-shrink: 0;
    }

    /* ===== FORM ===== */
    .form-group {
        margin-bottom: 1.75rem;
    }

    label {
        font-size: 0.875rem;
        font-weight: 700;
        color: var(--text-dark);
        margin-bottom: 0.625rem;
        display: block;
        text-transform: uppercase;
        letter-spacing: 0.3px;
    }

    input {
        width: 100%;
        padding: 0.975rem 1.125rem;
        border-radius: 12px;
        border: 2px solid var(--border);
        font-size: 0.95rem;
        transition: var(--transition);
        background: #f8f9fa;
        font-family: inherit;
    }

    input:focus {
        outline: none;
        border-color: var(--primary-light);
        background: white;
        box-shadow: 0 0 0 5px rgba(123, 44, 191, 0.12);
        transform: translateY(-2px);
    }

    input::placeholder {
        color: #adb5bd;
    }

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

    input.error {
        border-color: #dc3545;
        background: #fff5f5;
    }

    /* ===== SUBMIT BUTTON ===== */
    .submit-btn {
        width: 100%;
        padding: 1.125rem 2rem;
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
        margin-top: 1rem;
    }

    .submit-btn::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: rgba(255, 255, 255, 0.2);
        transition: var(--transition);
    }

    .submit-btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 12px 36px rgba(91, 24, 154, 0.4);
    }

    .submit-btn:hover::before {
        left: 100%;
    }

    .submit-btn:active {
        transform: translateY(-1px);
    }

    /* ===== FORM FOOTER ===== */
    .form-footer {
        margin-top: 2.5rem;
        padding-top: 1.75rem;
        border-top: 2px solid #f0f0f0;
        text-align: center;
    }

    .form-footer p {
        color: var(--text-light);
        font-size: 0.95rem;
        font-weight: 500;
    }

    .form-footer a {
        color: var(--primary-light);
        text-decoration: none;
        font-weight: 700;
        transition: var(--transition);
        position: relative;
    }

    .form-footer a::after {
        content: '';
        position: absolute;
        bottom: -2px;
        left: 0;
        width: 0;
        height: 2px;
        background: var(--primary-light);
        transition: var(--transition);
    }

    .form-footer a:hover {
        color: var(--primary);
    }

    .form-footer a:hover::after {
        width: 100%;
    }

    /* ===== FORGOT PASSWORD LINK ===== */
    .forgot-password {
        text-align: right;
        margin-top: -1rem;
        margin-bottom: 1.5rem;
    }

    .forgot-password a {
        font-size: 0.875rem;
        color: var(--primary-light);
        text-decoration: none;
        font-weight: 600;
        transition: var(--transition);
        position: relative;
    }

    .forgot-password a::after {
        content: '';
        position: absolute;
        bottom: -2px;
        left: 0;
        width: 0;
        height: 2px;
        background: var(--primary-light);
        transition: var(--transition);
    }

    .forgot-password a:hover {
        color: var(--primary);
    }

    .forgot-password a:hover::after {
        width: 100%;
    }

    /* ===== REMEMBER ME ===== */
    .form-group.checkbox {
        display: flex;
        align-items: center;
        margin-bottom: 1.75rem;
    }

    .form-group.checkbox input {
        width: 20px;
        height: 20px;
        margin-right: 0.75rem;
        cursor: pointer;
        accent-color: var(--primary-light);
    }

    .form-group.checkbox label {
        margin-bottom: 0;
        margin: 0;
        font-size: 0.9rem;
        cursor: pointer;
        text-transform: none;
        letter-spacing: normal;
    }

    /* ===== RESPONSIVE ===== */
    @media (max-width: 992px) {
        .container {
            grid-template-columns: 1fr;
            gap: 2rem;
        }

        .sidebar {
            position: static;
        }

        .form-card {
            padding: 2.5rem;
        }

        .form-title {
            font-size: 1.875rem;
        }
    }

    @media (max-width: 768px) {
        body {
            padding: 1.5rem 1rem;
        }

        .form-card {
            padding: 2rem;
            border-radius: 24px;
        }

        .form-title {
            font-size: 1.625rem;
        }

        .logo-card {
            padding: 2rem;
        }

        .logo-card img {
            width: 120px;
        }

        .sidebar {
            gap: 1.25rem;
        }

        .info-card {
            padding: 1.75rem;
        }

        .info-card h3 {
            font-size: 1.125rem;
        }

        .info-card li {
            padding: 0.75rem 0;
            font-size: 0.9rem;
        }
    }

    @media (max-width: 640px) {
        body {
            padding: 1rem;
        }

        .container {
            gap: 1.5rem;
        }

        .form-card {
            padding: 1.5rem;
            border-radius: 20px;
        }

        .form-title {
            font-size: 1.5rem;
        }

        .form-subtitle {
            font-size: 0.9rem;
        }

        label {
            font-size: 0.8rem;
        }

        input {
            padding: 0.875rem 1rem;
            font-size: 0.9rem;
        }

        .submit-btn {
            padding: 1rem 1.5rem;
            font-size: 0.95rem;
        }

        .logo-card {
            padding: 1.5rem;
        }

        .logo-card img {
            width: 100px;
            margin-bottom: 1rem;
        }

        .logo-card h2 {
            font-size: 1.1rem;
        }

        .info-card {
            padding: 1.5rem;
        }

        .info-card h3 {
            font-size: 1rem;
            margin-bottom: 1rem;
        }

        .info-card li {
            padding: 0.625rem 0;
            font-size: 0.85rem;
        }

        .info-card li::before {
            width: 24px;
            height: 24px;
        }

        .info-card .cta {
            padding: 1rem;
            font-size: 0.9rem;
        }

        .form-footer p {
            font-size: 0.9rem;
        }

        .form-footer a {
            font-size: 0.95rem;
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
  .form-card {
		    background: #ffffff;                 /* keep form white */
		    border-radius: 32px;
		    padding: 3.5rem;
		
		    /* PURPLE BORDER */
		    border: 2px solid #7b2cbf;
		
		    /* SOFT PURPLE GLOW */
		    box-shadow:
		        0 0 0 1px rgba(123, 44, 191, 0.25),
		        0 12px 35px rgba(123, 44, 191, 0.35);
		
		    animation: slideInRight 0.8s ease-out;
		}

</style>
</head>

<body>


<%
    String error = request.getParameter("error");
%>

<div class="container">

    <!-- ===== LEFT SIDEBAR ===== -->
    <aside class="sidebar">
        <div class="logo-card">
        <img src="<%=request.getContextPath()%>/images/dreams-soft-logo.jpeg" alt="Dreams Soft Solutions Logo">
        
            <h2>Dreams Soft Solutions</h2>
        </div>

        <div class="info-card">
            <h3>Welcome Back</h3>
            <ul>
                <li>Secure Seller Login</li>
                <li>Trusted Platform</li>
                <li>Fast Access</li>
                <li>Manage Your Business</li>
            </ul>
            <div class="cta">Login to Continue</div>
        </div>
    </aside>

    <!-- ===== FORM CARD ===== -->
    <main class="form-card">
        <div class="form-header">
            <h1 class="form-title">Seller Login</h1>
            <div class="divider"></div>
            <p class="form-subtitle">Access your seller dashboard and manage your business</p>
            <%
String success = request.getParameter("success");
%>

<% if ("reset".equals(success)) { %>
    <div class="success-box">
        Password reset successful. Please login.
    </div>
<% } %>
            
        </div>

        <!-- ✅ SUCCESS MESSAGE (ADD HERE) -->
    <% if ("onboarded".equals(request.getParameter("success"))) { %>
        <div class="success-box">
            Bank details are saved successfully
        </div>
    <% } %>

        <!-- ===== ERROR MESSAGES ===== -->
       
        <% if ("invalid".equals(error)) { %>
    <div class="error-box">
        Invalid email or password
    </div>
<% } %>
        

        <!-- ===== LOGIN FORM ===== -->
        <form action="LoginServlet" method="post" id="loginForm">
   	    <input type="hidden" name="from"  value="<%= request.getParameter("from") != null ? request.getParameter("from"): "login" %>">
            <div class="form-group">
                <label for="Email">Email</label>
                <input 
                    type="email" 
                    id="email"
                    name="email" 
                    placeholder="Enter your Email address"
                    required
                    autocomplete="off"
                >
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input 
                    type="password" 
                    id="password"
                    name="password" 
                    placeholder="Enter your password"
                    required
                    autocomplete="new-password"
                >
            </div>

            <div class="form-group checkbox">
                <input 
                    type="checkbox" 
                    id="remember" 
                    name="remember"
                >
                <label for="remember">Remember me</label>
            </div>

            <button type="submit" class="submit-btn">
                Login
                <span>→</span>
            </button>
        </form>

        <!-- ===== FORM FOOTER ===== -->
        <div class="form-footer">
            <div class="forgot-password">
                <a href="forgot-password.jsp">Forgot Password?</a>
            </div>
            <p>
                Don't have an account? 
                <a href="register.jsp">Register here</a>
            </p>
        </div>
    </main>

</div>

<script>
    // ===== FORM VALIDATION =====
    const form = document.getElementById('loginForm');
    
    

    function showValidationError(message) {
        const messageDiv = document.createElement('div');
        messageDiv.className = 'error-box';
        messageDiv.textContent = message;
        
        const formHeader = document.querySelector('.form-header');
        if (formHeader.nextElementSibling?.className === 'error-box') {
            formHeader.nextElementSibling.remove();
        }
        formHeader.insertAdjacentElement('afterend', messageDiv);
        
        setTimeout(() => messageDiv.remove(), 4000);
    }

    // ===== FOCUS ANIMATIONS =====
    document.querySelectorAll('input').forEach(input => {
        input.addEventListener('focus', function() {
            this.parentElement.style.transform = 'scale(1.01)';
        });
        input.addEventListener('blur', function() {
            this.parentElement.style.transform = 'scale(1)';
        });
    });

    // ===== CAPS LOCK DETECTION =====
    document.getElementById('password').addEventListener('keypress', function(e) {
        const capsLock = e.getModifierState('CapsLock');
        const hint = document.querySelector('.caps-lock-hint');
        
        if (capsLock) {
            if (!hint) {
                const newHint = document.createElement('div');
                newHint.className = 'input-hint caps-lock-hint';
                newHint.innerHTML = '⚠ Caps Lock is ON';
                this.parentElement.appendChild(newHint);
            }
        } else {
            if (hint) hint.remove();
        }
    });
 // Auto hide success & error messages after 5 seconds
    setTimeout(function() {
        document.querySelectorAll('.error-box, .success-box').forEach(function(el) {
            el.style.transition = "opacity 0.5s ease";
            el.style.opacity = "0";
            setTimeout(() => el.remove(), 500);
        });
    }, 5000);

</script>

</body>
</html>