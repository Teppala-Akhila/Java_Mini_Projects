package com.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.db.Dbconnection;
import com.model.InvoiceImageModel;

public class QcInvoiceWorkflow {

    public InvoiceImageModel getRandomInvoiceForQc(String qcUser) {

        String selectSql =
            "SELECT i.image_id, i.image_path " +
            "FROM invoice_images i " +
            "JOIN invoice_details d ON d.image_id = i.image_id " +
            "WHERE i.status = 'completed' " +
            "AND i.assigned_to_qc IS NULL " +
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
                    "SET assigned_to_qc = ?, " +
                    "status = 'qc_in_progress' " +
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

    public void releaseQcLock(int imageId) {

        String sql =
            "UPDATE invoice_images " +
            "SET assigned_to_qc = NULL, " +
            "status = 'completed' " +
            "WHERE image_id = ?";

        try (Connection con = Dbconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, imageId);
            ps.executeUpdate();

            System.out.println("QC lock released for image_id = " + imageId);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* =====================================================
       3️⃣ QC APPROVE
       ===================================================== */
    public boolean qcApprove(int imageId, String qcUser) {

        String sql =
            "UPDATE invoice_images SET " +
            "status = 'qc_approved', " +
            "qc_checked_by = ?, " +
            "assigned_to_qc = NULL " +
            "WHERE image_id = ?";

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

    public boolean qcReject(int imageId, String qcUser, String reason) {

        String sql =
            "UPDATE invoice_images SET " +
            "status = 'qc_rejected', " +
            "qc_checked_by = ?, " +
            "errors = ?, " +
            "assigned_to_qc = NULL " +
            "WHERE image_id = ?";

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