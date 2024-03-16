<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@page import="java.sql.*" %>
<%@page import="java.io.PrintWriter" %>
<%String id=request.getParameter("rid");%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a{text-decoration:none;color:white; border-radius:5px; background-color:blue; height:75px; width:200px;font-size:35px; margin-top:20px; margin-left:30px; margin-right:30px;padding-left:15px;}
	.h2{width:1100px; margin-left:120px;font-size:20px;}
	.cl{border:; margin-left:450px; font-size:30px; margin-top:15px;}
	table{width:100%;}
	table, th, td {text-align:left; }
	input{border:none;}
	th{border-bottom:1px solid black; padding-top:5px; padding-bottom:5px;}
	img[name=pencil]{height:20px; width:20px;}
	img[name=minus]{height:20px; width:20px;margin-right:5px;}
	img[name=ppic]{height:20px; width:20px;}
	.i_img{height:20px; width:20px;}
	.icon{display:flex;}
	.header{border-bottom:1px solid black; height:px; width:1100px; margin-left:120px; padding-bottom:15px; display:flex;padding-top:15px;}
</style>
</head>
<body>
	<div class="header">
		<div class="cl"><b>Your Menu</b></div>
	</div>
	<div class="h2">
		<table>
			<tr>
				<th>Food</th>
				<th>Details</th>
				<th>Quantity</th>
				<th>Price</th>
				<th>Category</th>
				<th>Food Image</th>
				<th>Action</th>
			</tr>
			<%
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/FoodieBay?allowPublicKeyRetrieval=true&autoReconnect=true&useSSL=false","root","root");
				PreparedStatement pstmt=con.prepareStatement("SELECT * FROM Menu WHERE rid=? ORDER BY category;");
				pstmt.setString(1, id);
				ResultSet rs=pstmt.executeQuery();
				while(rs.next())
				{
					String food=rs.getString("food");
					String details=rs.getString("detail"); 
					String quantity=rs.getString("quantity");
					String price=rs.getString("price");
					String category=rs.getString("category");
					String pic=rs.getString("pic");
					String fid=rs.getString("id");
				
			%>	
					<tr id="d<%=fid %>">
						<td><input type="text" id="food" value="<%=food %>"></td>
						<td><input type="text" id="detail" value="<%=details %>"></td>
						<td><input type="text" id="quantity" value="<%=quantity %>"></td>
						<td><input type="text" id="price" value="<%=price %>"></td>
						<td><input type="text" id="category" value="<%=category %>"></td>
						<td><img name="ppic"src="Menu_img/<%=pic %>"></td>
						
						<td>
							<div class="icon">
								<div class="i_img" onclick="remove(this);" data-fid="<%=fid %>" ><img name="minus" id="minus" src="images/minus.png" ></div>
																
								<div class="i_img" onclick="Edit(this);" data-fid="<%=fid %>" ><img name="pencil" id="pencil" src="images/pencil.png"></div>
							</div>
						</td>
					</tr>
			<%} %>		
		</table>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>	
		<script>

			function Edit(obj)
			{
				let id = obj.getAttribute('data-fid');
				let food = $("#food").val();
				let detail = $("#detail").val();
				let quantity = $("#quantity").val();
				let price = $("#price").val();
				let category = $("#category").val();
				
		    	$.ajax
		    	({
		             url: 'Menu_RemoveServlet',
		             type: 'get',
		             data:{id:id, food:food, detail:detail, quantity:quantity, price:price, category:category},
		             success: function () 
		             {
		                 alert("Menu Updated Successfully.");
		                 $("#d"+id).reload();
	
		             },
		             error: function () 
		             {
		                 alert("Oops! Something Went Wrong, Try again.");
		             }
		        });
			}
			function remove(obj)
			{
				let id = obj.getAttribute('data-fid');
				console.log(id);
		    	$.ajax
		    	({
		             url: 'Menu_RemoveServlet',
		             type: 'post',
		             data:{id:id},
		             success: function () 
		             {
		                 alert("Menu Deleted Successfully.");
		                 $("#d"+id).remove();

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