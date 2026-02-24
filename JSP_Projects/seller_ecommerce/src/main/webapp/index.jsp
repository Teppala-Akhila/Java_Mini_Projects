<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ElectroSeller - Sell Electronics Smarter</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Inter', sans-serif;
}

body {
    background: #FAFBFC;
    min-height: 100vh;
    overflow-x: hidden;
}

/* ===== NAVBAR ===== */
.navbar {
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(10px);
    color: #1a1a1a;
    padding: 18px 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: sticky;
    top: 0;
    z-index: 1000;
    box-shadow: 0 1px 3px rgba(0,0,0,0.06);
    border-bottom: 1px solid rgba(0,0,0,0.05);
}

.logo {
    font-size: 24px;
    font-weight: 800;
    background: linear-gradient(135deg, #6B2C91 0%, #9C4DC5 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    letter-spacing: -0.5px;
    flex: 1;
}

.nav-menu {
    display: flex;
    gap: 30px;
    align-items: center;
    font-size: 14px;
    flex: 2;
    justify-content: center;
}

.nav-auth {
    display: flex;
    gap: 16px;
    align-items: center;
    flex: 1;
    justify-content: flex-end;
}

.nav-auth .login-btn {
    background: transparent;
    color: #6B2C91;
    border: 2px solid #6B2C91;
    padding: 10px 24px;
    border-radius: 25px;
    font-weight: 600;
    text-decoration: none;
    transition: all 0.3s;
    font-size: 14px;
}

.nav-auth .login-btn:hover {
    background: #6B2C91;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(107, 44, 145, 0.3);
}

.nav-auth .signup-btn {
    background: linear-gradient(135deg, #6B2C91 0%, #9C4DC5 100%);
    color: white;
    border: none;
    padding: 10px 24px;
    border-radius: 25px;
    font-weight: 600;
    text-decoration: none;
    box-shadow: 0 4px 15px rgba(107, 44, 145, 0.3);
    transition: all 0.3s;
    font-size: 14px;
}

.nav-auth .signup-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(107, 44, 145, 0.4);
}

.nav-menu a {
    color: #4a4a4a;
    text-decoration: none;
    padding: 8px 12px;
    font-weight: 500;
    transition: all 0.3s;
    position: relative;
}

.nav-menu a:hover {
    color: #6B2C91;
}

.nav-menu a::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 0;
    height: 2px;
    background: #6B2C91;
    transition: width 0.3s;
}

.nav-menu a:hover::after {
    width: 80%;
}

.nav-menu .signup-btn {
    background: linear-gradient(135deg, #6B2C91 0%, #9C4DC5 100%);
    color: white;
    padding: 10px 24px;
    border-radius: 25px;
    font-weight: 600;
    box-shadow: 0 4px 15px rgba(107, 44, 145, 0.3);
    transition: all 0.3s;
}

.nav-menu .signup-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(107, 44, 145, 0.4);
}

.nav-menu .signup-btn::after {
    display: none;
}

/* ===== HERO SECTION ===== */
.hero-section {
    background: linear-gradient(135deg, #7B3AA0 0%, #9C4DC5 50%, #B85FD9 100%);
    color: white;
    padding: 80px 40px;
    display: flex;
    flex-direction: column;
    gap: 50px;
    position: relative;
    overflow: hidden;
}

.hero-section::before {
    content: '';
    position: absolute;
    top: -50%;
    right: -20%;
    width: 600px;
    height: 600px;
    background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
    border-radius: 50%;
}

.hero-section::after {
    content: '';
    position: absolute;
    bottom: -30%;
    left: -10%;
    width: 500px;
    height: 500px;
    background: radial-gradient(circle, rgba(255,255,255,0.08) 0%, transparent 70%);
    border-radius: 50%;
}

.hero-content {
    flex: 1;
    position: relative;
    z-index: 1;
}

.hero-content h1 {
    font-size: 56px;
    font-weight: 900;
    line-height: 1.2;
    margin-bottom: 24px;
    letter-spacing: -1.5px;
}

.hero-content p {
    font-size: 20px;
    line-height: 1.6;
    opacity: 0.95;
    margin-bottom: 36px;
    max-width: 600px;
    font-weight: 300;
}

.start-btn {
    background: white;
    color: #6B2C91;
    border: none;
    padding: 18px 48px;
    border-radius: 30px;
    font-weight: 700;
    font-size: 16px;
    cursor: pointer;
    display: inline-block;
    box-shadow: 0 10px 30px rgba(0,0,0,0.2);
    transition: all 0.3s;
}

.start-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 15px 40px rgba(0,0,0,0.25);
}

