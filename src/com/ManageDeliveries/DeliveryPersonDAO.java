package com.ManageDeliveries;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * DeliveryPersonDAO.java
 * This DAO class provides CRUD database operations for the table DeliveryPerson in the database.
 */
public class DeliveryPersonDAO {

    // JDBC URL, username, and password for the database
    private String jdbcURL = "jdbc:mysql://localhost:3306/yumride?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "bare@coat";

    // SQL queries for CRUD operations
    private static final String INSERT_DeliveryPerson_SQL = "INSERT INTO deliveries (order_id, cus_id, address, status, estimate_time, actual_del_time) VALUES (?, ?, ?, ?, ?, ?);";
    private static final String SELECT_DeliveryPerson_BY_ID = "SELECT delivery_id, order_id, cus_id, address, status, estimate_time, actual_del_time FROM deliveries WHERE delivery_id = ?;";
    private static final String SELECT_ALL_DeliveryPerson = "SELECT * FROM deliveries;";
    private static final String DELETE_DeliveryPerson_SQL = "DELETE FROM deliveries WHERE delivery_id = ?;";
    private static final String UPDATE_DeliveryPerson_SQL = "UPDATE deliveries SET order_id = ?, cus_id = ?, address = ?, status = ?, estimate_time = ?, actual_del_time = ? WHERE delivery_id = ?;";

    /**
     * Default constructor
     */
    public DeliveryPersonDAO() {
    }

    /**
     * Establishes a connection to the database.
     * @return A Connection object
     */
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver"); // Load the MySQL JDBC driver
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    /**
     * Inserts a new delivery person record into the database.
     * @param deliveryperson The DeliveryPerson object containing the details to be inserted.
     * @throws SQLException If a database access error occurs.
     */
    public void insertDeliveryPerson(DeliveryPerson deliveryperson) throws SQLException {
        System.out.println(INSERT_DeliveryPerson_SQL);
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_DeliveryPerson_SQL)) {
            preparedStatement.setInt(1, deliveryperson.getOrder_id());
            preparedStatement.setInt(2, deliveryperson.getCus_id());
            preparedStatement.setString(3, deliveryperson.getAddress());
            preparedStatement.setString(4, deliveryperson.getStatus());
            preparedStatement.setString(5, deliveryperson.getEstimate_time());
            preparedStatement.setString(6, deliveryperson.getActual_del_time());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    /**
     * Retrieves a delivery person record by its ID.
     * @param delivery_id The ID of the delivery person to be retrieved.
     * @return A DeliveryPerson object with the retrieved details, or null if not found.
     */
    public DeliveryPerson selectDeliveryPerson(int delivery_id) {
        DeliveryPerson deliveryperson = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_DeliveryPerson_BY_ID)) {
            preparedStatement.setInt(1, delivery_id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int order_id = rs.getInt("order_id");
                int cus_id = rs.getInt("cus_id");
                String address = rs.getString("address");
                String status = rs.getString("status");
                String estimate_time = rs.getString("estimate_time");
                String actual_del_time = rs.getString("actual_del_time");
                deliveryperson = new DeliveryPerson(delivery_id, order_id, cus_id, address, status, estimate_time, actual_del_time);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return deliveryperson;
    }

    /**
     * Retrieves all delivery person records from the database.
     * @return A list of DeliveryPerson objects containing all records.
     */
    public List<DeliveryPerson> selectAllDeliveryPerson() {
        List<DeliveryPerson> deliveryperson = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DeliveryPerson)) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int delivery_id = rs.getInt("delivery_id");
                int order_id = rs.getInt("order_id");
                int cus_id = rs.getInt("cus_id");
                String address = rs.getString("address");
                String status = rs.getString("status");
                String estimate_time = rs.getString("estimate_time");
                String actual_del_time = rs.getString("actual_del_time");
                deliveryperson.add(new DeliveryPerson(delivery_id, order_id, cus_id, address, status, estimate_time, actual_del_time));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return deliveryperson;
    }

    /**
     * Deletes a delivery person record by its ID.
     * @param delivery_id The ID of the delivery person to be deleted.
     * @return True if the record was deleted, otherwise false.
     * @throws SQLException If a database access error occurs.
     */
    public boolean deleteDeliveryPerson(int delivery_id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_DeliveryPerson_SQL)) {
            statement.setInt(1, delivery_id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    /**
     * Updates a delivery person record in the database.
     * @param deliveryperson The DeliveryPerson object containing the updated details.
     * @return True if the record was updated, otherwise false.
     * @throws SQLException If a database access error occurs.
     */
    public boolean updateDeliveryPerson(DeliveryPerson deliveryperson) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_DeliveryPerson_SQL)) {
            statement.setInt(1, deliveryperson.getOrder_id());
            statement.setInt(2, deliveryperson.getCus_id());
            statement.setString(3, deliveryperson.getAddress());
            statement.setString(4, deliveryperson.getStatus());
            statement.setString(5, deliveryperson.getEstimate_time());
            statement.setString(6, deliveryperson.getActual_del_time());
            statement.setInt(7, deliveryperson.getDelivery_id());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    /**
     * Prints details of a SQLException for debugging purposes.
     * @param ex The SQLException to be printed.
     */
    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
