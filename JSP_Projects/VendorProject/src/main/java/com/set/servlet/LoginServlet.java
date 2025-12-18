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
       
    
    public LoginServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname=request.getParameter("username").trim();  //"akhi " != "akhi"
		String pass=request.getParameter("pswd").trim();
		LoginModel um = new LoginModel(uname,pass);
		
		LoginDao ud=new LoginDao();
        try {
			if (ud.Validate(um)) {
				request.getRequestDispatcher("Vendor.jsp").forward(request, response);
			} else {
			    response.sendRedirect("Error.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//doGet(request, response);
	}

}
