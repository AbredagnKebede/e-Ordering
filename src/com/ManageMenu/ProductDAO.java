package com.ManageMenu;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * ProductDAO class
 * This class handles database operations (CRUD) for the 'products' table.
 * Created and updated by a student as a learning exercise.
 */
public class ProductDAO {

    // Database connection parameters
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/yumride?useSSL=false";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "bare@coat";

    // SQL queries for CRUD operations
    private static final String INSERT_PRODUCT_SQL =
        "INSERT INTO products (id, name, category, price, image) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_PRODUCT_BY_ID =
        "SELECT id, name, category, price, image FROM products WHERE id = ?";
    private static final String SELECT_ALL_PRODUCT = "SELECT * FROM products";
    private static final String DELETE_PRODUCT_SQL = "DELETE FROM products WHERE id = ?";
    private static final String UPDATE_PRODUCT_SQL =
        "UPDATE products SET name = ?, category = ?, price = ?, image = ? WHERE id = ?";

    // Default constructor
    public ProductDAO() {}

    /**
     * Establish a database connection.
     * @return Connection object
     */
    protected Connection getConnection() {
        try {
            return DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database: " + e.getMessage());
        }
    }

    /**
     * Insert a new product into the database.
     * @param product The Product object to be inserted.
     */
    public void insertProduct(Product product) {
        // Using try-with-resources to automatically close resources
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL)) {

            // Set the values for the prepared statement
            preparedStatement.setInt(1, product.getId());
            preparedStatement.setString(2, product.getName());
            preparedStatement.setString(3, product.getCategory());
            preparedStatement.setDouble(4, product.getPrice());
            preparedStatement.setString(5, product.getImage());

            // Execute the insert operation
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            handleSQLException(e);
        }
    }

    /**
     * Retrieve a product by its ID.
     * @param id The ID of the product to retrieve.
     * @return A Product object if found, or null if not.
     */
    public Product selectProduct(int id) {
        Product product = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID)) {

            // Set the ID parameter in the prepared statement
            preparedStatement.setInt(1, id);

            // Execute the query
            ResultSet rs = preparedStatement.executeQuery();

            // Process the result set
            if (rs.next()) {
                product = new Product(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("category"),
                    rs.getDouble("price"),
                    rs.getString("image")
                );
            }
        } catch (SQLException e) {
            handleSQLException(e);
        }
        return product;
    }

    /**
     * Retrieve all products from the database.
     * @return A list of Product objects.
     */
    public List<Product> selectAllProduct() {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCT)) {

            // Execute the query
            ResultSet rs = preparedStatement.executeQuery();

            // Process the result set
            while (rs.next()) {
                products.add(new Product(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("category"),
                    rs.getDouble("price"),
                    rs.getString("image")
                ));
            }
        } catch (SQLException e) {
            handleSQLException(e);
        }
		
        return products;
    }

    /**
     * Delete a product from the database by its ID.
     * @param id The ID of the product to delete.
     * @return true if the product was deleted, false otherwise.
     */
    public boolean deleteProduct(int id) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT_SQL)) {

            // Set the ID parameter in the prepared statement
            preparedStatement.setInt(1, id);

            // Execute the delete operation
            return preparedStatement.executeUpdate() > 0;

        } catch (SQLException e) {
            handleSQLException(e);
            return false;
        }
    }

    /**
     * Update an existing product in the database.
     * @param product The Product object containing updated data.
     * @return true if the product was updated, false otherwise.
     */
    public boolean updateProduct(Product product) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT_SQL)) {

            // Set the values for the prepared statement
            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2, product.getCategory());
            preparedStatement.setDouble(3, product.getPrice());
            preparedStatement.setString(4, product.getImage());
            preparedStatement.setInt(5, product.getId());

            // Execute the update operation
            return preparedStatement.executeUpdate() > 0;

        } catch (SQLException e) {
            handleSQLException(e);
            return false;
        }
    }

    /**
     * Handle and display SQL exceptions.
     * @param ex The SQLException to handle.
     */
    private void handleSQLException(SQLException ex) {
        System.err.println("SQL Error: " + ex.getMessage());
        System.err.println("SQLState: " + ex.getSQLState());
        System.err.println("Error Code: " + ex.getErrorCode());
    }
}
