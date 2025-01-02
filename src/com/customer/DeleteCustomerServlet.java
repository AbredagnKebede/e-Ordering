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
 * Servlet implementation for deleting a customer from the database.
 */
@WebServlet("/DeleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Handles POST requests for deleting a customer.
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
		
		// Retrieve the customer ID from the request
		String id = request.getParameter("cusid");
		boolean isDeleted;

		// Call the method to delete the customer
		isDeleted = CustomerDBUtil.deleteCustomer(id);
		
		// Check if the deletion was successful
		if (isDeleted) {
			// If successful, redirect to the customer insert page
			RequestDispatcher dispatcher = request.getRequestDispatcher("customerinsert.jsp");
			dispatcher.forward(request, response);
		} else {
			// If deletion failed, retrieve customer details for display
			List<Customer> cusDetails = CustomerDBUtil.getCustomerDetails(id);
			request.setAttribute("cusDetails", cusDetails); // Set customer details as a request attribute
			
			// Forward the request to the user account page for feedback
			RequestDispatcher dispatcher = request.getRequestDispatcher("useraccount.jsp");
			dispatcher.forward(request, response);
		}
	}
}
