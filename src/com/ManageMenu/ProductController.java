package com.manageMenu;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ProductController")
public class ProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO; // DAO for database interactions

    // Initialize the servlet and set up the DAO
    @Override
    public void init() {
        productDAO = new ProductDAO();
    }

    // Delegate POST requests to the doGet method
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    // Handle GET requests based on the action parameter
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/newProduct":
                    displayProductForm(request, response, null);
                    break;
                case "/addProduct":
                    createProduct(request, response);
                    break;
                case "/deleteProduct":
                    deleteProduct(request, response);
                    break;
                case "/editProduct":
                    displayProductForm(request, response, getProductById(request));
                    break;
                case "/updateProduct":
                    updateProduct(request, response);
                    break;
                case "/listProducts":
                    listProducts(request, response);
                    break;
                default:
                    System.err.println("Invalid action in ProductController.");
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    // Retrieve and display all products
    private void listProducts(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<Product> productList = productDAO.selectAllProducts();
        request.setAttribute("productList", productList);
        forwardToPage(request, response, "product-list.jsp");
    }

    // Display the product form for creating or editing
    private void displayProductForm(HttpServletRequest request, HttpServletResponse response, Product product)
            throws ServletException, IOException {
        if (product != null) {
            request.setAttribute("product", product);
        }
        forwardToPage(request, response, "product-form.jsp");
    }

    // Add a new product to the database
    private void createProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        Product newProduct = getProductFromRequest(request);
        productDAO.insertProduct(newProduct);
        redirectToAction(response, "listProducts");
    }

    // Update an existing product in the database
    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        Product updatedProduct = getProductFromRequest(request);
        updatedProduct.setId(Integer.parseInt(request.getParameter("id")));
        productDAO.updateProduct(updatedProduct);
        redirectToAction(response, "listProducts");
    }

    // Delete a product from the database
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        productDAO.deleteProduct(productId);
        redirectToAction(response, "listProducts");
    }

    // Utility method to fetch a product by ID from the database
    private Product getProductById(HttpServletRequest request) throws SQLException {
        int productId = Integer.parseInt(request.getParameter("id"));
        return productDAO.selectProduct(productId);
    }

    // Utility method to extract product data from the request
    private Product getProductFromRequest(HttpServletRequest request) {
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");
        return new Product(name, category, price, image);
    }

    // Utility method to forward the request to a JSP page
    private void forwardToPage(HttpServletRequest request, HttpServletResponse response, String page)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher(page);
        dispatcher.forward(request, response);
    }

    // Utility method to redirect to another servlet action
    private void redirectToAction(HttpServletResponse response, String action) throws IOException {
        response.sendRedirect(action);
    }
}
