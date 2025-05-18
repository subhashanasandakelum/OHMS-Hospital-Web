<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<!-- Custom CSS file -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/styles.css">
<!-- Font Awesome CDN for icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">




<%

String id = request.getParameter("id");
String name = request.getParameter("name");
String quantity = request.getParameter("quantity");
String exp = request.getParameter("exp");
String description = request.getParameter("description");

%>

<title>Update Product</title>
</head>

<body>
	<!-- Container for the entire page -->
	<div class="container">

		<!-- Form for adding a new product -->
		<div class="admin-product-form-container">
			<form action="UpdateServlet" method="post">
				<h3>Update Product</h3>



                
				<!-- Product ID Input -->
				<div class="form-group">
					<input type="text" placeholder="Enter Product ID" name="id" value = "<%=id%>"
						class="box" readonly>
				</div>
				


				<!-- Product Name Input -->
				<div class="form-group">
					<input type="text" placeholder="Enter Product Name" name="name" value = "<%=name%>"
						class="box" required>
				</div>



				<!-- Product Quantity Input -->
				<div class="form-group">
					<input type="number" placeholder="Enter Product Quantity"
						name="quantity" value = "<%=quantity%>" class="box">
				</div>



				<!-- Product Expire Date Input -->
				<div class="form-group">
					<input type="date" placeholder="Enter Product Expire Date"
						name="exp" value = "<%=exp%>" class="box">
				</div>




				<!-- Product description Input -->
				<div class="form-group">
					<input type="text" placeholder="Enter Product description"
						name="description" value = "<%=description%>" class="box">
				</div>




				<!-- Submit Button -->
				<div class="form-group">
					<input type="submit" class="btn" name="add_product" value="submit">
				</div>


			</form>
		</div>

	</div>







</body>
</html>