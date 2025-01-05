<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>  <!-- Set the page encoding to UTF-8 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  <!-- Import JSTL core tag library for conditional logic -->
<html>
<head>
<title>Delivery Management</title>
<link rel="icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZzPo9uv7MUCwwLTBVLgf29PIwG_Or3n2uVw&usqp=CAU">  <!-- Set the favicon of the page -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">  <!-- Make the page responsive on different devices -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>  <!-- Include Font Awesome icons -->
<style>

	/* Main body container styling */
	.body{
		width:90%;  /* Set the container to take up 90% of the page width */
		margin-left: auto;
        margin-right: auto;
	}

	/* Remove text decoration for links */
    a{
        text-decoration: none;
        text-align:center;
    }

    /* Styling for the save button */
    .savebtn{
    	background-color:28A745;  /* Green background color */
    	border-style:none;  /* No border */
    	color:white;  /* White text */
    	padding:10 40;  /* Padding for button */
    }

    /* Hover effect for the save button */
    .savebtn.active,button:hover{
	  background: green;  /* Darker green on hover */
	  transition: .5s;  /* Smooth transition effect */
	}

    /* Styling for input fields */
    input[type=text], select {
	  width: 100%;  /* Make inputs take up 100% of their container's width */
	  padding: 12px 20px;  /* Padding inside inputs */
	  margin: 8px 0;  /* Margin between fields */
	  display: inline-block;
	  border: 1px solid #ccc;  /* Light gray border */
	  border-radius: 4px;  /* Rounded corners */
	  box-sizing: border-box;
	}
	
	/* Card styling */
	.card{
		width:50%;  /* Set the width of the card to 50% */
		margin-left:auto;
		margin-right:auto;
		border-style:solid;  /* Solid border around the card */
	}
	.card-body{
		width:70%;  /* Set the width of the card body to 70% */
		margin-left:auto;
		margin-right:auto;
	}
	.feildset{
		border:none;  /* Remove border from the fieldset */
	}

	/* Header navigation styling */
   .nav{
  padding: 0;
  margin: 0;
  text-decoration: none;
  list-style: none;
  box-sizing: border-box;
  }
.navbody{
  font-family: montserrat;
}
nav{
  background: #0082e6;  /* Blue background for the navigation bar */
  height: 80px;
  width: 100%;
}
.logo{
	background-image:url('logo.png');  /* Set the logo image */
}
label.logo{
  color: white;  /* White text for the logo */
  font-size: 35px;
  line-height: 80px;
  padding: 0 100px;
  font-weight: bold;
}
nav ul{
  float: right;
  margin-right: 20px;
}
nav ul li{
  display: inline-block;
  line-height: 50px;
  margin: 0 5px;
}
nav ul li a{
  color: white;  /* White text for the navigation links */
  font-size: 17px;
  padding: 7px 13px;
  border-radius: 3px;
}
a.active,a:hover{
  background: #1b9bff;  /* Light blue background on hover */
  transition: .5s;
}
.checkbtn{
  font-size: 30px;
  color: white;
  float: right;
  line-height: 80px;
  margin-right: 40px;
  margin-top:20px;
  cursor: pointer;
  display: none;  /* Initially hide the check button */
}
#check{
  display: none;  /* Hide checkbox for mobile menu */
}
@media (max-width: 952px){
  label.logo{
    font-size: 30px;
    padding-left: 50px;
  }
  nav ul li a{
    font-size: 16px;  /* Adjust font size for smaller screens */
  }
}
@media (max-width: 858px){
  .checkbtn{
    display: block;  /* Show the check button on smaller screens */
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
    font-size: 20px;  /* Adjust font size for smaller screens */
  }
  a:hover,a.active{
    background: none;
    color: #0082e6;
  }
  #check:checked ~ ul{
    left: 0;  /* Show menu when checkbox is checked */
  }
}

</style>
</head>
<body>

	<!-- Navigation bar with links -->
    <nav class="nav">
    <div class="navbody">
      <input type="checkbox" id="check">  <!-- Checkbox for mobile navigation -->
      <label for="check" class="checkbtn">  <!-- Button for toggling menu on small screens -->
        <i class="fas fa-bars"></i>  <!-- Hamburger icon -->
      </label>
      <a href="index.jsp" style="padding:20px; "><label class="logo">ASTU</label></a>  <!-- Logo and home link -->
      
      <ul>
       	<!-- Navigation menu items -->
        <li><a href="Admin_index.jsp">Home</a></li>
        <li><a href="ManageUsers/user-list.jsp">User Management</a></li>
        <li><a href="order-list.jsp">Order Management</a></li>
        <li><a class="active" href="<%=request.getContextPath()%>/list2">Delivery Management</a></li>
        <li><a href="product-list.jsp">Menu Management</a></li>
      </ul>
      </div> 
    </nav>

	<br>
	
	<!-- Form section to manage delivery details -->
	<div>
		<div class="card">
			<div class="card-body">
				<!-- Conditional check for delivery person data (either updating or inserting new record) -->
				<c:if test="${deliveryperson != null}">
					<form action="update2" method="post">  <!-- Update form if delivery person exists -->
				</c:if>
				<c:if test="${deliveryperson == null}">
					<form action="insert2" method="post">  <!-- Insert form if no delivery person exists -->
				</c:if>

				<caption>
					<h2 style="font-size:40px;">
						<!-- Conditional heading for add/edit action -->
						<c:if test="${deliveryperson != null}">
            			<center>Edit Delivery</center>
            		</c:if>
						<c:if test="${deliveryperson == null}">
            			<center>Add New Delivery</center>
            		</c:if>
					</h2>
				</caption>

				<!-- Hidden field for delivery person ID (only when editing an existing delivery) -->
				<c:if test="${deliveryperson != null}">
					<input type="hidden" name="delivery_id" value="<c:out value='${deliveryperson.delivery_id}' />" />
				</c:if>

				<!-- Form fields for entering delivery details -->
				<fieldset>
					<label>Order ID</label> <input type="text" value="<c:out value='${deliveryperson.order_id}' />" class="feildset" name="order_id" required="required">
				</fieldset>
				<br>
				<fieldset>
					<label>Customer ID</label> <input type="text" value="<c:out value='${deliveryperson.cus_id}' />" class="feildset" name="cus_id" required="required">
				</fieldset>
				<br>
				<fieldset>
					<label>Delivery Address</label> <input type="text" value="<c:out value='${deliveryperson.address}' />" class="feildset" name="address" required="required">
				</fieldset>
				<br>
				<fieldset>
					<label>Delivery Status</label> <input type="text" value="<c:out value='${deliveryperson.status}' />" class="feildset" name="status">
				</fieldset>
				<br>
				<fieldset>
					<label>Estimate Time of Delivery</label> <input type="text" value="<c:out value='${deliveryperson.estimate_time}' />" class="feildset" name="estimate_time">
				</fieldset>
				<br>
				<fieldset>
					<label>Actual Delivered Time</label> <input type="text" value="<c:out value='${deliveryperson.actual_del_time}' />" class="feildset" name="actual_del_time">
				</fieldset>
			
				<br>

				<!-- Save button to submit the form -->
				<center><button type="submit" class="savebtn">Save</button></center>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
