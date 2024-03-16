<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }

        input,
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-bottom: 16px;
        }

        button {
            grid-column: span 2;
            background-color: #4caf50;
            color: #fff;
            padding: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #45a049;
        }

        .error-message {
            color: red;
            font-size: 14px;
            margin-top: -10px;
            margin-bottom: 10px;
        }
    </style>
</head>

<body>

    <form id="registrationForm" enctype="multipart/form-data" method="post">
        <div>
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
            <div class="error-message" id="nameError"></div>

            <label for="restaurantName">Restaurant Name:</label>
            <input type="text" id="restaurantName" name="restaurantName" required>
            <div class="error-message" id="restaurantNameError"></div>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <div class="error-message" id="emailError"></div>

            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phone" required>
            <div class="error-message" id="phoneError"></div>

			<label for="reataurantImage">Restaurant Image:</label>
            <input type="file" id="reataurantImage" name="reataurantImage" required>
            <div class="error-message" id="reataurantImageError"></div>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <div class="error-message" id="passwordError"></div>
        </div>
        <div>
            <label for="reEnterPassword">Re-enter Password:</label>
            <input type="password" id="reEnterPassword" name="reEnterPassword" required>
            <div class="error-message" id="reEnterPasswordError"></div>

            <label for="country">Country:</label>
            <select id="country" name="country" required>
                <!-- Add options for countries -->
                <option value="country1">Country 1</option>
                <option value="country2">Country 2</option>
            </select>
            <div class="error-message" id="countryError"></div>

            <label for="city">City:</label>
            <input type="text" id="city" name="city" required>
            <div class="error-message" id="cityError"></div>

            <label for="area">Area:</label>
            <input type="text" id="area" name="area" required>
            <div class="error-message" id="areaError"></div>

            <label for="pincode">Pincode:</label>
            <input type="text" id="pincode" name="pincode" required>
            <div class="error-message" id="pincodeError"></div>

            <label for="businessType">Business Type:</label>
            <select id="businessType" name="businessType" required>
                <option value="restaurant">Restaurant</option>
                <option value="homeFood">Home Food</option>
            </select>
            <div class="error-message" id="businessTypeError"></div>
        </div>

        <button type="button" onclick="submitForm()">Submit</button>
    </form>
    </body>

	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>	
    <script>
    function resetErrorMessages() {
        // Implement your logic to reset error messages
        // For example, if you have error message elements with IDs, you can set their innerHTML to an empty string
        $("#nameError").html('');
        $("#restaurantNameError").html('');
        $("#emailError").html('');
        // Add similar lines for other error messages
    }
    function submitForm() {
        // Reset previous error messages
        resetErrorMessages();

        // Collect form data using FormData
        let formData = new FormData();
        formData.append('name', $("#name").val());
        formData.append('restaurantName', $("#restaurantName").val());
        formData.append('email', $("#email").val());
        formData.append('phone', $("#phone").val());
        formData.append('password', $("#password").val());
        formData.append('reEnterPassword', $("#reEnterPassword").val());
        formData.append('country', $("#country").val());
        formData.append('city', $("#city").val());
        formData.append('area', $("#area").val());
        formData.append('pincode', $("#pincode").val());
        formData.append('businessType', $("#businessType").val());
        formData.append('reataurantImage', $("#reataurantImage")[0].files[0]);

        $.ajax({
            url: 'R_registrationServlet',
            type: 'post',
            data: formData,
            contentType: false,
            processData: false,
            success: function () {
                alert("Registered Successfully");
                window.history.go(-1);
            },
            error: function () {
                alert("Oops! Something Went Wrong, Try again.");
            }
        });
    }

    </script>
</html>
