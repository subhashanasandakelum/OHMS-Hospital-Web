<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard</title>
    <link rel="stylesheet" href="dashboard.css">
</head>
<body>
    
    <div class="container">
        <%@ include file="dashboardHeader.jsp" %>
    </div>
    
<%@ include file="dashboardSidebar.jsp" %>
       
       
    <!-- Dashboard Section -->
<section id="dashboard-section" class="dashboard-section">
    <h2>Dashboard</h2>
    <div class="dashboard-grid">
        <div class="dashboard-box" onclick="window.location.href='viewPatients.jsp';">
            <img src="img/icon1.png" alt="view-patient Icon">
            <h3>View patient details</h3>
            <p>View registered patients information.</p>
        </div>
        <div class="dashboard-box" onclick="window.location.href='addSessions.jsp';">
            <img src="img/icon2.png" alt="Add Sessions Icon">
            <h3>Add Sessions</h3>
            <p>Add your session times.</p>
        </div>
        <div class="dashboard-box" onclick="window.location.href='manageSessions.jsp';">
            <img src="img/icon3.png" alt="Manage Sessions Icon">
            <h3>Manage Sessions</h3>
            <p>Check and manage sessions.</p>
        </div>
        <div class="dashboard-box" onclick="window.location.href='medicineInventory.jsp';">
            <img src="img/icon4.png" alt="Medicine Inventory Icon">
            <h3>Medicine Inventory</h3>
            <p>View medicine available in Hospital.</p>
        </div>
    </div>
</section>

<%@ include file="dashboardFooter.jsp" %>

<script src="dashboard.js"></script>
</body>
</html>