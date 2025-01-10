<%@page import="com.cart.connection.DbCon"%>
<%@page import="com.cart.dao.ProductDao"%>
<%@page import="com.cart.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);

    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("person", auth);
    }

    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;

    if (cart_list != null) {
        ProductDao pDao = new ProductDao(DbCon.getConnection());
        cartProduct = pDao.getCartProducts(cart_list);
        double total = pDao.getTotalCartPrice(cart_list);
        request.setAttribute("total", total);
        request.setAttribute("cart_list", cart_list);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <%@include file="/includes/head.jsp"%>
    <title>ASTU | Shopping Cart</title>
    <link rel="icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZzPo9uv7MUCwwLTBVLgf29PIwG_Or3n2uVw&usqp=CAU" type="image/x-icon">
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            margin: 20px auto;
            max-width: 1200px;
        }

        .table {
            width: 100%;
            margin-bottom: 1rem;
            background-color: #f8f9fa;
        }

        .btn-primary {
            background: linear-gradient(135deg, #007bff, #00bcd4);
            color: #fff;
            border: none;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #0056b3, #008ba3);
            transform: scale(1.05);
        }

        .bg-image {
            text-align: center;
            color: #fff;
            padding: 50px;
            background-size: cover;
            border-radius: 10px;
        }
    </style>
</head>

<body>
    <%@include file="/includes/navbar.jsp"%>

    <div class="container">
        <% if (cart_list == null || cart_list.isEmpty()) { %>
            <h3 class="text-center">Your cart is empty. <a href="products.jsp">Browse products</a></h3>
        <% } else { %>
            <div class="d-flex justify-content-end">
                <h3>Total Price: Br. <%= dcf.format((Double) request.getAttribute("total")) %></h3>
                <a href="checkout.jsp" class="btn btn-primary mx-3">Proceed to Checkout</a>
            </div>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Cart c : cartProduct) { %>
                        <tr>
                            <td><%= c.getName() %></td>
                            <td><%= c.getCategory() %></td>
                            <td><%= dcf.format(c.getPrice()) %></td>
                            <td>
                                <div class="d-flex align-items-center">
                                    <a href="quantity-inc-dec?action=inc&id=<%= c.getId() %>" class="btn btn-sm btn-incre">+</a>
                                    <span class="mx-2"><%= c.getQuantity() %></span>
                                    <a href="quantity-inc-dec?action=dec&id=<%= c.getId() %>" class="btn btn-sm btn-decre">-</a>
                                </div>
                            </td>
                            <td>
                                <a href="remove-from-cart?id=<%= c.getId() %>" class="btn btn-danger btn-sm">Remove</a>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } %>
    </div>

    <div class="container my-5">
        <div class="bg-image" style="background-image: url('https://mdbootstrap.com/img/new/slides/003.jpg');">
            <h1>We Deliver Foods to Your Doorstep</h1>
            <p>Thank you for shopping with us. Explore more amazing products and services!</p>
        </div>
    </div>

    <%@include file="/includes/footer.jsp"%>
</body>
</html>
