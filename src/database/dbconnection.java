package database;

import java.sql.*;

public class dbconnection {
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/javaevent","root","root");
        return con;
    }

}