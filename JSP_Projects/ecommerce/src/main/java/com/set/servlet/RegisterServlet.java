package com.set.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.set.dao.RegisterDao;
import com.set.model.RegisterModel;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /*READ FORM DATA*/
        String vendorName   = request.getParameter("username");
        String gstNumber    = request.getParameter("gst");
        String email        = request.getParameter("email");
        String mobileNumber = request.getParameter("phone");
        String password     = request.getParameter("password");
        String confirmPwd   = request.getParameter("confirmPassword");

        /*PASSWORD MATCH CHECK*/
        if (password == null || !password.equals(confirmPwd)) {
            response.getWriter().println("Passwords do not match");
            return;
        }

        /*GENERATE BUSINESS SELLER ID*/
        String sellerId = "SELLER" + System.currentTimeMillis();
        // Example: SELLER1700001234567

        /*SET MODEL*/
        RegisterModel seller = new RegisterModel();
        seller.setSellerId(sellerId);
        seller.setVendorName(vendorName);
        seller.setGstNumber(gstNumber);
        seller.setEmail(email);
        seller.setMobileNumber(mobileNumber);
        seller.setPassword(password);

        /*DAO CALL*/
        RegisterDao dao = new RegisterDao();

        if (dao.register(seller)) {
            response.sendRedirect("login.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
