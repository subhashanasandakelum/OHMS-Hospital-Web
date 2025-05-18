<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
    String role = (String) session.getAttribute("role");
    if (role == null || !"Doctor".equals(role)) {
        response.sendRedirect("LogIn.jsp?error=Unauthorized access");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Session</title>
    <link rel="stylesheet" type="text/css" href="css/editSessions.css">
</head>
<body>

<%@ include file="header.jsp"%>

<a href="ManageSessionsServlet" class="button">Back to Session List</a>

<h2>Edit Session</h2>

<form action="EditSessionsServlet" method="post">
    <input type="hidden" name="action" value="edit">
    <input type="hidden" name="sessionId" value="${sessionId}">

    <label for="doctorId">Doctor ID:</label>
    <input type="text" id="doctorId" name="doctorId" value="${doctorId}" readonly><br><br>

    <label for="sessionDate">Session Date:</label>
    <input type="date" id="sessionDate" name="sessionDate" value="${sessionDate}" required><br><br>

    <label for="sessionTime">Session Time:</label>
    <input type="time" id="sessionTime" name="sessionTime" value="${sessionTime}" required><br><br>

    <label for="wardId">Ward ID:</label>
    <input type="text" id="wardId" name="wardId" value="${wardId}" required><br><br>

    <label for="room">Room:</label>
    <input type="text" id="room" name="room" value="${room}" required><br><br>

    <input type="submit" value="Save Changes">
</form>

<%@ include file="footer.jsp"%>
</body>
</html>


