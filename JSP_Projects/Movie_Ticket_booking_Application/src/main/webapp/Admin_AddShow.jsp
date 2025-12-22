<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Show</title>

<style>
    body {
        margin: 0;
        min-height: 100vh;
        background: #cc7a0a; /* admin orange background */
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
    .form-row select {
        width: 100%;
        height: 42px;
        padding: 8px 12px;
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
        font-weight: bold;
    }

    .btn-submit:hover {
        background: #e67600;
    }
</style>
</head>

<body>

<div class="card">
    <h2>🎞️ Add Show</h2>

    <form action="AddShowServlet" method="post">

        <div class="form-row">
            <label>Screen ID:</label>
            <input type="text" name="screenId" required>
        </div>

        <div class="form-row">
            <label>Movie:</label>
            <select name="movieId" required>
                <option value="">-- Select Movie --</option>

                <%-- Static sample (replace with DB data later) --%>
                <option value="1">RRR</option>
                <option value="2">Inception</option>
                <option value="3">Jawan</option>

                <%-- Later with JSTL:
                <c:forEach var="m" items="${movies}">
                    <option value="${m.id}">${m.title}</option>
                </c:forEach>
                --%>
            </select>
        </div>

        <div class="form-row">
            <label>Seat Template:</label>
            <select name="seatTemplateId" required>
                <option value="">-- Select Seat Template --</option>

                <%-- Static sample --%>
                <option value="1">Template A</option>
                <option value="2">Template B</option>

                <%-- Later from DB --%>
            </select>
        </div>

        <div class="form-row">
            <label>Show Time:</label>
            <input type="time" name="showTime" required>
        </div>

        <button type="submit" class="btn-submit">
            SAVE
        </button>

    </form>
</div>

</body>
</html>
