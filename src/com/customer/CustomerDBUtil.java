package com.customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
    
	/**
	 * Validates a user by checking the username and password against the database.
	 *
	 * @param userName The username of the customer.
	 * @param password The password of the customer.
	 * @return true if valid, false otherwise.
	 */
	public static boolean validate(String userName, String password) {
		isSuccess = false; // Reset success status

		String sql = "SELECT * FROM users WHERE username=? AND password=?";
		try (Connection con = DBConnect.getConnection();
			 PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			pstmt.setString(1, userName);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			
			isSuccess = rs.next(); // If there is a result, the user is valid
			
		} catch (Exception e) {
			e.printStackTrace(); // Print stack trace for debugging
		}
		
		return isSuccess;
	}
	
	/**
	 * Retrieves a list of customers based on the username.
	 *
	 * @param userName The username of the customer.
	 * @return List of customers associated with the username.
	 */
	public static List<Customer> getCustomer(String userName) {
		List<Customer> customers = new ArrayList<>();
		String sql = "SELECT * FROM users WHERE username=?";
		
		try (Connection con = DBConnect.getConnection();
			 PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			pstmt.setString(1, userName);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Customer cus = new Customer(
					rs.getInt(1),
					rs.getString(2),
					rs.getString(3),
					rs.getString(4),
					rs.getString(5),
					rs.getString(6),
					rs.getString(7),
					rs.getString(8)
				);
				customers.add(cus);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return customers;	
	}
    
	/**
	 * Inserts a new customer into the database.
	 *
	 * @param name The name of the customer.
	 * @param email The email of the customer.
	 * @param phone The phone number of the customer.
	 * @param address The address of the customer.
	 * @param username The username of the customer.
	 * @param password The password of the customer.
	 * @param role The role of the customer.
	 * @return true if insertion is successful, false otherwise.
	 */
    public static boolean insertCustomer(String name, String email, String phone, String address, String username, String password, String role) {
    	boolean isSuccess = false;
    	String sql = "INSERT INTO users VALUES (0, ?, ?, ?, ?, ?, ?, ?, ?)";

    	try (Connection con = DBConnect.getConnection();
    		 PreparedStatement pstmt = con.prepareStatement(sql)) {
    		
    		pstmt.setString(1, name);
    		pstmt.setString(2, email);
    		pstmt.setString(3, phone);
    		pstmt.setString(4, address);
    		pstmt.setString(5, username);
    		pstmt.setString(6, password);
    		pstmt.setString(7, role);
    		int rowsAffected = pstmt.executeUpdate();
    		
    		isSuccess = rowsAffected > 0; // If rows affected, insertion is successful
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
 	
    	return isSuccess;
    }
    
	/**
	 * Updates an existing customer's information.
	 *
	 * @param id The ID of the customer.
	 * @param name The new name of the customer.
	 * @param email The new email of the customer.
	 * @param phone The new phone number of the customer.
	 * @param address The new address of the customer.
	 * @param username The new username of the customer.
	 * @param password The new password of the customer.
	 * @param role The new role of the customer.
	 * @return true if update is successful, false otherwise.
	 */
    public static boolean updateCustomer(String id, String name, String email, String phone, String address, String username, String password, String role) {
    	boolean isSuccess = false;
    	String sql = "UPDATE users SET name=?, email=?, phone=?, address=?, username=?, password=?, role=? WHERE id=?";
    	
    	try (Connection con = DBConnect.getConnection();
    		 PreparedStatement pstmt = con.prepareStatement(sql)) {
    		
    		pstmt.setString(1, name);
    		pstmt.setString(2, email);
    		pstmt.setString(3, phone);
    		pstmt.setString(4, address);
    		pstmt.setString(5, username);
    		pstmt.setString(6, password);
    		pstmt.setString(7, role);
    		pstmt.setInt(8, Integer.parseInt(id));
    		
    		int rowsAffected = pstmt.executeUpdate();
    		isSuccess = rowsAffected > 0; // Update successful if rows affected
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	
    	return isSuccess;
    }
 
	/**
	 * Retrieves customer details based on the given ID.
	 *
	 * @param id The ID of the customer.
	 * @return List of customers matching the ID.
	 */
    public static List<Customer> getCustomerDetails(String id) {
    	int convertedID = Integer.parseInt(id);
    	List<Customer> customers = new ArrayList<>();
    	String sql = "SELECT * FROM users WHERE id=?";

    	try (Connection con = DBConnect.getConnection();
    		 PreparedStatement pstmt = con.prepareStatement(sql)) {
    		
    		pstmt.setInt(1, convertedID);
    		ResultSet rs = pstmt.executeQuery();
    		
    		while (rs.next()) {
    			Customer c = new Customer(
    				rs.getInt(1),
    				rs.getString(2),
    				rs.getString(3),
    				rs.getString(4),
    				rs.getString(5),
    				rs.getString(6),
    				rs.getString(7),
    				rs.getString(8)
    			);
    			customers.add(c);
    		}
    	} catch (Exception e) {
    		e.printStackTrace();
    	}	
    	return customers;	
    }
    
	/**
	 * Deletes a customer from the database based on the given ID.
	 *
	 * @param id The ID of the customer to delete.
	 * @return true if deletion is successful, false otherwise.
	 */
    public static boolean deleteCustomer(String id) {
    	boolean isSuccess = false;
    	int convId = Integer.parseInt(id);
    	String sql = "DELETE FROM users WHERE id=?";

    	try (Connection con = DBConnect.getConnection();
    		 PreparedStatement pstmt = con.prepareStatement(sql)) {
    		
    		pstmt.setInt(1, convId);
    		int rowsAffected = pstmt.executeUpdate();
    		isSuccess = rowsAffected > 0; // Deletion successful if rows affected
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	
    	return isSuccess;
    }
}
