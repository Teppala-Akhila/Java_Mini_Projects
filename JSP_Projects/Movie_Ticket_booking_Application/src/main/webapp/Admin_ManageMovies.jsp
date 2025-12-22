<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Movies</title>

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
        width: 900px;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 15px 35px rgba(0,0,0,0.35);
    }

    h2 {
        text-align: center;
        color: #ff8c00;
        margin-bottom: 25px;
    }

    /* SEARCH + ADD */
    .top-bar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
        gap: 10px;
    }

    .search-box input {
        padding: 8px 12px;
        width: 220px;
        border-radius: 6px;
        border: 1px solid #ccc;
    }

    .btn {
        padding: 8px 16px;
        background: #ff8c00;
        color: white;
        border: none;
        border-radius: 18px;
        cursor: pointer;
        font-size: 14px;
        text-decoration: none;
        font-weight: bold;
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
        margin: 0 2px;
    }

    .edit {
        background: #1976d2;
    }

    .delete {
        background: #d32f2f;
    }
</style>
</head>

<body>

<div class="card">
    <h2>🎬 Manage Movies</h2>

    <!-- SEARCH + ADD -->
    <div class="top-bar">
        <form class="search-box" action="SearchMovieServlet" method="get">
            <input type="text" name="keyword" placeholder="Search movies...">
            <button class="btn" type="submit">Search</button>
        </form>

        <a href="Admin_Add_Movie.jsp" class="btn">➕ Add Movie</a>
    </div>

    <!-- MOVIES TABLE -->
    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Language</th>
            <th>Genre</th>
            <th>Duration</th>
            <th>Actions</th>
        </tr>

        <%-- Sample static data (replace with DB data later) --%>
        <tr>
            <td>1</td>
            <td>RRR</td>
            <td>Telugu</td>
            <td>Action</td>
            <td>180 mins</td>
            <td>
                <a href="EditMovieServlet?id=1" class="action-btn edit">Edit</a>
                <a href="DeleteMovieServlet?id=1" class="action-btn delete"
                   onclick="return confirm('Are you sure you want to delete?')">
                   Delete
                </a>
            </td>
        </tr>

        <tr>
            <td>2</td>
            <td>Inception</td>
            <td>English</td>
            <td>Sci-Fi</td>
            <td>148 mins</td>
            <td>
                <a href="EditMovieServlet?id=2" class="action-btn edit">Edit</a>
                <a href="DeleteMovieServlet?id=2" class="action-btn delete"
                   onclick="return confirm('Are you sure you want to delete?')">
                   Delete
                </a>
            </td>
        </tr>

        <%-- Later: loop movies from DB using JSTL or scriptlet --%>

    </table>
</div>

</body>
</html>
