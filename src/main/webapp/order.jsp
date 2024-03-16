<%@page import="java.sql.*" %>
<%@page import="java.io.PrintWriter" %>
<html>
	<head>
		<title>Checkout</title>
		<link rel="icon" type="image/x-icon" href="FoodieBay_logo.png">
		<style>
			.mainbody{height:100%; width:100%}
			.header{width:100%; height:65px; display:flex; border-bottom:1px solid lightgray;}
		 	.logo{border:; height:65px; width:65px; margin-right:5px; margin-left:8px;}
			.checkout{border:; height:25px; width:200px; font-size:20px; color:purple; margin-left:10px; margin-top:20px;}
			.lowerbody{width:100%; height:580px; display:flex; background-color:lightgray;}
			.rightbody{height:100%; width:35%; border:;}
			.leftbody{ height:100%; width:65%; border:;}
			.userdata{border:; height:100px; width:671px; background-color:white; margin-top:30px; margin-left:70px;}
			.loggedinas{border:; width:170px; font-size:18px; font-family:arial; font-weight:600; padding-top:20px; margin-left:15px; display:flex;}
			.usermail{width:px; font-size:18px; font-family:arial; font-weight:300; margin-top:15px; margin-left:25px;}
			.address{width:671px; height:400px; background-color:white; margin-top:20px; margin-left:70px;}
			.checkaddress{font-family:arial; font-size:18px; font-weight:600; padding-top:20px; margin-left:25px;}
			.flex{display:flex;}
			.div{border:; margin-left:25px; margin-top:20px;}
			.payment{border:; width:400px; height:515px; background-color:white; margin-top:30px;}
			.rimg{height:60px; width:60px; margin-left:25px; padding-top:25px;}
			.r_data{display:flex; border-bottom:;}
			.r_addr{border:; padding-top:25px; margin-left:15px;}
			.rname{font-size:20px; font-weight:600; text-transform:capitalize;}
			.rcolony{font-family:arial; text-transform:capitalize;}
			.rcity{font-family:arial; text-transform:capitalize;}
			.cart_body{border:; width:100%; height:410px; overflow:scroll; margin-top:15px;}
			.food_dtls{border:; width:300px; margin-bottom:10px;}
			.fname{ border:; margin-left:5px; text-transform:capitalize; font-size:20px;}
			.fdtls{ border:; font-family:arial; margin-left:5px; font-size:15px;}
			.qnt{ border:; margin-left:5px; font-family:arial; font-size:15px;}
			.price{ border:; text-align:right; width:50px; padding-top:20px; font-size:20px; color:green; font-weight:600;}
			.cart_dtls{border:; display:flex;}
			.mark{padding-top:5px; margin-left:9px; color:green; }
			.mfn{display:flex;}
			.pay{border-top:1px solid lightgray; display:flex; margin-top:15px; padding-top:10px; padding-bottom:20px; border-bottom:;}
			.paybill_amt{border:; font-size:25px; font-family:arial; width:250px; margin-left:5px; ;}
			.rupee{border:; color:green; font-size:25px; text-align:right; width:130px; font-weight:600;}
			rate{color:black;}
			#label{border:; width:150px;}
			#place_order{background-color:white; color:green; border:1px solid gray; box-shadow:2px 2px lightgray; margin-bottom:25px;}
			#place_order:hover{background-color:green; color:white;}
			
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
			input[name=x]{height:25px; font-weight:800; background-color:white; border:1px solid gray; margin-top:20px; color:red; margin-left:5px;} 
			
			input[name=submit]:hover{background-color:white; color:green;}	
			input[name=x]:hover{background-color:red; color:white; box-shadow:2px 2px lightgray;}
			
			img[name=logo]{height:65px; width:65px;}
			img[name=rimg]{height:60px; width:60px;}
		</style>
	</head>
	<body>
		<div class="mainbody">
			<div class="header">
				<div class="logo">
					<img name="logo" src="FoodieBay_logo.png">
				</div>
				<div class="checkout">
					<b>CHECKOUT</b>
				</div>
			</div>
			<div class="lowerbody">
				<div class="leftbody">
					<div class="userdata">
						<%
						String pass="";
						String cid="";
						String cname="";
						String contact="";
						String chouse="";
						String colony="";
						String city="";
						String pincode="";
						String country="";
						String cmail=request.getParameter("cmail");
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodiebay?allowPublicKeyRetrieval=true&autoReconnect=true&useSSL=false","root","root");
						PreparedStatement pstmt=con.prepareStatement("SELECT * FROM Customers Where email=?");
						pstmt.setString(1, cmail);
						ResultSet rs=pstmt.executeQuery();
						while(rs.next())
						{
							cid=rs.getString("id");
							cname=rs.getString("name");
							contact=rs.getString("contact");
							chouse=rs.getString("house_name");
							colony=rs.getString("colony");
							city=rs.getString("city");
							pincode=rs.getString("pincode");
							country=rs.getString("country");
							pass=rs.getString("password");
						}
						%>
						<div class="loggedinas">
							Logged in as 
						</div>
						<div class="usermail">
							<%=cmail %>
						</div>
					</div>
					<div class="address">
						<div class="checkaddress">
							Check Your Delivery Address
						</div>
									<form>
				<div class="div flex">
			 		<div id="label">Name</div>:<div id="name2"><input type="text" id="name" value="<%=cname%>"></div>
			 	</div>
			 	<input type="hidden" id="email" value="<%=cmail%>">
				<input type="hidden" id="password" value="<%=pass%>">
				<div class="div flex">
					<div id="label">Contact No</div>:<div id="comtact2"><input type="number" id="contact" value="<%=contact%>"></div>
				</div>
				<div class="div flex">
					<div id="label">House Name</div>:<div id="house2"><input type="text" id="house" value="<%=chouse%>"></div>
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
					<input type="hidden" id="cid" value="<%=cid %>">
					<input type="button" onclick="profile()" value="Update Address" name="submit">
				</div>					
			</div>
			</form>
				</div>
				<div class="rightbody">
					<div class="payment">
						<%
						String restaurants_logo="";
						String rname="";
						String rcolony="";
						String rcity="";
						String onetime_fid="";
						String rid="";
						pstmt=con.prepareStatement("SELECT fid FROM Cart WHERE cid=?");
						pstmt.setString(1,cid);
						rs=pstmt.executeQuery();
						while(rs.next()){
							onetime_fid=rs.getString("fid");
						}
						pstmt=con.prepareStatement("SELECT rid FROM Menu WHERE id=?");
						pstmt.setString(1, onetime_fid);
						rs=pstmt.executeQuery();
						while(rs.next()){
							rid=rs.getString("rid");
						}
						pstmt=con.prepareStatement("SELECT * FROM Restaurants WHERE id=?");
						pstmt.setString(1,rid);
						rs=pstmt.executeQuery();
						while(rs.next()){
							restaurants_logo=rs.getString("logo");
							rname=rs.getString("name");
							rcolony=rs.getString("colony");
							rcity=rs.getString("city");
						}
						%>
						<div class="r_data">
							<div class="rimg">
								<img src="Restaurants_images/<%=restaurants_logo %>" name="rimg">
							</div>
							<div class="r_addr">
								<div class="rname"><%=rname %></div>
								<div class="rcolony"><%=rcolony %></div>
								<div class="rcity"><%=rcity %></div>
							</div>
						</div>
						<div class="cart_data">
							<div class="cart_body" id="cart_body">
							<%
							int a=0;
							int n=0;
							pstmt=con.prepareStatement("SELECT COUNT(fid) AS total FROM Cart WHERE cid=?");
							pstmt.setString(1,cid);
							rs=pstmt.executeQuery();
							while(rs.next()){
								String length=rs.getString("total");
								n=Integer.parseInt(length);
							}
							float arr[]=new float[n];
							pstmt=con.prepareStatement("SELECT Cart.id, Menu.food,Menu.detail,Menu.quantity,Menu.price FROM Menu INNER JOIN Cart ON Menu.id=Cart.fid WHERE cid=?");
							pstmt.setString(1, cid);
							rs=pstmt.executeQuery();
							while(rs.next()){
								String fname=rs.getString("food");
								String details=rs.getString("detail");
								String qnt=rs.getString("quantity");
								float price=rs.getFloat("price");
								String cartID=rs.getString("id");
								arr[a]=price;
								a++;
							%>
					
								<div class="cart_dtls" id="<%=cartID%>">
									<div class="food_dtls">
										<div class="mfn"><div class="mark">&#9679;&#8414; </div><div class="fname"> <b><%=fname %></b></div></div>
										<div class="fdtls"><%=details %></div>
										<div class="qnt">Quantity: <%=qnt %></div>
									</div>
									<div class="price"><%=price %><rate>/-</rate></div>
									<input type="submit" name="x" value="X" onclick="reduceCart(this,this);" data-cartID="<%=cartID%>" data-price="<%=price%>">
								</div>
							<%}%>
							<div class="pay">
								<%
								float total=0;
								for(int i=0;i<n;i++)
								{
									total=total+arr[i];
								}
								%>
								<div class="paybill_amt">Total Pay Bill Amount:</div>
								<input type="hidden" id="total" value="<%=total%>"> 
								<div class="rupee" id="rupee"><%=total %><rate>/-</rate></div>
							</div>
							<input type="submit" onclick="placeOrder(this,this);" id="place_order" value="Place Order Now" data-cid="<%=cid%>" data-rid="<%=rid%>">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>	
		<script>
		function placeOrder(obj1,obj2)
		{
			let cid=obj1.getAttribute("data-cid");
			let rid=obj2.getAttribute("data-rid");
			$.ajax
			({
				url:'orderServlet',
				type:'post',
				data:{cid:cid,rid:rid},
				success: function()
				{
					alert("Successfully Ordered");
					window.history.go(-2);
					
				},
				error: function()
				{
					alert("Oops! Something Went Wrong, Try again.")
				}
			});
		}
		function profile()
			{
				let id=$("#cid").val();
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
			function reduceCart(obj1,obj2)
			{
				let cartID=obj1.getAttribute('data-cartID');
				let price=obj2.getAttribute('data-price');
				let total=$("#total").val();
		   		$.ajax({
		   		url:'menuServlet',
		   		type: 'get',
		        data:{id:cartID},
		        success: function(){
		        	$('#'+cartID+'').remove();
		        	total=total-price;
		        	document.querySelector('#total').value=total;
		        	document.querySelector('#rupee').textContent=total+" /-";
		        	if(total <= 0)
			       	{
			        	alert("Opps Your Cart Is Empty..!!!");
			        	let bb="'s";
			        	$("#cart_body").html('<input type="submit" id="goback" onclick="window.history.go(-2); return false;" value="Let'+bb+' Choose Something Delicious...">');
			        	$("#goback").css("margin-right","10px");
			        	$("#goback").css("margin-left","10px");
			        	$("#goback").css("font-family","arial");
			        	$("#goback").css("font-size","20px");
			        	$("#goback").css("color","#f0c90b");
			        	$("#goback").css("box-shadow","1px 1px lightgray");
			        	$("#goback").css("background-color","white");
			        	$("#goback").css("height","50px");
			        	$("#goback").css("width","360px");
			        	$("#goback").css("border","2px solid gray");
			        	$("#goback").after('<img src="images/cooked.png" id="cooking">');
			        	$("img[id=cooking]").css("margin-left","80px");
			        	$("img[id=cooking]").css("margin-top","30px");
			        	$("#goback").hover(function(){
			        		$("#goback").css("color","red");
			        		$("#goback").css("border","2px solid black");
			        	},
			        	function(){
			        		$("#goback").css("color","#f0c90b");
			        		$("#goback").css("border","2px solid gray");
			        	});
			       	}
		        },
		        error: function(){
		        	alert("Oops! Something Went Wrong, Try again.");
		        }
		       });
			}
		</script>
	</body>
</html>