<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login | ASTU</title>
    <link rel="icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZzPo9uv7MUCwwLTBVLgf29PIwG_Or3n2uVw&usqp=CAU" type="image/x-icon">

    <!-- Internal CSS for styling the page -->
    <style>
        /* Body styling for center alignment and background gradient */
        body {
            font-family: 'Roboto', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(120deg, #0f2027, #203a43, #2c5364); /* Gradient for background */
            color: #fff;
        }

        /* Container for the message and the button */
        .message-container {
            text-align: center;
            background: rgba(0, 0, 0, 0.7); /* Semi-transparent dark background */
            padding: 40px 60px;
            border-radius: 20px; /* Rounded corners */
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5); /* Shadow for depth */
            max-width: 400px; /* Maximum width of the container */
            width: 90%; /* Ensures responsiveness on smaller screens */
        }

        /* Styling for the main heading */
        h1 {
            color: red;
            font-size: 2.2em;
            margin-bottom: 15px;
            font-weight: bold;
        }

        /* Styling for the paragraph text */
        p {
            color: #d4fc79; /* Light green color for readability */
            font-size: 1em;
            line-height: 1.5;
            margin-bottom: 20px;
        }

        /* Styling for the button */
        .button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 1em;
            color: #fff;
            background-color: #1e90ff; /* Blue background color */
            border: none;
            border-radius: 5px; /* Rounded corners */
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s; /* Smooth transition on hover */
        }

        /* Hover effect for the button */
        .button:hover {
            background-color: #4682b4; /* Darker blue on hover */
            transform: scale(1.05); /* Slightly enlarges the button */
        }
    </style>
</head>

<body>
    <!-- Main container with message and button to go back to the login page -->
    <div class="message-container">
        <!-- Title for the page, indicating an error or restriction -->
        <h1>Access Denied</h1>

        <!-- Message to guide the user to enter credentials correctly -->
        <p>Please ensure you enter your credentials correctly to proceed.</p>

        <!-- Button that links back to the login page -->
        <a href="login.jsp" class="button">Back to Login</a>
    </div>
</body>

</html>
