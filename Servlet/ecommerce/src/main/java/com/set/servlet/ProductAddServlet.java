package com.set.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;

import com.set.dao.ProductDao;
import com.set.model.ProductModel;

@WebServlet("/ProductAddServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,      // 1 MB
    maxFileSize = 1024 * 1024 * 5,         // 5 MB
    maxRequestSize = 1024 * 1024 * 10      // 10 MB
)
public class ProductAddServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /*SESSION*/
        HttpSession session = request.getSession(false);
        String sellerId = (String) session.getAttribute("sellerId");

        if (sellerId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        /*IMAGE UPLOAD*/
        Part imagePart = request.getPart("productImage");
        String fileName = System.currentTimeMillis() + "_" +
                          imagePart.getSubmittedFileName();

        String uploadPath = getServletContext()
                .getRealPath("") + "images" + File.separator + "products";

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        imagePart.write(uploadPath + File.separator + fileName);

        String imagePath = "images/products/" + fileName;

        /*PRICE CALCULATION*/
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        int discount = Integer.parseInt(request.getParameter("discount"));

        BigDecimal discountAmount =
                price.multiply(BigDecimal.valueOf(discount))
                     .divide(BigDecimal.valueOf(100));

        BigDecimal finalPrice = price.subtract(discountAmount);

        /*SET MODEL*/
        ProductModel p = new ProductModel();
        p.setSellerId(sellerId);                               // FK
        p.setProductCode(request.getParameter("productCode"));
        p.setProductName(request.getParameter("productName"));
        p.setModelNumber(request.getParameter("modelNumber"));
        p.setModel(request.getParameter("model"));
        p.setCategory(request.getParameter("category"));
        p.setBrand(request.getParameter("brand"));
        p.setColor(request.getParameter("color"));
        p.setQuantity(Integer.parseInt(request.getParameter("quantity")));
        p.setPrice(price);
        p.setDiscount(discount);
        p.setFinalPrice(finalPrice);
        p.setWarrantyMonths(
                Integer.parseInt(request.getParameter("warrantyMonths")));
        p.setImagePath(imagePath);                             //  uploaded image
        p.setStatus(request.getParameter("status"));
        p.setDescription(request.getParameter("description"));

        /*DAO CALL*/
        ProductDao dao = new ProductDao();

        if (dao.addProduct(p)) {
            response.sendRedirect("ProductViewServlet");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}



























