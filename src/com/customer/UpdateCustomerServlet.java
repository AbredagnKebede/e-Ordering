package com.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation for updating customer information.
 */
@WebServlet("/UpdateCustomerServlet")
public class UpdateCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Handles POST requests for updating a customer's information.
	 * 
	 * @param request  The HttpServletRequest object that contains the request
	 *                 from the client.
	 * @param response The HttpServletResponse object that contains the response
	 *                 to send to the client.
	 * @throws ServletException If an error occurs during request handling.
	 * @throws IOException      If an input or output error occurs during request
	 *                         handling.
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Retrieve customer details from the request parameters
		String id = request.getParameter("cusid");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String username = request.getParameter("uname");
		String password = request.getParameter("pass");
		String role = request.getParameter("role");
		
		// Variable to track the success of the update operation
		boolean isUpdated = CustomerDBUtil.updatecustomer(id, name, email, phone, address, username, password, role);
		
		// Retrieve customer details to display on user account page
		List<Customer> cusDetails = CustomerDBUtil.getCustomerDetails(id);
		request.setAttribute("cusDetails", cusDetails); // Set customer details as a request attribute

		// Forward to the user account page regardless of the update success
		RequestDispatcher dispatcher = request.getRequestDispatcher("useraccount.jsp");
		dispatcher.forward(request, response);
	}
}
