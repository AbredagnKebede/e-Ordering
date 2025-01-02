package com.customer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * DBConnect class for managing database connections.
 */
public class DBConnect {
	
	// Database URL, username, and password
	private static final String URL = "jdbc:mysql://localhost:3306/yumride";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "bare@coat";
	private static Connection con;

	/**
	 * Retrieves a connection to the database.
	 * 
	 * @return Connection object if successful, null otherwise.
	 */
	public static Connection getConnection() {
		try {
			// Load the MySQL JDBC driver
			Class.forName("com.mysql.cj.jdbc.Driver"); // Updated driver class name for newer MySQL versions

			// Establish the connection
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (ClassNotFoundException e) {
			System.out.println("MySQL JDBC Driver not found. Include it in your library path.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Database connection failed: " + e.getMessage());
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("An unexpected error occurred: " + e.getMessage());
			e.printStackTrace();
		}
		
		return con; // Return the connection or null if an error occurred
	}
}
