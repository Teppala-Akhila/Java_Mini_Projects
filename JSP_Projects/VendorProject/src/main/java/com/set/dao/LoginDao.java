package com.set.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.*;

import com.set.model.LoginModel;

public class LoginDao {
	DbConnection db = new DbConnection();

	    public boolean Register(LoginModel rgtr) throws SQLException, Exception {
	    	try (Connection con=db.getcon()){
	    		String register="INSERT INTO login values(?,?)";
	    		PreparedStatement ps=con.prepareStatement(register);
	    		 ps.setString(1, rgtr.getUserName());
	             ps.setString(2, rgtr.getPassword());
	             ps.executeUpdate();
	             return true;
	    	}catch(Exception e) {
	    		return false;
	    	}
	    }
	    public boolean Validate(LoginModel vldte) throws SQLException, Exception {
	    	try(Connection con=db.getcon()){
	    		String validate="select * from login";
	    		PreparedStatement ps=con.prepareStatement(validate);
	    		ps.setString(1, vldte.getUserName());
	    		ps.setString(2, vldte.getPassword());
	    		ResultSet rs=ps.executeQuery();
	    		return rs.next();   //When reading multiple rows we need while condition for rs.next here we are only checking is certain record exists.
	    	}catch(Exception e) {
	    		return false;
	    	}
	    }
}
