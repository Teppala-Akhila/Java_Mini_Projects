<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Seats</title>

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
        width: 520px;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 15px 35px rgba(0,0,0,0.35);
    }

    .card h2 {
        text-align: center;
        color: #ff8c00;
        margin-bottom: 20px;
    }

    /* CATEGORY SELECT */
    .category {
        text-align: center;
        margin-bottom: 20px;
    }

    .category label {
        margin: 0 10px;
        font-weight: bold;
        cursor: pointer;
    }

    /* SEAT GRID */
    .seat-grid {
        display: grid;
        grid-template-columns: repeat(8, 1fr);
        gap: 10px;
        justify-content: center;
        margin-bottom: 25px;
    }

    .seat {
        width: 40px;
        height: 40px;
        border-radius: 6px;
        background: #e0e0e0;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 12px;
        font-weight: bold;
    }

    .seat.regular { background: #90caf9; }
    .seat.vip { background: #fbc02d; }
    .seat.economy { background: #a5d6a7; }

    .seat:hover {
        outline: 2px solid #ff8c00;
    }

    .btn-submit {
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

    /* LEGEND */
    .legend {
        display: flex;
        justify-content: space-around;
        margin-bottom: 15px;
        font-size: 13px;
    }

    .legend span {
        display: flex;
        align-items: center;
        gap: 6px;
    }

    .box {
        width: 16px;
        height: 16px;
        border-radius: 4px;
    }

    .r { background: #90caf9; }
    .v { background: #fbc02d; }
    .e { background: #a5d6a7; }
</style>

<script>
    let selectedCategory = "regular";

    function setCategory(cat) {
        selectedCategory = cat;
    }

    function selectSeat(seat) {
        seat.className = "seat " + selectedCategory;
    }
</script>
</head>

<body>

<div class="card">
    <h2>🪑 Manage Seats</h2>

    <!-- CATEGORY SELECTION -->
    <div class="category">
        <label>
            <input type="radio" name="cat" onclick="setCategory('regular')" checked>
            REGULAR
        </label>
        <label>
            <input type="radio" name="cat" onclick="setCategory('vip')">
            VIP
        </label>
        <label>
            <input type="radio" name="cat" onclick="setCategory('economy')">
            ECONOMY
        </label>
    </div>

    <!-- LEGEND -->
    <div class="legend">
        <span><div class="box r"></div> Regular</span>
        <span><div class="box v"></div> VIP</span>
        <span><div class="box e"></div> Economy</span>
    </div>

    <!-- SEAT GRID -->
    <div class="seat-grid">
        <% for(int i=1;i<=32;i++){ %>
            <div class="seat" onclick="selectSeat(this)">
                <%= i %>
            </div>
        <% } %>
    </div>

    <!-- SAVE -->
    <form action="ManageSeatsServlet" method="post">
        <button type="submit" class="btn-submit">
            SAVE
        </button>
    </form>
</div>

</body>
</html>
