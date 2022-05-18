package com.laptrinhweb.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnect {
    private static Connection conn = null;

    public static Connection getConn() throws SQLException,
    ClassNotFoundException {
        if (conn == null) {
            Class.forName("org.sqlite.JDBC");
            conn = DriverManager.getConnection("jdbc:sqlite:database/database.db");
        }
        return conn;
    }      
    
    public static void main(String[] args) {
        String  query= "SELECT * FROM Product;";
        try {
            Connection con = DBConnect.getConn();
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ProductId= rs.getInt("ProductId");
                System.out.print(ProductId);
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 

    }
}
