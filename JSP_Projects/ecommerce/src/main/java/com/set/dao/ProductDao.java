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
            "(product_id, product_name, model_number, description, category, brand, color, price, stock, warranty_months, image_url, status) " +
            "VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

        try (Connection con = db.getcon();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, p.getProductId());
            ps.setString(2, p.getProductName());
            ps.setString(3, p.getModelNumber());
            ps.setString(4, p.getDescription());
            ps.setString(5, p.getCategory());
            ps.setString(6, p.getBrand());
            ps.setString(7, p.getColor());
            ps.setBigDecimal(8, p.getPrice());
            ps.setInt(9, p.getStock());
            ps.setInt(10, p.getWarrantyMonths());
            ps.setString(11, p.getImageUrl());
            ps.setString(12, p.getStatus());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<ProductModel> getAllProducts() {

        List<ProductModel> list = new ArrayList<>();
        String sql = "SELECT * FROM products";

        try (Connection con = db.getcon();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                ProductModel p = new ProductModel();

                p.setProductId(rs.getInt("product_id"));
                p.setProductName(rs.getString("product_name"));
                p.setModelNumber(rs.getString("model_number"));
                p.setDescription(rs.getString("description"));
                p.setCategory(rs.getString("category"));
                p.setBrand(rs.getString("brand"));
                p.setColor(rs.getString("color"));
                p.setPrice(rs.getBigDecimal("price"));
                p.setStock(rs.getInt("stock"));
                p.setWarrantyMonths(rs.getInt("warranty_months"));
                p.setImageUrl(rs.getString("image_url"));
                p.setStatus(rs.getString("status"));

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
