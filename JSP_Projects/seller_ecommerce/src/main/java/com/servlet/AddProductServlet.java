package com.servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Collection;

import com.dao.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/AddProductServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = -1,
        maxRequestSize = -1
)
public class AddProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        Connection conn = null;

        try {

            conn = DBConnection.getConnection();
            conn.setAutoCommit(false); // Start transaction

            HttpSession session = request.getSession(false);
            Integer sellerId = (Integer) session.getAttribute("sellerId");

            if (sellerId == null) {
                response.sendRedirect("sellerlogin.jsp");
                return;
            }

            /* ================= INSERT PRODUCT ================= */

            String productSql = "INSERT INTO products " +
                    "(seller_id, vendor_name, product_id, product_name, brand, model, category, description, warranty, status) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(
                    productSql,
                    Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, sellerId);
            ps.setString(2, request.getParameter("vendor_name"));
            ps.setString(3, request.getParameter("product_id"));
            ps.setString(4, request.getParameter("product_name"));
            ps.setString(5, request.getParameter("brand"));
            ps.setString(6, request.getParameter("model"));

            String category = request.getParameter("category");
            if ("OTHER".equalsIgnoreCase(category)) {
                category = request.getParameter("other_category");
            }
            ps.setString(7, category);

            ps.setString(8, request.getParameter("description"));

            int warranty = 0;
            try {
                warranty = Integer.parseInt(request.getParameter("warranty"));
            } catch (Exception ignored) {}

            ps.setInt(9, warranty);

            String productStatus = request.getParameter("status");
            if (productStatus == null || productStatus.isEmpty()) {
                productStatus = "ACTIVE";
            }
            ps.setString(10, productStatus);

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            int productDbId = 0;

            if (rs.next()) {
                productDbId = rs.getInt(1);
            }

            rs.close();
            ps.close();

            if (productDbId == 0) {
                throw new Exception("Product insertion failed.");
            }

            /* ================= HANDLE VARIANTS ================= */

            String[] colors = request.getParameterValues("color[]");
            String[] specTypes = request.getParameterValues("spec_type[]");
            String[] specValues = request.getParameterValues("spec_value[]");
            String[] skuArr = request.getParameterValues("sku[]");
            String[] priceArr = request.getParameterValues("price[]");
            String[] discountArr = request.getParameterValues("discount[]");
            String[] quantityArr = request.getParameterValues("quantity[]");
            String[] statusArr = request.getParameterValues("variant_status[]");

            if (colors != null) {

                for (int i = 0; i < colors.length; i++) {

                    double price = 0;
                    int discount = 0;
                    int quantity = 0;

                    try { price = Double.parseDouble(priceArr[i]); } catch (Exception ignored) {}
                    try { discount = Integer.parseInt(discountArr[i]); } catch (Exception ignored) {}
                    try { quantity = Integer.parseInt(quantityArr[i]); } catch (Exception ignored) {}

                    if (discount < 0) discount = 0;
                    if (discount > 100) discount = 100;
                    if (price < 0) price = 0;
                    if (quantity < 0) quantity = 0;

                    double finalPrice = price - (price * discount / 100);

                    String variantSql = "INSERT INTO product_variants " +
                            "(product_db_id, color, spec_type, spec_value, sku, price, discount, final_price, quantity, status) " +
                            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                    PreparedStatement vps = conn.prepareStatement(
                            variantSql,
                            Statement.RETURN_GENERATED_KEYS);

                    vps.setInt(1, productDbId);
                    vps.setString(2, colors[i]);
                    vps.setString(3, specTypes[i]);
                    vps.setString(4, specValues[i]);
                    vps.setString(5, skuArr[i]);
                    vps.setDouble(6, price);
                    vps.setInt(7, discount);
                    vps.setDouble(8, finalPrice);
                    vps.setInt(9, quantity);

                    String variantStatus = "ACTIVE";
                    if (statusArr != null && i < statusArr.length) {
                        variantStatus = statusArr[i];
                    }
                    vps.setString(10, variantStatus);

                    vps.executeUpdate();

                    ResultSet vrs = vps.getGeneratedKeys();
                    int variantId = 0;

                    if (vrs.next()) {
                        variantId = vrs.getInt(1);
                    }

                    vrs.close();
                    vps.close();

                    /* ================= SAVE IMAGES PER VARIANT ================= */

                    Collection<Part> parts = request.getParts();

                    for (Part part : parts) {

                        if (part.getName().equals("variantImages_" + i)
                                && part.getSubmittedFileName() != null
                                && !part.getSubmittedFileName().isEmpty()) {

                            String fileName = System.currentTimeMillis() + "_"
                                    + Paths.get(part.getSubmittedFileName())
                                            .getFileName().toString();

                            String uploadPath = getServletContext()
                                    .getRealPath("") + File.separator + "product-images";

                            File uploadDir = new File(uploadPath);
                            if (!uploadDir.exists()) {
                                uploadDir.mkdirs();
                            }

                            part.write(uploadPath + File.separator + fileName);

                            String imagePath = "product-images/" + fileName;

                            String imageSql =
                                    "INSERT INTO product_images (variant_id, image_url) VALUES (?, ?)";

                            PreparedStatement ips = conn.prepareStatement(imageSql);
                            ips.setInt(1, variantId);
                            ips.setString(2, imagePath);
                            ips.executeUpdate();
                            ips.close();
                        }
                    }
                }
            }

            conn.commit(); // Commit everything

            response.sendRedirect("sellerdashboard.jsp?tab=products&view=grid&success=true");

        } catch (Exception e) {

            try {
                if (conn != null) conn.rollback();
            } catch (Exception ignored) {}

            e.printStackTrace();
            response.sendRedirect("sellerdashboard.jsp?tab=products&error=true");

        } finally {

            try {
                if (conn != null) conn.close();
            } catch (Exception ignored) {}
        }
    }
}