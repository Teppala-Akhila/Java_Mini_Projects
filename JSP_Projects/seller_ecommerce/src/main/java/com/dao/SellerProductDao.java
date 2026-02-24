package com.dao;

import java.sql.*;
import java.util.*;

public class SellerProductDao {

	    public static List<Map<String,Object>> getProductsBySeller(int sellerId) {

	        List<Map<String,Object>> list = new ArrayList<>();

	        try (Connection conn = DBConnection.getConnection()) {

	            String sql = "SELECT * FROM products WHERE seller_id = ?";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setInt(1, sellerId);

	            ResultSet rs = ps.executeQuery();

	            while (rs.next()) {

	                Map<String,Object> map = new HashMap<>();

	                map.put("product_id", rs.getString("product_id"));
	                map.put("product_name", rs.getString("product_name"));
	                map.put("brand", rs.getString("brand"));
	                map.put("category", rs.getString("category"));
	                map.put("status", rs.getString("status"));

	                list.add(map);
	            }

	        } catch(Exception e) {
	            e.printStackTrace();
	        }

	        return list;
	    }
	}
