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
			Class.forName("com.mysql.jdbc.Driver"); // Load MySQL JDBC Driver
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword); // Establish connection
		} catch (SQLException e) {
			printSQLException(e); // Print SQL exceptions
		} catch (ClassNotFoundException e) {
			System.out.println("MySQL JDBC Driver not found!"); // Driver not found
			e.printStackTrace();
		}
		return connection; // Return connection object
	}

	/**
	 * Inserts a new user into the database.
	 * 
	 * @param user The User object containing user details.
	 * @throws SQLException If there is an error during the SQL operation.
	 */
	public void insertUser(User user) throws SQLException {
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
			// Set parameters for the prepared statement
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getEmail());
			preparedStatement.setString(3, user.getPhone());
			preparedStatement.setString(4, user.getAddress());
			preparedStatement.setString(5, user.getUsername());
			preparedStatement.setString(6, user.getPassword());
			preparedStatement.setString(7, user.getRole());
			preparedStatement.executeUpdate(); // Execute the insert operation
		} catch (SQLException e) {
			printSQLException(e); // Print SQL exceptions
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
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)) {
			preparedStatement.setInt(1, id); // Set the ID parameter
			ResultSet rs = preparedStatement.executeQuery(); // Execute query

			// Process the ResultSet
			if (rs.next()) {
				user = new User(id, rs.getString("name"), rs.getString("email"), rs.getString("phone"),
						rs.getString("address"), rs.getString("username"), rs.getString("password"),
						rs.getString("role")); // Create User object from ResultSet
			}
		} catch (SQLException e) {
			printSQLException(e); // Print SQL exceptions
		}
		return user; // Return the User object or null
	}

	/**
	 * Selects all users from the database.
	 * 
	 * @return A list of all users.
	 */
	public List<User> selectAllUsers() {
		List<User> users = new ArrayList<>(); // List to hold users
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS)) {
			ResultSet rs = preparedStatement.executeQuery(); // Execute query

			// Process the ResultSet
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String role = rs.getString("role");

				// Add User object to the list
				users.add(new User(id, name, email, phone, address, username, password, role));
			}
		} catch (SQLException e) {
			printSQLException(e); // Print SQL exceptions
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
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL)) {
			statement.setInt(1, id); // Set the ID parameter
			rowDeleted = statement.executeUpdate() > 0; // Execute delete operation
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
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL)) {
			// Set parameters for the prepared statement
			statement.setString(1, user.getName());
			statement.setString(2, user.getEmail());
			statement.setString(3, user.getPhone());
			statement.setString(4, user.getAddress());
			statement.setString(5, user.getUsername());
			statement.setString(6, user.getPassword());
			statement.setString(7, user.getRole());
			statement.setInt(8, user.getId());

			rowUpdated = statement.executeUpdate() > 0; // Execute update operation
		}
		return rowUpdated; // Return the result of the update operation
	}

	/**
	 * Prints SQL exceptions to the console.
	 * 
	 * @param ex The SQLException to be printed.
	 */
	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err); // Print stack trace
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause(); // Print cause of the exception
				}
			}
		}
	}
}
