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
        /* Body styling for background and layout */
        body {
            background-color: #f9f3f1; /* Light background color for the body */
            height: 100vh; /* Full viewport height */
            margin: 0; /* Remove default margin */
            display: flex; /* Use flexbox for centering */
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            font-family: Arial, Helvetica, sans-serif; /* Font styling */
        }

        /* Container to hold the form and title */
        .container {
            width: 60%; /* Set container width */
            text-align: center; /* Center align text inside container */
        }

        /* Styling the table displaying user data */
        #table {
            font-family: Arial, Helvetica, sans-serif; /* Font for the table */
            border-collapse: collapse; /* Collapse borders */
            width: 100%; /* Full width */
            background-color: white; /* White background for table */
            border-radius: 10px; /* Rounded corners for the table */
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* Shadow effect for subtle depth */
            margin-top: 20px; /* Space above the table */
            margin-bottom: 20px; /* Space below the table */
        }

        /* Table data and headers styling */
        #table td, #table th {
            border: 1px solid #ddd; /* Light gray border for cells */
            padding: 10px; /* Padding inside cells */
        }

        /* Styling for even rows */
        #table tr:nth-child(even) {
            background-color: #f2f2f2; /* Light background color for even rows */
        }

        /* Highlighting table row on hover */
        #table tr:hover {
            background-color: #ddd; /* Change background color on hover */
        }

        /* Table header styling */
        #table th {
            padding-top: 12px; /* Padding at the top of header */
            padding-bottom: 12px; /* Padding at the bottom of header */
            text-align: center; /* Center align header text */
            background-color: #d9e6fa; /* Light blue background for header */
            color: #2c3e50; /* Dark color for text */
            border: 2px solid #ddd; /* Light gray border for header */
        }

        /* Input styling for read-only fields */
        input {
            border: none; /* No border for inputs */
            background-color: transparent; /* Transparent background */
        }

        /* Submit button styling */
        input[type="submit"] {
            background-color: #ff6f61; /* Button color */
            color: white; /* Button text color */
            padding: 12px 24px; /* Button padding */
            border-radius: 5px; /* Rounded corners for button */
            cursor: pointer; /* Pointer cursor on hover */
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            font-size: 16px; /* Font size */
        }

        /* Button hover effect */
        input[type="submit"]:hover {
            background-color: #e25f54; /* Darker color on hover */
        }

        /* Button active effect */
        input[type="submit"]:active {
            background-color: #d14942; /* Even darker color when active */
        }

        /* Center alignment for the delete button */
        #delete-btn {
            text-align: center;
            margin-top: 20px; /* Space above the delete button */
        }

        /* Heading styling */
        h1 {
            text-align: center; /* Centered heading */
            color: #2c3e50; /* Dark text color */
            margin-bottom: 20px; /* Space below heading */
        }
    </style>
</head>
<body>

<%
    // Retrieve user details from request parameters (pre-populate form fields)
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
    <!-- Page Title -->
    <h1>Delete My Account</h1> <!-- Main title of the page -->

    <!-- Form for deleting the account -->
    <form action="delete" method="post"> <!-- Form submission to delete account -->
        <!-- Table to display the user's account information -->
        <table id="table">
            <!-- Customer ID Row -->
            <tr>
                <td>Customer ID</td>
                <td><input type="text" name="cusid" value="<%= id %>" readonly></td> <!-- Display the customer ID, read-only -->
            </tr>

            <!-- Name Row -->
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" value="<%= name %>" readonly></td> <!-- Display the name, read-only -->
            </tr>

            <!-- Email Row -->
            <tr>
                <td>Email Address</td>
                <td><input type="text" name="email" value="<%= email %>" readonly></td> <!-- Display the email, read-only -->
            </tr>

            <!-- Phone Number Row -->
            <tr>
                <td>Phone number</td>
                <td><input type="text" name="phone" value="<%= phone %>" readonly></td> <!-- Display the phone number, read-only -->
            </tr>

            <!-- Delivery Address Row -->
            <tr>
                <td>Delivery Address</td>
                <td><input type="text" name="address" value="<%= address %>" readonly></td> <!-- Display the delivery address, read-only -->
            </tr>

            <!-- User Name Row -->
            <tr>
                <td>User name</td>
                <td><input type="text" name="uname" value="<%= userName %>" readonly></td> <!-- Display the user name, read-only -->
            </tr>

            <!-- Role Row -->
            <tr>
                <td>Customer/Admin/Delivery Person</td>
                <td><input type="text" name="role" value="<%= role %>" readonly></td> <!-- Display the user role, read-only -->
            </tr>
        </table>

        <!-- Submit button to confirm deletion -->
        <div id="delete-btn">
            <input type="submit" name="submit" value="Delete My Account"> <!-- Button to delete the account -->
        </div>
    </form>
</div>

</body>
</html>
