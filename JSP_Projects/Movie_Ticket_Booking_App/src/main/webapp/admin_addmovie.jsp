<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Movie</title>

<style>
    body {
        margin: 0;
        min-height: 100vh;
        background: #cc7a0a; /* orange background */
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: Arial, Helvetica, sans-serif;
    }

    .card {
        background: #ffffff;
        width: 420px;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 15px 35px rgba(0,0,0,0.35);
    }

    .card h2 {
        text-align: center;
        color: #ff8c00;
        margin-bottom: 25px;
    }

   
    .form-row {
        display: grid;
        grid-template-columns: 130px 1fr;
        align-items: center;
        gap: 12px;
        margin-bottom: 14px;
    }

    .form-row label {
        font-size: 14px;
        color: #333;
    }

    .form-row input,
    .form-row select {
        width: 100%;
        height: 42px;                /* SAME HEIGHT */
        padding: 8px 12px;           /* SAME PADDING */
        border-radius: 6px;
        border: 1px solid #cfcfcf;
        font-size: 14px;
        box-sizing: border-box;
    }

    .form-row input:focus,
    .form-row select:focus {
        border-color: #ff8c00;
        outline: none;
    }

    .btn-submit {
        margin-top: 20px;
        width: 100%;
        height: 44px;
        background: #ff8c00;
        border: none;
        color: white;
        font-size: 15px;
        border-radius: 22px;
        cursor: pointer;
    }

    .btn-submit:hover {
        background: #e67600;
    }
</style>
</head>

<body>

<div class="card">
    <h2>Add Movie</h2>

    <form action="AddMovieServlet" method="post">

        <div class="form-row">
            <label>Title:</label>
            <input type="text" name="title" required>
        </div>

        <div class="form-row">
            <label>Description:</label>
            <input type="text" name="description">
        </div>

        <div class="form-row">
            <label>Duration:</label>
            <input type="text" name="duration">
        </div>

        <div class="form-row">
            <label>Rating:</label>
            <input type="text" name="rating">
        </div>

        <div class="form-row">
            <label>Language:</label>
            <select name="language" required>
                <option value="">-- Select Language --</option>
                <option>Hindi</option>
                <option>English</option>
                <option>Telugu</option>
                <option>Tamil</option>
                <option>Kannada</option>
                <option>Malayalam</option>
                <option>Marathi</option>
                <option>Bengali</option>
                <option>Punjabi</option>
                <option>Gujarati</option>
                <option>Urdu</option>
            </select>
        </div>

        <div class="form-row">
            <label>Genre:</label>
            <input type="text" name="genre">
        </div>

        <div class="form-row">
            <label>Release Date:</label>
            <input type="date" name="releaseDate">
        </div>

        <div class="form-row">
            <label>Poster URL:</label>
            <input type="text" name="posterUrl">
        </div>

        <button type="submit" class="btn-submit">
            Add Movie
        </button>

    </form>
</div>

</body>
</html>







<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Add Form</title>
<style>
	#movie_add{
	
	}
</style>
</head>
<body>
<div id="movie_add">
	<table>
		<tr>
		<td>Title:</td>
		<td><input type="text"></td>
		</tr>
		<tr>
		<td>Description:</td>
		<td><input type="text"></td>
		</tr>
		<tr>
		<td>Duration:</td>
		<td><input type="text"></td>
		</tr>
		<tr>
		<td>Rating:</td>
		<td><input type="text"></td>
		</tr>
		<tr>
		<td>Language:</td>
		<td><input type="text"></td>
		</tr>
		<tr>
		<td>Genre:</td>
		<td><input type="text"></td>
		</tr>
		<tr>
		<td>Release_Date:</td>
		<td><input type="date"></td>
		</tr>
		<tr>
		<td>Poster_url:</td>
		<td><input type="text"></td>
		</tr>
	</table>
</div>
</body>
</html>
--%>