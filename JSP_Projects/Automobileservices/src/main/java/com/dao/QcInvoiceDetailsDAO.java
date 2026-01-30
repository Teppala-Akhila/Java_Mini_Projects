package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.db.Dbconnection;
import com.model.InvoiceDetailsModel;

public class QcInvoiceDetailsDAO {

    public InvoiceDetailsModel getInvoiceDetailsForQc(int imageId) {

        String sql = "SELECT * FROM invoice_details WHERE image_id = ?";

        try (Connection con = Dbconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, imageId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                InvoiceDetailsModel m = new InvoiceDetailsModel();

                m.setItemNo(rs.getString("item_no"));
                m.setItemName(rs.getString("item_name"));
                m.setQuantity(rs.getString("quantity"));
                m.setPrice(rs.getString("price"));
                m.setCgst(rs.getString("cgst"));
                m.setSgst(rs.getString("sgst"));
                m.setItemTotal(rs.getString("item_total"));
                m.setSubTotal(rs.getDouble("sub_total"));

                m.setVerifiedBy(rs.getString("verified_by"));
                m.setVerifiedTime(rs.getTimestamp("verified_time"));

                return m;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateQcItemDetails(
            int imageId,
            String itemNo,
            String itemName,
            String quantity,
            String price,
            String cgst,
            String sgst,
            String itemTotal,
            double subTotal,
            String qcUser
    ) {

        String sql =
            "UPDATE invoice_details SET " +
            "item_no = ?, " +
            "item_name = ?, " +
            "quantity = ?, " +
            "price = ?, " +
            "cgst = ?, " +
            "sgst = ?, " +
            "item_total = ?, " +
            "sub_total = ?, " +
            "qc_by = ?, " +
            "qc_time = NOW() " +
            "WHERE image_id = ?";

        try (Connection con = Dbconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, itemNo);
            ps.setString(2, itemName);
            ps.setString(3, quantity);
            ps.setString(4, price);
            ps.setString(5, cgst);
            ps.setString(6, sgst);
            ps.setString(7, itemTotal);
            ps.setDouble(8, subTotal);
            ps.setString(9, qcUser);
            ps.setInt(10, imageId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean isVerifyDataPresent(int imageId) {

        String sql =
            "SELECT 1 FROM invoice_details WHERE image_id = ? LIMIT 1";

        try (Connection con = Dbconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, imageId);
            ResultSet rs = ps.executeQuery();
            return rs.next();

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