.hero-image {
     width: 100%;
    max-width: 550px;
 overflow: hidden;
  padding: 14px; 
    height: 340px;              /* 🔑 FIXED HEIGHT */
    position: relative;
     border-radius: 28px; 
}

.hero-image img {
    width: 100%;
    box-shadow: 0 20px 60px rgba(0,0,0,0.4);
    transition: transform 0.3s;
}

.hero-image img:hover {
    transform: scale(1.02);
}

/* ===== SECTION TITLE ===== */
.section-title {
    text-align: center;
    padding: 70px 20px 40px;
    background: #FAFBFC;
}

.section-title h2 {
    font-size: 42px;
    font-weight: 800;
    background: linear-gradient(135deg, #6B2C91 0%, #9C4DC5 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    letter-spacing: -1px;
}

/* ===== POPULAR CATEGORIES ===== */
.categories-section {
    padding: 0 40px 80px;
    background: #FAFBFC;
}

.categories-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 30px;
    max-width: 1200px;
    margin: 0 auto;
}

.category-card {
    background: white;
    border-radius: 20px;
    padding: 0;
    text-align: center;
    box-shadow: 0 4px 20px rgba(0,0,0,0.06);
    cursor: pointer;
    transition: all 0.4s;
    overflow: hidden;
    border: 1px solid rgba(0,0,0,0.05);
}

.category-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 12px 40px rgba(107, 44, 145, 0.2);
}

.category-card img {
    width: 100%;
    height: 220px;
    object-fit: cover;
    transition: transform 0.4s;
}

.category-card:hover img {
    transform: scale(1.08);
}

.category-card h3 {
    font-size: 18px;
    font-weight: 700;
    color: #6B2C91;
    padding: 24px;
}

/* ===== FEATURES SECTION ===== */
.features-section {
    padding: 80px 40px;
    background: white;
}

.features-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
    gap: 40px;
    max-width: 1200px;
    margin: 0 auto;
}

.feature-card {
    background: linear-gradient(135deg, #FAFBFC 0%, #F5F2F8 100%);
    border-radius: 24px;
    padding: 44px 32px;
    text-align: center;
    transition: all 0.4s;
    border: 1px solid rgba(107, 44, 145, 0.08);
}

.feature-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 15px 50px rgba(107, 44, 145, 0.15);
    background: white;
}

