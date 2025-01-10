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
        body {
            font-family: 'Roboto', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(135deg, #141e30, #243b55); /* Enhanced gradient */
            color: #fff;
            animation: fadeIn 1.5s ease-in-out; /* Smooth fade-in animation */
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        .message-container {
            text-align: center;
            background: rgba(0, 0, 0, 0.8);
            padding: 40px 60px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.6);
            max-width: 400px;
            width: 90%;
            animation: slideIn 1s ease-out; /* Slide-in animation */
        }

        @keyframes slideIn {
            from {
                transform: translateY(-20px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        h1 {
            color: #e74c3c;
            font-size: 2.5em;
            margin-bottom: 15px;
            font-weight: bold;
        }

        p {
            color: #ecf0f1;
            font-size: 1.1em;
            line-height: 1.6;
            margin-bottom: 25px;
        }

        .button {
            display: inline-block;
            padding: 12px 25px;
            font-size: 1em;
            color: #fff;
            background: linear-gradient(135deg, #2980b9, #6dd5fa);
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.4);
        }

        .button:hover {
            background: linear-gradient(135deg, #1e90ff, #4682b4);
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.6);
        }

        .button:focus {
            outline: none;
            box-shadow: 0 0 10px rgba(30, 144, 255, 0.8);
        }
    </style>
</head>

<body>
    <div class="message-container">
        <h1>Access Denied</h1>
        <p>Please ensure you enter your credentials correctly to proceed. If the problem persists, contact support.</p>
        <a href="login.jsp" class="button" aria-label="Return to login page">Back to Login</a>
    </div>
</body>

</html>
