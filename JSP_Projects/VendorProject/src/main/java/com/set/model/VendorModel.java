package com.set.model;

public class VendorModel {
	String VendorName;
	String GstNumber;
	String Email;
	String contactno;
	public VendorModel(String vendorName, String gstNumber, String email, String contactno) {
		super();
		VendorName = vendorName;
		GstNumber = gstNumber;
		Email = email;
		this.contactno = contactno;
	}
	public String getVendorName() {
		return VendorName;
	}
	public void setVendorName(String vendorName) {
		VendorName = vendorName;
	}
	public String getGstNumber() {
		return GstNumber;
	}
	public void setGstNumber(String gstNumber) {
		GstNumber = gstNumber;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getContactno() {
		return contactno;
	}
	public void setContactno(String contactno) {
		this.contactno = contactno;
	}
	
}
