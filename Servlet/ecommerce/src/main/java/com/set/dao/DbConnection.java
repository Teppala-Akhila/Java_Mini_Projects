package com.set.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/demo";
    String DB_USERNAME = "root";
    String DB_PASSWORD = "root";
    public Connection getcon() throws Exception {
    	Class.forName(DB_DRIVER);
    	return DriverManager.getConnection(DB_URL,DB_USERNAME,DB_PASSWORD);
    }
}
