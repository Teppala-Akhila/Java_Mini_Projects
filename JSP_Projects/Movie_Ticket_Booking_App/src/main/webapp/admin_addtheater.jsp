<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Theater</title>

<style>
    body {
        margin: 0;
        min-height: 100vh;
        background: #cc7a0a; /* orange admin background */
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

    /* FORM ROW */
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
    .form-row textarea {
        width: 100%;
        height: 42px;
        padding: 8px 12px;
        border-radius: 6px;
        border: 1px solid #cfcfcf;
        font-size: 14px;
        box-sizing: border-box;
    }

    .form-row textarea {
        height: 70px;
        resize: none;
    }

    .form-row input:focus,
    .form-row textarea:focus {
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
        font-weight: bold;
    }

    .btn-submit:hover {
        background: #e67600;
    }
</style>
</head>

<body>

<div class="card">
    <h2>Add Theater</h2>

    <form action="AddTheaterServlet" method="post">

        <div class="form-row">
            <label>Theater ID:</label>
            <input type="text" name="theaterId" required>
        </div>

        <div class="form-row">
            <label>Name:</label>
            <input type="text" name="theaterName" required>
        </div>

        <div class="form-row">
            <label>City:</label>
            <input type="text" name="city" required>
        </div>

        <div class="form-row">
            <label>Address:</label>
            <textarea name="address" required></textarea>
        </div>

        <button type="submit" class="btn-submit">
            SAVE
        </button>

    </form>
</div>

</body>
</html>
