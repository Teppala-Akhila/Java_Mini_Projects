package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.LoginDAO;
import com.dao.BusinessBankDAO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ LOGIN USING EMAIL
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        LoginDAO loginDao = new LoginDAO();

        // ✅ Validate login by EMAIL
        int status = loginDao.validateLoginByEmail(email, password);

        if (status == 1) {

            // ✅ Get sellerId using EMAIL
            int sellerId = loginDao.getSellerIdByEmail(email);
            BusinessBankDAO bankDao = new BusinessBankDAO();

            HttpSession session = request.getSession();
            session.setAttribute("sellerId", sellerId);
            session.setAttribute("email", email);

            // ✅ BLOCK LOGIN IF BANK DETAILS NOT FILLED
            if (!bankDao.hasBankDetails(sellerId)) {
                response.sendRedirect("businessdetails.jsp");
            } else {
            	response.sendRedirect("addproduct.jsp?login=success");
            }

        } else {
            response.sendRedirect("login.jsp?error=invalid");
        }

    }
}