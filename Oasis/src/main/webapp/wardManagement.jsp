<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ward Management</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>
	
	<div class="content">
	
		<%@ include file="header.jsp"%>
		
		<%@ include file="sidebar.jsp"%>
		
		<section id="dashboard-section" class="dashboard-section">
			<h2>Ward Management</h2>

			<!-- begin -->

			<div class="dashboard-grid">
				<div class="dashboard-box"
					onclick="window.location.href='WardServlet?action=new';">
					<img src="img/add ward.png" alt="view-patient Icon">
					<h3>Add <br> New Ward</h3>
					
				</div>
				<div class="dashboard-box"
					onclick="window.location.href='WardServlet?action=list';">
					<img src="img/wardlist.png" alt="view-patient Icon">
					<h3>View <br> Ward List</h3>
					
				</div>
				
				
			</div>

			<!-- end -->

		</section>

		<%@ include file="footer.jsp"%>
	</div>
	
	
	
	
</body>
</html>