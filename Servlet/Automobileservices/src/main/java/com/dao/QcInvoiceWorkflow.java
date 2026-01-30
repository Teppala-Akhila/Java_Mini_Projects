package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.db.Dbconnection;
import com.model.InvoiceDetailsModel;
import com.model.InvoiceImageModel;

public class QcInvoiceWorkflow {

    public InvoiceImageModel getRandomInvoiceForQc(String qcUser) {

        String selectSql =
            "SELECT image_id, image_path " +
            "FROM invoice_images " +
            "WHERE status = 'completed' " +
            "AND assigned_to_qc IS NULL " +
            "ORDER BY RAND() LIMIT 1";

        try (Connection con = Dbconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(selectSql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {

                InvoiceImageModel img = new InvoiceImageModel();
                img.setImageId(rs.getInt("image_id"));
                img.setImagePath(rs.getString("image_path"));

              
                String updateSql =
                    "UPDATE invoice_images " +
                    "SET assigned_to_qc = ?, status = 'qc_in_progress' " +
                    "WHERE image_id = ?";

                try (PreparedStatement ups = con.prepareStatement(updateSql)) {
                    ups.setString(1, qcUser);
                    ups.setInt(2, img.getImageId());
                    ups.executeUpdate();
                }

                return img;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

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

                return m;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

   
    public boolean qcApprove(int imageId, String qcUser) {

        String sql =
            "UPDATE invoice_images SET " +
            "status = 'qc_approved', " +
            "qc_checked_by = ?, " +
            "assigned_to_qc = NULL " +
            "WHERE image_id = ?";

        return executeQcAction(sql, qcUser, imageId);
    }

    public boolean qcReject(int imageId, String qcUser, String reason) {

        String sql =
            "UPDATE invoice_images SET " +
            "status = 'qc_rejected', " +
            "qc_checked_by = ?, " +
            "errors = ?, " +
            "assigned_to_qc = NULL " +
            "WHERE image_id = ?";

        return executeQcAction(sql, qcUser, imageId, reason);
    }

    public boolean qcCorrection(int imageId, String qcUser, String comments) {

        String sql =
            "UPDATE invoice_images SET " +
            "status = 'needs_correction', " +
            "qc_checked_by = ?, " +
            "errors = ?, " +
            "assigned_to_qc = NULL " +
            "WHERE image_id = ?";

        return executeQcAction(sql, qcUser, imageId, comments);
    }

    private boolean executeQcAction(String sql, String qcUser, int imageId) {

        try (Connection con = Dbconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, qcUser);
            ps.setInt(2, imageId);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private boolean executeQcAction(String sql, String qcUser, int imageId, String reason) {

        try (Connection con = Dbconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, qcUser);
            ps.setString(2, reason);
            ps.setInt(3, imageId);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
