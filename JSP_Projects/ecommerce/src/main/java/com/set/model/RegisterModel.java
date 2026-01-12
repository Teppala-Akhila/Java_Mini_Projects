package com.set.model;

public class RegisterModel {
	String username;
	String gstno;
	String email;
	String phoneno;
	String password;
	public RegisterModel(String username,String gstno, String email, String phoneno, String password) {
		this.username = username;
		this.gstno = gstno;
		this.email = email;
		this.phoneno = phoneno;
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getGstno() {
		return gstno;
	}
	public void setGstno(String gstno) {
		this.gstno = gstno;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
