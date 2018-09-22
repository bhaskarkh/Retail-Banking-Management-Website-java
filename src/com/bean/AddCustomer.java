package com.bean;

public class AddCustomer {
	private String ssnid;
	private int CustomerId;
	private String customerName;
	private int customerAge;
	private String addressLine1;
	private String addressLine2;
	private String city;
	private String state;
	public AddCustomer(String ssnid, String customerName, int customerAge, String addressLine1, String addressLine2,
			String city, String state) {
		this.ssnid = ssnid;
		this.customerName = customerName;
		this.customerAge = customerAge;
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.city = city;
		this.state = state;
	}
	
	public int getCustomerId() {
		return CustomerId;
	}

	public void setCustomerId(int customerId) {
		CustomerId = customerId;
	}

	public String getSsnid() {
		return ssnid;
	}
	public void setSsnid(String ssnid) {
		this.ssnid = ssnid;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public int getCustomerAge() {
		return customerAge;
	}
	public void setCustomerAge(int customerAge) {
		this.customerAge = customerAge;
	}
	public String getAddressLine1() {
		return addressLine1;
	}
	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}
	public String getAddressLine2() {
		return addressLine2;
	}
	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}
