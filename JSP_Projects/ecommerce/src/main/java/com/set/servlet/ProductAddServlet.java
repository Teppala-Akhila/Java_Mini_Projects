package com.set.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;

import com.set.dao.ProductDao;
import com.set.model.ProductModel;


@WebServlet("/ProductServlet")
@MultipartConfig
public class ProductAddServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductModel p = new ProductModel();

        p.setProductId(Integer.parseInt(request.getParameter("productId")));
        p.setProductName(request.getParameter("productName"));
        p.setBrand(request.getParameter("brand"));
        p.setColor(request.getParameter("color"));
        p.setPrice(new BigDecimal(request.getParameter("price")));
        p.setStock(Integer.parseInt(request.getParameter("stock")));
        p.setStatus(request.getParameter("status"));

        Part imagePart = request.getPart("productImage");
        String fileName = imagePart.getSubmittedFileName();

        String uploadPath = getServletContext().getRealPath("") + "uploads";
        new File(uploadPath).mkdir();

        imagePart.write(uploadPath + File.separator + fileName);
        p.setImageUrl("uploads/" + fileName);

        ProductDao dao = new ProductDao();

        if (dao.addProduct(p)) {
            response.sendRedirect("ProductViewServlet");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}









































