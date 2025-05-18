package oasisdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/oasis";
    private static final String USER = "root";
    private static final String PASSWORD = "2024Oasis123";

    // Private constructor to prevent instantiation
    private DBConnection() { }

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            System.out.println("Error connecting to the database.");
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            System.out.println("Error loading the driver.");
            e.printStackTrace();
        }
        return null;
    }
}

