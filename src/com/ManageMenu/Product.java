package com.ManageMenu;

/**
 * Product.java
 *
 * This is the Product class for managing product info.
 * It holds details like id, name, category, price, and image.
 * Used for storing product details for apps like menus or shopping systems.
 */
public class Product {

	// Unique ID for the product (e.g., from the database).
	protected int productId;

	// Product's name (e.g., "Burger", "Juice")
	protected String productName;

	// The category this product belongs to (e.g., "Food", "Beverages").
	protected String productCategory;

	// How much the product costs
	protected double productPrice;

	// URL or file path to the product's image
	protected String productImage;

	// Default constructor (no parameters needed here)
	public Product() {
	}

	/**
	 * Constructor to set up the product with some details.
	 *
	 * @param productName     The name of the product.
	 * @param productCategory The category of the product.
	 * @param productPrice    The price of the product.
	 * @param productImage    The image URL or file path.
	 */
	public Product(String productName, String productCategory, double productPrice, String productImage) {
		super(); // Calls the parent constructor (just a habit, not needed here)
		this.productName = productName;
		this.productCategory = productCategory;
		this.productPrice = productPrice;
		this.productImage = productImage;
	}

	
	public Product(int productId, String productName, String productCategory, double productPrice, String productImage) {
		super(); // Calls the parent constructor
		this.productId = productId;
		this.productName = productName;
		this.productCategory = productCategory;
		this.productPrice = productPrice;
		this.productImage = productImage;
	}

	
	public int getProductId() {
		return productId;
	}

	/**
	 * Sets the unique ID of the product.
	 *
	 * @param productId The product's ID.
	 */
	public void setProductId(int productId) {
		this.productId = productId;
	}

	/**
	 * Gets the name of the product.
	 *
	 * @return The product's name.
	 */
	public String getProductName() {
		return productName;
	}

	
	public void setProductName(String productName) {
		this.productName = productName;
	}

	/**
	 * Gets the category of the product.
	 *
	 * @return The product's category.
	 */
	public String getProductCategory() {
		return productCategory;
	}

	/**
	 * Sets the category of the product.
	 *
	 * @param productCategory The product's category.
	 */
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	
	public double getProductPrice() {
		return productPrice;
	}

	/**
	 * Sets the price of the product.
	 *
	 * @param productPrice The product's price.
	 */
	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	/**
	 * Gets the image URL or path of the product.
	 *
	 * @return The product's image URL/path.
	 */
	public String getProductImage() {
		return productImage;
	}

	/**
	 * Sets the image URL or path of the product.
	 *
	 * @param productImage The product's image URL/path.
	 */
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
}
