<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.Adminlogin.DAO.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Success - ASTU</title>
    <link rel="icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZzPo9uv7MUCwwLTBVLgf29PIwG_Or3n2uVw&usqp=CAU">
    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('https://source.unsplash.com/1920x1080/?nature,abstract') no-repeat center center fixed;
            background-size: cover;
        }
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            backdrop-filter: blur(10px);
            background-color: rgba(0, 0, 0, 0.5);
            z-index: -1;
        }
        .container {
            position: relative;
            text-align: center;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            max-width: 400px;
            width: 90%;
        }

        .container h1 {
            color: #4CAF50;
            font-size: 2rem;
            margin-bottom: 10px;
        }

        .container p {
            font-size: 1rem;
            color: #333;
        }
    </style>
</head>
<body>

<div class="overlay"></div>

<div class="container">
    <h1>Login Successful!</h1>
    <p>Welcome! You have successfully logged in to ASTU.</p>
</div>
</body>
</html>
