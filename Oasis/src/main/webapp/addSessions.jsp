<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
    String role = (String) session.getAttribute("role");
    if (role == null || !"Doctor".equals(role)) {
        response.sendRedirect("Login.jsp?error=Unauthorized access");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Session</title>
    <link rel="stylesheet" type="text/css" href="css/addSessions.css">
</head>
<body>

<%@ include file="header.jsp"%>

<a href="ManageSessionsServlet" class="button">Back to Session List</a>

<h2>Add New Session</h2>

<form action="ManageSessionsServlet" method="post">
    <input type="hidden" name="action" value="add">
    <label for="doctorId">Doctor ID:</label>
    <input type="number" id="doctorId" name="doctorId" required><br><br>

    <label for="sessionDate">Session Date:</label>
    <input type="date" id="sessionDate" name="sessionDate" required><br><br>

    <label for="sessionTime">Session Time:</label>
    <input type="time" id="sessionTime" name="sessionTime" required><br><br>

    <label for="wardId">Ward ID:</label>
    <input type="number" id="wardId" name="wardId" required><br><br>

    <label for="room">Room:</label>
    <input type="text" id="room" name="room" required><br><br>

    <input type="submit" value="Add Session">
</form>


<%@ include file="footer.jsp"%>

</body>
</html>
