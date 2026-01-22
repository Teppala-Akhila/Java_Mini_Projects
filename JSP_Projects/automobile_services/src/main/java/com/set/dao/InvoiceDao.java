package com.set.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import com.set.model.InvoiceModel;
import com.set.model.InvoiceItemModel;

public class InvoiceDao {

    public void saveInvoiceWithItems(InvoiceModel invoice) throws Exception {

        String invoiceSql = "INSERT INTO invoices "
                + "(username, vendor_name, invoice_number, invoice_date, po_number, "
                + "invoice_total, image_not_clear, action_status) "
                + "VALUES (?,?,?,?,?,?,?,?)";

        String itemSql = "INSERT INTO invoice_items "
                + "(invoice_id, item_no, item_name, price, cgst, sgst, total) "
                + "VALUES (?,?,?,?,?,?,?)";

        try (Connection con = DbConnection.getConnection()) {

            con.setAutoCommit(false); // START TRANSACTION
            int invoiceId = 0;

            /* ===== SAVE INVOICE ===== */
            try (PreparedStatement ps =
                         con.prepareStatement(invoiceSql, Statement.RETURN_GENERATED_KEYS)) {

                ps.setString(1, invoice.getUsername());
                ps.setString(2, invoice.getVendorName());
                ps.setString(3, invoice.getInvoiceNumber());
                ps.setString(4, invoice.getInvoiceDate());
                ps.setString(5, invoice.getPoNumber());
                ps.setDouble(6, invoice.getInvoiceTotal());
                ps.setBoolean(7, invoice.isImageNotClear());
                ps.setString(8, invoice.getActionStatus());

                ps.executeUpdate();

                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    invoiceId = rs.getInt(1);
                }
            }

            /* ===== SAVE ITEMS ONLY FOR SUBMIT ===== */
            if ("SUBMIT".equalsIgnoreCase(invoice.getActionStatus())
                    && invoice.getItems() != null
                    && !invoice.getItems().isEmpty()) {

                try (PreparedStatement psItem = con.prepareStatement(itemSql)) {

                    for (InvoiceItemModel item : invoice.getItems()) {
                        psItem.setInt(1, invoiceId);
                        psItem.setString(2, item.getItemNo());
                        psItem.setString(3, item.getItemName());
                        psItem.setDouble(4, item.getPrice());
                        psItem.setDouble(5, item.getCgst());
                        psItem.setDouble(6, item.getSgst());
                        psItem.setDouble(7, item.getTotal());
                        psItem.addBatch();
                    }

                    psItem.executeBatch();
                }
            }

            con.commit(); // COMMIT BOTH

        } catch (Exception e) {
            throw e; // servlet handles error
        }
    }
}
