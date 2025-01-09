package com.cart.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cart.model.Cart;

/**
 * Servlet implementation class AddToCartServlet
 * Handles adding items to the shopping cart.
 */
@WebServlet(name = "AddToCartServlet", urlPatterns = "/add-to-cart")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String INDEX_PAGE = "index.jsp";
    private static final String CART_PAGE = "cart.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            int id = parseProductId(request.getParameter("id"));
            HttpSession session = request.getSession();

            // Get or initialize the cart list in session
            @SuppressWarnings("unchecked")
            ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart-list");
            if (cartList == null) {
                cartList = new ArrayList<>();
                session.setAttribute("cart-list", cartList);
            }

            // Check if the product already exists in the cart
            if (isProductInCart(cartList, id)) {
                displayMessage(response, "Selected item is already in the order.", CART_PAGE);
            } else {
                // Add new product to the cart
                Cart newCartItem = new Cart();
                newCartItem.setId(id);
                newCartItem.setQuantity(1);
                cartList.add(newCartItem);
                session.setAttribute("cart-list", cartList);
                response.sendRedirect(INDEX_PAGE);
            }
        } catch (NumberFormatException e) {
            displayMessage(response, "Invalid product ID.", INDEX_PAGE);
        } catch (Exception e) {
            throw new ServletException("Error while adding item to the cart.", e);
        }
    }

    /**
     * Parses and validates the product ID.
     * 
     * @param idParam the product ID parameter as String.
     * @return the parsed product ID as int.
     * @throws NumberFormatException if the ID is not a valid integer.
     */
    private int parseProductId(String idParam) throws NumberFormatException {
        if (idParam == null || idParam.isEmpty()) {
            throw new NumberFormatException("Product ID is missing.");
        }
        return Integer.parseInt(idParam);
    }

    /**
     * Checks if a product with the given ID already exists in the cart.
     * 
     * @param cartList the list of cart items.
     * @param productId the product ID to check.
     * @return true if the product exists in the cart, false otherwise.
     */
    private boolean isProductInCart(ArrayList<Cart> cartList, int productId) {
        return cartList.stream().anyMatch(cartItem -> cartItem.getId() == productId);
    }

    /**
     * Displays a message to the user and provides a navigation link.
     * 
     * @param response the HttpServletResponse object.
     * @param message the message to display.
     * @param redirectPage the page to link to.
     * @throws IOException if an input or output error is detected.
     */
    private void displayMessage(HttpServletResponse response, String message, String redirectPage) throws IOException {
        try (var out = response.getWriter()) {
            out.println("<h3 style='color:crimson; text-align: center'>" + message + 
                        "<br> <a href='" + redirectPage + "'>Go Back</a></h3>");
        }
    }
}
