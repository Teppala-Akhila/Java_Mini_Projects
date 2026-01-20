package com.set.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.set.model.RegisterModel;

public class RegisterDao {

    DbConnection db = new DbConnection();

    public boolean register(RegisterModel seller) {

        String sql =
            "INSERT INTO seller_register " +
            "(seller_id, vendor_name, gst_number, email, mobile_number, password) " +
            "VALUES (?,?,?,?,?,?)";

        try (Connection con = db.getcon();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, seller.getSellerId());        
            ps.setString(2, seller.getVendorName());
            ps.setString(3, seller.getGstNumber());
            ps.setString(4, seller.getEmail());
            ps.setString(5, seller.getMobileNumber());
            ps.setString(6, seller.getPassword());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
