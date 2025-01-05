<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Metadata and page settings -->
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Admin Dashboard for ASTU - Efficient system management.">
    <meta name="author" content="ASTU">
    <meta name="keywords" content="Admin, Dashboard, Management, ASTU, System">
    <title>Admin | ASTU</title>
    <link rel="icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZzPo9uv7MUCwwLTBVLgf29PIwG_Or3n2uVw&usqp=CAU">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <!-- Internal CSS for styling -->
    <style>
        /* Reset and basic styles */
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

        /* Table styling */
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

        /* Navigation bar styling */
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
            back
