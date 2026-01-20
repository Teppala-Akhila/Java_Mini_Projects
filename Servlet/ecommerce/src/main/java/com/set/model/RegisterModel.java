package com.set.model;

public class RegisterModel {

    private int id;                // auto-increment record id
    private String sellerId;       // business id (SELLER1001)
    private String vendorName;     // username / vendor name
    private String gstNumber;
    private String email;
    private String mobileNumber;
    private String password;


    public RegisterModel() {}

    public RegisterModel(String sellerId, String vendorName, String gstNumber,
                         String email, String mobileNumber, String password) {
        this.sellerId = sellerId;
        this.vendorName = vendorName;
        this.gstNumber = gstNumber;
        this.email = email;
        this.mobileNumber = mobileNumber;
        this.password = password;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getSellerId() {
        return sellerId;
    }
    public void setSellerId(String sellerId) {
        this.sellerId = sellerId;
    }

    public String getVendorName() {
        return vendorName;
    }
    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }

    public String getGstNumber() {
        return gstNumber;
    }
    public void setGstNumber(String gstNumber) {
        this.gstNumber = gstNumber;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }
    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
}
