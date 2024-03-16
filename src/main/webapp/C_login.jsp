<html>
	<head>
		<title>Login Page</title>
		<link rel="icon" type="image/x-icon" href="FoodieBay_logo.png">
		<style>
			h1{margin-left:900px; margin-top:100;}
			form{margin-left:900px; margin-top:50;}
			a{margin-left:900px; text-decoration:none;}
			input{border:none; border-bottom:1px solid black;}
			
			input[name=submit]{border:1px solid black;}
		</style>
	</head>
	<body>
	<input type="hidden" id="status" value="<%=request.getAttribute("status") %>">
		<h1>LogIn</h1>
		<form action="C_loginServlet" target="_self" method="post">
			<input type="email" id="EId" name="EId" placeholder=" your email" required="required" ><br><br>
			<input type="password" id="password" name="password" placeholder=" password" required="required"><br><br>
			<input type="checkbox" id="remember" name="remember" value="remember">
			<label for="remember"> Remember me</label><br><br>
			<input type="submit" name="submit" value="login">
		</form>
		<a href="C_registration.jsp">Create Account</a>

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
	</body>
</html>