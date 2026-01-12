package com.set.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.set.dao.LoginDao;
import com.set.model.LoginModel;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       
        String username = request.getParameter("username");
        String password = request.getParameter("pswd");

        LoginModel login = new LoginModel(username, password);
        LoginDao dao = new LoginDao();

        if (dao.validate(login)) {
            response.sendRedirect("productadd.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}


























