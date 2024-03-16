<html>
<%@page import="java.sql.*" %>
<%@page import="java.io.PrintWriter"%>
	<head>
		<title>Insert title here</title>
		<style>
			.flex{display:flex;}
			.body{border:; margin-left:25px; margin-top:55px;}
			.div{border:; margin-left:25px; margin-top:20px;}
		
			#label{border:; width:150px;}
			
			input[id=name]{border:none; border-bottom:1px solid gray; width:300px;}
			input[id=email]{border:none; border-bottom:1px solid gray; width:300px;}
			input[id=password]{border:none; border-bottom:1px solid gray; width:300px;}
			input[id=city]{border:none; border-bottom:1px solid gray; width:300px;}
			input[id=house]{border:none; border-bottom:1px solid gray; width:300px;}
			input[id=pincode]{border:none; border-bottom:1px solid gray; width:300px;}
			input[id=colony]{border:none; border-bottom:1px solid gray; width:300px;}
			input[id=country]{border:none; border-bottom:1px solid gray; width:300px;}
			input[id=contact]{border:none; border-bottom:1px solid gray; width:300px;}
			input[name=submit]{border:1px solid lightgray; color:white; background-color:green; box-shadow:2px 2px lightgray;}
			
			input[name=submit]:hover{background-color:white; color:green;}
		</style>
	</head>
	<body>
		<div class="body">
			<%	
				String mail=request.getParameter("cmail");
				String id="";
				String name="";
				String email="";
				String password="";
				String contact="";
				String house="";
				String colony="";
				String city="";
				String pincode="";
				String country="";
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodiebay?allowPublicKeyRetrieval=true&autoReconnect=true&useSSL=false","root","root");
				PreparedStatement pstmt=con.prepareStatement("SELECT * FROM Customers WHERE email=?");
				pstmt.setString(1, mail);	
				ResultSet rs=pstmt.executeQuery();
				while(rs.next())
				{
					String cid=rs.getString("id");
					String cname=rs.getString("name");
					String cemail=rs.getString("email");
					String cpassword=rs.getString("password");
					String ccontact=rs.getString("contact");
					String chousename=rs.getString("house_name");
					String ccolony=rs.getString("colony");
					String ccity=rs.getString("city");
					String cpincode=rs.getString("pincode");
					String ccountry=rs.getString("country");
					id=cid;
					name=cname;
					email=cemail;
					password=cpassword;
					contact=ccontact;
					house=chousename;
					colony=ccolony;
					city=ccity;
					pincode=cpincode;
					country=ccountry;
				}
			%>
			<form>
				<div class="div flex">
			 		<div id="label">Name</div>:<div id="name2"><input type="text" id="name" value="<%=name%>"></div>
			 	</div>
			 	<div class="div flex">
			 		<div id="label">Email</div>:<div id="mail2"><input type="mail" id="email" value="<%=email%>"></div> 
				</div>
				<div class="div flex">
					<div id="label">Password</div>:<div id="pass2"><input type="password" id="password" value="<%=password%>"></div>
				</div>
				<div class="div flex">
					<div id="label">Contact No</div>:<div id="comtact2"><input type="number" id="contact" value="<%=contact%>"></div>
				</div>
				<div class="div flex">
					<div id="label">House Name</div>:<div id="house2"><input type="text" id="house" value="<%=house%>"></div>
				</div>
				<div class="div flex">
					<div id="label">Colony</div>:<div id="colony2"><input type="text" id="colony" value="<%=colony%>"></div>
				</div>	
				<div class="div flex">
					<div id="label">City</div>:<div id="city2"><input type="text" id="city" value="<%=city%>"></div>
				</div>
				<div class="div flex">
					<div id="label">City Pincode</div>:<div id="code2"><input type="number" id="pincode" value="<%=pincode%>"></div>
				</div>
				<div class="div flex">
					<div id="label">Country</div>:<div id="country2"><input type="text" id="country" value="<%=country%>"></div>
				</div>
				<div class="div">
					<input type="hidden" id="cid" value="<%=id %>">
					<input type="button" onclick="profile()" value="Save Changes" name="submit">
				</div>					
		</div>
		</form>
		<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>	
		<script>
			function profile()
			{
				let id = $("#cid").val();
				let name = $("#name").val();
				let mail = $("#email").val();
				let password = $("#password").val();
				let contact = $("#contact").val();
				let house = $("#house").val();
				let colony = $("#colony").val();
				let city = $("#city").val();
				let pincode = $("#pincode").val();
				let country = $("#country").val();
		    	$.ajax
		    	({
		             url: 'C_profileServlet',
		             type: 'post',
		             data:{id:id, name:name, mail:mail, password:password, contact:contact, house:house, colony:colony, city:city, pincode:pincode, country:country},
		             success: function () 
		             {
		                 alert("Your Profile Has Been Successfully Updated.");
		             },
		             error: function () 
		             {
		                 alert("Oops! Something Went Wrong, Try again.");
		             }
		        });
			}
		</script>
	</body>
</html>