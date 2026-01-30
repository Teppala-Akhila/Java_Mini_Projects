package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.db.Dbconnection;

@WebServlet("/logout")
public class Logoutservlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String username = null;

        if (session != null) {
            username = (String) session.getAttribute("username");
        }

        try (Connection conn = new Dbconnection().getConnection()) {

            if (username != null) {

                // VERIFY release
                String verifySql =
                    "UPDATE invoice_images SET assigned_to_user=NULL, status='pending', verify_start_time=NULL " +
                    "WHERE assigned_to_user=? AND status IN ('in_progress','hold')";

                try (PreparedStatement ps = conn.prepareStatement(verifySql)) {
                    ps.setString(1, username);
                    ps.executeUpdate();
                }

                // QC release
                String qcSql =
                    "UPDATE invoice_images SET assigned_to_qc=NULL WHERE assigned_to_qc=?";

                try (PreparedStatement ps = conn.prepareStatement(qcSql)) {
                    ps.setString(1, username);
                    ps.executeUpdate();
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        if (session != null) {
            session.invalidate();
        }

        response.sendRedirect("login.jsp");
    }
}