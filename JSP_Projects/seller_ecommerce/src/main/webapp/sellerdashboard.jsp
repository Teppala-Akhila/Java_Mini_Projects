<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.RegisterModel" %>
<%@ page import="java.util.*" %>
<%@ page import="com.dao.AddProductDAO" %>
<%
    // ===== SESSION CHECK =====
    HttpSession userSession = request.getSession(false);
    boolean isLoggedIn = false;
    String displayName = "User";
    String userEmail = "";
    Integer sellerId = null;
    
    if (userSession != null) {
        sellerId = (Integer) userSession.getAttribute("sellerId");
        
        if (sellerId != null) {
            isLoggedIn = true;
            
            RegisterModel user = (RegisterModel) userSession.getAttribute("user");
            if (user != null && user.getUsername() != null && !user.getUsername().isEmpty()) {
                displayName = user.getUsername();
            } else {
                String username = (String) userSession.getAttribute("username");
                if (username != null && !username.isEmpty()) {
                    displayName = username;
                }
            }
            
            userEmail = (String) userSession.getAttribute("email");
            if ((userEmail == null || userEmail.isEmpty()) && user != null) {
                userEmail = user.getEmail();
            }
            if (userEmail == null) {
                userEmail = "";
            }
        }
    }
    
    // Redirect to login if not logged in
    if (!isLoggedIn) {
        response.sendRedirect("sellerlogin.jsp");
        return;
    }

 // ===== TAB NAVIGATION =====
    String tab = request.getParameter("tab");
    if(tab == null || tab.trim().isEmpty()) tab = "dashboard";

    // ===== VIEW MODE =====
    String view = request.getParameter("view");
    if(view == null || view.trim().isEmpty()){
        view = "list";
    }

    // ===== ACTION =====
    String action = request.getParameter("action");
    if(action == null) action = "";

    // ===== DATABASE FETCH =====
    AddProductDAO dao = new AddProductDAO();
    List<Map<String,Object>> products = dao.getProductsBySeller(sellerId.intValue());

    // ===== SETTINGS SAVE =====
    if("saveSettings".equals(action) && "POST".equalsIgnoreCase(request.getMethod())){
        session.setAttribute("shopName", request.getParameter("shopName"));
        session.setAttribute("supportEmail", request.getParameter("supportEmail"));
        session.setAttribute("supportPhone", request.getParameter("supportPhone"));
        tab = "settings";
    }

    if("deleteProduct".equals(action)){
        String pid = request.getParameter("pid");
        if(pid != null){
            int productDbId = Integer.parseInt(pid);
            dao.deleteProduct(productDbId);
        }
        response.sendRedirect("sellerdashboard.jsp?tab=products&view="+view);
        return;
    }

    // ===== ORDERS LIST =====
    class Order {
        String id,cust,amt,status,date;
        Order(String a,String b,String c,String d,String e){id=a;cust=b;amt=c;status=d;date=e;}
    }
    List<Order> orders = Arrays.asList(
        new Order("#ES1021","Rahul Sharma","₹ 4,999","PAID","10 Feb 2026"),
        new Order("#ES1020","Sneha Patel","₹ 2,450","PENDING","09 Feb 2026"),
        new Order("#ES1019","Kiran Kumar","₹ 1,299","PAID","08 Feb 2026"),
        new Order("#ES1018","Vamsi Krishna","₹ 899","CANCELLED","07 Feb 2026"),
        new Order("#ES1017","Priya Singh","₹ 5,999","PAID","06 Feb 2026")
    );

    // ===== STATS =====
    int totalOrders = 128;
    int productsCount = products.size();
    int pendingShip = 9;
    String revenue = "₹ 92,450";

    // ===== SETTINGS =====
    String shopName = (String) session.getAttribute("shopName"); 
    if(shopName==null) shopName="ElectroSeller";
    String supportEmail = (String) session.getAttribute("supportEmail"); 
    if(supportEmail==null) supportEmail="support@electroseller.com";
    String supportPhone = (String) session.getAttribute("supportPhone"); 
    if(supportPhone==null) supportPhone="+91-XXXXXXXXXX";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><%=shopName%> - Dashboard</title>

