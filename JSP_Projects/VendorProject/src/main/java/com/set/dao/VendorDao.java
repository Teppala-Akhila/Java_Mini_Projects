package com.set.dao;

import java.sql.*;

import com.set.model.VendorModel;

public class VendorDao {
	DbConnection db = new DbConnection();
	public void saveVendor(VendorModel sv) {
        try (Connection con = db.getcon()) {
            String sql = "INSERT INTO vendor(vendor_name, gst_no, email, mobile) VALUES (?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, sv.getVendorName());
            ps.setString(2, sv.getGstNumber());
            ps.setString(3, sv.getEmail());
            ps.setString(4, sv.getContactno());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
