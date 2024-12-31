<!DOCTYPE html>
<html>
<head>
<title>Login|ASTU</title>
<!-- Title of the webpage, which appears in the browser tab -->
<link rel="icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZzPo9uv7MUCwwLTBVLgf29PIwG_Or3n2uVw&usqp=CAU">
<!-- Favicon for the website, displayed in the browser tab -->


<!-- Including FontAwesome for adding icons in the page (e.g., for buttons, input fields) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<!-- Including Bootstrap CSS for layout and design styling (Grid system, forms, buttons) -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
</head>
<body>
	

	<div class="container">
		<!-- Container that holds the login card -->
		<div class="card w-50 mx-auto my-5">
			<!-- The login form card with width 50%, centered on the page -->
			<div class="card-header text-center">Please Enter Credentials Again</div>
			<!-- Card header with title indicating the user should enter their credentials -->
			<div class="card-body">
				<!-- Main body of the login card containing the form -->
				<form action="login" method="post">
					<!-- Form that sends the username and password to the server for validation -->

					<div class="form-group">
						<!-- Form group for username input -->
						<label>Username</label> 
						<input type="text" name="username" class="form-control" placeholder="Enter Username">
						<!-- Username input field with a placeholder text -->
					</div>

					<div class="form-group">
						<!-- Form group for password input -->
						<label>Password</label> 
						<input type="password" name="password" class="form-control" placeholder="Password">
						<!-- Password input field with a placeholder text -->
					</div>

					<div class="text-center">
						<!-- Button that submits the form data to the server -->
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>

					<br>
					
 					 </div>
					<!-- Closing the form group -->

				</form>
			</div>
		</div>
	</div>

	<%@include file="/includes/footer.jsp"%>
	<!-- Including footer.jsp at the bottom of the page to display the footer content -->
</body>
</html>
