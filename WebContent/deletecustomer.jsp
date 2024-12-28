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
            background-color: #f9f3f1;
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, Helvetica, sans-serif;
        }
        .container {
            width: 60%;
            text-align: center;
        }
        #table {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            margin-bottom: 20px;
        }

        #table td, #customers th {
            border: 1px solid #ddd;
            padding: 10px;
        }

        #table tr:nth-child(even) { background-color: #f2f2f2; }
        #table tr:hover { background-color: #ddd; }

        #table th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #d9e6fa;
            color: #2c3e50;
            text-align: center;
            border: 2px solid #ddd;
        }

        #table td {
            text-align: left;
        }

        input {
            border: none;
            background-color: transparent;
        }

        input[type="submit"] {
            background-color: #ff6f61; 
            color: white;
            padding: 12px 24px;
            border-radius: 5px;
            cursor: pointer;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #e25f54;
        }

        input[type="submit"]:active {
            background-color: #d14942;
        }

        #delete-btn {
            text-align: center;
            margin-top: 20px;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px; 
        }
    </style>
</head>
<body>

<%
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
    <h1>Delete My Account</h1>

    <form action="delete" method="post">
        <table id="table">
            <tr>
                <td>Customer ID</td>
                <td><input type="text" name="cusid" value="<%= id %>" readonly></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" value="<%= name %>" readonly></td>
            </tr>
            <tr>
                <td>Email Address</td>
                <td><input type="text" name="email" value="<%= email %>" readonly></td>
            </tr>
            <tr>
                <td>Phone number</td>
                <td><input type="text" name="phone" value="<%= phone %>" readonly></td>
            </tr>
            <tr>
                <td>Delivery Address</td>
                <td><input type="text" name="address" value="<%= address %>" readonly></td>
            </tr>
            <tr>
                <td>User name</td>
                <td><input type="text" name="uname" value="<%= userName %>" readonly></td>
            </tr>
            <tr>
                <td>Customer/Admin/Delivery Person</td>
                <td><input type="text" name="role" value="<%= role %>" readonly></td>
            </tr>
        </table>
        <div id="delete-btn">
            <input type="submit" name="submit" value="Delete My Account">
        </div>
    </form>
</div>

</body>
</html>
