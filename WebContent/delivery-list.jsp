<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Delivery Management</title>
    <link rel="icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZzPo9uv7MUCwwLTBVLgf29PIwG_Or3n2uVw&usqp=CAU">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    
    <style>
        /* General Body Styling */
        .body {
            width: 90%;
            margin-left: auto;
            margin-right: auto;
        }

        /* Table Styling */
        #table {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 75%;
            margin-left: auto;
            margin-right: auto;
        }

        /* Table Cell Styling */
        #table td, #table th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        /* Alternating Row Colors */
        #table tr:nth-child(even) {background-color: #f2f2f2;}

        /* Hover Effect for Rows */
        #table tr:hover {background-color: #ddd;}

        /* Table Header Styling */
        #table th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: #d9e6fa;
            color: blue;
            border: 2px solid #ddd;
        }

        /* Button Styling */
        a {
            text-decoration: none;
            text-align: center;
        }

        #list {
            text-align: center;
            color: blue;
            text-decoration: none;
            font-weight: bold;
        }

        #addbtn {
            background-color: #7c66ad;
            border: none;
            color: white;
            padding: 15px 32px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.4s;
            font-weight: bold;
        }

        #addbtn:hover {
            background-color: blue;
            color: white;
     
