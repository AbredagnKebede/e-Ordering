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
    private static final String USER_LIST_JSP = "ManageUsers/user-list.jsp";
    private static final String USER_FORM_JSP = "ManageUsers/user-form.jsp";
    private UserDAO userDAO;

    /**
     * Initializes the servlet and creates an instance of UserDAO.
     */
    @Override
    public void init() {
        userDAO = new UserDAO();
        log("UserServlet initialized.");
    }

    /**
     * Handles POST requests by delegating to the doGet method.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    /**
     * Handles GET requests and directs to the appropriate action based on the URL path.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insertuser":
                    insertUser(request, response);
                    break;
                case "/deleteuser":
                    deleteUser(request, response);
                    break;
                case "/edituser":
                    showEditForm(request, response);
                    break;
                case "/updateuser":
                    updateUser(request, response);
                    break;
                case "/userlist":
                    listUser(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "The requested action is not supported.");
                    log("Unhandled action: " + action);
            }
        } catch (SQLException ex) {
            log("SQL Exception: " + ex.getMessage(), ex);
            throw new ServletException("Database access error: " + ex.getMessage(), ex);
        }
    }

    /**
     * Retrieves and displays a list of all users.
     */
    private void listUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<User> listUser = userDAO.selectAllUsers();
        request.setAttribute("listUser", listUser);
        forwardToPage(request, response, USER_LIST_JSP);
    }

    /**
     * Displays the form for creating a new user.
     */
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        forwardToPage(request, response, USER_FORM_JSP);
    }

    /**
     * Displays the form for editing an existing user.
     */
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = parseId(request);
        User existingUser = userDAO.selectUser(id);
        if (existingUser != null) {
            request.setAttribute("user", existingUser);
            forwardToPage(request, response, USER_FORM_JSP);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found with ID: " + id);
            log("User not found with ID: " + id);
        }
    }

    /**
     * Inserts a new user into the database.
     */
    private void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        User newUser = extractUserFromRequest(request);
        if (isValidUser(newUser)) {
            userDAO.insertUser(newUser);
            log("User inserted successfully: " + newUser);
            response.sendRedirect("userlist");
        } else {
            log("Invalid user data: " + newUser);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid user data.");
        }
    }

    /**
     * Updates an existing user's details in the database.
     */
    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = parseId(request);
        User updatedUser = extractUserFromRequest(request);
        updatedUser.setId(id);

        if (isValidUser(updatedUser)) {
            if (userDAO.updateUser(updatedUser)) {
                log("User updated successfully: " + updatedUser);
                response.sendRedirect("userlist");
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found with ID: " + id);
                log("Failed to update user. User not found with ID: " + id);
            }
        } else {
            log("Invalid user data: " + updatedUser);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid user data.");
        }
    }

    /**
     * Deletes a user from the database.
     */
    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = parseId(request);
        if (userDAO.deleteUser(id)) {
            log("User deleted successfully with ID: " + id);
            response.sendRedirect("userlist");
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found with ID: " + id);
            log("Failed to delete user. User not found with ID: " + id);
        }
    }

    /**
     * Parses and validates the ID parameter from the request.
     */
    private int parseId(HttpServletRequest request) throws NumberFormatException {
        return Integer.parseInt(request.getParameter("id"));
    }

    /**
     * Extracts user data from the HTTP request and creates a User object.
     */
    private User extractUserFromRequest(HttpServletRequest request) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        return new User(name, email, phone, address, username, password, role);
    }

    /**
     * Validates user data.
     */
    private boolean isValidUser(User user) {
        return user.getName() != null && !user.getName().isEmpty() &&
               user.getEmail() != null && !user.getEmail().isEmpty();
    }

    /**
     * Forwards the request and response to the specified page.
     */
    private void forwardToPage(HttpServletRequest request, HttpServletResponse response, String page)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher(page);
        dispatcher.forward(request, response);
    }
}
