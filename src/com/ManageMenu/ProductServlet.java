package com.ManageMenu;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * ProductServlet.java
 * This servlet is responsible for handling requests related to product management, including adding, editing, viewing, and deleting products.
 */

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDAO;  // DAO object to interact with the database

	// Initialize the servlet and create an instance of ProductDAO
	public void init() {
		productDAO = new ProductDAO();
	}

	// Handle POST requests by delegating to doGet
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	// Main logic for handling GET requests
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();  // Get the requested action

		try {
			// Route based on the action specified in the URL
			switch (action) {
			case "/newProduct":
				showNewProductForm(request, response);
				break;
			case "/addProduct":
				addProduct(request, response);
				break;
			case "/removeProduct":
				removeProduct(request, response);
				break;
			case "/editProduct":
				showEditProductForm(request, response);
				break;
			case "/modifyProduct":
				modifyProduct(request, response);
				break;
			case "/viewProducts":
				viewAllProducts(request, response);
				break;
			default:
				System.out.println("Error in Product Servlet");  // Error handling
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);  // Handle SQL exceptions
		}
	}

	// View all products from the database and display them
	private void viewAllProducts(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Product> products = productDAO.selectAllProduct();  // Get all products
		request.setAttribute("products", products);  // Pass the products list to the JSP
		RequestDispatcher dispatcher = request.getRequestDispatcher("product-list.jsp");  // Redirect to the list page
		dispatcher.forward(request, response);
	}

	// Show the form for adding a new product
	private void showNewProductForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("product-form.jsp");  // Forward to form
		dispatcher.forward(request, response);
	}

	// Show the form for editing an existing product
	private void showEditProductForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));  // Get the product ID
		Product existingProduct = productDAO.selectProduct(id);  // Fetch the existing product by ID
		RequestDispatcher dispatcher = request.getRequestDispatcher("product-form.jsp");  // Forward to form
		request.setAttribute("product", existingProduct);  // Pass the product to the form for editing
		dispatcher.forward(request, response);
	}

	// Add a new product to the database
	private void addProduct(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		// Get product details from the form
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		double price = Double.parseDouble(request.getParameter("price"));
		String image = request.getParameter("image");

		// Create a new product object and insert it into the database
		Product newProduct = new Product(name, category, price, image);
		productDAO.insertProduct(newProduct);
		response.sendRedirect("viewProducts");  // Redirect to view all products
	}

	// Modify an existing product in the database
	private void modifyProduct(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		// Get updated product details
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		double price = Double.parseDouble(request.getParameter("price"));
		String image = request.getParameter("image");

		// Create a product object with the updated data
		Product updatedProduct = new Product(id, name, category, price, image);
		productDAO.updateProduct(updatedProduct);  // Update the product in the database
		response.sendRedirect("viewProducts");  // Redirect to the products list
	}

	// Remove a product from the database
	private void removeProduct(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));  // Get the product ID
		productDAO.deleteProduct(id);  // Delete the product from the database
		response.sendRedirect("viewProducts");  // Redirect to the products list
	}
}
