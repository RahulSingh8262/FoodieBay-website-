<%@page import="java.sql.*" %>
<%@page import="java.io.PrintWriter" %>
<html>
	<head>
		<title>let's choose something delicious</title>
		<link rel="icon" type="image/x-icon" href="FoodieBay_logo.png">
		<style>
			.main_body{border:; width:100%; height:100%;}
			.header1{border-bottom:; width:100%; height:65px; display:flex;}
		 	.logo{border:; height:65px; width:65px; margin-right:5px; margin-left:8px;}
			.ordernow{border:; height:25px; width:200px; font-size:20px; color:purple; margin-left:10px; margin-top:20px;}
			.rname{border:; height:50px; width:380px; font-size:35px; margin-top:10px; color:white;}
			.leftBody{border:; display:flex; flex-wrap:wrap; padding-left:21px; padding-right:px; width:993px; align-contant:center;}
			.R_container{border:; margin:10px; width:283px; height:365px; display-column:flex;}
			.pic{border:; margin:5px; width:272px; height:267px;}
			.sub_container{border:; height:75px; width:267px; margin:5px;}
			.fname{border:; width:190px; margin-top:8px; padding-left:3px; text-transform:capitalize; font-size:20px;}
			.sub1{border-bottom:1px solid gray; height:37.5px; width:267px; display:flex;}
			.sub2{border:; height:37.5px; width:267px; padding-top:3px; padding-left:3px; display:flex; justify-content:space-between;}
			.price{border:; height:25px; width:70px; margin-left:px; margin-top:8px; color:green; padding-top:3px; display:flex;}
			.rup_S{border:; height:25px; width:12px; color:black;}
			.header2{border:; height:260px; width:100%; background-color:black; display:flex;}
			.rimg{border:; margin-top:17px; margin-left:50px; height:225px; width:225px;}
			.header2details{border:; height:225px; width:380px; margin-left:25px; margin-top:17px;}
			.h2d1{border:; height:25px; width:380px; text-transform:capitalize; color:white;}
			.h2d2{border:; height:25px; width:380px; text-transform:capitalize; color:white;}
			.h2d3{border:; height:35px; width:60px; font-size:25px; color:white;}
			.filter{border-bottom:; height:65px; width:100%;}
			.RightBody{border-left:1px solid gray; width:400px;}
			.lowerbody{border:; width:100%; display:flex;}
			.R_title{border-bottom:1px solid gray; width:100%; height:65px; display:flex;}
			.R_logo{border:; width:65px; height:65px; margin-left:5px;}
			.text{border:; width:280px; height:65px; margin-left:15px; font-size:55px;}
			.R_items{border:; height:25px; width:100%; font-size:20px; color:gray;}
			.btn{color:red;}
			
			.R_container:hover{border:1px solid gray;}
			input[name=add]:hover{box-shadow: 2px 2px lightgray;}
			
			input[name=add]{color:green; background:white;}
			img[name=R_logo]{height:65px; weight:65px;}
			img[name=rimg]{height:225px; width:225px;}
			img[name=fimg]{height:267px; width:272px;}
			img[name=logo]{height:65px; width:65px;}
			
			#cart{display: flex; flex-direction: column;}
			#blockquote{}
			#cnt{padding-left:5px;}
		</style>
	</head>
	<body>
		<div class="main_body">
			<div class="header1">
				<div class="logo">
					<img name="logo" src="FoodieBay_logo.png">
				</div>
				<div class="ordernow">
					<b>ORDER NOW</b>
				</div>
			</div>
				<%
					String rid=request.getParameter("aa");
					String cmail=request.getParameter("cmail");
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodiebay?allowPublicKeyRetrieval=true&autoReconnect=true&useSSL=false","root","root");
					PreparedStatement pstmt=con.prepareStatement("SELECT * FROM Restaurants WHERE id=?;");
					pstmt.setString(1,rid);
					ResultSet rs=pstmt.executeQuery();
					while(rs.next())
					{
						String rname=rs.getString("name");
						String image=rs.getString("logo");
						String city=rs.getString("city");
						String country=rs.getString("country");
						String colony=rs.getString("colony");
						String rating=rs.getString("rating");
				%>
			<div class="header2">
				<div class="rimg">
					<img src="Restaurants_images/<%=image%>" name="rimg">
				</div>
				<div class="header2details">
					<div class="rname">
						<b><%=rname %></b>
					</div>
					<div class="h2d1">
						<%=city %>, <%=country %>
					</div>
					<div class="h2d2">
						<%=colony %>
					</div>
					<div class="h2d3">
						&#10032 <%=rating %>
					</div>
				</div>
			</div><%} %>
			<div class="lowerbody">
				<div class="leftBody">
					<div class="filter">
						
					</div>
					<%
						pstmt=con.prepareStatement("SELECT * FROM Menu WHERE rid=?;");
						pstmt.setString(1,rid);
						rs=pstmt.executeQuery();
						while(rs.next())
						{
							String fname=rs.getString("food");
							String price=rs.getString("price");
							String details=rs.getString("detail");
							String quantity=rs.getString("quantity");
							String category=rs.getString("category");
							String pic=rs.getString("pic");
							String fid=rs.getString("id");
					%>
					<div class="R_container" >
						<div class="pic">
							<img name="fimg" src="Menu_img/<%=pic%>">
						</div>
						<div class="sub_container">
							<div class="sub1">
								<div class="fname">
									<b><%=fname %></b>
								</div>
								<div class="price">
									<div class="rup_S">&#8377</div>
									<b> <%=price %>/-</b>
								</div>
							</div>
							<div class="sub2">
								<%=details %>
								<div class="add">
									<input onClick="count(); callservlet(this,this,this,this,this,this);" id="add" name="add" type="button" value="ADD" data-fid="<%=fid %>" data-cmail="<%=cmail %>" data-fname="<%=fname %>" data-detail="<%=details %>" data-price="<%=price %>" data-qnt="<%=quantity %>">
								</div>
							</div>
						</div>
					</div>
					<%}%>
				</div>
				<div class="RightBody">
					<div class="R_title">
						<div class="R_logo">
							<img src="FoodieBay_logo.png" name="R_logo">
						</div>
						<div class="text">
							Cart
						</div>
					</div>
					<div class="R_items">
						<span id="cnt">0</span> ITEMS
					</div>
					<div id="cart">
						<%
						String CustomerID="";
						pstmt=con.prepareStatement("SELECT id FROM Customers WHERE email=?");
						pstmt.setString(1,cmail);
						rs=pstmt.executeQuery();
						while(rs.next()){
							CustomerID=rs.getString("id");
						}
						pstmt=con.prepareStatement("SELECT Menu.food, Menu.detail, Menu.quantity, Menu.price, Cart.id FROM Menu INNER JOIN Cart ON Menu.id=Cart.fid WHERE Cart.cid=?");
						pstmt.setString(1,CustomerID);
						rs=pstmt.executeQuery();
						while(rs.next()){
							String fname=rs.getString("food");
							String details=rs.getString("detail");
							String quantity=rs.getString("quantity");
							String price=rs.getString("price");
							String cartid=rs.getString("id");
						
						%>
						<cartbody<%=cartid%>>
							<mark>&#9679;&#8414;</mark>
							<fname><%=fname %></fname><br>
							<detail><%=details %></detail>
							<right>
								<rate><b><%=price %>/-</b></rate>
								<btn onclick="reduceCart(this);" data-cartid="<%=cartid %>">X</btn>
							</right><br>
							<quantity>Quantity: <i><%=quantity%></i></quantity>
						</cartbody<%=cartid %>>'

						<%} %>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
    function callservlet(Fid,Cmail,Fname,Details,Price,Quantity)
    {
    	let qnt=Quantity.getAttribute('data-qnt')
    	let price=Price.getAttribute('data-price')
    	let details=Details.getAttribute('data-detail')
    	let fname=Fname.getAttribute('data-fname')
    	let fid=Fid.getAttribute('data-fid')
    	let cmail=Cmail.getAttribute('data-cmail')
    	$.ajax
    	({
             url: 'menuServlet',
             type: 'post',
             data:{id:fid, cmail:cmail},
             success: function (obj1) 
             {
            	 var cartid=obj1;
            	 var create;
                 create=document.getElementById("cart");
                 create.innerHTML+=
               	 '<cartbody'+cartid+'><mark>&#9679;&#8414;</mark><fname>'+fname+'</fname><br><detail>'+details+'</detail><right><rate><b>'+price+'/-</b></rate><btn onclick="reduceCart(this);" data-cartid="'+cartid+'">X</btn></right><br><quantity>Quantity: <i>'+qnt+'</i></quantity></cartbody'+cartid+'>';
               	 $("cartbody"+cartid).css("border", "1px solid lightgray");
               	$("cartbody"+cartid).css("padding-bottom", "10px");
               	$("mark").css("color", "green");
               	$("mark").css("margin-left", "10px");
               	$("fname").css("text-transform", "capitalize");
               	$("fname").css("margin-left", "10px");
               	$("fname").css("font-size", "20px");
               	$("mark").css("font-size", "20px");
               	$("detail").css("margin-left", "40px");
               	$("quantity").css("margin-left", "40px");
               	$("rate").css("color", "green");
               	$("rate").css("font-size", "20px");
               	$("rate").css("padding-right", "5px");
               	$("right").css("float", "right");
               	$("btn").css("padding-right", "2px");
            	$("btn").css("padding-left", "2px");
               	$("btn").css("color", "red");
               	$("btn").css("margin-right", "5px");
               	$("btn").hover(function(){
               	    $("btn").css("color","gray");
               	    $("btn").css("font-weight","bold");
               	 	$("btn").css("border", "1px solid red");
               	 	$("btn").css("box-shadow", "2px 2px lightgray");
               	},
               	function(){
               		$("btn").css("color","red");
               		$("btn").css("font-weight","normal");
               	 	$("btn").css("border", "1px solid gray");
               	 	$("btn").css("box-shadow", "none");
               		$("btn").css("border", "none");
               	});
               	
               	$("#b1").remove();
               	$("cartbody"+cartid).after('<form action="order.jsp"><input type="hidden" name="cmail" id="cmail" value="'+cmail+'"><b><input type="submit" id="b1" value="Place Order"></b></form>');
               	$("#b1").css("display", "block");
               	$("#b1").css("border", "1px solid black");
               	$("#b1").css("height", "35px");
               	$("#b1").css("width", "100%");
               	$("#b1").css("text-align", "center");
               	$("#b1").css("background-color", "white");
               	$("#b1").css("color", "green");
               	$("#b1").css("font-size", "25px");
               	$("#b1").hover(function(){
               		$("#b1").css("box-shadow", "3px 3px lightgray");
               		$("#b1").css("color", "white");
               		$("#b1").css("background-color", "green");
               	},
               	function(){
               		$("#b1").css("box-shadow", "none");
               		$("#b1").css("color", "green");
               		$("#b1").css("background-color", "white");	
               	});
             },
             error: function () 
             {
				alert("Oops! Something Went Wrong, Try again.");
             }
         });
	}
	var p=0;
	function count(){
		p++;
		let span = document.querySelector('#cnt');
		span.textContent = p;
	}
	function reduceCart(obj2)
	{
		p--;
		let span = document.querySelector('#cnt');
		span.textContent = p;
		let id=obj2.getAttribute('data-cartid')
		
   		$.ajax({
   		url:'menuServlet',
   		type: 'get',
        data:{id:id},
        success: function(){
        	$("cartbody"+id).remove();
        	if(p<=0)
        	{
        		$("#b1").remove();
        		p=0;
        		
        	}
        },
        error: function(){
        	alert("Oops! Something Went Wrong, Try again.");
        }
       });
   		
	}
	</script>
</html>