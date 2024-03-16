<html>
    <head>
    	<title>FoodieBay</title>
		<link rel="icon" type="image/x-icon" href="FoodieBay_logo.png">
        <style>
            body{
                background-image: url('');
                background-repeat: no-repeat;
				background-attachment: fixed;
				background-size: cover;
            }
            .flex{
                display: flex;
            }
            .break{
                width: 50%;
                height:100%;
            }
            .main{
                height: 100%;
                width:100%;
            }
            #b1{
                margin-top: 275px;
                margin-left: 370px;
            }
            #b2{
                margin-top: 275px;
                margin-left: 150px;
                padding: 12px 26px 12px 26px;
            }
            button:hover{
                background-color:#26a541 ;
                color: black;
            }
            button{
                font-size:32px;
                font-family:Times New Roman;
                font-weight: bold;
                padding: 12px;
                background-color: #ff905a;
                color: white;
                border:none;
                border-radius: 5px;
            }
            #h1{
                color: red  ;
                position: absolute;
                top: 80px;
                left: 42%;
            }
        </style>
    </head>
    <body>
        <div class="main flex" >
            <div class="flex">
                <h1 id="h1">Who Are You ?</h1>
            </div>
            <div class="break">
                <button onclick="document.location='R_login.jsp'" id="b1">Restaurant</button>
            </div>
            <div class="break">
                <button onclick="document.location='C_login.jsp'" id="b2">Customer</button>
            </div>
        </div>
    </body>
</html>