package com.dao;

public class FactoryDAO {
	public static DAO getDAO(){
		return new DAO();
	}
}
