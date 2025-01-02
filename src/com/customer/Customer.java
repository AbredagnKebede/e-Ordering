package com.customer;

/**
 * The Customer class represents a customer with various attributes.
 */
public class Customer {
   
    // Unique identifier for the customer
	private int id;
    
    // Customer's full name
    private String name;
    
    // Customer's email address
    private String email;
    
    // Customer's phone number
    private String phone;
    
    // Customer's physical address
    private String address;
    
    // Customer's username for login
    private String username;
    
    // Customer's password for login
    private String password;
    
    // Role of the customer (e.g., admin, user)
    private String role;
    
    /**
     * Constructor to initialize a Customer object with all attributes.
     *
     * @param id Unique identifier for the customer
     * @param name Full name of the customer
     * @param email Email address of the customer
     * @param phone Phone number of the customer
     * @param address Physical address of the customer
     * @param username Username for the customer
     * @param password Password for the customer
     * @param role Role of the customer
     */
    public Customer(int id, String name, String email, String phone, String address, String username, String password, String role) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.username = username;
		this.password = password;
		this.role = role;
	}

    // Getters and setters for each attribute

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}
