package com.set.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.set.model.RegisterModel;

public class RegisterDao {
	DbConnection db = new DbConnection();

    public boolean register(RegisterModel user) {
        String sql = "INSERT INTO seller_register(username, gst_number, email_id, phone_number, password) VALUES (?,?,?,?,?)";

        try (Connection con = db.getcon();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getGstno());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhoneno());
            ps.setString(5, user.getPassword());

            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
}
}
