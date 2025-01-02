<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Delete My Account</title>
    <link rel="icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZzPo9uv7MUCwwLTBVLgf29PIwG_Or3n2uVw&usqp=CAU">
    <link rel="stylesheet" type="text/css" href="CSS/table.css">
    <style>
        body {
            background-color: #f9f3f1; /* Light background color */
            height: 100vh; /* Full height of the viewport */
            margin: 0; /* Remove default margin */
            display: flex; /* Use flexbox for centering */
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            font-family: Arial, Helvetica, sans-serif; /* Font styling */
        }

        .container {
            width: 60%; /* Set container width */
            text-align: center; /* Center text */
        }

        #table {
            font-family: Arial, Helvetica, sans-serif; /* Font for the table */
            border-collapse: collapse; /* Collapse borders */
            width: 100%; /* Full width */
            background-color: white; /* White background for table */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            margin-top: 20px; /* Space above the table */
            margin-bottom: 20px; /* Space below the table */
        }

        #table td, #table th {
            border: 1px solid #ddd; /* Light gray border */
            padding: 10px; /* Padding inside cells */
        }

        #table tr:nth-child(even) { 
            background-color: #f2f2f2; /* Light background for even rows */
        }
        #table tr:hover { 
            background-color: #ddd; /* Highlight row on hover */
        }

        #table th {
            padding-top: 12px; /* Top padding for header */
            padding-bottom: 12px; /* Bottom padding for header */
            text-align: center; /* Center align header text */
            background-color: #d9e6fa; /* Light blue background for header */
            color: #2c3e50; /* Dark text color for header */
            border: 2px solid #ddd; /* Light gray border */
        }

        input {
            border: none; /* No border for input */
            background-color: transparent; /* Transparent background */
        }

        input[type="submit"] {
            background-color: #ff6f61; /* Button color */
            color: white; /* Button text color */
            padding: 12px 24px; /* Padding for button */
            border-radius: 5px; /* Rounded corners for button */
            cursor: pointer; /* Pointer cursor on hover */
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1); /* Shadow effect */
            font-size: 16px; /* Font size for button */
        }

        input[type="submit"]:hover {
            background-color: #e25f54; /* Darker color on hover */
        }

        input[type="submit"]:active {
            background-color: #d14942; /* Even darker color when active */
        }

        #delete-btn {
            text-align: center; /* Center the delete button */
            margin-top: 20px; /* Space above the button */
        }

        h1 {
            text-align: center; /* Center align the heading */
            color: #2c3e50; /* Dark text color */
            margin-bottom: 20px; /* Space below the heading */
        }
    </style>
</head>
<body>

<%
    // Retrieve user details from request parameters
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String userName = request.getParameter("uname");
    String password = request.getParameter("pass");
    String role = request.getParameter("role");
%>

<div class="container">
    <h1>Delete My Account</h1> <!-- Page title -->

    <form action="delete" method="post"> <!-- Form submission to delete account -->
        <table id="table"> <!-- Table for displaying user information -->
            <tr>
                <td>Customer ID</td>
                <td><input type="text" name="cusid" value="<%= id %>" readonly></td> <!-- Readonly ID field -->
            </tr>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" value="<%= name %>" readonly></td> <!-- Readonly name field -->
            </tr>
            <tr>
                <td>Email Address</td>
                <td><input type="text" name="email" value="<%= email %>" readonly></td> <!-- Readonly email field -->
            </tr>
            <tr>
                <td>Phone number</td>
                <td><input type="text" name="phone" value="<%= phone %>" readonly></td> <!-- Readonly phone field -->
            </tr>
            <tr>
                <td>Delivery Address</td>
                <td><input type="text" name="address" value="<%= address %>" readonly></td> <!-- Readonly address field -->
            </tr>
            <tr>
                <td>User name</td>
                <td><input type="text" name="uname" value="<%= userName %>" readonly></td> <!-- Readonly username field -->
            </tr>
            <tr>
                <td>Customer/Admin/Delivery Person</td>
                <td><input type="text" name="role" value="<%= role %>" readonly></td> <!-- Readonly role field -->
            </tr>
        </table>
        <div id="delete-btn">
            <input type="submit" name="submit" value="Delete My Account"> <!-- Submit button for deletion -->
        </div>
    </form>
</div>

</body>
</html>
