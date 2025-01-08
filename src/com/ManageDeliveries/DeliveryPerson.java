package com.ManageDeliveries;

/**
 * DeliveryPerson.java
 * This is a model class representing a DeliveryPerson entity.
 * It encapsulates the details of a delivery process such as delivery ID, order ID, customer ID, address, status, 
 * estimated delivery time, and actual delivery time.
 */
public class DeliveryPerson {

    // Unique identifier for the delivery
    protected int delivery_id;

    // Identifier for the associated order
    protected int order_id;

    // Identifier for the customer
    protected int cus_id;

    // Delivery address
    protected String address;

    // Current status of the delivery (e.g., Pending, Delivered, etc.)
    protected String status;

    // Estimated time for the delivery
    protected String estimate_time;

    // Actual time the delivery was completed
    protected String actual_del_time;

    /**
     * Default constructor
     */
    public DeliveryPerson() {
    }

    /**
     * Parameterized constructor to initialize a DeliveryPerson without a delivery ID.
     * @param order_id       ID of the order
     * @param cus_id         ID of the customer
     * @param address        Delivery address
     * @param status         Current delivery status
     * @param estimate_time  Estimated delivery time
     * @param actual_del_time Actual delivery time
     */
    public DeliveryPerson(int order_id, int cus_id, String address, String status, String estimate_time, String actual_del_time) {
        super();
        this.order_id = order_id;
        this.cus_id = cus_id;
        this.address = address;
        this.status = status;
        this.estimate_time = estimate_time;
        this.actual_del_time = actual_del_time;
    }

    /**
     * Parameterized constructor to initialize a DeliveryPerson with all fields.
     * @param delivery_id    ID of the delivery
     * @param order_id       ID of the order
     * @param cus_id         ID of the customer
     * @param address        Delivery address
     * @param status         Current delivery status
     * @param estimate_time  Estimated delivery time
     * @param actual_del_time Actual delivery time
     */
    public DeliveryPerson(int delivery_id, int order_id, int cus_id, String address, String status, String estimate_time, String actual_del_time) {
        super();
        this.delivery_id = delivery_id;
        this.order_id = order_id;
        this.cus_id = cus_id;
        this.address = address;
        this.status = status;
        this.estimate_time = estimate_time;
        this.actual_del_time = actual_del_time;
    }

    /**
     * Gets the delivery ID.
     * @return Delivery ID
     */
    public int getDelivery_id() {
        return delivery_id;
    }

    /**
     * Sets the delivery ID.
     * @param delivery_id ID of the delivery
     */
    public void setDelivery_id(int delivery_id) {
        this.delivery_id = delivery_id;
    }

    /**
     * Gets the order ID.
     * @return Order ID
     */
    public int getOrder_id() {
        return order_id;
    }

    /**
     * Sets the order ID.
     * @param order_id ID of the order
     */
    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    /**
     * Gets the customer ID.
     * @return Customer ID
     */
    public int getCus_id() {
        return cus_id;
    }

    /**
     * Sets the customer ID.
     * @param cus_id ID of the customer
     */
    public void setCus_id(int cus_id) {
        this.cus_id = cus_id;
    }

    /**
     * Gets the delivery address.
     * @return Delivery address
     */
    public String getAddress() {
        return address;
    }

    /**
     * Sets the delivery address.
     * @param address Delivery address
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * Gets the delivery status.
     * @return Delivery status
     */
    public String getStatus() {
        return status;
    }

    /**
     * Sets the delivery status.
     * @param status Delivery status
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * Gets the estimated delivery time.
     * @return Estimated delivery time
     */
    public String getEstimate_time() {
        return estimate_time;
    }

    /**
     * Sets the estimated delivery time.
     * @param estimate_time Estimated delivery time
     */
    public void setEstimate_time(String estimate_time) {
        this.estimate_time = estimate_time;
    }

    /**
     * Gets the actual delivery time.
     * @return Actual delivery time
     */
    public String getActual_del_time() {
        return actual_del_time;
    }

    /**
     * Sets the actual delivery time.
     * @param actual_del_time Actual delivery time
     */
    public void setActual_del_time(String actual_del_time) {
        this.actual_del_time = actual_del_time;
    }
}
