package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.db.Dbconnection;

@WebServlet("/QCServlet")
public class QCServlet extends HttpServlet {

    /* ===============================
       GET → block browser access
       =============================== */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/plain");
        response.getWriter().write(
            "QCServlet is POST-only. Use this via QC actions (Approve / Reject)."
        );
    }

    /* ===============================
       POST → QC actions
       =============================== */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/plain");

        HttpSession session = request.getSession(false);
        String qcUser = (session != null) ? (String) session.getAttribute("username") : null;

        if (qcUser == null) {
            response.getWriter().write("QC user not logged in");
            return;
        }

        String action = request.getParameter("action");
        String imageIdStr = request.getParameter("imageId");
        String comments = request.getParameter("comments");

        if (action == null || imageIdStr == null) {
            response.getWriter().write("Invalid request");
            return;
        }

        int imageId = Integer.parseInt(imageIdStr);

        try (Connection conn = Dbconnection.getConnection()) {

            switch (action) {

                /* ================= APPROVE ================= */
                case "approve": {
                    String sql =
                        "UPDATE invoice_images SET " +
                        " qc_checked_by = ?, " +
                        " qc_data = ?, " +
                        " qc_end_time = NOW(), " +
                        " status = 'qc_approved', " +
                        " assigned_to_qc = NULL " +
                        " WHERE image_id = ?";

                    try (PreparedStatement ps = conn.prepareStatement(sql)) {
                        ps.setString(1, qcUser);
                        ps.setString(2, "Approved: " + (comments != null ? comments : "No comments"));
                        ps.setInt(3, imageId);
                        ps.executeUpdate();
                    }

                    response.getWriter().write("success");
                    break;
                }

                /* ================= REJECT ================= */
                case "reject": {
                    String sql =
                        "UPDATE invoice_images SET " +
                        " qc_checked_by = ?, " +
                        " qc_data = ?, " +
                        " qc_end_time = NOW(), " +
                        " status = 'qc_rejected', " +
                        " assigned_to_qc = NULL " +
                        " WHERE image_id = ?";

                    try (PreparedStatement ps = conn.prepareStatement(sql)) {
                        ps.setString(1, qcUser);
                        ps.setString(2, "Rejected: " + (comments != null ? comments : "No reason"));
                        ps.setInt(3, imageId);
                        ps.executeUpdate();
                    }

                    response.getWriter().write("success");
                    break;
                }

                /* ============ NEEDS CORRECTION ============ */
                case "correction": {
                    String sql =
                        "UPDATE invoice_images SET " +
                        " qc_checked_by = ?, " +
                        " qc_data = ?, " +
                        " qc_end_time = NOW(), " +
                        " status = 'needs_correction', " +
                        " assigned_to_qc = NULL, " +
                        " errors = CONCAT(IFNULL(errors,''), ' | QC: ', ?) " +
                        " WHERE image_id = ?";

                    try (PreparedStatement ps = conn.prepareStatement(sql)) {
                        ps.setString(1, qcUser);
                        ps.setString(2, "Correction requested");
                        ps.setString(3, comments != null ? comments : "No comments");
                        ps.setInt(4, imageId);
                        ps.executeUpdate();
                    }

                    response.getWriter().write("success");
                    break;
                }

                default:
                    response.getWriter().write("Invalid action");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}