package com.ManageMenu;

/**
 * Product.java
 * 
 * This is a model class representing a Product entity in the system.
 * It contains details such as id, name, category, price, and image for each product.
 * This class is typically used for storing product information in an e-commerce or menu management system.
 * 
 * @version 1.0
 * @since 2024-12-31
 */
public class Product {

    // Unique identifier for the product (typically from a database)
    protected int id;

    // Name of the product (e.g., "Apple", "Pizza")
    protected String name;

    // Category to which the product belongs (e.g., "Fruits", "Snacks")
    protected String category;

    // Price of the product
    protected double price;

    // Image URL or path to an image representing the product
    protected String image;
    
    // Default constructor (no arguments)
    // This is useful for cases where a product object is created but the values are set later
    public Product() {
    }

    /**
     * Constructor to initialize the product with name, category, price, and image.
     * 
     * @param name     The name of the product.
     * @param category The category of the product.
     * @param price    The price of the product.
     * @param image    The image representing the product (URL or path).
     */
    public Product(String name, String category, double price, String image) {
        super(); // Optional, calls the superclass constructor (Object class)
        this.name = name;
        this.category = category;
        this.price = price;
        this.image = image;
    }

    /**
     * Constructor to initialize all fields of the product, including its unique ID.
     * 
     * @param id       The unique identifier for the product.
     * @param name     The name of the product.
     * @param category The category of the product.
     * @param price    The price of the product.
     * @param image    The image representing the product (URL or path).
     */
    public Product(int id, String name, String category, double price, String image) {
        super(); // Optional, calls the superclass constructor (Object class)
        this.id = id;
        this.name = name;
        this.category = category;
        this.price = price;
        this.image = image;
    }

    // Getter and setter methods for each field (id, name, category, price, and image)

    /**
     * Get the unique ID of the product.
     * 
     * @return The unique product ID.
     */
    public int getId() {
        return id;
    }

    /**
     * Set the unique ID of the product.
     * 
     * @param id The unique product ID.
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Get the name of the product.
     * 
     * @return The name of the product.
     */
    public String getName() {
        return name;
    }

    /**
     * Set the name of the product.
     * 
     * @param name The name of the product.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Get the category of the product.
     * 
     * @return The category of the product.
     */
    public String getCategory() {
        return category;
    }

    /**
     * Set the category of the product.
     * 
     * @param category The category of the product.
     */
    public void setCategory(String category) {
        this.category = category;
    }

    /**
     * Get the price of the product.
     * 
     * @return The price of the product.
     */
    public double getPrice() {
        return price;
    }

    /**
     * Set the price of the product.
     * 
     * @param price The price of the product.
     */
    public void setPrice(double price) {
        this.price = price;
    }

    /**
     * Get the image of the product.
     * 
     * @return The image URL or path of the product.
     */
    public String getImage() {
        return image;
    }

    /**
     * Set the image of the product.
     * 
     * @param image The image URL or path of the product.
     */
    public void setImage(String image) {
        this.image = image;
    }
}
