package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.model.BusinessBankModel;

public class BusinessBankDAO {

    public boolean saveBankDetails(BusinessBankModel model) {

        String sql = "INSERT INTO business_bank_details " +
                     "(seller_id, account_type, account_holder_name, bank_name, branch_name, ifsc_code, account_number) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setInt(1, model.getSellerId());
            ps.setString(2, model.getAccountType());
            ps.setString(3, model.getAccountHolderName());
            ps.setString(4, model.getBankName());
            ps.setString(5, model.getBranchName());
            ps.setString(6, model.getIfscCode());
            ps.setString(7, model.getAccountNumber());

            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // CHECK IF BANK DETAILS EXIST
    public boolean hasBankDetails(int sellerId) {

        String sql = "SELECT id FROM business_bank_details WHERE seller_id=?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setInt(1, sellerId);
            ResultSet rs = ps.executeQuery();
            return rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
