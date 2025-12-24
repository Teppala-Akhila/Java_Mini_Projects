<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Confirmation</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:include page="common/header.jsp"/>
	
<main>
  <h2>Booking Confirmation</h2>

  <div class="card">
    <h3>Booking ID: 5</h3>
    <p><strong>Show ID:</strong> 2</p>
    <p><strong>Total Amount:</strong> $11.99</p>
    <p><strong>Booking Time:</strong> 2025-11-25 19:38:58</p>

    <button class="btn" onclick="window.print()">Download Ticket</button>
  </div>
</main>
	<jsp:include page="common/footer.jsp"/>
</body>
</html>
