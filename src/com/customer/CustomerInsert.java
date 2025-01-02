package com.customer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation for inserting a new customer into the database.
 */
@WebServlet("/CustomerInsert")
public class CustomerInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Handles POST requests to insert a new customer.
	 * 
	 * @param request  The HttpServletRequest object that contains the request
	 *                 from the client.
	 * @param response The HttpServletResponse object that contains the response
	 *                 to send to the client.
	 * @throws ServletException If an error occurs during the request handling.
	 * @throws IOException      If an input or output error occurs during the
	 *                         handling of the request.
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Retrieve parameters from the request
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String username = request.getParameter("uid");
		String password = request.getParameter("psw");
		String role = request.getParameter("role");
		
		// Initialize success status
		boolean isInserted = false;

		// Call the method to insert customer details into the database
		isInserted = CustomerDBUtil.insertCustomer(name, email, phone, address, username, password, role);
		
		// Check the result of the insertion
		if (isInserted) {
			// If successful, redirect to the login page
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		} else {
			// If unsuccessful, redirect to the failure page with error message
			request.setAttribute("errorMessage", "Customer registration failed. Please try again.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("unsuccess.jsp");
			dispatcher.forward(request, response);
		}
	}
}
