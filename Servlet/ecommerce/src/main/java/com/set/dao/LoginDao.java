package com.set.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.set.model.SellerModel;

public class LoginDao {

    DbConnection db = new DbConnection();

    public SellerModel validate(String usernameOrEmail, String password) {

        String sql = "SELECT * FROM seller_register " +
                     "WHERE (vendor_name = ? OR email = ?) AND password = ?";

        try (Connection con = db.getcon();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, usernameOrEmail);
            ps.setString(2, usernameOrEmail);
            ps.setString(3, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                SellerModel seller = new SellerModel();
                seller.setId(rs.getInt("id"));
                seller.setSellerId(rs.getString("seller_id"));
                seller.setVendorName(rs.getString("vendor_name"));
                seller.setEmail(rs.getString("email"));
                return seller;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
















