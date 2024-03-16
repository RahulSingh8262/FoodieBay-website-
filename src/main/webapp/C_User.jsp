<html>
	<head>
		<title>My Account</title>
		<link rel="icon" type="image/x-icon" href="FoodieBay_logo.png">
		<style>
			#mainbody{border:; widt:100%; height:100%;}
			#header{border-bottom:1px solid black; height:65px; width:100%; display:flex;}
			#logo{border:; height:65px; width:65px; margin-left:5px;}
			#myacc{border:; height:25px; width:200px; font-size:20px; color:purple; margin-left:15px;margin-top:20px;}
			#uname{border:; height:25px; width:200px; font-size:20px; margin-left:750px; margin-top:20px; text-align:right;}
			#mymenu{border:1px solid lightgary; height:577px; width:225px; background-color:LightGray;}
			#order{border:; height:55px; width:201px; margin-left:25px; margin-top:45px; font-size:20px; padding-top:8px; display:flex;}
			#editprofile{border:; height:55px; width:201px; margin-left:25px; margin-top:25px; font-size:20px; padding-top:8px; display:flex;}
			#icon{border:; height:20px; width:20px; margin-right:5px; margin-left:3px;}
			#frame{border-left:1px solid gray; width:1125px;}
			#lowerbody{border:; display:flex;}
			#iamframe{height:575px; width:1120px; border:none;}
			
			#order:hover{background-color:white;}
			#editprofile:hover{background-color:white;}
			
			img[name=logo]{height:65px; width:65px;}
			img[name=icon]{height:20px; wedth:20px;}
			img[name=frame_img]{height:450px; widht:450px; margin-left:300px; margin-top:80px;}
			
		</style>
	</head>
	<body>
		<div id="mainbody">
		<%String cname=request.getParameter("uname");%>
			<div id="header">
				<div id="logo">
					<img src="FoodieBay_logo.png" name="logo">
				</div>
				<div id="myacc">
					<b>MY ACCOUNT</b>
				</div>
				<div id="uname">
					<b><%=cname %></b>
				</div>
			</div>
			<div id="lowerbody">
				<div id="mymenu">
					<div id="order">
						<div id="icon">
							<img name="icon" src="my_order.png">
						</div>
						<b>My Orders</b>
					</div>
					<%String cmail=request.getParameter("cusmail");%>
					 <div id="editprofile" onClick="MyProfile(this);" data-cmail="<%=cmail %>">
						<div id="icon">
							<img name="icon" src="edit.png">
						</div>
						<b>Edit My Profile</b>
					</div>
				</div>
				<div id="frame">
					<img src="manage_things.jpg" name="frame_img">
				</div>
			</div>
		</div>
	</body>
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	
	<script>
	function MyProfile(obj)
	{
        var cusmail=obj.getAttribute('data-cmail')
        console.log(cusmail)
		$.ajax
        ({
        	success: function () 
        	{
        		$('#frame').load('EditMyProfile.jsp?cmail='+cusmail);
        	},
        	error: function () 
        	{
        	    alert("Oops! Something Went Wrong, Try again.");
        	}
		});
	}
</script>
</html>