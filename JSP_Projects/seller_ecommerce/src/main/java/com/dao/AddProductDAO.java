package com.dao;

import java.sql.*;
import java.util.*;
import com.model.AddProductModel;

public class AddProductDAO {

    /* ==============================
       INSERT PRODUCT
    ============================== */
    public int insertProduct(AddProductModel p) {

        int productDbId = 0;

        String sql = "INSERT INTO products " +
                "(seller_id, vendor_name, product_id, product_name, brand, model, category, description, warranty, status) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, p.getSellerId());
            ps.setString(2, p.getVendorName());
            ps.setString(3, p.getProductId());
            ps.setString(4, p.getProductName());
            ps.setString(5, p.getBrand());
            ps.setString(6, p.getModel());
            ps.setString(7, p.getCategory());
            ps.setString(8, p.getDescription());
            ps.setInt(9, p.getWarranty());
            ps.setString(10, p.getStatus());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                productDbId = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return productDbId;
    }

    /* ==============================
       INSERT VARIANT (UPDATED)
    ============================== */
    public int insertVariant(int productDbId,
                             String color,
                             String specType,
                             String specValue,
                             String sku,
                             double price,
                             int discount,
                             double finalPrice,
                             int quantity,
                             String status) {

        int variantId = 0;

        String sql = "INSERT INTO product_variants " +
                "(product_db_id, color, spec_type, spec_value, sku, price, discount, final_price, quantity, status) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, productDbId);
            ps.setString(2, color);
            ps.setString(3, specType);
            ps.setString(4, specValue);
            ps.setString(5, sku);
            ps.setDouble(6, price);
            ps.setInt(7, discount);
            ps.setDouble(8, finalPrice);
            ps.setInt(9, quantity);
            ps.setString(10, status);

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                variantId = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return variantId;
    }

    /* ==============================
       INSERT IMAGE
    ============================== */
    public void insertImage(int variantId, String imagePath) {

        String sql = "INSERT INTO product_images (variant_id, image_url) VALUES (?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, variantId);
            ps.setString(2, imagePath);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* ==============================
       GET PRODUCTS BY SELLER
    ============================== */
    public List<Map<String,Object>> getProductsBySeller(int sellerId){

        List<Map<String,Object>> products = new ArrayList<>();

        String sql = "SELECT p.product_db_id, p.product_name, v.variant_id, v.final_price, v.quantity " +
                     "FROM products p " +
                     "JOIN product_variants v ON p.product_db_id = v.product_db_id " +
                     "WHERE p.seller_id=?";

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)){

            ps.setInt(1, sellerId);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Map<String,Object> product = new HashMap<>();

                int variantId = rs.getInt("variant_id");

                product.put("productDbId", rs.getInt("product_db_id"));
                product.put("variantId", variantId);
                product.put("name", rs.getString("product_name"));
                product.put("price", rs.getDouble("final_price"));
                product.put("stock", rs.getInt("quantity"));
                product.put("images", getImagesByVariantId(variantId));

                products.add(product);
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return products;
    }

    /* ==============================
       GET IMAGES
    ============================== */
    public List<String> getImagesByVariantId(int variantId){

        List<String> images = new ArrayList<>();

        String sql = "SELECT image_url FROM product_images WHERE variant_id=?";

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)){

            ps.setInt(1, variantId);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                images.add(rs.getString("image_url"));
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return images;
    }

    /* ==============================
       DELETE PRODUCT
    ============================== */
    public void deleteProduct(int productDbId){

        String sql = "DELETE FROM products WHERE product_db_id=?";

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)){

            ps.setInt(1, productDbId);
            ps.executeUpdate();

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}


















//package com.dao;
//
//import java.sql.*;
//
//import com.model.AddProductModel;
//
//public class AddProductDAO {
//
//    /* ==============================
//       INSERT PRODUCT
//    ============================== */
//    public int insertProduct(AddProductModel p) {
//
//        int productDbId = 0;
//
//        String sql = "INSERT INTO products " +
//                "(seller_id, vendor_name, product_id, product_name, brand, model, category, description, warranty, status) " +
//                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//
//        try (Connection con = DBConnection.getConnection();
//             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
//
//            ps.setInt(1, p.getSellerId());
//            ps.setString(2, p.getVendorName());
//            ps.setString(3, p.getProductId());   // seller product id
//            ps.setString(4, p.getProductName());
//            ps.setString(5, p.getBrand());
//            ps.setString(6, p.getModel());
//            ps.setString(7, p.getCategory());
//            ps.setString(8, p.getDescription());
//            ps.setInt(9, p.getWarranty());
//            ps.setString(10, p.getStatus());
//
//            ps.executeUpdate();
//
//            ResultSet rs = ps.getGeneratedKeys();
//            if (rs.next()) {
//                productDbId = rs.getInt(1);
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return productDbId;
//    }
//
//
//    /* ==============================
//       INSERT VARIANT
//    ============================== */
//    public int insertVariant(int productDbId,
//                             String color,
//                             String storage,
//                             String sku,
//                             double price,
//                             int discount,
//                             double finalPrice,
//                             int quantity,
//                             String status) {
//
//        int variantId = 0;
//
//        String sql = "INSERT INTO product_variants " +
//                "(product_db_id, color, storage, sku, price, discount, final_price, quantity, status) " +
//                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
//
//        try (Connection con = DBConnection.getConnection();
//             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
//
//            ps.setInt(1, productDbId);
//            ps.setString(2, color);
//            ps.setString(3, storage);
//            ps.setString(4, sku);
//            ps.setDouble(5, price);
//            ps.setInt(6, discount);
//            ps.setDouble(7, finalPrice);
//            ps.setInt(8, quantity);
//            ps.setString(9, status);
//
//            ps.executeUpdate();
//
//            ResultSet rs = ps.getGeneratedKeys();
//            if (rs.next()) {
//                variantId = rs.getInt(1);
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return variantId;
//    }
//
//
//    /* ==============================
//       INSERT IMAGE
//    ============================== */
//    public void insertImage(int variantId, String imagePath) {
//
//        String sql = "INSERT INTO product_images (variant_id, image_url) VALUES (?, ?)";
//
//        try (Connection con = DBConnection.getConnection();
//             PreparedStatement ps = con.prepareStatement(sql)) {
//
//            ps.setInt(1, variantId);
//            ps.setString(2, imagePath);
//            ps.executeUpdate();
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//}
//
