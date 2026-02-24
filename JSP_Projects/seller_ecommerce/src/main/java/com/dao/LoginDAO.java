package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO {

    // 1 = success, 2 = wrong password, 3 = email not found
	public int validateLoginByEmail(String email, String password) {

	    String sql = "SELECT password FROM seller_register WHERE email=?";

	    try (
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(sql)
	    ) {
	        ps.setString(1, email);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            String dbPassword = rs.getString("password");
	            if (dbPassword.equals(password)) {
	                return 1; // success
	            } else {
	                return 2; // wrong password
	            }
	        } else {
	            return 3; // email not found
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return 0;
	}

	public int getSellerIdByEmail(String email) {

	    String sql = "SELECT id FROM seller_register WHERE email=?";

	    try (
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(sql)
	    ) {
	        ps.setString(1, email);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            return rs.getInt("id");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return -1;
	}
	
	public boolean updatePasswordByEmail(String email, String newPassword) {

	    String sql = "UPDATE seller_register SET password=? WHERE email=?";

	    try (
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(sql)
	    ) {
	        ps.setString(1, newPassword);
	        ps.setString(2, email);

	        return ps.executeUpdate() > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}

}