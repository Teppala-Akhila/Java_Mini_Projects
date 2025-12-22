<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Screens</title>

<style>
    body {
        margin: 0;
        min-height: 100vh;
        background: #cc7a0a;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: Arial, Helvetica, sans-serif;
    }

    .card {
        background: #ffffff;
        width: 850px;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 15px 35px rgba(0,0,0,0.35);
    }

    h2 {
        text-align: center;
        color: #ff8c00;
        margin-bottom: 15px;
    }

    /* TOP SECTION */
    .top-section {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
        gap: 10px;
    }

    .top-section input {
        padding: 8px 12px;
        width: 260px;
        border-radius: 6px;
        border: 1px solid #ccc;
        font-size: 14px;
    }

    .btn {
        padding: 8px 18px;
        background: #ff8c00;
        color: white;
        border: none;
        border-radius: 20px;
        cursor: pointer;
        font-size: 14px;
        font-weight: bold;
        text-decoration: none;
    }

    .btn:hover {
        background: #e67600;
    }

    /* TABLE */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: center;
        font-size: 14px;
    }

    th {
        background: #ff8c00;
        color: white;
    }

    tr:nth-child(even) {
        background: #f9f9f9;
    }

    .action-btn {
        padding: 5px 10px;
        border-radius: 5px;
        color: white;
        text-decoration: none;
        font-size: 12px;
    }

    .edit { background: #1976d2; }
    .delete { background: #d32f2f; }
</style>
</head>

<body>

<div class="card">

    <h2>📽️ Manage Screens</h2>

    <!-- ENTER THEATER NAME -->
    <form action="adminScreens.jsp" method="get" class="top-section">
        <div>
            <strong>Manage Screens For:</strong>
            <input type="text" name="theaterName"
                   placeholder="Enter Theater Name" required>
            <button class="btn" type="submit">Load</button>
        </div>

        <a href="addScreens.jsp" class="btn">➕ Add Screen</a>
    </form>

    <!-- SCREENS TABLE -->
    <table>
        <tr>
            <th>ID</th>
            <th>Screen Name</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>

        <%-- Sample static data (replace with DB filtered by theaterName) --%>
        <tr>
            <td>1</td>
            <td>Screen 1</td>
            <td>Main Dolby Screen</td>
            <td>
                <a href="EditScreenServlet?id=1" class="action-btn edit">Edit</a>
                <a href="DeleteScreenServlet?id=1"
                   class="action-btn delete"
                   onclick="return confirm('Delete this screen?')">Delete</a>
            </td>
        </tr>

        <tr>
            <td>2</td>
            <td>Screen 2</td>
            <td>3D Screen</td>
            <td>
                <a href="EditScreenServlet?id=2" class="action-btn edit">Edit</a>
                <a href="DeleteScreenServlet?id=2"
                   class="action-btn delete"
                   onclick="return confirm('Delete this screen?')">Delete</a>
            </td>
        </tr>

    </table>

</div>

</body>
</html>
