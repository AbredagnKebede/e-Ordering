package com.Adminlogin.bean;

// Importing required package for serialization
import java.io.Serializable;

/**
 * LoginBean is a simple JavaBean class used for storing login credentials.
 * Implements Serializable to allow its instances to be converted into a byte stream.
 */
public class LoginBean implements Serializable {

    // Unique identifier for serialization
    private static final long serialVersionUID = 1L;

    // Username for login
    private String username;

    // Password for login
    private String password;

    /**
     * Gets the username.
     * @return The username of the user.
     */
    public String getUsername() {
        return username;
    }

    /**
     * Sets the username.
     * @param username The username to be set.
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * Gets the password.
     * @return The password of the user.
     */
    public String getPassword() {
        return password;
    }

    /**
     * Sets the password.
     * @param password The password to be set.
     */
    public void setPassword(String password) {
        this.password = password;
    }
}
