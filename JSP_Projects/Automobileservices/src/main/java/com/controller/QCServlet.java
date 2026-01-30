package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.db.Dbconnection;
import com.dao.QcInvoiceWorkflow;

@WebServlet("/QCServlet")
public class QCServlet extends HttpServlet {

    /* ===============================
       BLOCK GET REQUESTS
       =============================== */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/plain");
        response.getWriter().write(
            "QCServlet is POST-only. Use QC buttons."
        );
    }

    /* ===============================
       HANDLE QC ACTIONS
       =============================== */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String qcUser = (session != null)
                ? (String) session.getAttribute("username")
                : null;

        if (qcUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");
        String imageIdStr = request.getParameter("imageId");
        String comments = request.getParameter("comments");

        if (action == null || imageIdStr == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid request");
            return;
        }

        int imageId = Integer.parseInt(imageIdStr);

        try {

            /* =================================================
               SUBMIT → QC APPROVE + LOAD NEXT INVOICE
               ================================================= */
            if ("submit".equals(action)) {

                QcInvoiceWorkflow workflow = new QcInvoiceWorkflow();
                workflow.markQcApproved(imageId, qcUser);

                // redirect to loader servlet
                response.sendRedirect(request.getContextPath() + "/qc");
                return;
            }

            /* =================================================
               OTHER QC ACTIONS
               ================================================= */
            try (Connection conn = Dbconnection.getConnection()) {

                /* ---------- APPROVE ---------- */
                if ("approve".equals(action)) {

                    String sql =
                        "UPDATE invoice_images SET " +
                        "status = 'qc_approved', " +
                        "qc_checked_by = ?, " +
                        "qc_end_time = NOW(), " +
                        "assigned_to_qc = NULL " +
                        "WHERE image_id = ?";

                    try (PreparedStatement ps = conn.prepareStatement(sql)) {
                        ps.setString(1, qcUser);
                        ps.setInt(2, imageId);
                        ps.executeUpdate();
                    }
                }

                /* ---------- REJECT ---------- */
                else if ("reject".equals(action)) {

                    String sql =
                        "UPDATE invoice_images SET " +
                        "status = 'qc_rejected', " +
                        "qc_checked_by = ?, " +
                        "errors = ?, " +
                        "qc_end_time = NOW(), " +
                        "assigned_to_qc = NULL " +
                        "WHERE image_id = ?";

                    try (PreparedStatement ps = conn.prepareStatement(sql)) {
                        ps.setString(1, qcUser);
                        ps.setString(2,
                            comments != null ? comments : "Rejected by QC");
                        ps.setInt(3, imageId);
                        ps.executeUpdate();
                    }
                }

                /* ---------- NEEDS CORRECTION ---------- */
                else if ("correction".equals(action)) {

                    String sql =
                        "UPDATE invoice_images SET " +
                        "status = 'needs_correction', " +
                        "qc_checked_by = ?, " +
                        "errors = CONCAT(IFNULL(errors,''), ' | QC: ', ?), " +
                        "qc_end_time = NOW(), " +
                        "assigned_to_qc = NULL " +
                        "WHERE image_id = ?";

                    try (PreparedStatement ps = conn.prepareStatement(sql)) {
                        ps.setString(1, qcUser);
                        ps.setString(2,
                            comments != null ? comments : "Correction required");
                        ps.setInt(3, imageId);
                        ps.executeUpdate();
                    }
                }

                else {
                    response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Invalid QC action"
                    );
                    return;
                }
            }

            // after any action → load next invoice
            response.sendRedirect(request.getContextPath() + "/qc");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(
                HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                "QC processing failed"
            );
        }
    }
}