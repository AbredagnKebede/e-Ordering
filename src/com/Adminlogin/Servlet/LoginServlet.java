package com.Adminlogin.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Adminlogin.DAO.LoginDao;
import com.Adminlogin.bean.LoginBean;

/**
 * Servlet implementation for Admin login functionality.
 * Handles login requests and validates user credentials.
 * @developer abredagn@gmail.com
 */
@WebServlet("/Adminlogin")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // DAO object for handling login-related database operations
    private LoginDao loginDao;

    /**
     * Initializes the LoginDao instance when the servlet is first loaded.
     */
    public void init() {
        loginDao = new LoginDao();
    }

    /**
     * Handles POST requests for the login functionality.
     * @param request  HttpServletRequest object containing client request data
     * @param response HttpServletResponse object for sending response data to the client
     * @throws ServletException If an input or output error is detected
     * @throws IOException If a servlet-specific error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve username and password from the login form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Create a LoginBean instance and set its properties with the user input
        LoginBean loginBean = new LoginBean();
        loginBean.setUsername(username);
        loginBean.setPassword(password);

        try {
            // Validate user credentials using LoginDao
            if (loginDao.validate(loginBean)) {
                // Redirect to Admin index page upon successful login
                response.sendRedirect("Admin_index.jsp");
            } else {
                // On login failure, create a session and redirect to an error page
                HttpSession session = request.getSession();
                response.sendRedirect("Error.jsp");
            }
        } catch (ClassNotFoundException e) {
            // Handle exceptions related to database operations or class loading
            e.printStackTrace();
        }
    }
}
