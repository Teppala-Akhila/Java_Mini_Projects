package com.set.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.set.model.LoginModel;

public class LoginDao {

    DbConnection db = new DbConnection();

    public boolean validate(LoginModel login) {
        String sql = "SELECT * FROM seller_register WHERE username=? AND password=?";

        try (Connection con = db.getcon();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, login.getUsername());
            ps.setString(2, login.getPassword());

            ResultSet rs = ps.executeQuery();
            return rs.next();   //checks if record exists

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
























//package com.set.dao;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//import com.set.model.LoginModel;
//
//public class LoginDao {
//	DbConnection db = new DbConnection();
//
//    public boolean Register(LoginModel rgtr) throws SQLException, Exception {
//    	try (Connection con=db.getcon()){
//    		String register="INSERT INTO login(UserName, Password) values(?,?)";
//    		PreparedStatement ps=con.prepareStatement(register);
//    		 ps.setString(1, rgtr.getUserName());
//             ps.setString(2, rgtr.getPassword());
//             ps.executeUpdate();
//             return true;
//    	}catch(Exception e) {
//    		return false;
//    	}
//    }
//    public boolean Validate(LoginModel vldte) throws SQLException, Exception {
//    	try(Connection con=db.getcon()){
//    		String validate="SELECT * FROM login WHERE UserName=? AND Password=?";
//    		PreparedStatement ps=con.prepareStatement(validate);
//    		ps.setString(1, vldte.getUserName());
//    		ps.setString(2, vldte.getPassword());
//    		ResultSet rs=ps.executeQuery();
//    		return rs.next();   //When reading multiple rows we need while condition for rs.next here we are only checking is certain record exists.
//    	}catch(Exception e) {
//    		return false;
//    	}
//    }
//}
