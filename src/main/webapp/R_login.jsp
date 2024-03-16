<html>
	<head>
		<title>Admin Login</title>
		<link rel="icon" type="image/x-icon" href="FoodieBay_logo.png">
		<style>
			h1{
				margin-left:900px;
				margin-top:100;
			}
			form{
				margin-left:900px;
				margin-top:50;
			}
			a{
				margin-left:900px; 
				text-decoration:none;
			}
		</style>
	</head>
	<body>
		<!-- we will get the status value from R_registrationServelet (suces or fail) -->
	<input type="hidden" id="status" value="<%=request.getAttribute("status") %>">
	
		<h1>LogIn</h1>
		<form action="R_loginServlet" target="_self" method="post">
			<label for="EId">Email ID:</label><br>
			<input type="email" id="EId" name="EId" placeholder=" your email" required="required" ><br><br>
			<label for="password">Password:</label><br>
			<input type="password" id="password" name="password" placeholder=" password" required="required"><br><br>
			<input type="checkbox" id="remember" name="remember" value="remember">
			<label for="remember"> Remember me</label><br><br>
			<input type="submit" value="login">
		</form>
		<a href="R_registration.jsp">Create Account</a>

		<!-- we are using the librery sweetalert to get alert msg after completion of event -->
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" href="alert/dist/sweetalert.css"> 
		
		<script type="text/javascript">
		var status=document.getElementById("status").value;
		if(status=="Failed")
		{
			swal("Sorry","Wrong Email or Passward","error");
		}
		if(status=="invalidCEmail")
		{
			swal("Sorry","Email Is Empty","error");
		}
		if(status=="invalidCpwd")
		{
			swal("Sorry","Password Is Empty","error");
		}
		</script>
</html>