.feature-icon {
    width: 90px;
    height: 90px;
    background: linear-gradient(135deg, #6B2C91 0%, #9C4DC5 100%);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 28px;
    font-size: 42px;
    box-shadow: 0 8px 25px rgba(107, 44, 145, 0.3);
    transition: all 0.4s;
}

.feature-card:hover .feature-icon {
    transform: scale(1.1) rotate(5deg);
}

.feature-card h3 {
    font-size: 22px;
    font-weight: 800;
    color: #2a2a2a;
    margin-bottom: 16px;
}

.feature-card p {
    font-size: 15px;
    line-height: 1.7;
    color: #666;
}

/* ===== HOW IT WORKS SECTION ===== */
.how-section {
    padding: 80px 40px 100px;
    background: linear-gradient(180deg, #F7F4FA, #FAF7FC);
    position: relative;
}

.how-title {
    font-size: 42px;
    font-weight: 900;
    background: linear-gradient(135deg, #6B2C91 0%, #9C4DC5 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    margin-bottom: 60px;
    text-align: center;
    letter-spacing: -1px;
}

.how-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 50px;
    max-width: 1200px;
    margin: 0 auto;
    position: relative;
}

.how-grid::before {
    content: '';
    position: absolute;
    top: 40px;
    left: 16%;
    right: 16%;
    height: 3px;
    background: linear-gradient(90deg, #6B2C91, #9C4DC5, #6B2C91);
    z-index: 0;
    opacity: 0.2;
}

.how-card {
    background: white;
    border-radius: 28px;
    padding: 50px 36px;
    text-align: center;
    box-shadow: 0 10px 40px rgba(0, 0, 0, 0.08);
    transition: all 0.4s;
    position: relative;
    z-index: 1;
    border: 2px solid rgba(107, 44, 145, 0.1);
}

.how-card:hover {
    transform: translateY(-12px);
    box-shadow: 0 20px 60px rgba(107, 44, 145, 0.2);
    border-color: #9C4DC5;
}

.step-circle {
    width: 90px;
    height: 90px;
    background: linear-gradient(135deg, #6B2C91 0%, #9C4DC5 100%);
    color: white;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 38px;
    font-weight: 900;
    margin: 0 auto 32px;
    box-shadow: 0 12px 30px rgba(107, 44, 145, 0.4);
    transition: all 0.4s;
}

.how-card:hover .step-circle {
    transform: scale(1.15) rotate(360deg);
}

.how-card h3 {
    font-size: 24px;
    font-weight: 800;
    color: #2a2a2a;
    margin-bottom: 18px;
}

.how-card p {
    font-size: 16px;
    line-height: 1.8;
    color: #666;
}

/* ===== REGISTRATION FORM ===== */
.registration-section {
    padding: 80px 40px;
    background: linear-gradient(135deg, #7B3AA0 0%, #9C4DC5 100%);
}

.registration-form {
    max-width: 600px;
    margin: 0 auto;
    background: white;
    padding: 50px 45px;
    border-radius: 28px;
    box-shadow: 0 20px 60px rgba(0,0,0,0.3);
}

.form-title {
    font-size: 32px;
    font-weight: 800;
    color: #2a2a2a;
    margin-bottom: 12px;
    text-align: center;
}

.form-subtitle {
    font-size: 15px;
    color: #666;
    text-align: center;
    margin-bottom: 36px;
}

.form-group {
    margin-bottom: 24px;
}

.form-group label {
    display: block;
    margin-bottom: 10px;
    color: #2a2a2a;
    font-weight: 700;
    font-size: 14px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.form-group input,
.form-group select,
.form-group textarea {
    width: 100%;
    padding: 16px 18px;
    border: 2px solid #E8E3F0;
    border-radius: 14px;
    font-size: 15px;
    transition: all 0.3s;
    background: #FAFBFC;
    font-family: inherit;
}

.form-group input:focus,
.form-group select:focus,
.form-group textarea:focus {
    outline: none;
    border-color: #9C4DC5;
    background: white;
    box-shadow: 0 0 0 4px rgba(156, 77, 197, 0.1);
}

.form-group textarea {
    resize: vertical;
    min-height: 120px;
}

.form-actions {
    display: flex;
    gap: 16px;
    margin-top: 32px;
}

.btn-submit,
.btn-reset {
    flex: 1;
    padding: 16px 32px;
    border: none;
    border-radius: 14px;
    font-weight: 700;
    font-size: 16px;
    cursor: pointer;
    transition: all 0.3s;
}

.btn-submit {
    background: linear-gradient(135deg, #6B2C91 0%, #9C4DC5 100%);
    color: white;
    box-shadow: 0 8px 20px rgba(107, 44, 145, 0.3);
}

.btn-submit:hover {
    transform: translateY(-3px);
    box-shadow: 0 12px 30px rgba(107, 44, 145, 0.4);
}

.btn-reset {
    background: #F0F0F0;
    color: #666;
}

.btn-reset:hover {
    background: #E0E0E0;
    color: #333;
}

/* ===== FOOTER ===== */
.footer {
    background: linear-gradient(135deg, #5A2275 0%, #6B2C91 100%);
    color: white;
    padding: 60px 40px 30px;
}

.footer-content {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 40px;
    max-width: 1200px;
    margin: 0 auto 40px;
}

.footer-section h3 {
    margin-bottom: 20px;
    font-size: 18px;
    color: white;
    font-weight: 800;
}

.footer-section ul {
    list-style: none;
}

.footer-section ul li {
    margin-bottom: 12px;
}

.footer-section ul li a {
    color: rgba(255,255,255,0.9);
    text-decoration: none;
    font-size: 14px;
    transition: all 0.3s;
    display: inline-block;
}

.footer-section ul li a:hover {
    color: white;
    transform: translateX(5px);
}

.footer-bottom {
    text-align: center;
    padding-top: 30px;
    border-top: 1px solid rgba(255,255,255,0.15);
    color: rgba(255,255,255,0.85);
    font-size: 14px;
    font-weight: 500;
}

/* ===== NOTIFICATION ===== */
.notification {
    position: fixed;
    top: -100px;
    right: 30px;
    background: white;
    padding: 18px 26px;
    border-radius: 16px;
    box-shadow: 0 10px 40px rgba(0,0,0,0.2);
    display: flex;
    align-items: center;
    gap: 14px;
    z-index: 3000;
    transition: all 0.4s cubic-bezier(0.68, -0.55, 0.265, 1.55);
    border-left: 5px solid #4CAF50;
}

.notification.show {
    top: 30px;
}

.notification.error {
    border-left-color: #f44336;
}

.notification-icon {
    width: 32px;
    height: 32px;
    background: #4CAF50;
    color: white;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    font-size: 16px;
    flex-shrink: 0;
}

.notification.error .notification-icon {
    background: #f44336;
}

#notificationText {
    color: #333;
    font-weight: 600;
    font-size: 14px;
}

/* ===== RESPONSIVE ===== */
@media (max-width: 900px) {
    .hero-content h1 {
        font-size: 42px;
    }
    
    .how-grid {
        grid-template-columns: 1fr;
        gap: 40px;
    }
    
    .how-grid::before {
        display: none;
    }
    
    .categories-grid {
        grid-template-columns: repeat(2, 1fr);
    }
    
    .navbar {
        flex-wrap: wrap;
    }
    
    .nav-menu {
        order: 3;
        flex: 100%;
        justify-content: center;
        margin-top: 12px;
        gap: 20px;
    }
}

@media (max-width: 600px) {
    .navbar {
        padding: 16px 20px;
    }
    
    .hero-content h1 {
        font-size: 36px;
    }
    
    .hero-content p {
        font-size: 16px;
    }
    
    .section-title h2,
    .how-title {
        font-size: 32px;
    }
    
    .categories-grid {
        grid-template-columns: 1fr;
    }
    
    .nav-menu {
        font-size: 12px;
        gap: 12px;
    }
    
    .nav-menu a {
        padding: 6px 8px;
    }
    
    .nav-auth {
        gap: 10px;
    }
    
    .nav-auth .login-btn,
    .nav-auth .signup-btn {
        padding: 8px 18px;
        font-size: 13px;
    }
    
    .registration-form {
        padding: 35px 25px;
    }
}

@media (min-width: 901px) {
    .hero-section {
        flex-direction: row;
        align-items: center;
        padding: 100px 60px;
    }
    
    .hero-content {
        max-width: 600px;
    }
    
    .hero-image {
        max-width: 550px;
    }
}

/* ===== ANIMATIONS ===== */
@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.hero-content,
.hero-image {
    animation: fadeInUp 0.8s ease-out;
}

.slider {
    position: relative;
    overflow: hidden;
}

.slider .slide {
    position: absolute;
    inset: 0;                  /* top, right, bottom, left = 0 */
    width: 100%;
    height: 100%;
 border-radius: 20px;
    object-fit: cover;         /* fills box, no height change */
    object-position: center;

    opacity: 0;
    transition: opacity 0.6s ease-in-out;
}

.slider .slide.active {
    opacity: 1;
}

/* dots */
.slider-dots {
    position: absolute;
    bottom: 16px;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    gap: 10px;
}

.slider-dots .dot {
    width: 9px;
    height: 9px;
    background: rgba(255,255,255,0.6);
    border-radius: 50%;
    cursor: pointer;
}

.slider-dots .dot.active {
    background: #fff;
    transform: scale(1.2);
}
</style>
</head>
<body>
<%
Integer sellerId = (Integer) session.getAttribute("sellerId");
String userName = (String) session.getAttribute("userName");
%>

<!-- NAVBAR -->
<div class="navbar">
    
    <div class="logo">ElectroSeller</div>
    
    <div class="nav-menu">
        <a href="<%= (sellerId != null) 
                    ? "sellerdashboard.jsp" 
                    : "login.jsp?from=dashboard" %>">
            Dashboard
        </a>
        <a href="#orders">Orders</a>
        <a href="#help">Help</a>
        <a href="#support">Support</a>
    </div>

    <!-- AUTH SECTION -->
    <div class="nav-auth">
    <% if (sellerId != null) { %>

        <span style="font-weight:700;color:#6B2C91;">
            Welcome, <%= userName %>
        </span>

        <a href="sellerdashboard.jsp" class="login-btn">
            Dashboard
        </a>

        <a href="logout" class="signup-btn">
            Logout
        </a>

    <% } else { %>

        <a href="login.jsp?from=login" class="login-btn">Login</a>
        <a href="register.jsp" class="signup-btn">Register</a>

    <% } %>
    </div>

</div>

<!-- HERO SECTION -->
<div class="hero-section">
    <div class="hero-content">
        <h1>Sell Electronics Smarter</h1>
        <p>Grow your electronics business with mobiles, laptops, cameras & appliances. Join thousands of successful sellers.</p>
        <button class="start-btn" onclick="scrollToRegister()">Start Selling Today</button>
    </div>
    <div class="hero-image slider">
    <img src="https://images.unsplash.com/photo-1556656793-08538906a9f8" class="slide active">
    <img src="https://images.unsplash.com/photo-1511707171634-5f897ff02aa9" class="slide">
    <img src="https://images.unsplash.com/photo-1516035069371-29a1b244cc32" class="slide">
    <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e" class="slide">

    <div class="slider-dots">
        <span class="dot active"></span>
        <span class="dot"></span>
        <span class="dot"></span>
        <span class="dot"></span>
    </div>
</div>
    
</div>

<!-- POPULAR CATEGORIES -->
<div class="section-title">
    <h2>Popular Categories</h2>
</div>

<div class="categories-section">
    <div class="categories-grid">
        <div class="category-card" onclick="showNotification('Mobiles category selected', 'success')">
            <img src="https://images.unsplash.com/photo-1511707171634-5f897ff02aa9" alt="Mobiles">
            <h3>Mobiles & Smartphones</h3>
        </div>
        
        <div class="category-card" onclick="showNotification('Laptops category selected', 'success')">
            <img src="https://laptopmedia.com/wp-content/uploads/2022/07/3-1.jpg" alt="Laptops">
            <h3>Laptops & Computers</h3>
        </div>
        
        <div class="category-card" onclick="showNotification('Cameras category selected', 'success')">
            <img src="https://images.unsplash.com/photo-1516035069371-29a1b244cc32" alt="Cameras">
            <h3>Cameras & Photography</h3>
        </div>
        
        <div class="category-card" onclick="showNotification('TVs category selected', 'success')">
            <img src="https://images.unsplash.com/photo-1593359677879-a4bb92f829d1" alt="TVs">
            <h3>Smart TVs</h3>
        </div>
        
        <div class="category-card" onclick="showNotification('Washing Machines category selected', 'success')">
            <img src="https://images.unsplash.com/photo-1626806787461-102c1bfaaea1" alt="Washing Machines">
            <h3>Home Appliances</h3>
        </div>
        
        <div class="category-card" onclick="showNotification('Audio category selected', 'success')">
            <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e" alt="Audio">
            <h3>Audio & Headphones</h3>
        </div>
    </div>
</div>

<!-- FEATURES SECTION -->
<div class="section-title">
    <h2>Why Choose ElectroSeller?</h2>
</div>

<div class="features-section">
    <div class="features-grid">
        <div class="feature-card">
            <div class="feature-icon">🚚</div>
            <h3>Fast Delivery</h3>
            <p>Get your products delivered quickly with our express shipping options nationwide.</p>
        </div>
        
        <div class="feature-card">
            <div class="feature-icon">🔒</div>
            <h3>Secure Payment</h3>
            <p>100% secure transactions with multiple payment options and buyer protection.</p>
        </div>
        
        <div class="feature-card">
            <div class="feature-icon">💰</div>
            <h3>Best Prices</h3>
            <p>Competitive pricing and regular deals on top electronic brands to maximize profits.</p>
        </div>
        
        <div class="feature-card">
            <div class="feature-icon">⭐</div>
            <h3>Quality Products</h3>
            <p>100% authentic products with manufacturer warranty included on all items.</p>
        </div>
        
        <div class="feature-card">
            <div class="feature-icon">🎯</div>
            <h3>Expert Support</h3>
            <p>24/7 dedicated customer service to help with all your queries and concerns.</p>
        </div>
        
        <div class="feature-card">
            <div class="feature-icon">🔄</div>
            <h3>Easy Returns</h3>
            <p>Hassle-free returns within 30 days of purchase with full refund guarantee.</p>
        </div>
    </div>
</div>

<!-- HOW IT WORKS -->
<div class="how-section">
    <h2 class="how-title">How It Works</h2>

    <div class="how-grid">
        <div class="how-card">
            <div class="step-circle">1</div>
            <h3>Register as Seller</h3>
            <p>
                Sign up with your business details and verify your account in just a few minutes
            </p>
        </div>

        <div class="how-card">
            <div class="step-circle">2</div>
            <h3>List Your Products</h3>
            <p>
                Add your electronics inventory with photos, competitive prices, and detailed descriptions
            </p>
        </div>

        <div class="how-card">
            <div class="step-circle">3</div>
            <h3>Start Selling & Get Paid</h3>
            <p>
                Receive orders, ship products, and get paid quickly and securely to your account
            </p>
        </div>
    </div>
</div>

<!-- REGISTRATION FORM -->
<div class="registration-section" id="register">
    <form class="registration-form" id="registrationForm">
        <h2 class="form-title">Start Selling Today</h2>
        <p class="form-subtitle">Join our platform and reach millions of customers</p>
        
        <div class="form-group">
            <label for="sellerName">Your Name</label>
            <input type="text" id="sellerName" name="sellerName" placeholder="Enter your full name" required>
        </div>
        
        <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" placeholder="your.email@example.com" required>
        </div>
        
        <div class="form-group">
            <label for="phone">Phone Number</label>
            <input type="tel" id="phone" name="phone" placeholder="+91 1234567890" required>
        </div>
        
        <div class="form-group">
            <label for="description">Business Description</label>
            <textarea id="description" name="description" placeholder="Tell us about your business..."></textarea>
        </div>
        
        <div class="form-group">
            <label for="issues">Issues or Queries</label>
            <textarea id="issues" name="issues" placeholder="Any questions, concerns, or issues you'd like to discuss..."></textarea>
        </div>
        
        <div class="form-actions">
            <button type="submit" class="btn-submit">Register Now</button>
            <button type="reset" class="btn-reset">Clear Form</button>
        </div>
    </form>
</div>

<!-- FOOTER -->
<div class="footer">
    <div class="footer-content">
        <div class="footer-section">
            <h3>About Us</h3>
            <ul>
                <li><a href="#about">Our Story</a></li>
                <li><a href="#careers">Careers</a></li>
                <li><a href="#press">Press</a></li>
                <li><a href="#blog">Blog</a></li>
            </ul>
        </div>
        
        <div class="footer-section">
            <h3>For Sellers</h3>
            <ul>
                <li><a href="#sell">Start Selling</a></li>
                <li><a href="#seller-guide">Seller Guide</a></li>
                <li><a href="#fees">Fee Structure</a></li>
                <li><a href="#success">Success Stories</a></li>
            </ul>
        </div>
        
        <div class="footer-section">
            <h3>Support</h3>
            <ul>
                <li><a href="#help">Help Center</a></li>
                <li><a href="#contact">Contact Us</a></li>
                <li><a href="#faq">FAQ</a></li>
                <li><a href="#shipping">Shipping Info</a></li>
            </ul>
        </div>
        
        <div class="footer-section">
            <h3>Legal</h3>
            <ul>
                <li><a href="#terms">Terms of Service</a></li>
                <li><a href="#privacy">Privacy Policy</a></li>
                <li><a href="#cookies">Cookie Policy</a></li>
                <li><a href="#disclaimer">Disclaimer</a></li>
            </ul>
        </div>
    </div>
    
    <div class="footer-bottom">
        © 2026 ElectroSeller | All Rights Reserved | Empowering Sellers Nationwide
    </div>
</div>

<!-- NOTIFICATION -->
<div class="notification" id="notification">
    <span class="notification-icon">✓</span>
    <span id="notificationText"></span>
</div>

<script>
// ===== FORM HANDLING =====
document.getElementById('registrationForm')
.addEventListener('submit', function(e) {
    e.preventDefault();

    const sellerName = document.getElementById('sellerName').value.trim();
    const email = document.getElementById('email').value.trim();
    const phone = document.getElementById('phone').value.trim();
    const description = document.getElementById('description').value.trim();
    const issues = document.getElementById('issues').value.trim();

    if (!sellerName || !email || !phone) {
        showNotification('Please fill in all required fields', 'error');
        return;
    }

    showNotification(
        'Registration successful! Welcome ' + sellerName + '!',
        'success'
    );

    setTimeout(() => {
        this.reset();
    }, 2000);
});

// ===== NAVIGATION =====
function scrollToRegister() {
    document.getElementById('register').scrollIntoView({ behavior: 'smooth' });
}

// ===== NOTIFICATIONS =====
function showNotification(message, type) {
    const notification = document.getElementById('notification');
    const notificationText = document.getElementById('notificationText');
    
    notificationText.textContent = message;
    notification.className = `notification ${type} show`;
    
    setTimeout(() => {
        notification.classList.remove('show');
    }, 3500);
}

// ===== SMOOTH SCROLL =====
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({ behavior: 'smooth' });
        }
    });
});

// ===== SCROLL ANIMATIONS =====
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
};

const observer = new IntersectionObserver(function(entries) {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.opacity = '1';
            entry.target.style.transform = 'translateY(0)';
        }
    });
}, observerOptions);

// Apply animation to cards
setTimeout(() => {
    document.querySelectorAll('.category-card, .feature-card, .how-card').forEach(card => {
        card.style.opacity = '0';
        card.style.transform = 'translateY(30px)';
        card.style.transition = 'all 0.6s ease-out';
        observer.observe(card);
    });
}, 100);


/* ===== REAL HERO SLIDER ===== */
const slides = document.querySelectorAll(".slider .slide");
const dots = document.querySelectorAll(".slider-dots .dot");

let current = 0;

function showSlide(index) {
    slides.forEach((slide, i) => {
        slide.classList.toggle("active", i === index);
        dots[i].classList.toggle("active", i === index);
    });
    current = index;
}

// auto slide
setInterval(() => {
    let next = (current + 1) % slides.length;
    showSlide(next);
}, 2000);

// dot click
dots.forEach((dot, index) => {
    dot.addEventListener("click", () => {
        showSlide(index);
    });
});



</script>

</body>
</html>