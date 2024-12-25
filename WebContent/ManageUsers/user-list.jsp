<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Management | ASTU</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <link rel="icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZzPo9uv7MUCwwLTBVLgf29PIwG_Or3n2uVw&usqp=CAU">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        :root {
            --primary-color: #2196F3;
            --secondary-color: #1976D2;
            --background-color: #f5f5f5;
            --text-color: #333;
            --table-stripe: #f8f9fa;
            --table-hover: #e9ecef;
        }

        body {
            background-color: var(--background-color);
        }

        .body {
            width: 95%;
            max-width: 1400px;
            margin: 2rem auto;
            padding: 20px;
        }

        /* Navigation Styles */
        nav {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            padding: 0 2rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .nav-container {
            max-width: 1400px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 70px;
        }

        .logo {
            color: white;
            font-size: 1.8rem;
            font-weight: bold;
            text-decoration: none;
            display: flex;
            align-items: center;
        }

        .nav-menu {
            display: flex;
            gap: 1.5rem;
            list-style: none;
        }

        .nav-menu li a {
            color: white;
            text-decoration: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            transition: all 0.3s ease;
        }

        .nav-menu li a:hover,
        .nav-menu li a.active {
            background: rgba(255,255,255,0.2);
        }

        /* Main Content Styles */
        .container {
            background: white;
            border-radius: 8px;
            padding: 2rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .page-title {
            color: var(--text-color);
            text-align: center;
            margin-bottom: 2rem;
            font-size: 2.5rem;
            position: relative;
        }

        .page-title::after {
            content: '';
            display: block;
            width: 100px;
            height: 4px;
            background: var(--primary-color);
            margin: 10px auto;
            border-radius: 2px;
        }

        /* Table Styles */
        .table-responsive {
            overflow-x: auto;
            margin-top: 2rem;
        }

        #table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
        }

        #table th {
            background: var(--primary-color);
            color: white;
            padding: 15px;
            text-transform: uppercase;
            font-size: 0.9rem;
            letter-spacing: 0.5px;
        }

        #table td {
            padding: 12px 15px;
            border-bottom: 1px solid #ddd;
        }

        #table tr:nth-child(even) {
            background-color: var(--table-stripe);
        }

        #table tr:hover {
            background-color: var(--table-hover);
            transition: background-color 0.3s ease;
        }

        /* Button Styles */
        .btn {
            display: inline-block;
            padding: 0.8rem 1.5rem;
            border-radius: 5px;
            text-decoration: none;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .btn-add {
            background: var(--primary-color);
            color: white;
            border: none;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .btn-add:hover {
            background: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .action-buttons {
            display: flex;
            gap: 0.5rem;
            justify-content: center;
        }

        .btn-edit, .btn-delete {
            padding: 0.5rem 1rem;
            border-radius: 4px;
            color: white;
            text-decoration: none;
            font-size: 0.9rem;
        }

        .btn-edit {
            background: #4CAF50;
        }

        .btn-delete {
            background: #f44336;
        }

        .btn-edit:hover, .btn-delete:hover {
            opacity: 0.9;
            transform: translateY(-1px);
        }

        /* Search and Filter Section */
        .controls-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .search-box {
            display: flex;
            align-items: center;
            background: white;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 0.5rem;
            width: 300px;
        }

        .search-box input {
            border: none;
            outline: none;
            padding: 0.5rem;
            width: 100%;
        }

        .search-box i {
            color: #666;
            margin-right: 0.5rem;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .nav-menu {
                display: none;
                position: absolute;
                top: 70px;
                left: 0;
                width: 100%;
                background: var(--primary-color);
                padding: 1rem;
            }

            .nav-menu.active {
                display: flex;
                flex-direction: column;
            }

            .menu-toggle {
                display: block;
            }

            .controls-section {
                flex-direction: column;
                align-items: stretch;
            }

            .search-box {
                width: 100%;
            }
        }

        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .container {
            animation: fadeIn 0.5s ease-out;
        }
    </style>
</head>
<body>
    <nav>
        <div class="nav-container">
            <a href="<%=request.getContextPath()%>/index.jsp" class="logo">
                <i class="fas fa-university"></i>&nbsp;ASTU
            </a>
            <ul class="nav-menu">
                <li><a href="<%=request.getContextPath()%>/Admin_index.jsp"><i class="fas fa-home"></i> Home</a></li>
                <li><a class="active" href="<%=request.getContextPath()%>/user-list.jsp"><i class="fas fa-users"></i> Users</a></li>
                <li><a href="<%=request.getContextPath()%>/order-list.jsp"><i class="fas fa-shopping-cart"></i> Orders</a></li>
                <li><a href="<%=request.getContextPath()%>/delivery-list.jsp"><i class="fas fa-truck"></i> Delivery</a></li>
                <li><a href="<%=request.getContextPath()%>/product-list.jsp"><i class="fas fa-utensils"></i> Menu</a></li>
            </ul>
        </div>
    </nav>

    <div class="body">
        <div class="container">
            <h1 class="page-title">User Management</h1>

            <div class="controls-section">
                <div class="search-box">
                    <i class="fas fa-search"></i>
                    <input type="text" id="searchInput" placeholder="Search users...">
                </div>
                
                <a href="<%=request.getContextPath()%>/new" class="btn btn-add">
                    <i class="fas fa-user-plus"></i> Add New User
                </a>
            </div>

            <div class="table-responsive">
                <table id="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Username</th>
                            <th>Role</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${listUser}">
                            <tr>
                                <td><c:out value="${user.id}" /></td>
                                <td><c:out value="${user.name}" /></td>
                                <td><c:out value="${user.email}" /></td>
                                <td><c:out value="${user.phone}" /></td>
                                <td><c:out value="${user.address}" /></td>
                                <td><c:out value="${user.username}" /></td>
                                <td><c:out value="${user.role}" /></td>
                                <td class="action-buttons">
                                    <a href="edituser?id=<c:out value='${user.id}' />" class="btn-edit">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <a href="deleteuser?id=<c:out value='${user.id}' />" class="btn-delete">
                                        <i class="fas fa-trash-alt"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        // Search functionality
        document.getElementById('searchInput').addEventListener('keyup', function() {
            let searchQuery = this.value.toLowerCase();
            let table = document.getElementById('table');
            let rows = table.getElementsByTagName('tr');

            for (let i = 1; i < rows.length; i++) {
                let row = rows[i];
                let text = row.textContent.toLowerCase();
                row.style.display = text.includes(searchQuery) ? '' : 'none';
            }
        });

        // Mobile menu toggle
        document.querySelector('.menu-toggle').addEventListener('click', function() {
            document.querySelector('.nav-menu').classList.toggle('active');
        });
    </script>
</body>
</html>