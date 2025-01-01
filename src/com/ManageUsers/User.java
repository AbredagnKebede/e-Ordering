package com.ManageUsers;

/**
 * User.java
 * This is a model class that represents a User entity.
 */
public class User {
	// Fields to store user information
	protected int id; // Unique identifier for the user
	protected String name; // Name of the user
	protected String email; // Email address of the user
	protected String phone; // Phone number of the user
	protected String address; // Address of the user
	protected String username; // Username for the user account
	protected String password; // Password for the user account
	protected String role; // Role assigned to the user (e.g., admin, user)

	/**
	 * Default constructor.
	 */
	public User() {
	}

	/**
	 * Parameterized constructor to initialize a user without an ID.
	 * 
	 * @param name     Name of the user
	 * @param email    Email address of the user
	 * @param phone    Phone number of the user
	 * @param address  Address of the user
	 * @param username Username for the user account
	 * @param password Password for the user account
	 * @param role     Role assigned to the user
	 */
	public User(String name, String email, String phone, String address, String username, String password, String role) {
		super();
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.username = username;
		this.password = password;
		this.role = role;
	}

	/**
	 * Parameterized constructor to initialize a user with an ID.
	 * 
	 * @param id       Unique identifier for the user
	 * @param name     Name of the user
	 * @param email    Email address of the user
	 * @param phone    Phone number of the user
	 * @param address  Address of the user
	 * @param username Username for the user account
	 * @param password Password for the user account
	 * @param role     Role assigned to the user
	 */
	public User(int id, String name, String email, String phone, String address, String username, String password,
			String role) {
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

	/**
	 * Gets the unique identifier of the user.
	 * 
	 * @return User ID
	 */
	public int getId() {
		return id;
	}

	/**
	 * Sets the unique identifier of the user.
	 * 
	 * @param id User ID
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * Gets the name of the user.
	 * 
	 * @return User name
	 */
	public String getName() {
		return name;
	}

	/**
	 * Sets the name of the user.
	 * 
	 * @param name User name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * Gets the email address of the user.
	 * 
	 * @return User email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * Sets the email address of the user.
	 * 
	 * @param email User email
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * Gets the phone number of the user.
	 * 
	 * @return User phone
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * Sets the phone number of the user.
	 * 
	 * @param phone User phone
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * Gets the address of the user.
	 * 
	 * @return User address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * Sets the address of the user.
	 * 
	 * @param address User address
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * Gets the username of the user.
	 * 
	 * @return User username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * Sets the username of the user.
	 * 
	 * @param username User username
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * Gets the password of the user.
	 * 
	 * @return User password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * Sets the password of the user.
	 * 
	 * @param password User password
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * Gets the role of the user.
	 * 
	 * @return User role
	 */
	public String getRole() {
		return role;
	}

	/**
	 * Sets the role of the user.
	 * 
	 * @param role User role
	 */
	public void setRole(String role) {
		this.role = role;
	}
}
