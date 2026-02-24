package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.model.RegisterModel;

public class RegisterDAO {

    // ==========================================
    // REGISTER USER
    // ==========================================
    public int register(RegisterModel model) {

        String sql = "INSERT INTO seller_register " +
                     "(username, gst_number, email, phone_number, password) " +
                     "VALUES (?, ?, ?, ?, ?)";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps =
                con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)
        ) {

            ps.setString(1, model.getUsername());
            ps.setString(2, model.getGstnumber());
            ps.setString(3, model.getEmail());
            ps.setString(4, model.getPhoneno());
            ps.setString(5, model.getPassword());

            int rows = ps.executeUpdate();

            if(rows > 0){

                ResultSet rs = ps.getGeneratedKeys();

                if (rs.next()) {
                    return rs.getInt(1);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return -1;
    }


    // ==========================================
    // COMMON EXISTS METHOD (BEST PRACTICE 🔥)
    // ==========================================

    private boolean recordExists(String column, String value){

        String sql="SELECT id FROM seller_register WHERE "+column+"=?";

        try(Connection con=DBConnection.getConnection();
            PreparedStatement ps=con.prepareStatement(sql)){

            ps.setString(1, value);

            ResultSet rs=ps.executeQuery();

            return rs.next();

        }catch(Exception e){
            e.printStackTrace();
        }

        return false;
    }


    // ==========================================
    // CHECK USERNAME EXISTS
    // ==========================================

    public boolean usernameExists(String username){
        return recordExists("username", username);
    }


    // ==========================================
    // CHECK EMAIL EXISTS
    // ==========================================

    public boolean emailExists(String email){
        return recordExists("email", email);
    }


    // ==========================================
    // CHECK PHONE EXISTS
    // ==========================================

    public boolean phoneExists(String phone){
        return recordExists("phone_number", phone);
    }


    // ==========================================
    // CHECK GST EXISTS
    // ==========================================

    public boolean gstExists(String gst){
        return recordExists("gst_number", gst);
    }

}