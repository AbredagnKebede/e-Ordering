<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Order Management</title>
<!-- Favicon for the page -->
<link rel="icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZzPo9uv7MUCwwLTBVLgf29PIwG_Or3n2uVw&usqp=CAU">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
<style>

    /* Body styling */
    .body{
        width:90%;
        margin-left: auto;
        margin-right: auto;
    }
    
    /* Link styling */
    a{
        text-decoration: none;
        text-align:center;
    }
    
    /* Save button styling */
    .savebtn{
        background-color: #28A745;
        border-style: none;
        color: white;
        padding: 10px 40px;
        border-radius: 8px; /* Rounded corners */
    }
    
    /* Save button hover effect */
    .savebtn.active, button:hover{
      background: green;
      transition: .5s;
    }
    
    /* Input and select styling */
    input[type=text], select {
      width: 100%;
      padding: 12px 20px;
      margin: 8px 0;
      display: inline-block;
      border: 1px solid #ccc;
      border-radius: 8px; /* Rounded corners */
      box-sizing: border-box;
    }
    
    /* Card styling */
    .card{
        width: 50%;
        margin-left: auto;
        margin-right: auto;
        border-style: solid;
        border-radius: 8px; /* Rounded corners */
    }
    
    /* Card body styling */
    .card-body{
        width: 70%;
        margin-left: auto;
        margin-right: auto;
    }
    
    /* Fieldset styling */
    .feildset{
        border: none;
    }

    /* Navigation styling */
    .nav{
        padding: 0;
        margin: 0;
        text-decoration: none;
        list-style: none;
        box-sizing: border-box;
    }
    
    /* Navigation body styling */
    .navbody{
        font-family: montserrat;
    }
    
    /* Navigation bar styling */
    nav{
        background: #0082e6;
        height: 80px;
        width: 100%;
    }
    
    /* Logo styling */
    .logo{
        background-image: url('logo.png');
    }
    
    /* Logo label styling */
    label.logo{
        color: white;
        font-size: 35px;
        line-height: 80px;
        padding: 0 100px;
        font-weight: bold;
    }
    
    /* Navigation list styling */
    nav ul{
        float: right;
        margin-right: 20px;
    }
    
    /* Navigation list item styling */
    nav ul li{
        display: inline-block;
        line-height: 50px;
        margin: 0 5px;
    }
    
    /* Navigation link styling */
    nav ul li a{
        color: white;
        font-size: 17px;
        padding: 7px 13px;
        border-radius: 3px;
    }
    
    /* Active and hover link effect */
    a.active, a:hover{
        background: #1b9bff;
        transition: .5s;
    }
    
    /* Check button styling */
    .checkbtn{
        font-size: 30px;
        color: white;
        float: right;
        line-height: 80px;
        margin-right: 40px;
        margin-top: 20px;
        cursor: pointer;
        display: none;
    }
    
    /* Check input styling */
    #check{
        display: none;
    }
    
    /* Media query for smaller screens */
    @media (max-width: 952px){
        label.logo{
            font-size: 30px;
            padding-left: 50px;
        }
        nav ul li a{
            font-size: 16px;
        }
    }
    
    /* Media query for even smaller screens */
    @media (max-width: 858px){
        .checkbtn{
            display: block;
        }
        ul{
            position: fixed;
            width: 100%;
            height: 100vh;
            background: #2c3e50;
            top: 80px;
            left: -100%;
            text-align: center;
            transition: all .5s;
        }
        nav ul li{
            display: block;
            margin: 50px 0;
            line-height: 30px;
        }
        nav ul li a{
            font-size: 20px;
        }
        a:hover, a.active{
            background: none;
            color: #0082e6;
        }
        #check:checked ~ ul{
            left: 0;
        }
    }

</style>
</head>
<body>

    <!-- Navigation bar -->
    <nav class="nav">
    <div class="navbody">
      <input type="checkbox" id="check">
      <label for="check" class="checkbtn">
        <i class="fas fa-bars"></i> <!-- Hamburger icon for mobile view -->
      </label>
      <a href="index.jsp" style="padding:20px; "><label class="logo">ASTU</label></a>
      
      <ul>
        <li><a href="Admin_index.jsp">Home</a></li>
        <li><a href="ManageUsers/user-list.jsp">User Management</a></li>
        <li><a class="active" href="<%=request.getContextPath()%>/list3">Order Management</a></li>
        <li><a href="delivery-list.jsp">Delivery Management</a></li>
        <li><a href="product-list.jsp">Menu Management</a></li>
      </ul>
      </div> 
    </nav>
        
    <br>
    
    <!-- Main content -->
    <div>
        <div class="card">
            <div class="card-body">
                <!-- Conditional form rendering based on whether 'order' is null or not -->
                <c:if test="${order != null}">
                    <form action="update3" method="post">
                </c:if>
                <c:if test="${order == null}">
                    <form action="insert3" method="post">
                </c:if>

                <caption>
                    <h2 style="font-size:40px;">
                        <!-- Display 'Edit Order' if 'order' is not null, otherwise 'Add New Order' -->
                        <c:if test="${order != null}">
                        <center>Edit Order</center>
                    </c:if>
                        <c:if test="${order == null}">
                        <center>Add New Order</center>
                    </c:if>
                    </h2>
                </caption>

                <!-- Hidden input for order ID if 'order' is not null -->
                <c:if test="${order != null}">
                    <input type="hidden" name="o_id" value="<c:out value='${order.o_id}' />" />
                </c:if>

                <!-- Form fields for order details -->
                <fieldset>
                    <label>Product ID</label> <input type="text"
                        value="<c:out value='${order.p_id}' />" class="feildset"
                        name="p_id" required="required">
                </fieldset>
                <br>
                <fieldset>
                    <label>User ID</label> <input type="text"
                        value="<c:out value='${order.u_id}' />" class="feildset"
                        name="u_id">
                </fieldset>
                <br>
                <fieldset>
                    <label>Order Quantity</label> <input type="text"
                        value="<c:out value='${order.o_quantity}' />" class="feildset"
                        name="o_quantity">
                </fieldset>
                
                <br>
                <fieldset>
                    <label>Date</label> <input type="text"
                        value="<c:out value='${order.o_date}' />" class="feildset"
                        name="o_date">
                </fieldset>
            
                <br>
                <!-- Save button -->
                <center><button type="submit" class="savebtn">Save</button></center>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
