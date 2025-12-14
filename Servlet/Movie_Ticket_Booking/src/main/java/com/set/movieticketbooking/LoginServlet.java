package com.set.movieticketbooking;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DispatcherRedirect")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet Executed @ LoginServlet");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("uname");
		String password=request.getParameter("upass");
		if(username.equals(password)) {
			request.setAttribute("LoggedInUser", username);
			RequestDispatcher rd = request.getRequestDispatcher("DashboardServlet");
			rd.forward(request, response);
		}
		else {
			response.sendRedirect("Login.html");
		}
		doGet(request, response);
	}

}































