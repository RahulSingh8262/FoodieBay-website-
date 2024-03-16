<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@page import="java.sql.*" %>
<%@page import="java.io.PrintWriter" %>
<%String rid=request.getParameter("rid");%>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
			
		<style>
			.header{border-bottom:1px solid black; height:px; width:1100px; margin-left:120px; padding-bottom:15px; display:flex;padding-top:15px;}
			.h2{width:1100px; margin-left:120px;font-size:20px;}
			.cl{border:; margin-left:450px; font-size:30px; margin-top:15px;}
			table{width:100%;}
			th{border-bottom:1px solid black; padding-top:5px; padding-bottom:5px;}
			table, th, td {text-align: center; }
		</style>
	</head>
	<body>
	<div class="header">
		<div class="cl"><b>All Orders</b></div>
	</div>
	<div class="h2">
		<table>
			<tr>
				<th>Customer Name</th>
				<th>Food</th>
				<th>Quantity</th>
				<th>Date & Time</th>
				<th>Price</th>
			</tr>
			<%
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/FoodieBay?allowPublicKeyRetrieval=true&autoReconnect=true&useSSL=false", "root", "root");
			PreparedStatement pstmt = con.prepareStatement("SELECT Menu.id, Orders.Customer_name, Menu.food, Menu.quantity, Orders.order_date, Orders.price FROM Orders INNER JOIN Menu ON Menu.rid=Orders.rid WHERE Orders.rid=?");
			pstmt.setString(1, rid);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
			    //String fid = rs.getString("id");
			    String customer = rs.getString("Customer_name");
			    String food = rs.getString("food");
			    String quantity = rs.getString("quantity");
			    String date = rs.getString("order_date");
			    String price = rs.getString("price");
				
			%>	
					<tr id="orderData">
						<td><%=customer %></td>
						<td><%=food %></td>
						<td><%=quantity %></td>
						<td><%=date %></td>
						<td><%=price %></td>
					</tr>
			<%} %>		
		</table>
	</div>

	</body>
</html>