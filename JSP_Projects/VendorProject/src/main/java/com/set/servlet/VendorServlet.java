package com.set.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.set.dao.VendorDao;
import com.set.model.VendorModel;

@WebServlet("/VendorServlet")
public class VendorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public VendorServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String vendorname=request.getParameter("vendorname");
	        String gst=request.getParameter("gst");
	        String email=request.getParameter("email");
	        String cno=request.getParameter("cno");
	        VendorModel v = new VendorModel(vendorname,gst,email,cno);

	        VendorDao vd = new VendorDao();
	        vd.saveVendor(v);

	        response.getWriter().println("Vendor Details Saved Successfully");
		doGet(request, response);
	}

}
