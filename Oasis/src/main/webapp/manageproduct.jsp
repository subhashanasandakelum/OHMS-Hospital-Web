<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">



<!-- Custom CSS file -->



 




<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/styles.css">


<!-- Font Awesome CDN for icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">


<title>Manage Medicine</title>

</head>

<body>

<%@ include file="header.jsp" %>



	<div class="container">

		<!-- Upper Container Section -->
		<div class="upper-container">
			<header>
				<h1>Manage Medicine</h1>
			</header>

			<div class="notification">
				<p>
					Welcome to the Medicine Management Dashboard. <a href="#">Learn
						More</a>
				</p>
				<p>
					Stay organized with our new batch tracking system for medicines. <a
						href="#">Learn how to use</a>
				</p>
			</div>



			<div class="product-filter">
				<label for="filter">Filter Product:</label> <input type="text"
					id="searchInput" placeholder="serch..">

				<button class="add-product-btn"
					onclick="window.location.href='addproduct.jsp'">+ New
					Product</button>



				<button class="add-product-btn"
					onclick="window.location.href='GetAllServlet'">Show List</button>



			</div>


		</div>

		<!-- Product Display Section -->
		<div class="product-display-section">
			<div class="product-display">
				<table class="product-display-table">
					<thead>
						<tr>
							<th>ID</th>
							<th>Product Name</th>
							<th>Product Quantity</th>
							<th>Expire Date</th>
							<th>Product Description</th>
							<th>Action</th>

						</tr>
					</thead>
					<tbody>
						<!-- Sample Data (replace with dynamic data in your backend) -->
						<c:forEach var="medicine" items="${allmediciness}">
							<tr>
								<td>${medicine.id}</td>
								<td>${medicine.name}</td>
								<td>${medicine.quantity}</td>
								<td>${medicine.exp}</td>
								<td>${medicine.description}</td>
								<td><a
									href="update.jsp?id=${medicine.id}&name=${medicine.name}&quantity=${medicine.quantity}&exp=${medicine.exp}&description=${medicine.description}"
									class="btn"><i class="fas fa-edit"></i> Edit</a>

									<form action="DeleteServlet" method="post">

										<input type="hidden" name="id" value="${medicine.id}" />
										<button class="btn" class="fas fa-trash">Delete</button>
									</form>
							</tr>
						</c:forEach>
						<!-- Add more product rows as needed -->
					</tbody>
				</table>
			</div>
		</div>
	</div>


   <!-- Product Search Section -->

	<script>
function filterTable() {
    var input, filter, table, tr, td, i, j, txtValue;
    input = document.getElementById("searchInput");
    filter = input.value.toUpperCase(); // Uppercase -> toUpperCase
    table = document.querySelector("table"); // Slector -> Selector
    tr = table.getElementsByTagName("tr"); // TagName -> ElementsByTagName
    
    for (i = 1; i < tr.length; i++) { 
        tr[i].style.display = "none"; // Default to hidden
        td = tr[i].getElementsByTagName("td");
        for (j = 0; j < td.length; j++) {
            if (td[j]) {
                txtValue = td[j].textContent || td[j].innerText; // textContenct -> textContent
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = ""; // Show row if match found
                    break; // Stop checking other cells
                }
            }
        }
    }
}


document.getElementById("searchInput").addEventListener("input", filterTable);
</script>

<%@ include file="footer.jsp" %>

</body>
</html>
