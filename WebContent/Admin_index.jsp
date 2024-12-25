<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin | ASTU</title>
    <link rel="icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZzPo9uv7MUCwwLTBVLgf29PIwG_Or3n2uVw&usqp=CAU">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        .body {
            width: 90%;
            margin: 0 auto;
        }

        /* Existing table styles */
        #table {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 75%;
            margin: 20px auto;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }

        #table td, #table th {
            border: 1px solid #ddd;
            padding: 12px;
        }

        #table tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        #table tr:hover {
            background-color: #e9ecef;
            transform: scale(1.01);
            transition: all 0.3s ease;
        }

        #table th {
            padding: 15px;
            text-align: center;
            background: linear-gradient(135deg, #007bff, #00bcd4);
            color: white;
            border: 2px solid #ddd;
        }

        #table td {
            text-align: center;
        }

        /* Enhanced navigation styles */
        .nav {
            padding: 0;
            margin: 0;
            text-decoration: none;
            list-style: none;
            box-sizing: border-box;
        }

        nav {
            background: linear-gradient(135deg, #007bff, #00bcd4);
            height: 80px;
            width: 100%;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: fixed;
            top: 0;
            z-index: 1000;
        }

        label.logo {
            color: white;
            font-size: 35px;
            line-height: 80px;
            padding: 0 100px;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
        }

        nav ul {
            float: right;
            margin-right: 20px;
        }

        nav ul li {
            display: inline-block;
            line-height: 50px;
            margin: 0 5px;
        }

        nav ul li a {
            color: white;
            font-size: 17px;
            padding: 7px 13px;
            border-radius: 3px;
            transition: all 0.3s ease;
        }

        nav ul li a:hover {
            background: rgba(255,255,255,0.2);
            color: #fff;
        }

        .checkbtn {
            font-size: 30px;
            color: white;
            float: right;
            line-height: 80px;
            margin-right: 40px;
            cursor: pointer;
            display: none;
        }

        #check {
            display: none;
        }

        /* New Slider Styles */
        .slider-container {
            margin-top: 80px;
            width: 100%;
            height: 400px;
            position: relative;
            overflow: hidden;
        }

        .slide {
            position: absolute;
            width: 100%;
            height: 100%;
            opacity: 0;
            transition: opacity 0.5s ease-in-out;
        }

        .slide.active {
            opacity: 1;
        }

        .slide-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            color: white;
            z-index: 2;
        }

        .slide-content h2 {
            font-size: 3em;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
        }

        .slide-content p {
            font-size: 1.2em;
            margin-bottom: 30px;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.5);
        }

        .slide-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: brightness(0.7);
        }

        /* Dashboard Cards */
        .dashboard-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
            margin-top: 20px;
        }

        .dashboard-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            width: 250px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
        }

        .dashboard-card i {
            font-size: 2em;
            color: #007bff;
            margin-bottom: 10px;
        }

        .dashboard-card h3 {
            margin: 10px 0;
            color: #333;
        }

        .dashboard-card p {
            color: #666;
        }

        @media (max-width: 952px) {
            label.logo {
                font-size: 30px;
                padding-left: 50px;
            }
            nav ul li a {
                font-size: 16px;
            }
            .dashboard-card {
                width: calc(50% - 20px);
            }
        }

        @media (max-width: 858px) {
            .checkbtn {
                display: block;
            }
            nav ul {
                position: fixed;
                width: 100%;
                height: 100vh;
                background: #2c3e50;
                top: 80px;
                left: -100%;
                text-align: center;
                transition: all .5s;
                z-index: 999;
            }
            nav ul li {
                display: block;
                margin: 50px 0;
                line-height: 30px;
            }
            nav ul li a {
                font-size: 20px;
            }
            #check:checked ~ ul {
                left: 0;
            }
            .dashboard-card {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <nav class="nav">
        <div class="navbody">
            <input type="checkbox" id="check">
            <label for="check" class="checkbtn">
                <i class="fas fa-bars"></i>
            </label>
            <a href="index.jsp" style="padding:20px; text-decoration: none;">
                <label class="logo">ASTU</label>
            </a>
            <ul>
                <li><a class="active" href="Admin_index.jsp">Home</a></li>
                <li><a href="ManageUsers/user-list.jsp">User Management</a></li>
                <li><a href="order-list.jsp">Order Management</a></li>
                <li><a href="delivery-list.jsp">Delivery Management</a></li>
                <li><a href="product-list.jsp">Menu Management</a></li>
            </ul>
        </div>
    </nav>

    <!-- Image Slider -->
    <div class="slider-container">
        <div class="slide active">
            <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='100%25' height='100%25' viewBox='0 0 800 400'%3E%3Crect fill='%23007bff' width='800' height='400'/%3E%3C/svg%3E" class="slide-img" alt="Admin Dashboard">
            <div class="slide-content">
                <h2>Welcome to Admin Dashboard</h2>
                <p>Manage your system efficiently</p>
            </div>
        </div>
    </div>

    <!-- Dashboard Cards -->
    <div class="dashboard-container">
        <div class="dashboard-card">
            <i class="fas fa-users"></i>
            <h3>User Management</h3>
            <p>Manage system users and their permissions</p>
        </div>
        <div class="dashboard-card">
            <i class="fas fa-shopping-cart"></i>
            <h3>Order Management</h3>
            <p>Track and manage customer orders</p>
        </div>
        <div class="dashboard-card">
            <i class="fas fa-truck"></i>
            <h3>Delivery Management</h3>
            <p>Monitor delivery status and assignments</p>
        </div>
        <div class="dashboard-card">
            <i class="fas fa-utensils"></i>
            <h3>Menu Management</h3>
            <p>Update and manage product menu</p>
        </div>
    </div>

    <script>
        // Slider functionality
        let slideIndex = 0;
        const slides = document.querySelectorAll('.slide');

        function showSlides() {
            slides.forEach(slide => slide.classList.remove('active'));
            slideIndex++;
            if (slideIndex > slides.length) {slideIndex = 1}
            slides[slideIndex-1].classList.add('active');
            setTimeout(showSlides, 5000); // Change slide every 5 seconds
        }

        // Initialize slider
        showSlides();
    </script>
</body>
</html>