package com.cart.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cart.connection.DbCon;
import com.cart.dao.OrderDao;

/**
 * CancelOrderServlet handles the cancellation of orders.
 */
@WebServlet("/cancel-order")
public class CancelOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String ORDERS_PAGE = "orders.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");

        if (idParam == null || idParam.isEmpty()) {
            redirectToOrdersPageWithError(response, "Invalid order ID provided.");
            return;
        }

        try {
            int orderId = Integer.parseInt(idParam);
            OrderDao orderDao = new OrderDao(DbCon.getConnection());

            if (orderDao.cancelOrder(orderId)) {
                response.sendRedirect(ORDERS_PAGE);
            } else {
                redirectToOrdersPageWithError(response, "Order cancellation failed. Order ID may not exist.");
            }
        } catch (NumberFormatException e) {
            redirectToOrdersPageWithError(response, "Order ID must be a valid integer.");
        } catch (ClassNotFoundException | SQLException e) {
            log("Database error during order cancellation: " + e.getMessage(), e);
            redirectToOrdersPageWithError(response, "An error occurred while processing your request. Please try again.");
        }
    }

    /**
     * Redirects the response to the orders page with an error message.
     *
     * @param response the HttpServletResponse object.
     * @param errorMessage the error message to display.
     * @throws IOException if an input or output error occurs.
     */
    private void redirectToOrdersPageWithError(HttpServletResponse response, String errorMessage) throws IOException {
        response.sendRedirect(ORDERS_PAGE + "?error=" + errorMessage);
    }
}
