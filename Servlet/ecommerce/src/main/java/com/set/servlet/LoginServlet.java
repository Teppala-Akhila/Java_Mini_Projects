package com.set.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.set.dao.LoginDao;
import com.set.model.SellerModel;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       
    	String usernameOrEmail = request.getParameter("username");
        String password = request.getParameter("password");

        LoginDao dao = new LoginDao();
        SellerModel seller = dao.validate(usernameOrEmail, password);

        if (seller != null) {
            HttpSession session = request.getSession();
            session.setAttribute("sellerId", seller.getSellerId());
            session.setAttribute("vendorName", seller.getVendorName());

            response.sendRedirect("productadd.jsp");
        } else {
            response.getWriter().println("Invalid username/email or password");
        }
    }
}


























