<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Metadata and page settings -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Admin Dashboard for ASTU - Efficient system management.">
    <meta name="author" content="ASTU">
    <meta name="keywords" content="Admin, Dashboard, Management, ASTU, System">
    <title>Admin | ASTU</title>

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZzPo9uv7MUCwwLTBVLgf29PIwG_Or3n2uVw&usqp=CAU">

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha384-dyBldEN4KhT35h2Df8MA0Fw1LNlbHsvfr6yItFEFb5gjVcvHc8CbBHEZ77YgXMk" crossorigin="anonymous">

    <!-- Internal CSS for styling -->
    <style>
        /* Reset and basic styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            width: 90%;
            margin: 0 auto;
        }

        /* Table styling */
        #table {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 90%;
            margin: 100px auto;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        #table td,
        #table th {
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
        nav {
            background: linear-gradient(135deg, #007bff, #00bcd4);
            height: 80px;
            width: 100%;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: fixed;
            top: 0;
            z-index: 1000;
        }

        label.logo {
            color: white;
            font-size: 35px;
            line-height: 80px;
            padding: 0 20px;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        nav ul {
            float: right;
            margin-right: 20px;
        }

        nav ul li {
            display: inline-block;
            line-height: 50px;
            margin: 0 10px;
        }

        nav ul li a {
            color: white;
            font-size: 17px;
            padding: 7px 13px;
            border-radius: 3px;
            transition: all 0.3s ease;
            text-decoration: none;
        }

        nav ul li a:hover {
            background-color: #0056b3;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            nav ul {
                display: none;
            }

            nav label.logo {
                font-size: 25px;
            }

            #table {
                width: 100%;
                font-size: 14px;
            }
        }
    </style>
</head>

<body>
    <!-- Navigation Bar -->
    <nav>
        <label class="logo">ASTU Admin</label>
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Logout</a></li>
        </ul>
    </nav>

    <!-- Content Section -->
    <div class="content">
        <table id="table" aria-label="Data Table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Role</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>Jane Doe</td>
                    <td>Admin</td>
                    <td>Active</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>John Smith</td>
                    <td>Editor</td>
                    <td>Inactive</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>Emily Johnson</td>
                    <td>Viewer</td>
                    <td>Active</td>
                </tr>
            </tbody>
        </table>
    </div>
</body>

</html>
