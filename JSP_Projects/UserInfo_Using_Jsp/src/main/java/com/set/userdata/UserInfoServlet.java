package com.set.userdata;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.set.doa.UserDao;
import com.set.model.UserModel;


@WebServlet("/UserInfoServlet")
public class UserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   UserDao ud=new UserDao();
    public UserInfoServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("get data");
		List<UserModel> AllUsers=ud.getAllUsers();
		request.setAttribute("userList", AllUsers);
		request.getRequestDispatcher("User.jsp").forward(request, response);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post data");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String phno=request.getParameter("phno");
		String email=request.getParameter("email");
		UserModel usm=new UserModel(0,fname, lname,phno,email );
		ud.insertUser(usm);
		List<UserModel> userdata=ud.getAllUsers();
		request.setAttribute("userList", userdata);
		request.getRequestDispatcher("User.jsp").forward(request, response);
		
		//doGet(request, response);
	}

}
