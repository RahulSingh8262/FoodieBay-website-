<%
	if(session.getAttribute("name")==null)
	{
		response.sendRedirect("R_login.jsp");
	}
%>
<%@page import="java.sql.*" %>
<%@page import="java.io.PrintWriter" %>
<html>
	    <%
	    	String rname="";
	    	String oname="";
	    	String rid="";
	    	String img="";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodiebay?allowPublicKeyRetrieval=true&autoReconnect=true&useSSL=false","root","root");
			String rmail=request.getParameter("EId");
			PreparedStatement pstmt=con.prepareStatement("SELECT * FROM Restaurants WHERE email=?");
			pstmt.setString(1,rmail);
	 		ResultSet rs=pstmt.executeQuery();
	 		while(rs.next())
	 		{
	 			rname=rs.getString("name");
	 			oname=rs.getString("owner_name");
	 			rid=rs.getString("id");
	 			img=rs.getString("wallpaper");
	 		}	
		%>
	<head>
		<title>Restaurants Dashboard</title>
		<link rel="icon" type="image/x-icon" href="FoodieBay_logo.png">
		<style>
			.l_side{border-right:1px solid black; width:60px;height:100%;}
			#r_side{border:1px solid black; width:100%; height:100%;}
			.dashboard{width:100%; height:100px; border-bottom:1px solid black;}
			.main_body{height:; width:100%; border:;}
			.owner_name{border:; height:20px; width:600px; text-transform:uppercase; padding-top:10px; font-size:18px;}
			.container1{border:; height:22px; width:1320px; display:flex; margin:5px;}
			.res_name{border:; height:65px; width:525px; font-size:55px; text-align:right; margin-top:px; margin-left:800px;}			
			.lower_body{display:flex; height:100%; width:100%;}
			
			#add{border:1px solid back; height:35px; width:35px; margin-left:5px; margin-top:5px;}
			#m_list{border:1px solid back; height:35px; width:35px; margin-left:5px; margin-top:5px;}
			#order{border:1px solid back; height:35px; width:35px; margin-left:5px; margin-top:5px;}
			#sm2{border:; width:100px; height:px; margin-left:900px; text-align:right; padding-top:10px;}	
			
			img[name=add]{border:1px solid back; height:35px; width:35px;margin-left:5px; margin-top:5px;}
			img[name=orders]{border:1px solid back; height:35px; width:35px;margin-left:5px; margin-top:5px;}
			img[name=list]{border:1px solid back; height:35px; width:35px;margin-left:5px; margin-top:5px;}
		</style>
	</head>
	<body>
	<!-- we will get the status value from C_registrationServelet (suces or fail) -->
	<input type="hidden" id="status" value="<%=request.getAttribute("status") %>">
	
		<div class="main_body">
			<div class="dashboard">
				<div class="container1">
					<div class="owner_name">
						<b>WELCOME <%=oname %></b>
					</div>
					<div id="sm2">
						RID: <%=rid %>
					</div>
				</div>
				<div class="res_name">
					<b>
						<%=rname %>
					</b>
				</div>
			</div>
			<div class="lower_body">
				<div class="l_side">
					<input type="hidden" id="rid" name="rid" value="<%=rid %>">
					<div id="add" onClick="Add();">
						<img src="images/add(+).png" name="add" id="add">
					</div>
					<div id="m_list" onclick="Rlist();">
						<img src="images/list2.png" name="list" id="list">
					</div>
					<div id="order" onclick="Order()">
						<img src="images/orders.png" name="orders" id="orders">
					</div>
				</div>
				<div id="r_side">
				
				</div>
			</div>
	
		
	</body>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		let rid = $("#rid").val();
		function Add()
		{
	    	$('#r_side').load('R_add.jsp?rid='+rid);
		}
		function Rlist()
		{
			$('#r_side').load('R_list.jsp?rid='+rid);
		}
		function Order()
		{
			$('#r_side').load('ListOrders.jsp?rid='+rid);
		}
	</script>
</html>