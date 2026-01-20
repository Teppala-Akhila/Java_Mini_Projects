package com.set.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.set.model.ProductModel;

public class ProductDao {

    DbConnection db = new DbConnection();

    public boolean addProduct(ProductModel p) {

        String sql =
            "INSERT INTO products " +
            "(seller_id, product_code, category, product_name, model_number, model, brand, " +
            "quantity, color, price, discount, final_price, warranty_months, image_path, status, description) " +
            "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        try (Connection con = db.getcon();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, p.getSellerId());        // FK
            ps.setString(2, p.getProductCode());
            ps.setString(3, p.getCategory());
            ps.setString(4, p.getProductName());
            ps.setString(5, p.getModelNumber());
            ps.setString(6, p.getModel());
            ps.setString(7, p.getBrand());
            ps.setInt(8, p.getQuantity());
            ps.setString(9, p.getColor());
            ps.setBigDecimal(10, p.getPrice());        
            ps.setInt(11, p.getDiscount());
            ps.setBigDecimal(12, p.getFinalPrice()); 
            ps.setInt(13, p.getWarrantyMonths());
            ps.setString(14, p.getImagePath());     
            ps.setString(15, p.getStatus());
            ps.setString(16, p.getDescription());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /* GET PRODUCTS BY SELLER*/
    public List<ProductModel> getProductsBySeller(String sellerId) {

        List<ProductModel> list = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE seller_id = ? ORDER BY created_at DESC";

        try (Connection con = db.getcon();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, sellerId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                ProductModel p = new ProductModel();

                p.setId(rs.getInt("id"));
                p.setSellerId(rs.getString("seller_id"));
                p.setProductCode(rs.getString("product_code"));
                p.setCategory(rs.getString("category"));
                p.setProductName(rs.getString("product_name"));
                p.setModelNumber(rs.getString("model_number"));
                p.setModel(rs.getString("model"));
                p.setBrand(rs.getString("brand"));
                p.setQuantity(rs.getInt("quantity"));
                p.setColor(rs.getString("color"));
                p.setPrice(rs.getBigDecimal("price"));
                p.setDiscount(rs.getInt("discount"));
                p.setFinalPrice(rs.getBigDecimal("final_price"));
                p.setWarrantyMonths(rs.getInt("warranty_months"));
                p.setImagePath(rs.getString("image_path"));
                p.setStatus(rs.getString("status"));
                p.setDescription(rs.getString("description"));

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
























