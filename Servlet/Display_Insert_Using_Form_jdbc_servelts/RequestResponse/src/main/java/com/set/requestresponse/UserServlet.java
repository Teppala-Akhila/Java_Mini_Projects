package com.set.requestresponse;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
	String DB_URL = "jdbc:mysql://localhost:3306/akhila";
	String DB_USERNAME = "root";
	String DB_PASSWORD = "root";

	public Connection getcon() throws Exception {
		Class.forName(DB_DRIVER);
		Connection con = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
		return con;
	}

	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		try (Connection con = getcon();
		     Statement s = con.createStatement();
		     ResultSet rs = s.executeQuery("SELECT * FROM movie")) {

		    StringBuilder movieListRow = new StringBuilder();

		    while (rs.next()) {
		        int id = rs.getInt(1);
		        String name = rs.getString(2);
		        String time = rs.getString(3);
		        String place = rs.getString(4);

		        movieListRow.append("<tr>");
		        movieListRow.append("<td>").append(id).append("</td>");
		        movieListRow.append("<td>").append(name).append("</td>");
		        movieListRow.append("<td>").append(time).append("</td>");
		        movieListRow.append("<td>").append(place).append("</td>");
		        movieListRow.append("</tr>");
		    }
		    String responseStr = "<html>"
		            + "<body>"
		            + "<h2>Movie List</h2>"
		            + "<table border='1' cellpadding='5' cellspacing='0'>"
		            + "<tr>"
		            + "<th>ID</th>"
		            + "<th>Movie Name</th>"
		            + "<th>Show Time</th>"
		            + "<th>Place</th>"
		            + "</tr>"
		            + movieListRow
		            + "</table>"
		            + "</body>"
		            + "</html>";

		    out.print(responseStr);
	}catch(Exception e)	{
		e.printStackTrace();
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	// response.setContentType("text/html");
//	int id = Integer.parseInt(request.getParameter("id"));
//    String name = request.getParameter("name");
//    String time = request.getParameter("time");
//    String place = request.getParameter("place");
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

	        try (Connection con = getcon()) {

	            String query = "INSERT INTO movie(moviename,movietime,place) VALUES (?,?,?)";
	            PreparedStatement ps = con.prepareStatement(query);
	            String name = request.getParameter("moviename");
	            String time = request.getParameter("movietime");
	            String place = request.getParameter("place");
	            ps.setString(1, name);
	            ps.setString(2, time);
	            ps.setString(3, place);

	            int rows = ps.executeUpdate();

	            if (rows > 0) {
	                System.out.println("Record inserted successfully!");
	            } else {
	                System.out.println("Insert failed!");
	            }
	        }
		catch(Exception e) {
			e.printStackTrace();
		}
		doGet(request, response);
	}

}