<style>
*{margin:0;padding:0;box-sizing:border-box;font-family:Segoe UI, Arial, sans-serif;}
body{background:linear-gradient(135deg,#6B2C91,#9C4DC5);min-height:100vh;}
.wrapper{display:flex;min-height:100vh;}

.sidebar{
  width:260px;background:#fff;padding:22px 18px;
  box-shadow:0 8px 25px rgba(0,0,0,0.18);
}
.brand{font-size:22px;font-weight:900;color:#6B2C91;margin-bottom:18px;}
.userbox{
  background:linear-gradient(135deg,#6B2C91,#9C4DC5);
  color:#fff;padding:14px;border-radius:14px;margin-bottom:18px;
}
.userbox .small{font-size:12px;opacity:.9;}
.userbox .name{font-size:16px;font-weight:800;margin-top:4px;}

.nav a, .nav button{
  width:100%;
  display:flex;align-items:center;gap:10px;
  text-decoration:none;
  padding:12px 12px;border-radius:12px;
  color:#2f2f2f;font-weight:800;margin:6px 0;
  background:#f3f4f6;border:none;cursor:pointer;
  transition:.2s;text-align:left;
}
.nav a:hover, .nav button:hover{background:#e9d5ff;color:#4c1d95;}
.nav .active{background:#6B2C91;color:#fff;}

.main{flex:1;padding:22px;}
.topbar{
  background:#fff;border-radius:16px;padding:14px 18px;
  display:flex;align-items:center;justify-content:space-between;
  box-shadow:0 8px 25px rgba(0,0,0,0.18);
}
.topbar h2{color:#6B2C91;font-size:20px;}
.topbar .right{display:flex;gap:10px;align-items:center;}
.search{
  border:1px solid #e5e7eb;padding:10px 12px;border-radius:999px;
  width:260px;outline:none;
}
.btn{
  border:none;padding:10px 14px;border-radius:999px;
  background:#6B2C91;color:#fff;font-weight:900;cursor:pointer;
}
.btn:hover{background:#5b247b;}
.btn-dark{
  border:none;padding:10px 14px;border-radius:999px;
  background:#111827;color:#fff;font-weight:900;cursor:pointer;
}
.btn-dark:hover{background:#000;}
.btn-green{
  border:none;padding:10px 14px;border-radius:999px;
  background:#16a34a;color:#fff;font-weight:900;cursor:pointer;
}
.btn-green:hover{background:#15803d;}
.btn-red{
  border:none;padding:10px 14px;border-radius:999px;
  background:#dc2626;color:#fff;font-weight:900;cursor:pointer;
}
.btn-red:hover{background:#b91c1c;}
.btn-logout{
  border:none;padding:10px 14px;border-radius:999px;
  background:#dc2626;color:#fff;font-weight:900;cursor:pointer;
  text-decoration:none;
  display:inline-block;
}
.btn-logout:hover{background:#b91c1c;}

.cards{
  margin-top:18px;display:grid;grid-template-columns: repeat(4, 1fr);gap:14px;
}
@media(max-width:1100px){ .cards{grid-template-columns: repeat(2, 1fr);} }
@media(max-width:520px){ .cards{grid-template-columns: 1fr;} }

.card{
  background:#fff;border-radius:16px;padding:16px;
  box-shadow:0 8px 25px rgba(0,0,0,0.18);
}
.card .title{color:#6B2C91;font-weight:900;font-size:14px;}
.card .value{font-size:26px;font-weight:900;color:#111827;margin-top:6px;}
.card .hint{font-size:12px;color:#6b7280;margin-top:6px;}

.grid{
  margin-top:18px;display:grid;grid-template-columns: 1.2fr .8fr;gap:18px;
}
@media(max-width:980px){
  .grid{grid-template-columns:1fr;}
  .search{width:180px;}
  .sidebar{display:none;}
}

.panel{
  background:#fff;border-radius:16px;padding:16px;
  box-shadow:0 8px 25px rgba(0,0,0,0.18);
}
.panel h3{color:#6B2C91;font-size:16px;margin-bottom:10px;}

.tablewrap{overflow:auto;}
table{width:100%;border-collapse:collapse;min-width:560px;}
th, td{padding:12px 10px;border-bottom:1px solid #e5e7eb;text-align:left;font-size:13px;}
th{color:#6B2C91;font-weight:900;background:#faf5ff;}
.badge{display:inline-block;padding:6px 10px;border-radius:999px;font-weight:900;font-size:11px;}
.paid{background:#dcfce7;color:#166534;}
.pending{background:#fef9c3;color:#854d0e;}
.cancel{background:#fee2e2;color:#991b1b;}

.quicklinks{display:grid;grid-template-columns:1fr 1fr;gap:10px;}
.quicklinks button{
  text-decoration:none;background:#f3f4f6;color:#111827;
  font-weight:900;padding:12px;border-radius:14px;text-align:center;
  transition:.2s;border:none;cursor:pointer;
}
.quicklinks button:hover{background:#e9d5ff;color:#4c1d95;}

.footer{text-align:center;padding:18px 8px;color:#fff;opacity:.9;font-size:13px;margin-top:18px;}

.hidden{display:none;}
.modal-bg{
  position:fixed;inset:0;background:rgba(0,0,0,.45);
  display:none;align-items:center;justify-content:center;padding:16px;
}
.modal{
  width:100%;max-width:520px;background:#fff;border-radius:18px;
  padding:16px;box-shadow:0 20px 60px rgba(0,0,0,.35);
}
.modal h3{color:#6B2C91;margin-bottom:10px;}
.field{margin:10px 0;}
.field label{display:block;font-size:12px;font-weight:900;color:#4b5563;margin-bottom:6px;}
.field input{width:100%;padding:10px 12px;border:1px solid #e5e7eb;border-radius:12px;outline:none;}
.row{display:flex;gap:10px;flex-wrap:wrap;align-items:center;margin-top:10px;}
.note{font-size:12px;color:#6b7280;font-weight:800;margin-top:8px;line-height:1.6;}
.tip-card {
    background: #faf5ff;
    border-radius: 14px;
    padding: 14px;
    margin-top: 16px;
}
.tip-title {
    font-weight: 900;
    color: #6B2C91;
    margin-bottom: 8px;
}
.tip-text {
    color: #4b5563;
    font-size: 14px;
}
</style>

<script>
function openModal(){ document.getElementById("modalBg").style.display="flex"; }
function closeModal(){ document.getElementById("modalBg").style.display="none"; }
function goTab(tab){ window.location.href = "sellerdashboard.jsp?tab="+encodeURIComponent(tab); }
</script>

</head>

<body>
<div class="wrapper">

  <!-- SIDEBAR -->
  <aside class="sidebar">
    <div class="brand"><%=shopName%></div>

    <div class="userbox">
      <div class="small">Welcome back</div>
      <div class="name"><%= displayName %></div>
      <div class="small" style="margin-top:6px;"><%= userEmail %></div>
    </div>
    

    <div class="nav">
      <a href="sellerdashboard.jsp?tab=dashboard" class="<%= "dashboard".equals(tab) ? "active" : "" %>">📊 Dashboard</a>
      <a href="sellerdashboard.jsp?tab=myprofile" class="<%= "myprofile".equals(tab) ? "active" : "" %>">👤 My Profile</a>
      <a href="sellerdashboard.jsp?tab=products" class="<%= "products".equals(tab) ? "active" : "" %>">📦 Products</a>
      <a href="sellerdashboard.jsp?tab=orders" class="<%= "orders".equals(tab) ? "active" : "" %>">🧾 Orders</a>
      <a href="sellerdashboard.jsp?tab=shipments" class="<%= "shipments".equals(tab) ? "active" : "" %>">🚚 Shipments</a>
      <a href="sellerdashboard.jsp?tab=customers" class="<%= "customers".equals(tab) ? "active" : "" %>">👥 Customers</a>
      <a href="sellerdashboard.jsp?tab=reports" class="<%= "reports".equals(tab) ? "active" : "" %>">📈 Reports</a>
      <a href="sellerdashboard.jsp?tab=settings" class="<%= "settings".equals(tab) ? "active" : "" %>">⚙️ Settings</a>
    </div>
  </aside>

  <!-- MAIN -->
  <main class="main">

    <!-- TOPBAR -->
    <div class="topbar">
      <h2>
        <%
          if("dashboard".equals(tab)) out.print("Dashboard");
          else if("myprofile".equals(tab)) out.print("My Profile");
          else if("products".equals(tab)) out.print("Products");
          else if("orders".equals(tab)) out.print("Orders");
          else if("shipments".equals(tab)) out.print("Shipments");
          else if("customers".equals(tab)) out.print("Customers");
          else if("reports".equals(tab)) out.print("Reports");
          else if("settings".equals(tab)) out.print("Settings");
        %>
      </h2>

      <div class="right">
        <input class="search" type="text" placeholder="Search (demo only)">
        <button class="btn" type="button" onclick="openModal()">+ Add product</button>
        <a href="<%=request.getContextPath()%>/logout" class="btn-logout">🚪 Logout</a>
      </div>
    </div>

    <!-- STATS (show only on dashboard) -->
    <%
      if("dashboard".equals(tab)){
    %>
    <div class="cards">
      <div class="card">
        <div class="title">Total Orders</div>
        <div class="value"><%= totalOrders %></div>
        <div class="hint">Last 30 days</div>
      </div>
      <div class="card">
        <div class="title">Revenue</div>
        <div class="value"><%= revenue %></div>
        <div class="hint">This month</div>
      </div>
      <div class="card">
        <div class="title">Products</div>
        <div class="value"><%= productsCount %></div>
        <div class="hint">In stock items</div>
      </div>
      <div class="card">
        <div class="title">Pending Shipments</div>
        <div class="value"><%= pendingShip %></div>
        <div class="hint">Need dispatch</div>
      </div>
    </div>

    <div class="grid">
      <!-- LEFT -->
      <section class="panel">
        <h3>Recent Orders</h3>
        <div class="tablewrap">
          <table>
            <thead>
              <tr>
                <th>Order ID</th>
                <th>Customer</th>
                <th>Amount</th>
                <th>Status</th>
                <th>Date</th>
              </tr>
            </thead>
            <tbody>
              <%
                for(Order o: orders){
              %>
              <tr>
                <td><%=o.id%></td>
                <td><%=o.cust%></td>
                <td><%=o.amt%></td>
                <td>
                  <%
                    if("PAID".equals(o.status)){ %><span class="badge paid">PAID</span><% }
                    else if("PENDING".equals(o.status)){ %><span class="badge pending">PENDING</span><% }
                    else { %><span class="badge cancel">CANCELLED</span><% }
                  %>
                </td>
                <td><%=o.date%></td>
              </tr>
              <% } %>
            </tbody>
          </table>
        </div>
      </section>

      <!-- RIGHT -->
      <aside class="panel">
        <h3>Quick Actions</h3>
        <div class="quicklinks">
          <button type="button" onclick="goTab('products')">➕ Add Product</button>
          <button type="button" onclick="goTab('products')">📦 View Products</button>
          <button type="button" onclick="goTab('orders')">🧾 View Orders</button>
          <button type="button" onclick="alert('Shipping page not created. Add it as tab if needed!')">🚚 Shipping</button>
          <button type="button" onclick="goTab('customers')">👥 Customers</button>
          <button type="button" onclick="goTab('reports')">📊 Reports</button>
        </div>
        <div class="tip-card">
          <div class="tip-title">💡 Pro Tip</div>
          <div class="tip-text">
            Connect these cards to your database using DAO methods. 
            Replace static values with real-time counts from your database.
          </div>
        </div>
        
        <div class="tip-card" style="margin-top:12px;">
          <div class="tip-title">📈 Today's Stats</div>
          <div class="tip-text" style="display:flex; justify-content:space-between;">
            <span>Views: 245</span>
            <span>Sales: 12</span>
          </div>
        </div>
      </aside>
    </div>
    <% } %>

    <!-- MY PROFILE TAB -->
    <%
      if("myprofile".equals(tab)){
    %>
    <div class="grid" style="grid-template-columns:1fr;">
      <section class="panel">
        <h3>My Profile</h3>
        <div style="padding:20px;">
          <div class="field">
            <label>Username</label>
            <input type="text" value="<%= displayName %>" readonly style="background:#f3f4f6;">
          </div>
          <div class="field">
            <label>Email</label>
            <input type="email" value="<%= userEmail %>" readonly style="background:#f3f4f6;">
          </div>
          <div class="field">
            <label>Seller ID</label>
            <input type="text" value="<%= sellerId != null ? sellerId : "" %>" readonly style="background:#f3f4f6;">
          </div>
          <div class="row">
            <button class="btn" type="button" onclick="alert('Profile edit feature coming soon!')">Edit Profile</button>
            <button class="btn-dark" type="button" onclick="goTab('dashboard')">Back to Dashboard</button>
          </div>
        </div>
      </section>
    </div>
    <% } %>

    <!-- PRODUCTS TAB -->
    <%
      if("products".equals(tab)){
    %>
    <div class="grid" style="grid-template-columns:1fr;">
      <section class="panel">
       <div style="display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;">
    <h3>Products</h3>

    <div style="display:flex;gap:8px;">
        <a href="sellerdashboard.jsp?tab=products&view=list"
           style="text-decoration:none;">
            <button class="<%= "list".equals(view) ? "btn" : "btn-dark" %>" type="button">
                📋 List View
            </button>
        </a>

        <a href="sellerdashboard.jsp?tab=products&view=grid"
           style="text-decoration:none;">
            <button class="<%= "grid".equals(view) ? "btn" : "btn-dark" %>" type="button">
                🖼 Grid View
            </button>
        </a>
    </div>
</div>
        <div class="row" style="margin-bottom:10px;">
          <button class="btn" type="button" onclick="openModal()">+ Add Product</button>
          <button class="btn-dark" type="button" onclick="goTab('dashboard')">⬅ Back</button>
        </div>
		
		<% if("list".equals(view)){ %>
        <div class="tablewrap">
          <table>
            <thead>
              <tr>
                <th>Product ID</th>
                <th>Name</th>
                <th>Price (₹)</th>
                <th>Stock</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              <%
              for(Map<String,Object> p : products){
              %>
              <tr>
                <td><%=p.get("productDbId")%></td>
                <td><%=p.get("name")%></td>
                <td><%=p.get("price")%></td>
                <td><%=p.get("stock")%></td>
                <td>
                  <a href="sellerdashboard.jsp?tab=products&action=deleteProduct&pid=<%=p.get("productDbId")%>"
                     style="text-decoration:none;">
                    <button class="btn-red" type="button">Delete</button>
                  </a>
                </td>
              </tr>
              <% } %>
            </tbody>
          </table>
        </div>
		<% } %>
		
<% if("grid".equals(view)){ %>

<div style="display:grid;
            grid-template-columns:repeat(auto-fill,minmax(260px,260px));
            gap:20px;
            margin-top:20px;
            justify-content:flex-start;">

<% for(Map<String,Object> p : products){ %>

    <div style="background:#fff;
                border-radius:18px;
                padding:16px;
                width:260px;
                box-shadow:0 10px 25px rgba(0,0,0,0.15);
                display:flex;
                flex-direction:column;">

        <!-- IMAGE -->
        <div style="height:160px;
                    border-radius:14px;
                    overflow:hidden;
                    background:#f3f4f6;">

            <%
            List<String> imgs = (List<String>) p.get("images");
            String firstImage = "images/noimage.png";

            if(imgs != null && imgs.size() > 0){
                firstImage = imgs.get(0);
            }
            %>

            <img src="<%= request.getContextPath() + "/" + firstImage %>"
                 style="width:100%;height:100%;object-fit:cover;">
        </div>

        <!-- DETAILS -->
        <div style="margin-top:12px;">

            <div style="font-weight:900;color:#111827;font-size:16px;">
                <%=p.get("name")%>
            </div>

            <div style="color:#6B2C91;font-weight:900;margin-top:6px;">
                ₹ <%=p.get("price")%>
            </div>

            <div style="font-size:13px;color:#6b7280;margin-top:4px;">
                Stock: <%=p.get("stock")%>
            </div>

            <%
            int stockValue = 0;
            try{
                stockValue = Integer.parseInt(p.get("stock").toString());
            }catch(Exception e){}
            boolean isActive = stockValue > 0;
            %>

            <div style="margin-top:8px;">
                <% if(isActive){ %>
                    <span style="background:#dcfce7;color:#166534;
                                 padding:4px 12px;border-radius:999px;
                                 font-size:12px;font-weight:900;">
                        Active
                    </span>
                <% } else { %>
                    <span style="background:#fee2e2;color:#991b1b;
                                 padding:4px 12px;border-radius:999px;
                                 font-size:12px;font-weight:900;">
                        Out of Stock
                    </span>
                <% } %>
            </div>

        </div>

        <!-- DELETE BUTTON -->
        <div style="margin-top:15px;">
            <a href="sellerdashboard.jsp?tab=products&view=<%=view%>&action=deleteProduct&pid=<%=p.get("productDbId")%>"
               style="text-decoration:none;">
                <button class="btn-red"
                        style="width:100%;border-radius:12px;">
                    Delete
                </button>
            </a>
        </div>

    </div>

<% } %>

</div>

<% } %>

<% } %>
    <!-- ORDERS TAB -->
    <%
      if("orders".equals(tab)){
    %>
    <div class="grid" style="grid-template-columns:1fr;">
      <section class="panel">
        <h3>Orders (Single Page)</h3>
        <div class="tablewrap">
          <table>
            <thead>
              <tr>
                <th>Order ID</th>
                <th>Customer</th>
                <th>Amount</th>
                <th>Status</th>
                <th>Date</th>
              </tr>
            </thead>
            <tbody>
              <%
                for(Order o: orders){
              %>
              <tr>
                <td><%=o.id%></td>
                <td><%=o.cust%></td>
                <td><%=o.amt%></td>
                <td>
                  <%
                    if("PAID".equals(o.status)){ %><span class="badge paid">PAID</span><% }
                    else if("PENDING".equals(o.status)){ %><span class="badge pending">PENDING</span><% }
                    else { %><span class="badge cancel">CANCELLED</span><% }
                  %>
                </td>
                <td><%=o.date%></td>
              </tr>
              <% } %>
            </tbody>
          </table>
        </div>
      </section>
    </div>
    <% } %>

    <!-- SHIPMENTS TAB -->
    <%
      if("shipments".equals(tab)){
    %>
    <div class="grid" style="grid-template-columns:1fr;">
      <section class="panel">
        <h3>Shipments</h3>
        <div class="tablewrap">
          <table>
            <thead>
              <tr>
                <th>Order ID</th>
                <th>Customer</th>
                <th>Status</th>
                <th>Tracking</th>
              </tr>
            </thead>
            <tbody>
              <tr><td>#ES1021</td><td>Rahul Sharma</td><td><span class="badge pending">SHIPPED</span></td><td>TRK123456</td></tr>
              <tr><td>#ES1020</td><td>Sneha Patel</td><td><span class="badge pending">PENDING</span></td><td>-</td></tr>
              <tr><td>#ES1019</td><td>Kiran Kumar</td><td><span class="badge paid">DELIVERED</span></td><td>TRK789012</td></tr>
            </tbody>
          </table>
        </div>
      </section>
    </div>
    <% } %>

    <!-- CUSTOMERS TAB -->
    <%
      if("customers".equals(tab)){
    %>
    <div class="grid" style="grid-template-columns:1fr;">
      <section class="panel">
        <h3>Customers (Single Page)</h3>
        <div class="tablewrap">
          <table>
            <thead>
              <tr>
                <th>Customer</th>
                <th>Email</th>
                <th>Orders</th>
                <th>City</th>
              </tr>
            </thead>
            <tbody>
              <tr><td>Rahul</td><td>rahul@gmail.com</td><td>6</td><td>Hyderabad</td></tr>
              <tr><td>Sneha</td><td>sneha@gmail.com</td><td>3</td><td>Vizag</td></tr>
              <tr><td>Kiran</td><td>kiran@gmail.com</td><td>2</td><td>Vijayawada</td></tr>
              <tr><td>Vamsi</td><td>vamsi@gmail.com</td><td>1</td><td>Guntur</td></tr>
            </tbody>
          </table>
        </div>
        <div class="note"></div>
      </section>
    </div>
    <% } %>

    <!-- REPORTS TAB -->
    <%
      if("reports".equals(tab)){
    %>
    <div class="grid" style="grid-template-columns:1fr;">
      <section class="panel">
        <h3>Reports (Single Page)</h3>
        <div style="padding:12px;border-radius:14px;background:#faf5ff;line-height:1.8;">
          <div style="font-weight:900;color:#6B2C91;">Sales Summary (Demo)</div>
          <div style="margin-top:8px;color:#111827;font-weight:800;">• Monthly Revenue: <%=revenue%></div>
          <div style="color:#111827;font-weight:800;">• Total Orders: <%=totalOrders%></div>
          <div style="color:#111827;font-weight:800;">• Pending Shipments: <%=pendingShip%></div>
          <div style="margin-top:10px;color:#6b7280;font-weight:800;font-size:12px;">
          </div>
        </div>
      </section>
    </div>
    <% } %>

    <!-- SETTINGS TAB -->
    <%
      if("settings".equals(tab)){
    %>
    <div class="grid" style="grid-template-columns:1fr;">
      <section class="panel">
        <h3>Settings (Single Page)</h3>

        <form action="sellerdashboard.jsp?tab=settings&action=saveSettings" method="post">
          <div class="field">
            <label>Shop Name</label>
            <input type="text" name="shopName" value="<%=shopName%>" required>
          </div>
          <div class="field">
            <label>Support Email</label>
            <input type="email" name="supportEmail" value="<%=supportEmail%>" required>
          </div>
          <div class="field">
            <label>Support Phone</label>
            <input type="text" name="supportPhone" value="<%=supportPhone%>" required>
          </div>

          <div class="row">
            <button class="btn-green" type="submit">Save Settings</button>
            <button class="btn-dark" type="button" onclick="goTab('dashboard')">Cancel</button>
          </div>

        </form>
      </section>
    </div>
    <% } %>

    <div class="footer">© 2026 <%=shopName%> • Single Page sellerdashboard</div>
  </main>
</div>

<!-- MODAL: ADD NEW (Product demo) -->
<div class="modal-bg" id="modalBg">
  <div class="modal">
    <div style="display:flex;justify-content:space-between;align-items:center;gap:10px;">
      <h3>Add New Product (Demo)</h3>
      <button class="btn-red" type="button" onclick="closeModal()">X</button>
    </div>

    <form action="sellerdashboard.jsp?tab=products&action=addProduct" method="post">
      <div class="field">
        <label>Product ID</label>
        <input type="text" name="pid" placeholder="P200" required>
      </div>
      <div class="field">
        <label>Product Name</label>
        <input type="text" name="pname" placeholder="New Product" required>
      </div>
      <div class="field">
        <label>Price (₹)</label>
        <input type="number" name="pprice" placeholder="999" required>
      </div>
      <div class="field">
        <label>Stock</label>
        <input type="number" name="pstock" placeholder="10" required>
      </div>

      <div class="row">
        <button class="btn-green" type="submit">Save</button>
        <button class="btn-dark" type="button" onclick="closeModal()">Cancel</button>
      </div>
    </form>
  </div>
</div>

<script>
  // close modal when clicking outside
  document.getElementById("modalBg").addEventListener("click", function(e){
    if(e.target === this) closeModal();
  });
</script>

</body>
</html>