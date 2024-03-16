  <%
	if(session.getAttribute("name")==null)
	{
		response.sendRedirect("C_login.jsp");
	}
%>
<html>
	<head>
		<title>FoodieBay Home</title>
		<link rel="icon" type="image/x-icon" href="FoodieBay_logo.png"> 
		<style>
			.R_rating{height:25px; width:25px; margin-left:px;}
			.R_name{border:; width:225px; height:35px;}
			.R_data{border:; height:75px; width:267px; margin:5px; display-column:flex;}
			.R_sub_data{height:35px; width:275px; display:flex;	}
			.R_img{border:; margin:5px; width:272px; height:267px;}
			.R_container{border:; margin:10px; width:283px; height:365px; display-column:flex;}
			.filters{width:100%; height:65px; border-bottom:1px solid black; display:flex;}
			.lower_body{display:flex; flex-wrap:wrap; border:; padding-left:50px; padding-right:50px;}
            .main{height:100%; width:100%;}
            .header{height:75px; width:100%; border:; display:flex;}
            .features{height:48%; width:100%; border:; background-color:#282c3f; display:flex; border-bottom:1px solid black;}
            .search_icon{border:1px solid black; height:40xp; width:40px; padding-left:; padding-top:px;}
            .searchBar{height:30px; width:250px; padding-left:65px; padding-top:15px; display:flex;}
            .filt{height:30px; width:100px; padding-left:830px; padding-top:15px;}
            .R_container:hover{border:1px solid grey; decoration:none;}
            
            #logout{border:; height:25px; width:80px; text-decoration:none; color:black; font-family:Fantasy; font-size:25px; margin-top:22px; margin-left:15px;}
            #header1{border:; width:265px; height:75px;}
            #home_food:hover{transform: scale(1.07,1.07); transition-duration: .8s;}
            #R_food:hover{transform: scale(1.07,1.07); transition-duration: .8s;}
            #food_Bank:hover{transform: scale(1.07,1.07); transition-duration: .8s;}
            #Rrating{color:white; background-color:green; padding-left:3px; padding-right:3px;}
            #Rname{text-align:left; margin-left:5px;}
            #quick_view{codlor:transparent; text-align:center}
            #header2{border:; height:25px; width:310px; margin-top:22px; font-size:23px; margin-left:680px; text-align:right; display:flex; flex-direction:row-reverse;}
            #homefood{border:; height:240px; width:250px; margin-left:250px; margin-top:35px;}
            
            a{text-decoration:none; color:black;}
            
            
            img[id=search_icon]{height:28px; width:28px;}
            img[id=food_Bank]{height:240px; width:250px;padding-left:25px;padding-top:35px;}
            img[name=R_food]{height:240px; width:250px;padding-left:25px;padding-top:35px;}
            img[id=home_food]{height:240px; width:250px;}
            img[id=logo]{height:75px; width:265px;}
            img[name=usericon]{height:25px; width:25px;}
            input[name=username]{border:none; background-color:white; font-size:25px; border:;}
            input[name=searchBar]{height:30px; width:200px;}
            input[name=username]:hover{color:orange;}
            select[id=filt]{height:30px; width:100px;}
		</style>
	</head>
	<body>
		<div class="main">
			<div class="header">
				<div id="header1">
					<img src="FoodieBay.jpg" id="logo">
				</div>
				<div id="header2">
				<form action="C_User.jsp"><b>
				<%
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodiebay?allowPublicKeyRetrieval=true&autoReconnect=true&useSSL=false","root","root");	
					String cmail=request.getParameter("EId");
					PreparedStatement pstmt=con.prepareStatement("SELECT name FROM Customers WHERE email=?;");
					pstmt.setString(1,cmail);
					ResultSet set=pstmt.executeQuery();
					while(set.next())
					{
						String cname=set.getString("name");%>
						<input type="submit" name="username" value="<% out.println(cname);%>">
						<input type="hidden" id="uname" name="uname" value="<%=cname %>">
						
				<%}%>
				<input type="hidden" id="cusmail" name="cusmail" value="<%=cmail %>">
				</b></form>
				</div>
				<div id="logout">
				<a href="C_login.jsp">Logout</a>
				</div>
			</div>
			
			<div class="features">
				<div id="homefood" onClick="HomeFood();">
					<img id="home_food" name="home_food"src="home_food.png">
				</div>
				<div id="R_food" onClick="HomeFood();">
					<img id="R_food" name="R_food"src="images/Rimg.jpg">
				</div>
				<div id="food_Bank" onClick="HomeFood();">
					<img id="food_Bank" name="food_Bank"src="images/FoodBank.jpg">
				</div>
			</div>
			
			
			
			<div class="filters">
				
				
				<div class="searchBar">
					<input type="text" id="searchBar" name="searchBar" placeholder="Search..">
					<div class="search_icon" onClick=""> <img src="images/search.png" id="search_icon" name="search_icon"></div>
				</div>
				
				
				<div class="filt">
					<select id="filt" name="fily">
             			<option value="all">All Foods</option>
             			<option value="veg">Vegitarian</option>
                		<option value="non-veg">Non-Vegitarian</option>
            		</select>
				</div>
			</div>
						
			
			<div id="lower_body" class="lower_body" >
				<form action="menu.jsp" name="form" id="form">
				<input type="hidden" id="aa" name="aa" value="">
				<input type="hidden" name="cmail" id="cmail" value="<%=cmail %>"></form>
				<%@page import="java.sql.*" %>
				<%@page import="java.io.PrintWriter" %>
				<%
					Statement stmt=con.createStatement();
					ResultSet rs=stmt.executeQuery("SELECT * FROM Restaurants;");
							
					while(rs.next())
					{
						String Rname=rs.getString("name");
						String rating=rs.getString("rating");
						String rid=rs.getString("id");
				%>
				
					<div class="R_container" onClick="valueSet(this); document.forms['form'].submit();" data-id="<%=rid %>">
					
						<div class="R_img">
							<% 
								String image=rs.getString("logo");
							%>
							<img style="height:267px; width:272px;"src="Restaurants_images/<%=image%>">
						</div>
						<div class="R_data">
							<div class="R_sub_data">
								<div class="R_name">
									<p id="Rname"><b><%=Rname %></b></p>
								</div>
								<div class="R_rating ">
									<p id="Rrating"><%=rating %></p>
								</div>
							</div>
							<div>
								<p id="quick_view">quick view</p>
							</div>
						</div>
					</div>
				<%}rs.close();%>
			</div>
			
		</div>
	</body>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		let cmail = $("#cusmail").val();
		function HomeFood()
		{
	    	$('#lower_body').load('homeFood.jsp?cmail='+cmail);
		}
		function valueSet(obj){
			let id=obj.getAttribute('data-id')
			document.querySelector('#aa').value=id
		}
		
		
	</script>
</html>