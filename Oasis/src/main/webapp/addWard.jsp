<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="stylesheet" href="css/form.css">
</head>
<body>

	<div class="content">

		<%@ include file="header.jsp" %>
		
		<%@ include file="sidebar.jsp" %>
	
	    <section id="dashboard-section" class="dashboard-section">
	        <h2>Add New Ward</h2>
	        
	        <div class="d-flex justify-content-start mb-3">
                <a href="wardManagement.jsp">
                    <img src="img/undo.png" alt="Add Ward Icon" class="back-icon" style="width: 40px; height: 40px;">
                </a>
            </div>
	
	        <!-- begin -->
	        
	        <div class="container mt-5 ">
	         	<div class="d-flex justify-content-center">
	
			        <form action="WardServlet?action=insert" method="post" class="frm">
			        	<div class="mb-3">
					        <label for="name" class="form-label">Ward Name:</label>
					        <input type="text" class="form-control" id="name" name="name" required><br>
					    </div>
					    <div class="mb-3"> 
					        <label for="numberOfBeds" class="form-label">Number of Beds:</label>
					        <input type="number" class="form-control" id="numberOfBeds" name="numberOfBeds" required><br>
					    </div>
					    <div class="mb-3">
					        <label for="department" class="form-label">Department:</label>
					        <input type="text" class="form-control" id="department" name="department" required><br>
					    </div>
					    <div class="d-flex justify-content-end">   
					        <button type="submit" class="btn btn-primary">Submit</button>
					    </div>
		    		</form>
		    		
	    		</div>
	    	</div>
	
	        <!-- end -->
	
	    </section>
	    
	    <%@ include file="footer.jsp" %>
	</div> 
    
</body>