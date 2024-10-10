<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="top-bar">
            <div class="hospital-name">
                <img src="img/hms.png" alt="Hospital Icon" class="hospital-icon"> Oasis Hospital Management System
            </div>
            <div class="user-info">
                <img src="img/user.png" alt="User Icon" class="user-icon">
                <div class="user-details">
                    <!-- Display Username and Role from Session -->
                    <span class="user-name"><%= session.getAttribute("username") %></span>
                    <br>
                    <span class="user-role" id="user-role"><%= session.getAttribute("role") %></span>
                </div> 
				<a href="#" onclick="confirmLogout()" id="logout-btn" class="logout-btn">Log Out</a>
            </div>
        </div>
</body>
</html>