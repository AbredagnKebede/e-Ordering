<%@page import="com.cart.connection.DbCon"%>
<%@page import="com.cart.dao.ProductDao"%>
<%@page import="com.cart.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
    // Formatting decimal values for displaying currency
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);

    // Retrieving the authenticated user from session
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("person", auth); // Set the user attribute to the request for use in the page
    }

    // Retrieving the cart list from the session
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;

    if (cart_list != null) {
        // Fetching cart products and calculating total price
        ProductDao pDao = new ProductDao(DbCon.getConnection());
        cartProduct = pDao.getCartProducts(cart_list); // Fetching product details for each cart item
        double total = pDao.getTotalCartPrice(cart_list); // Calculating total price for all items in the cart
        request.setAttribute("total", total); // Storing total price in the request
        request.setAttribute("cart_list", cart_list); // Storing cart list in the request
    }
%>

<!DOCTYPE html>
<html>
<head>
    <%@include file="/includes/head.jsp"%> <!-- Including common head section -->
    <title>ASTU</title>
    <link rel="icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZzPo9uv7MUCwwLTBVLgf29PIwG_Or3n2uVw&usqp=CAU">

    <!-- Internal CSS for styling the page -->
    <style type="text/css">

        /* Table cell vertical alignment */
        .table tbody td {
            vertical-align: middle;
        }

        /* Styling for buttons with transition effects */
        .btn-incre, .btn-decre {
            box-shadow: none;
            font-size: 25px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        /* Hover effect for increment/decrement buttons */
        .btn-incre:hover, .btn-decre:hover {
            transform: scale(1.1);
            box-shadow: 0 4px 15px rgba(0, 123, 255, 0.4);
        }

        /* Styling for the jumbotron section with fade-in animation */
        .bg-image {
            animation: fadeIn 2s ease-in-out;
        }

        /* Keyframes for fade-in animation */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        /* Table row hover effect */
        .table tbody tr:hover {
            background-color: rgba(0, 123, 255, 0.1);
            transition: background-color 0.3s ease;
        }

        /* Button with gradient background and hover effect */
        .btn-primary {
            background: linear-gradient(135deg, #007bff, #00bcd4);
            border: none;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }

        /* Hover effect for primary button */
        .btn-primary:hover {
            background: linear-gradient(135deg, #0056b3, #008ba3);
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 5px 15px rgba(0,123,255,0.4);
        }

    </style>
</head>

<body>
    <%@include file="/includes/navbar.jsp"%> <!-- Including navbar section -->

    <!-- Main container for cart items and checkout details -->
    <div class="container my-3">
        <div class="d-flex py-3 row justify-content-end">
            <h3>Total Price: Br. ${(total > 0) ? dcf.format(total) : 0}</h3>
            <a class="mx-3 btn btn-primary" href="login.jsp">Check Out</a>
        </div>
        <br>

        <!-- Table displaying cart items -->
        <table class="table table-light">
            <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col" class="text-center">Category</th>
                    <th scope="col" class="text-center">Price (Birr)</th>
                    <th scope="col" class="text-center">Buy Now</th>
                    <th scope="col" class="text-center">Cancel</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Iterating over the cart products to display each item's details
                    if (cart_list != null) {
                        for (Cart c : cartProduct) {
                %>
                <tr>
                    <td><%= c.getName() %></td>
                    <td class="text-center"><%= c.getCategory() %></td>
                    <td class="text-center"><%= dcf.format(c.getPrice()) %></td>

                    <!-- Column for quantity control and 'Buy Now' button -->
                    <td class="text-center">
                        <form action="order-now" method="post" class="form-inline">
                            <input type="hidden" name="id" value="<%= c.getId() %>" class="form-input">
                            <div class="form-group d-flex ">
                                <!-- Increment button -->
                                <a class="btn btn-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%= c.getId() %>"><i class="fas fa-plus-circle"></i></a> 
                                <!-- Quantity display -->
                                <input type="text" name="quantity" class="form-control w-50 text-center" value="<%= c.getQuantity() %>" readonly> 
                                <!-- Decrement button -->
                                <a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%= c.getId() %>"><i class="fas fa-minus-circle"></i></a>
                            </div>
                            <!-- 'Buy Now' button -->
                            <button type="submit" class="btn btn-primary btn-sm">Buy Now</button>
                        </form>
                    </td>

                    <!-- Column for removing item from cart -->
                    <td class="text-center">
                        <a href="remove-from-cart?id=<%= c.getId() %>" class="btn btn-sm btn-danger">Remove</a>
                    </td>
                </tr>
                <% 
                        } 
                    }
                %>
            </tbody>
        </table>

        <br><br><br>
    </div>

    <!-- Jumbotron section for promoting services -->
    <div class="container my-5">
        <div class="bg-image p-5 text-center shadow-1-strong rounded mb-5 text-white" 
             style="background-image: url('https://mdbootstrap.com/img/new/slides/003.jpg');">
            <h1 class="mb-3 h2">We Deliver Foods to Your Door Step</h1>
            <p>Thank You For Choosing. You Can Choose Many More... There is always the right taste here, prepared for you.</p>
        </div>
    </div>

    <%@include file="/includes/footer.jsp"%> <!-- Including footer section -->

</body>
</html>
