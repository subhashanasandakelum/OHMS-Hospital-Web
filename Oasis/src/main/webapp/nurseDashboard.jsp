<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Nurse Dashboard</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>
	
	<div class="content">

		<%@ include file="header.jsp"%>

		<%@ include file="sidebar.jsp"%>

		<section id="dashboard-section" class="dashboard-section">
			<h2>Nurse Dashboard</h2>

			<!-- begin -->

			<div class="dashboard-grid">
				<div class="dashboard-box"
					onclick="window.location.href='wardManagement.jsp';">
					<img src="img/wardma.png" alt="view-patient Icon">
					<h3>Ward Management</h3>
					<p>Manage ward and bed allocation</p>
				</div>
				<div class="dashboard-box"
					onclick="window.location.href='#';">
					<img src="img/medreport.png" alt="view-patient Icon">
					<h3>Report Management</h3>
					<p>Generate patient and ward reports</p>
				</div>
				<div class="dashboard-box"
					onclick="window.location.href='#';">
					<img src="img/shift.png" alt="view-patient Icon">
					<h3>Scheduling & Shift Management</h3>
					<p>Organize nurse shifts and schedules</p>
				</div>
				<div class="dashboard-box"
					onclick="window.location.href='#';">
					<img src="img/careplan.png" alt="view-patient Icon">
					<h3>Care Plan Management</h3>
					<p>Create and update care plans</p>
				</div>
				
				
			</div>

			<!-- end -->

		</section>

		<%@ include file="footer.jsp"%>
	</div>
	
	
    
</body>
</html>