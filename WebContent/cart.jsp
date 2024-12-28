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
<title>ASTU</title>
<link rel="icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZzPo9uv7MUCwwLTBVLgf29PIwG_Or3n2uVw&usqp=CAU">
<style type="text/css">

/* Table cell vertical alignment */
.table tbody td {
  vertical-align: middle;
}

/* Button styling with transitions */
.btn-incre, .btn-decre {
  box-shadow: none;
  font-size: 25px;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

/* Button hover effect */
.btn-incre:hover, .btn-decre:hover {
  transform: scale(1.1);
  box-shadow: 0 4px 15px rgba(0, 123, 255, 0.4);
}

/* Jumbotron styling with fade-in animation */
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

/* Button styling with gradient background and hover effect */
.btn-primary {
  background: linear-gradient(135deg, #007bff, #00bcd4);
  border: none;
  transition: all 0.3s ease;
  box-shadow: 0 4px 15px rgba(0,0,0,0.2);
}

/* Button hover effect */
.btn-primary:hover {
  background: linear-gradient(135deg, #0056b3, #008ba3);
  transform: translateY(-3px) scale(1.05);
  box-shadow: 0 5px 15px rgba(0,123,255,0.4);
}

</style>
</head>
<body>
    <%@include file="/includes/navbar.jsp"%>

    <div class="container my-3">
        <div class="d-flex py-3 row justify-content-end"><h3>Total Price: Br. ${(total>0)?dcf.format(total):0} </h3> <a class="mx-3 btn btn-primary" href="login.jsp">Check Out</a></div>
        <br>
        <table class="table table-light">
            <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col"class="text-center">Category</th>
                    <th scope="col"class="text-center">Price(Birr)</th>
                    <th scope="col"class="text-center">Buy Now</th>
                    <th scope="col"class="text-center">Cancel</th>
                </tr>
            </thead>
            <tbody>
                <%
                if (cart_list != null) {
                    for (Cart c : cartProduct) {
                %>
                <tr>
                    <td><%=c.getName()%></td>
                    <td class="text-center"><%=c.getCategory()%></td>
                    <td class="text-center"><%= dcf.format(c.getPrice())%></td>
                    <td class="text-center">
                        <form action="order-now" method="post" class="form-inline">
                        <input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
                            <div class="form-group d-flex ">
                                <a class="btn bnt-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-circle"></i></a> 
                                <input type="text" name="quantity" class="form-control w-50 text-center"  value="<%=c.getQuantity()%>" readonly> 
                                <a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-circle"></i></a>
                            </div>
                            <button type="submit" class="btn btn-primary btn-sm">Buy Now</button>
                        </form>
                    </td>
                    <td class="text-center"><a href="remove-from-cart?id=<%=c.getId() %>" class="btn btn-sm btn-danger">Remove</a></td>
                </tr>

                <%
                }}%>
            </tbody>
        </table>
        <br>
        <br>
        <br>
    </div>
        <div class="container my-5">

  <!-- Jumbotron -->
  <div class="bg-image p-5 text-center shadow-1-strong rounded mb-5 text-white" 
       style="background-image: url('https://mdbootstrap.com/img/new/slides/003.jpg');">
    <h1 class="mb-3 h2">We Deliver Foods to Your Door Step</h1>

    <p>Thank You For Choosing. You Can Choose Many More... There is always right Taste here Prepared for you</p>

  </div>
  <!-- Jumbotron -->

</div>
    

    
    <%@include file="/includes/footer.jsp"%>
</body>
</html>
