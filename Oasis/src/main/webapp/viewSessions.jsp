<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Arrays"%>
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
    <title>View Sessions</title>
    <link rel="stylesheet" type="text/css" href="css/viewSession.css">
</head>
<body>

<%@ include file="header.jsp"%>

		<h2>Session List</h2>

		<!-- Add New Session Button -->
		<a href="addSessions.jsp" class="button">Add New Session</a>

		<table>
			<thead>
				<tr>
					<th>Session ID</th>
					<th>Doctor ID</th>
					<th>Session Date</th>
					<th>Session Time</th>
					<th>Ward ID</th>
					<th>Room</th>
				</tr>
			</thead>
			<tbody>
				<%
            List<String[]> sessions = (List<String[]>) request.getAttribute("sessions");
            if (sessions != null && !sessions.isEmpty()) {
                for (String[] sessionData : sessions) {
        %>
				<tr>
					<td><%= sessionData[0] %></td>
					<td><%= sessionData[1] %></td>
					<td><%= sessionData[2] %></td>
					<td><%= sessionData[3] %></td>
					<td><%= sessionData[4] %></td>
					<td><%= sessionData[5] %></td>
					<td>
						<!-- Edit button that links to the edit session page --> <a
						href="EditSessionsServlet?action=edit&sessionId=<%= sessionData[0] %>"
						class="button">Edit</a> <!-- Delete button that calls a delete servlet -->
						<form action="ManageSessionsServlet" method="post"
							style="display: inline;">
							<input type="hidden" name="action" value="delete"> <input
								type="hidden" name="sessionId" value="<%= sessionData[0] %>">
							<input type="submit" value="Delete" class="button"
								onclick="return confirm('Are you sure you want to delete this session?');">
						</form>
					</td>
				</tr>
				<%
                }
            } else {
        %>
				<tr>
					<td colspan="6">No sessions found.</td>
				</tr>
				<%
            }
        %>
			</tbody>
		</table>
<%@ include file="footer.jsp"%>
</body>
</html>
