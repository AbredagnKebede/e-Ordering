package com.ManageUsers;

/**
 * User.java
 * This is a model class that represents a User entity.
 */
public class User {
    // Fields to store user information
    private int id; // Unique identifier for the user
    private String name; // Name of the user
    private String email; // Email address of the user
    private String phone; // Phone number of the user
    private String address; // Address of the user
    private String username; // Username for the user account
    private String password; // Password for the user account
    private String role; // Role assigned to the user (e.g., admin, user)

    /**
     * Default constructor.
     */
    public User() {
        // Initialize default values if needed
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
    public User(int id, String name, String email, String phone, String address, String username, String password, String role) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.username = username;
        this.password = password;
        this.role = role;
    }

    // Getter and setter methods
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

    /**
     * Sets the password for the user. It's recommended to hash the password before
     * storing it for security.
     * 
     * @param password Plaintext password
     */
    public void setPassword(String password) {
        // Example of hashing (implement actual hashing logic as needed)
        this.password = hashPassword(password);
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    /**
     * Utility method to hash the password. Replace with a proper hashing
     * algorithm (e.g., bcrypt).
     * 
     * @param password Plaintext password
     * @return Hashed password
     */
    private String hashPassword(String password) {
        // Placeholder for hashing logic
        return "hashed_" + password; // Replace with real hashing logic
    }

    @Override
    public String toString() {
        return "User [id=" + id + ", name=" + name + ", email=" + email + ", phone=" + phone + 
                ", address=" + address + ", username=" + username + ", role=" + role + "]";
    }
}
