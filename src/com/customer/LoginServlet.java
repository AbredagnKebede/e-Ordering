package com.customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation for handling user login.
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Handles POST requests for user login.
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
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter(); // Initialize PrintWriter for output

		// Retrieve username and password from the request
		String userName = request.getParameter("username");
		String password = request.getParameter("password");

		// Validate user credentials
		boolean isValidUser = CustomerDBUtil.validate(userName, password);
		
		if (isValidUser) {
			// If validation is successful, retrieve customer details
			List<Customer> cusDetails = CustomerDBUtil.getCustomer(userName);
			request.setAttribute("cusDetails", cusDetails);

			// Forward to user account page
			RequestDispatcher dispatcher = request.getRequestDispatcher("useraccount.jsp");
			dispatcher.forward(request, response);
		} else {
			// If validation fails, send an alert and redirect to login page
			out.println("<script type='text/javascript'>");
			out.println("alert('Your username or password is incorrect. Please try again.');");
			out.println("location='profilelogin.jsp';");
			out.println("</script>");
		}
	}
}
