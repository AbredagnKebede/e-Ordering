<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Update Profile | ASTU</title>
    <link rel="icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZzPo9uv7MUCwwLTBVLgf29PIwG_Or3n2uVw&usqp=CAU">
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, rgb(238, 242, 243), rgb(142, 158, 171));
            color: rgb(51, 51, 51); 
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        h1 {
            text-align: center;
            font-size: 2.2rem;
            color: rgb(52, 73, 94);
            font-weight: bold;
            margin-bottom: 20px;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2); 
        }

        #table {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 60%;
            margin: 0 auto;
            background: rgb(255, 255, 255); 
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        #table td, #table th {
            border: 1px solid rgb(221, 221, 221);
            padding: 10px;
        }

        #table tr:nth-child(even) {
            background-color: rgb(249, 249, 249);
        }

        #table tr:hover {
            background-color: rgb(241, 241, 241);
        }

        #table th {
            background-color: rgb(215, 227, 252); 
            color: rgb(51, 51, 51); 
            text-align: center;
            border: 1px solid rgb(221, 221, 221);
        }

        input[type="submit"] {
            background-color: rgb(80, 137, 198); 
            color: rgb(255, 255, 255); 
            padding: 10px 20px;
            margin: 5px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 1px 1px 4px rgba(0, 0, 0, 0.2); 
        }

        input[type="submit"]:hover {
            background-color: rgb(57, 107, 160); 
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); 
        }

        input[type="submit"]:active {
            background-color: rgb(156, 179, 214);
        }

        #update-btn {
            text-align: center;
            margin-top: 20px;
        }

        #update-form {
            max-width: 800px;
            width: 100%;
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
    String username = request.getParameter("uname");
    String password = request.getParameter("pass");
    String role = request.getParameter("role");
%>
<div id="update-form">
    <h1>Update My Account</h1>
    <form action="update" method="post">
        <table id="table">
            <tr>
                <td>Customer ID</td>
                <td><input type="text" name="cusid" value="<%=id%>" readonly><br></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" value="<%=name%>"><br></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="text" name="email" value="<%=email%>"><br></td>
            </tr>
            <tr>
                <td>Phone Number</td>
                <td><input type="text" name="phone" value="<%=phone%>"><br></td>
            </tr>
            <tr>
                <td>Delivery Address</td>
                <td><input type="text" name="address" value="<%=address%>"><br></td>
            </tr>
            <tr>
                <td>Username</td>
                <td><input type="text" name="uname" value="<%=username%>"><br></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="pass" value="<%=password%>"><br></td>
            </tr>
            <tr>
                <td>Role (Customer/Admin/Delivery Person)</td>
                <td><input type="text" name="role" value="<%=role%>"><br></td>
            </tr>
        </table>
        <div id="update-btn">
            <input type="submit" name="submit" value="Update Account Now">
        </div>
    </form>
</div>
</body>
</html>
