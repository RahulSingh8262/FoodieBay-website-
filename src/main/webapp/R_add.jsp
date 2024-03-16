<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@page import="java.sql.*" %>
<%@page import="java.io.PrintWriter"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
	.sb2{border:; width:400px; margin-left:25px;}
	.sb1{border:;width:400px;}
	.sub_body{border:; margin-top:20px; margin-left:150px; display:flex;}
	.cd{border:; margin-top:100px; margin-left:150px; width:300px; font-size:35px;}
	input[name=food_name]{width:400px; margin-top:15px; padding:5px;}
	input[name=details]{width:400px; margin-top:15px; padding:5px;}
	input[name=quantity]{width:400px; margin-top:15px; padding:5px;}
	input[name=price]{width:400px; margin-top:15px; padding:5px;}
	input[name=category]{width:400px; margin-top:15px; padding:5px;}
	input[name=pic]{width:400px; margin-top:15px; padding:5px;}
	input[type=submit]{color:white; background-color:blue; width:100px; height:30px; margin-left:875px; margin-top:15px;}	
	</style>
</head>
<body>
	<%String id=request.getParameter("rid");%>
	
<div class="cd"><b>Add Menu</b></div>
	<div class="sub_body">
		
		<div class="sb1">
		<form enctype="multipart/form-data" method="post">
			<input type="text" id="food_name" name="food_name" placeholder="Food Name">
			<input type="text" id="details" name="details" placeholder="Details">
			<input type="text" id="quantity" name="quantity" placeholder="Quantity">
			
		</div>
		<div class="sb2">
			<input type="number" id="price" name="price" placeholder="Price">
			<input type="text" id="category" name="category" placeholder="Category">
			<input type="file" id="pic" name="pic" placeholder="Food Picture">
			<input type="hidden" name="rid" id="rid" value="<%=id %>">
		</div>
		
	</div>
	<div> <input type="submit" onclick="Add_food();" id="submit" name="submit" placeholder="Submit"> </div>
	</form>
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>	
		<script>
		function Add_food() {
		    let formData = new FormData();
		    formData.append("food_name", $("#food_name").val());
		    formData.append("details", $("#details").val());
		    formData.append("quantity", $("#quantity").val());
		    formData.append("price", $("#price").val());
		    formData.append("category", $("#category").val());
		    formData.append("pic", $("#pic")[0].files[0]); // Get the selected file
		    formData.append("rid", $("#rid").val());

		    $.ajax({
		        url: 'R_addServlet',
		        type: 'post',
		        data: formData,
		        processData: false,  // Don't process the data
		        contentType: false,  // Don't set content type
		        success: function () {
		            alert("Food Added Successfully.");
		            
		        },
		        error: function () {
		            alert("Oops! Something Went Wrong, Try again.");
		        }
		    });
		}
		</script>
</body>
</html>