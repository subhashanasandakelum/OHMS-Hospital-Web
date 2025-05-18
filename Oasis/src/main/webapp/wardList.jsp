<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ward List</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="stylesheet" href="css/ward-table.css">
</head>
<body>

	<div class="content">
	
		<%@ include file="header.jsp"%>

		<%@ include file="sidebar.jsp"%>

			<section id="dashboard-section" class="dashboard-section">
			<h2>Ward List</h2>
			
			<!-- begin -->
			
			<div class="d-flex justify-content-start mb-3">
                <a href="wardManagement.jsp">
                    <img src="img/undo.png" alt="Add Ward Icon" class="back-icon" style="width: 40px; height: 40px;">
                </a>
            </div>

			
			
			<div class="search-bar m-5">
				<label for="filter">Filter Ward</label>
                <input type="text" class="form-control" id="searchInput" placeholder="Search...">
    		</div>
    		
				<div class="d-flex justify-content-center"> 
					<table class="table">
						<thead class="thead-dark">
							<tr class="table-info">
								<th scope="col">Ward ID</th>
					            <th scope="col">Name</th>
					            <th scope="col">Number of Beds</th>
					            <th scope="col">Department</th>
					            <th scope="col">Actions</th>
							</tr>
						</thead>
						
						<c:forEach var="ward" items="${wardList}">
						<tbody>
				            <tr>
				                <td>${ward.wardId}</td>
				                <td>${ward.name}</td>
				                <td>${ward.numberOfBeds}</td>
				                <td>${ward.department}</td>
				                <td>
				                    <!-- Delete Form -->
				                    <a href="WardServlet?action=edit&wardId=${ward.wardId}" class="btn btn-primary">Update</a>
				                    <!-- Edit Form -->
				                    <a href="WardServlet?action=delete&wardId=${ward.wardId}" class="btn btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
				                </td>
				            </tr>
				        </tbody>
				        </c:forEach>
				
					</table>
			</div>
			

			<!-- end -->

		</section>
		
		<script>
			function filterTable() {
				var input, filter, table, tr, td, i, txtValue;
				input = document.getElementById("searchInput");
				filter = input.value.toUpperCase();		//Uppercase -> toUpperCase
				table = document.querySelector("table");	//querySelectorAll -> querySelector
				tr = table.getElementsByTagName("tr");		//TagName -> ElementsByTagName
				
				for (i = 1; i < tr.length; i++) {
					tr[i].style.display = "none";  	// Default to hidden
					td = tr[i].getElementsByTagName("td");
					for (j = 0; j < td.length; j++) {
						if (td[j]) {
							txtValue = td[j].textContent || td[j].innerText;  	// textContent -> textContent
							if (txtValue.toUpperCase().indexOf(filter) > -1) {
								tr[i].style.display = "";		// Show row if match found
								break;	//Stop checking other shells
							}
						}
					}
				}
			}
			
			document.getElementById("searchInput").addEventListener("input", filterTable);
			
		</script>
			
		
		<%@ include file="footer.jsp"%>
	</div>
	
</body>
</html>