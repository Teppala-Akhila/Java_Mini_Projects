package com.servlet;

import java.io.IOException;

import com.dao.LoginDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String newPass = request.getParameter("new_password");
        String confirmPass = request.getParameter("confirm_password");

        if (!newPass.equals(confirmPass)) {
            response.sendRedirect("forgot-password.jsp?error=nomatch");
            return;
        }

        LoginDAO dao = new LoginDAO();
        boolean updated = dao.updatePasswordByEmail(email, newPass);

        if (updated) {
            response.sendRedirect("login.jsp?success=reset");
        } else {
            response.sendRedirect("forgot-password.jsp?error=email");
        }
    }
}