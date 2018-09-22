package com.service;

public class FactoryService {
	public static Service getService(){
		return new Service();
	}
}
