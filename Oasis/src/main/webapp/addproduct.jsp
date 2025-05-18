<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

<title>Add New Product</title>
</head>

<body>
	<!-- Container for the entire page -->
	<div class="container">

		<!-- Form for adding a new product -->
		<div class="admin-product-form-container">
			<form action="InsertServlet" method="post">
				<h3>Add a New Product</h3>




				<!-- Product Name Input -->
				<div class="form-group">
					<input type="text" placeholder="Enter Product Name" name="name"
						class="box" required>
				</div>



				<!-- Product Quantity Input -->
				<div class="form-group">
					<input type="number" placeholder="Enter Product Quantity"
						name="quantity" class="box" required>
				</div>



				<!-- Product Expire Date Input -->
				<div class="form-group">
					<input type="date" placeholder="Enter Product Expire Date"
						name="exp" class="box" required>
				</div>




				<!-- Product description Input -->
				<div class="form-group">
					<input type="text" placeholder="Enter Product description"
						name="description" class="box">
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
