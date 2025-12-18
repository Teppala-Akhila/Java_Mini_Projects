package com.set.model;

public class LoginModel {
	String Username;
	String Password;
	public LoginModel(String username, String password) {
		super();
		Username = username;
		Password = password;
	}
	public String getUserName() {
		return Username;
	}
	public void setUserName(String userName) {
		Username = userName;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	
}
