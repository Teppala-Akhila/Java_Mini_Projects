package com.set.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.set.model.InvoiceModel;

public class InvoiceDao {

    public boolean saveInvoiceProcessing(InvoiceModel invoice) {

    	String sql =
    		    "INSERT INTO user_invoice_processing (" +
    		    "username, user_role, image_id, image_path, " +
    		    "vendor_name, invoice_number, invoice_date, po_number, invoice_total, " +
    		    "item_no, item_name, quantity, price, cgst, sgst, item_total, " +
    		    "image_not_clear, action_status, hold_reason, " +
    		    "start_time, end_time, processed_date" +
    		    ") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, invoice.getUsername());
            ps.setString(2, invoice.getUserRole());
            ps.setInt(3, invoice.getImageId());
            ps.setString(4, invoice.getImagePath());

            ps.setString(5, invoice.getVendorName());
            ps.setString(6, invoice.getInvoiceNumber());
            ps.setString(7, invoice.getInvoiceDate());
            ps.setString(8, invoice.getPoNumber());
            ps.setDouble(9, invoice.getInvoiceTotal());

            ps.setString(10, invoice.getItemNo());
            ps.setString(11, invoice.getItemName());
            ps.setInt(12, invoice.getQuantity());
            ps.setDouble(13, invoice.getPrice());
            ps.setDouble(14, invoice.getCgst());
            ps.setDouble(15, invoice.getSgst());
            ps.setDouble(16, invoice.getItemTotal());

            ps.setBoolean(17, invoice.isImageNotClear());
            ps.setString(18, invoice.getActionStatus());
            ps.setString(19, invoice.getHoldReason());

            ps.setString(20, invoice.getStartTime());
            ps.setString(21, invoice.getEndTime());
            ps.setString(22, invoice.getProcessedDate());

            return ps.executeUpdate() > 0; // ✅ SUCCESS FLAG

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
