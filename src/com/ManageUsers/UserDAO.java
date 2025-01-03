package com.ManageUsers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * UserDAO.java
 * This DAO class provides CRUD database operations for the table users in the database.
 */
public class UserDAO {
    // JDBC URL, username, and password for connecting to the database
    private String jdbcURL = "jdbc:mysql://localhost:3306/yumride?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "bare@coat";

    // SQL statements for CRUD operations
    private static final String INSERT_USERS_SQL = "INSERT INTO users (name,email,phone,address,username,password,role) VALUES (?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "SELECT id,name,email,phone,address,username,password,role FROM users WHERE id = ?";
    private static final String SELECT_ALL_USERS = "SELECT * FROM users";
    private static final String DELETE_USERS_SQL = "DELETE FROM users WHERE id = ?;";
    private static final String UPDATE_USERS_SQL = "UPDATE users SET name = ?, email = ?, phone = ?, address = ?, username = ?, password = ?, role = ? WHERE id = ?;";

    /**
     * Default constructor.
     */
    public UserDAO() {
    }

    /**
     * Establishes a connection to the database.
     * 
     * @return Connection object or null if the connection fails.
     */
    protected Connection getConnection() {
        Connection connection = null;
        try {
            // Load the MySQL JDBC Driver
            Class.forName("com.mysql.jdbc.Driver");
            // Establish connection with the database
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // Handle SQL exceptions
            printSQLException(e);
        } catch (ClassNotFoundException e) {
            // Handle case where JDBC Driver is not found
            System.out.println("MySQL JDBC Driver not found!");
            e.printStackTrace();
        }
        return connection; // Return the connection object
    }

    /**
     * Inserts a new user into the database.
     * 
     * @param user The User object containing user details.
     * @throws SQLException If there is an error during the SQL operation.
     */
    public void insertUser(User user) throws SQLException {
        // Use try-with-resources to ensure the connection is closed automatically
        try (Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            // Set the parameters for the prepared statement
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPhone());
            preparedStatement.setString(4, user.getAddress());
            preparedStatement.setString(5, user.getUsername());
            preparedStatement.setString(6, user.getPassword());
            preparedStatement.setString(7, user.getRole());
            // Execute the insert operation
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            // Handle SQL exceptions
            printSQLException(e);
        }
    }

    /**
     * Selects a user by ID from the database.
     * 
     * @param id The ID of the user to be selected.
     * @return The User object or null if not found.
     */
    public User selectUser(int id) {
        User user = null;
        // Use try-with-resources to ensure the connection is closed automatically
        try (Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)) {
            // Set the ID parameter for the prepared statement
            preparedStatement.setInt(1, id);
            // Execute the query
            ResultSet rs = preparedStatement.executeQuery();

            // Process the ResultSet to create a User object
            if (rs.next()) {
                user = new User(id, rs.getString("name"), rs.getString("email"), rs.getString("phone"),
                        rs.getString("address"), rs.getString("username"), rs.getString("password"),
                        rs.getString("role"));
            }
        } catch (SQLException e) {
            // Handle SQL exceptions
            printSQLException(e);
        }
        return user; // Return the User object or null
    }

    /**
     * Selects all users from the database.
     * 
     * @return A list of all users.
     */
    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        // Use try-with-resources to ensure the connection is closed automatically
        try (Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS)) {
            // Execute the query
            ResultSet rs = preparedStatement.executeQuery();

            // Process the ResultSet to create User objects and add them to the list
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String role = rs.getString("role");

                users.add(new User(id, name, email, phone, address, username, password, role));
            }
        } catch (SQLException e) {
            // Handle SQL exceptions
            printSQLException(e);
        }
        return users; // Return the list of users
    }

    /**
     * Deletes a user by ID from the database.
     * 
     * @param id The ID of the user to be deleted.
     * @return True if the user was deleted, false otherwise.
     * @throws SQLException If there is an error during the SQL operation.
     */
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        // Use try-with-resources to ensure the connection is closed automatically
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL)) {
            // Set the ID parameter for the prepared statement
            statement.setInt(1, id);
            // Execute the delete operation and check if any row was affected
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted; // Return the result of the delete operation
    }

    /**
     * Updates a user's details in the database.
     * 
     * @param user The User object containing updated user details.
     * @return True if the user was updated, false otherwise.
     * @throws SQLException If there is an error during the SQL operation.
     */
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        // Use try-with-resources to ensure the connection is closed automatically
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL)) {
            // Set the parameters for the prepared statement
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPhone());
            statement.setString(4, user.getAddress());
            statement.setString(5, user.getUsername());
            statement.setString(6, user.getPassword());
            statement.setString(7, user.getRole());
            statement.setInt(8, user.getId());

            // Execute the update operation and check if any row was affected
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated; // Return the result of the update operation
    }

    /**
     * Prints SQL exceptions to the console.
     * 
     * @param ex The SQLException to be printed.
     */
    private void printSQLException(SQLException ex) {
        // Iterate through the chain of SQL exceptions
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                // Print details of the SQLException
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                // Print the causes of the exception
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
