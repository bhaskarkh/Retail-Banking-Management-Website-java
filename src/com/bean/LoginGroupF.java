package com.bean;

public class LoginGroupF {
	private String userid;
	private String password;
	private String role;
	private String  datetime;
	
	public LoginGroupF(String userid, String password, String role, String datetime) {
		this.userid = userid;
		this.password = password;
		this.role = role;
		this.datetime = datetime;
	}
	
	public LoginGroupF(){
		
	}
				
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	

}
