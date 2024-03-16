<html>
	<head>
		<title>Registration Page</title>
		<link rel="icon" type="image/x-icon" href="FoodieBay_logo.png">
		<style>
			a{
				text-decoration:none;
				margin-left:900px;
			}
			form{
				margin-left:900px;
				
				}
			h1{
				margin-left:900px; 
				margin-top:100;
			}
		</style>
	</head>
	<body>
	
	<!-- we will get the status value from C_registrationServelet (suces or fail) -->
	<input type="hidden" id="status" value="<%=request.getAttribute("status") %>">
	
		<h1>Sign In</h1>
		<form action="C_registrationServlet" target="_self" method="post" autocomplete="off">
			<label for="name">User Name:</label><br>
			<input type="text" id="name" name="name" placeholder=" user name" required="required" ><br><br>
			<label for="EId">Email ID:</label><br>
			<input type="email" id="EId" name="EId" placeholder=" your email" required="required" ><br><br>
			<label for="password">Enter Password:</label><br> 
			<input type="password" id="password" name="password" placeholder=" password" required="required"><br><br>
			<label for="repassword">Re-Enter Password:</label><br>
			<input type="password" id="repassword" name="repassword" placeholder=" password" required="required"><br><br>
			<label for="phoneno">Phone No:</label><br>
			<input type="text" id="phoneno" name="contact" placeholder=" phone no" required="required"><br><br>
			<input type="submit" value="Register">
		</form>
		<a href="C_login.jsp">Already Registered</a>
		
		<!-- we are using the librery sweetalert to get alert msg after completion of event -->
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" href="alert/dist/sweetalert.css"> 
		
		<script type="text/javascript">
		var status=document.getElementById("status").value;
		if(status=="Success")
		{
			swal("Congrats","Account Created Sucessfully","success");
		}
		if(status=="invalidCname")
		{
			swal("Sorry","Name Is Empty","error");
		}
		if(status=="invalidCEmail")
		{
			swal("Sorry","Email Is Empty","error");
		}
		if(status=="invalidCpwd")
		{
			swal("Sorry","Password Is Empty","error");
		}
		if(status=="invalidCrepwd")
		{
			swal("Sorry","Password Do Not Match","error");
		}
		if(status=="invalidCph")
		{
			swal("Sorry","Phone No. Is Empty","error");
		}
		if(status=="invalidCphlen")
		{
			swal("Sorry","Phone No. Is Empty	","error");
		}
		</script>
	</body>
</html>