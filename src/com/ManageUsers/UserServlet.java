package com.ManageUsers;

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
 * UserServlet.java
 * This servlet acts as a page controller for the application, handling all
 * requests from the user.
 */
@WebServlet("/")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO; // DAO instance for user operations

    /**
     * Initializes the servlet and creates an instance of UserDAO.
     */
    public void init() {
        userDAO = new UserDAO(); // Initialize the UserDAO instance
    }

    /**
     * Handles POST requests by delegating to the doGet method.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // Delegate POST requests to doGet
    }

    /**
     * Handles GET requests and directs to the appropriate action based on the URL path.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath(); // Get the requested action

        try {
            switch (action) {
            case "/new":
                showNewForm(request, response); // Show form to create a new user
                break;
            case "/insertuser":
                insertUser(request, response); // Insert a new user
                break;
            case "/deleteuser":
                deleteUser(request, response); // Delete a user
                break;
            case "/edituser":
                showEditForm(request, response); // Show form to edit an existing user
                break;
            case "/updateuser":
                updateUser(request, response); // Update user information
                break;
            case "/userlist":
                listUser(request, response); // List all users
                break;
            default:
                System.out.println("Default action: no specific route matched."); // Log default action
                break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex); // Handle SQL exceptions
        }
    }

    /**
     * Retrieves and displays a list of all users.
     */
    private void listUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<User> listUser = userDAO.selectAllUsers(); // Fetch all users from the database
        request.setAttribute("listUser", listUser); // Set the user list as a request attribute
        RequestDispatcher dispatcher = request.getRequestDispatcher("ManageUsers/user-list.jsp");
        dispatcher.forward(request, response); // Forward to the user list JSP
    }

    /**
     * Displays the form for creating a new user.
     */
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("ManageUsers/user-form.jsp");
        dispatcher.forward(request, response); // Forward to the user form JSP
    }

    /**
     * Displays the form for editing an existing user.
     */
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id")); // Get user ID from request
        User existingUser = userDAO.selectUser(id); // Retrieve user details by ID
        request.setAttribute("user", existingUser); // Set the user as a request attribute
        RequestDispatcher dispatcher = request.getRequestDispatcher("ManageUsers/user-form.jsp");
        dispatcher.forward(request, response); // Forward to the user form JSP
    }

    /**
     * Inserts a new user into the database. its so simple
     */
    private void insertUser(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        // Get user details from the request
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // Create a new User object and insert it
        User newUser = new User(name, email, phone, address, username, password, role);
        userDAO.insertUser(newUser); // Insert user into the database
        response.sendRedirect("userlist"); // Redirect to the user list page
    }

    /**
     * Updates an existing user's details in the database.
     */
    private void updateUser(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id")); // Get user ID from request
        // Get updated user details from the request
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // Create a User object with updated details and update it
        User updatedUser = new User(id, name, email, phone, address, username, password, role);
        userDAO.updateUser(updatedUser); // Update user in the database
        response.sendRedirect("userlist"); // Redirect to the user list page
    }

    /**
     * Deletes a user from the database.
     */
    private void deleteUser(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id")); // Get user ID from request
        userDAO.deleteUser(id); // Delete the user
        response.sendRedirect("userlist"); // Redirect to the user list page
    }
}
