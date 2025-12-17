package com.set.doa;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.set.model.UserModel;

public class UserDao {

    String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/userdata";
    String DB_USERNAME = "root";
    String DB_PASSWORD = "root";

    
    public Connection getcon() throws Exception {
        Class.forName(DB_DRIVER);
        return DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
    }

    
    public void insertUser(UserModel user) {

        String insert = "INSERT INTO userdatavalues (firstname, lastname, phoneno , email) VALUES (?, ?, ?, ?)";

        try (
            Connection con = getcon();
            PreparedStatement ps = con.prepareStatement(insert)
        ) {
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getphno());
            ps.setString(4, user.getEmail());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

   
    public List<UserModel> getAllUsers() {

        List<UserModel> list = new ArrayList<>();
        String select = "SELECT * FROM userdatavalues";

        try (
            Connection con = getcon();
            PreparedStatement ps = con.prepareStatement(select);
            ResultSet rs = ps.executeQuery()
        ) {
            while (rs.next()) {
                UserModel um = new UserModel(
                        rs.getInt("id"),
                        rs.getString("firstname"),
                        rs.getString("lastname"),
                        rs.getString("phoneno"),
                        rs.getString("email")
                );
                list.add(um);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}































//package com.set.doa;
//
//import java.sql.*;
//import java.util.ArrayList;
//import java.util.List;
//
//import com.set.model.UserModel;
//
//public class UserDao {
//	String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
//	String DB_URL = "jdbc:mysql://localhost:3306/userdata";
//	String DB_USERNAME = "root";
//	String DB_PASSWORD = "root";
//	public Connection getcon() throws Exception {
//		Class.forName(DB_DRIVER);
//		Connection con = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
//		return con;
//	}
//	public UserDao() {
//		super();
//		 public void insertUser(UserModel user) {
//
//		        String insert = "INSERT INTO userdatavalues(fname,lname,phone,email) VALUES (?,?,?,?)";
//
//		        try (
//		            Connection con = getcon();
//		            PreparedStatement ps = con.prepareStatement(insert);
//		       ){ 
//		        	ps.setString(1, user.getFirstName());
//		            ps.setString(2, user. getLastName());
//		            ps.setString(3, user.getPhno());
//		            ps.setString(4, user.getEmail());
//		            
//		            ps.executeUpdate();
//		        }catch(Exception e) {
//		        	e.printStackTrace();
//		        }
//
//}
//		 public List<UserModel> getAllUsers() {
//
//		        List<UserModel> list = new ArrayList<>();
//		        String select = "SELECT * FROM users";
//
//		        try (
//		            Connection con = getcon();
//		            PreparedStatement ps = con.prepareStatement(select);
//		            ResultSet rs = ps.executeQuery()
//		        ) {
//		            while (rs.next()) {
//
//		                UserModel um = new UserModel(
//		                        rs.getInt("id"),
//		                        rs.getString("fname"),
//		                        rs.getString("lname"),
//		                        rs.getString("phone"),
//		                        rs.getString("email")
//		                );
//		                list.add(um);
//		            }
//
//		        } catch (Exception e) {
//		            e.printStackTrace();
//		        }
//		        return list;
//	}
//	}
